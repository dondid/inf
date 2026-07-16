program DivizoriA;
uses math;

var
  fin, fout: text;
  n, i, x, count: integer;
  rez: array[1..100] of integer;
  temp, j: integer;

// Un numar are un numar impar de divizori daca si numai daca este patrat perfect.
function EstePatratPerfect(x: integer): boolean;
var
  r: integer;
begin
  if x < 0 then
    EstePatratPerfect := false
  else
  begin
    r := round(sqrt(x));
    EstePatratPerfect := (r * r = x);
  end;
end;

begin
  assign(fin, 'divizori.in');
  reset(fin);
  assign(fout, 'divizori.out');
  rewrite(fout);
  
  if eof(fin) then
  begin
    close(fin);
    close(fout);
    exit;
  end;
  
  read(fin, n);
  count := 0;
  for i := 1 to n do
  begin
    read(fin, x);
    if EstePatratPerfect(x) then
    begin
      count := count + 1;
      rez[count] := x;
    end;
  end;
  
  if count = 0 then
    write(fout, 'nu exista')
  else
  begin
    // Sortare descrescatoare (Bubble Sort)
    for i := 1 to count - 1 do
      for j := i + 1 to count do
        if rez[i] < rez[j] then
        begin
          temp := rez[i];
          rez[i] := rez[j];
          rez[j] := temp;
        end;
        
    for i := 1 to count do
    begin
      write(fout, rez[i]);
      if i < count then
        write(fout, ' ');
    end;
    writeln(fout);
  end;
  
  close(fin);
  close(fout);
end.
