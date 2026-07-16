program MinimA;

var
  fin, fout: text;
  n, i: integer;
  x, val_min: int64;

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
  if not eof(fin) then
  begin
    read(fin, val_min);
    for i := 2 to n do
    begin
      read(fin, x);
      if x < val_min then
        val_min := x;
    end;
    writeln(fout, val_min);
  end;
  
  close(fin);
  close(fout);
end.
