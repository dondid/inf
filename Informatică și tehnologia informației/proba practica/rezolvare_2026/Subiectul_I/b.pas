program MinimB;

type
  TTablou = array[1..100] of int64;

var
  fin, fout: text;
  n, i, jumatate: integer;
  v: TTablou;

// Subprogramul afla_minim primeste prin n numarul de elemente ale unui vector,
// iar prin v elementele vectorului. Returneaza valoarea minima din vector.
function afla_minim(n: integer; var v: TTablou): int64;
var
  i: integer;
  val_min: int64;
begin
  val_min := v[1];
  for i := 2 to n do
  begin
    if v[i] < val_min then
      val_min := v[i];
  end;
  afla_minim := val_min;
end;

begin
  assign(fin, 'minim.in');
  reset(fin);
  assign(fout, 'minim.out');
  rewrite(fout);
  
  if eof(fin) then
  begin
    close(fin);
    close(fout);
    exit;
  end;
  
  read(fin, n);
  for i := 1 to n do
    read(fin, v[i]);
    
  jumatate := n div 2;
  if jumatate = 0 then
    jumatate := 1;
    
  writeln(fout, afla_minim(jumatate, v));
  
  close(fin);
  close(fout);
end.
