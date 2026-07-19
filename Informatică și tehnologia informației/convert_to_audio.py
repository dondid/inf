import os
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed

def check_dependencies():
    missing = []
    try:
        import pypdf
    except ImportError:
        missing.append("pypdf")
    try:
        import gtts
    except ImportError:
        missing.append("gtts")
    
    if missing:
        print("[-] Lipsesc biblioteci necesare pentru rularea scriptului.")
        print("    Pentru a le instala, rulează următoarea comandă în terminal:")
        print(f"    pip install {' '.join(missing)}")
        return False
    return True

def convert_single_page(page_num, text_clean, output_file):
    from gtts import gTTS
    try:
        # Apelăm Google Text-to-Speech cu limba română ('ro')
        tts = gTTS(text=text_clean, lang='ro', slow=False)
        tts.save(output_file)
        return page_num, True, None
    except Exception as e:
        return page_num, False, str(e)

def convert_pdf_to_audio(pdf_path, output_dir):
    if not check_dependencies():
        return

    import pypdf

    if not os.path.exists(pdf_path):
        print(f"[-] Eroare: Fișierul PDF nu există la calea: {pdf_path}")
        return

    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
        print(f"[+] S-a creat directorul de ieșire: {output_dir}")

    print(f"[+] Se încarcă fișierul PDF: {pdf_path}")
    reader = pypdf.PdfReader(pdf_path)
    num_pages = len(reader.pages)
    print(f"[+] PDF-ul are {num_pages} pagini.")

    # Pregătim sarcinile pentru execuție în paralel
    tasks = []
    for i in range(num_pages):
        page_num = i + 1
        page = reader.pages[i]
        text = page.extract_text()
        
        if not text or not text.strip():
            continue
            
        text_clean = text.strip()
        output_file = os.path.join(output_dir, f"pagina_{page_num:02d}.mp3")
        tasks.append((page_num, text_clean, output_file))

    total_tasks = len(tasks)
    print(f"[+] Se începe conversia în paralel pentru {total_tasks} pagini (folosind 10 thread-uri)...")

    completed = 0
    # Executăm descărcarea în paralel folosind ThreadPoolExecutor
    with ThreadPoolExecutor(max_workers=10) as executor:
        futures = {
            executor.submit(convert_single_page, page_num, text_clean, out_file): page_num 
            for page_num, text_clean, out_file in tasks
        }
        
        for future in as_completed(futures):
            page_num, success, err = future.result()
            completed += 1
            if success:
                print(f"[>] [{completed}/{total_tasks}] Pagina {page_num} descarcată cu succes.")
            else:
                print(f"[-] [{completed}/{total_tasks}] Eroare la pagina {page_num}: {err}")

    print("\n[+] Toate paginile individuale au fost procesate!")

    # Concatenăm toate paginile în ordine numerică exactă într-un singur fișier audio complet
    master_file = os.path.join(output_dir, "ghid_complet_audio.mp3")
    print(f"[+] Se generează fișierul audio complet unificat: {master_file}...")
    try:
        with open(master_file, "wb") as outfile:
            for i in range(num_pages):
                page_file = os.path.join(output_dir, f"pagina_{i+1:02d}.mp3")
                if os.path.exists(page_file):
                    with open(page_file, "rb") as infile:
                        outfile.write(infile.read())
        print(f"[+] Succes! Fișierul unificat a fost creat la: {master_file}")
    except Exception as e:
        print(f"[-] Eroare la unificarea fișierelor audio: {e}")
        
    print("    Le poți transfera pe telefon pentru a le asculta oricând în căști.")

if __name__ == "__main__":
    # Căile implicite
    pdf_implicit = "ghid_programa_titularizare_informatica_tic.pdf"
    output_implicit = "ghid_audio"

    # Permitem rularea din rădăcina proiectului sau din folderul specific
    if not os.path.exists(pdf_implicit) and os.path.exists(os.path.join("Informatică și tehnologia informației", pdf_implicit)):
        pdf_implicit = os.path.join("Informatică și tehnologia informației", pdf_implicit)
        output_implicit = os.path.join("Informatică și tehnologia informației", output_implicit)

    convert_pdf_to_audio(pdf_implicit, output_implicit)
