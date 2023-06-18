program ejercicio1;

type
  archivo_enteros = file of integer;

procedure cargarArchivo (var enteros : archivo_enteros);
var
  numero : integer;
begin
  write('Ingrese un numero: ');
  readln(numero);
  while numero <> 30000 do begin
    write(enteros, numero);
    write('Ingrese un numero: ');
    readln(numero);
  end;
end;

var
  enteros : archivo_enteros;
  nombre : string;
begin
  write('Ingrese el nombre del archivo: ');
  readln(nombre);
  assign(enteros, nombre);
  rewrite(enteros);
  cargarArchivo(enteros);
  close(enteros);
  writeln();
  writeln('Finalizando programa...');
  writeln();
  readln();
end.
