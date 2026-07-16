program DivizoriB;

type
  TTablou = array[1..100] of integer;

var
  fin, fout: text;
  n, i, x, count: integer;
  v: TTablou;

// Subprogramul nrdiv primeste ca parametru un numar natural n si returneaza numarul de divizori ai sai.
function nrdiv(n: integer): integer;
var
  i, cnt: integer;
begin
  cnt := 0;
  i := 1;
  while i * i <= n do
  begin
    if n mod i = 0 then
    begin
      cnt := cnt + 1;
      if i * i <> n then
        cnt := cnt + 1;
    end;
    i := i + 1;
  end;
  nrdiv := cnt;
end;

// Subprogramul ordonare primeste numarul de elemente n si tabloul v si il ordoneaza descrescator.
procedure ordonare(n: integer; var v: TTablou);
var
  i, j, temp: integer;
begin
  for i := 1 to n - 1 do
    for j := i + 1 to n do
      if v[i] < v[j] then
      begin
        temp := v[i];
        v[i] := v[j];
        v[j] := temp;
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
    if nrdiv(x) mod 2 <> 0 then
    begin
      count := count + 1;
      v[count] := x;
    end;
  end;
  
  if count = 0 then
    write(fout, 'nu exista')
  else
  begin
    ordonare(count, v);
    for i := 1 to count do
    begin
      write(fout, v[i]);
      if i < count then
        write(fout, ' ');
    end;
    writeln(fout);
  end;
  
  close(fin);
  close(fout);
end.
