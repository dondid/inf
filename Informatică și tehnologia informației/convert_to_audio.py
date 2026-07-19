import os
import sys
import re
import asyncio
import time

def check_dependencies():
    missing = []
    try:
        import pypdf
    except ImportError:
        missing.append("pypdf")
    try:
        import edge_tts
    except ImportError:
        missing.append("edge_tts")
    
    if missing:
        print("[-] Lipsesc biblioteci necesare pentru rularea scriptului.")
        print("    Pentru a le instala, rulează următoarea comandă în terminal:")
        print(f"    pip install {' '.join(missing)} --break-system-packages")
        return False
    return True

def is_code_line(line):
    line_s = line.strip()
    if not line_s:
        return False
        
    keywords = [
        '#include', 'using namespace', 'std::', 'cin', 'cout', 'ifstream', 'ofstream',
        'int ', 'float ', 'double ', 'char ', 'void ', 'struct ', 'class ', 'public:', 'private:',
        'begin', 'end.', 'end;', 'var ', 'procedure ', 'function ', 'type ', 'record',
        'while ', 'for ', 'if ', 'do {', '} while', 'else ', 'swap', 'override',
        'printf', 'scanf', 'iostream', 'vector<', 'map<', 'stack<', 'priority_queue<', 'temp[',
        ':=', 'return', 'const ', 'inline ', 'main()', 'delete', 'new ', 'malloc',
        'NULL', 'nullptr', 'mod ', 'div ', 'write(', 'writeln(', 'read(', 'readln('
    ]
    for kw in keywords:
        if kw in line_s:
            return True
            
    if line_s.endswith(';') and ('=' in line_s or '(' in line_s or ')' in line_s or '::' in line_s):
        return True
    if line_s == '{' or line_s == '}' or line_s == 'begin' or line_s.startswith('end;'):
        return True
    if line_s.startswith('//') or line_s.startswith('/*') or line_s.startswith('* '):
        if any(c in line_s for c in [';', '{', '}', ':=']):
            return True
            
    return False

def clean_text_for_tts(text):
    lines = text.split('\n')
    cleaned_lines = []
    in_code_block = False
    
    for line in lines:
        line_strip = line.strip()
        
        # Eliminăm antetul repetitiv
        if line_strip == "Ghid programa titularizare - Informatică și TIC":
            continue
            
        # Eliminăm subsolul repetitiv cu pagina
        if "Pregătire completă" in line_strip or "programa oficială" in line_strip:
            continue
        if re.match(r'^\d+$', line_strip):
            continue
            
        # Eliminăm punctele de legătură specifice cuprinsului (. . . . . . .)
        if ". . ." in line_strip:
            line_strip = re.sub(r'\.\s*\.\s*\.\s*', '', line_strip)
            
        # Tratăm liniile de cod sursă
        if is_code_line(line):
            if not in_code_block:
                cleaned_lines.append("[Se prezintă implementarea codului sursă în documentul PDF]")
                in_code_block = True
            continue
        else:
            in_code_block = False
            
        # Simplificăm / transliterăm caractere speciale și operatori logici
        line_clean = line_strip
        line_clean = line_clean.replace("==", " este egal cu ")
        line_clean = line_clean.replace("!=", " diferit de ")
        line_clean = line_clean.replace("<>", " diferit de ")
        line_clean = line_clean.replace("<=", " mai mic sau egal cu ")
        line_clean = line_clean.replace(">=", " mai mare sau egal cu ")
        line_clean = line_clean.replace("->", " duce la ")
        
        cleaned_lines.append(line_clean)
        
    return "\n".join([l for l in cleaned_lines if l.strip()])

async def synthesize_chunk(idx, chunk, voice, temp_dir):
    import edge_tts
    temp_file = os.path.join(temp_dir, f"temp_chunk_{idx:03d}.mp3")
    
    # Retry logic pentru fiabilitate maximă
    max_retries = 3
    for attempt in range(max_retries):
        try:
            communicate = edge_tts.Communicate(chunk, voice)
            await communicate.save(temp_file)
            return temp_file
        except Exception as e:
            print(f"[~] Eșec la chunk {idx}, încercarea {attempt + 1}: {e}")
            if os.path.exists(temp_file):
                try:
                    os.remove(temp_file)
                except:
                    pass
            await asyncio.sleep(2)
            
    raise RuntimeError(f"Nu s-a putut sintetiza chunk-ul {idx} după {max_retries} încercări.")

async def convert_pdf_to_audio_async(pdf_path, output_dir):
    if not check_dependencies():
        return

    import pypdf

    if not os.path.exists(pdf_path):
        print(f"[-] Eroare: Fișierul PDF nu există la calea: {pdf_path}")
        return

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Citim textul din tot PDF-ul
    print(f"[+] Se încarcă și se extrage textul din PDF: {pdf_path}")
    reader = pypdf.PdfReader(pdf_path)
    full_text_list = []
    
    for i in range(len(reader.pages)):
        text = reader.pages[i].extract_text()
        if text:
            full_text_list.append(text)
            
    full_raw_text = "\n".join(full_text_list)
    
    # Curățăm textul extras complet
    print("[+] Se curăță textul (se elimină codurile sursă, tabelele și antetele)...")
    cleaned_text = clean_text_for_tts(full_raw_text)
    
    # Împărțim textul în bucăți mari de până la 8000 de caractere pentru viteză
    print("[+] Se fragmentează textul în blocuri mari (de 8000 caractere)...")
    lines = cleaned_text.split("\n")
    chunks = []
    current_chunk = []
    current_len = 0
    
    for line in lines:
        line_strip = line.strip()
        if not line_strip:
            continue
        if current_len + len(line_strip) + 1 > 8000:
            chunks.append("\n".join(current_chunk))
            current_chunk = [line_strip]
            current_len = len(line_strip)
        else:
            current_chunk.append(line_strip)
            current_len += len(line_strip) + 1
            
    if current_chunk:
        chunks.append("\n".join(current_chunk))
        
    num_chunks = len(chunks)
    print(f"[+] S-au generat {num_chunks} blocuri de text. Începe descărcarea în paralel...")

    # Executăm descărcarea tuturor blocurilor în paralel cu asyncio.gather
    voice = "ro-RO-AlinaNeural"
    start_time = time.time()
    
    try:
        tasks = [synthesize_chunk(i, chunk, voice, output_dir) for i, chunk in enumerate(chunks)]
        temp_files = await asyncio.gather(*tasks)
        
        # Concatenăm toate fișierele audio în ordinea corectă
        master_file = os.path.join(output_dir, "ghid_complet_audio.mp3")
        print(f"[+] Se asamblează fișierul audio unificat: {master_file}...")
        
        with open(master_file, "wb") as outfile:
            for temp_file in sorted(temp_files):
                with open(temp_file, "rb") as infile:
                    outfile.write(infile.read())
                # Ștergem bucățile temporare
                os.remove(temp_file)
                
        elapsed = time.time() - start_time
        print(f"[+] Succes! Fișierul unificat a fost creat în {elapsed:.1f} secunde la: {master_file}")
        
    except Exception as e:
        print(f"[-] Eroare în timpul procesării audio: {e}")

def main():
    pdf_implicit = "ghid_programa_titularizare_informatica_tic.pdf"
    output_implicit = "ghid_audio"

    if not os.path.exists(pdf_implicit) and os.path.exists(os.path.join("Informatică și tehnologia informației", pdf_implicit)):
        pdf_implicit = os.path.join("Informatică și tehnologia informației", pdf_implicit)
        output_implicit = os.path.join("Informatică și tehnologia informației", output_implicit)

    asyncio.run(convert_pdf_to_audio_async(pdf_implicit, output_implicit))

if __name__ == "__main__":
    main()
