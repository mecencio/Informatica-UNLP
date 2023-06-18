program ejercicio2;

type
  archivo_enteros = file of integer;

procedure leerArchivo (var enteros : archivo_enteros);
var
  numero : integer;
begin
  while not EOF(enteros) do begin
    read(enteros, numero);
    write(numero);
    write(' ');
  end;
  writeln();
end;

var
  enteros : archivo_enteros;
  nombre : string;
begin
  writeln('Bienvenido!');
  writeln();
  write('Ingrese el nombre del archivo: ');
  readln(nombre);
  assign(enteros, nombre);
  reset(nombre);
  leerArchivo(enteros);
  close(enteros);
  writeln();
  writeln('Finalizando programa...');
  writeln();
  readln();
end.
