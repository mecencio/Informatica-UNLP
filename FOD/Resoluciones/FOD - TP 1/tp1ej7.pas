program ejercicio7;

type
  novela = record
    id : integer;
    nombre : string;
    genero : string;
    precio : real;
  end;
  
  archivo_novelas = file of novela;

procedure showMenu();
begin
  writeln();
  writeln('Seleccione una de las siguientes opciones:');
  writeln('1. Crear un archivo a partir del archivo "novelas.txt".');
  writeln('Abrir el archivo y: ');
  writeln('  2. Modificar una novela existente.');
  writeln('  3. Agregar una nueva novela.');
  writeln();
  writeln('0. Salir');
  writeln();
end;

procedure leerNovela (var n : novela);
begin
  writeln();
  write('Ingrese el nombre: '); readln(n.nombre);
  write('Ingrese el codigo: '); readln(n.id);
  write('Ingrese el genero: '); readln(n.genero);
  write('Ingrese el precio: '); readln(n.precio);
  writeln();
end;

procedure crearArchivo (var a : archivo_novelas);
var
  n : novela;
  aText : Text;
begin
  assign(aText, 'novelas.txt');
  reset(aText);
  rewrite(a);
  writeln();
  writeln('Creando archivo...');
  writeln();
  while not EOF(aText) do begin
    readln(aText, n.id, n.precio, n.genero);
    readln(aText, n.nombre);
    write(a, n);
  end;
  close(aText);
  close(a);
  writeln();
  writeln('Finalizando creacion...');
  writeln();
end;

procedure modificarNovela (var a : archivo_novelas);
var
  nNueva, n : novela;
  encontrada, continuar : boolean;
  opcion : integer;
begin
  reset(a);
  continuar := true;
  encontrada := false;
  writeln();
  writeln('Ingrese los datos de la novela: ');
  writeln('Tenga en cuenta que se buscara por su codigo.');
  writeln();
  while continuar do begin
    leerNovela(nNueva);
    while not EOF(a) do begin
      read(a, n);
      if (n.id = nNueva.id) then
        encontrada := true;
    end;
    if encontrada then begin
      seek(a, filePos(a)-1);
      write(a, nNueva);
      writeln();
      writeln('Modificaciones realizadas correctamente.');
      writeln();
    end;
    seek(a, 0);
    encontrada := false;
    writeln();
    writeln('Desea realizar otra modificacion?');
    writeln('1. Si');
    writeln('2. No');
    writeln();
    write('Ingrese su eleccion: '); readln(opcion);
    if opcion = 2 then
      continuar := false;
  end;
  close(a);
  writeln();
  writeln('Guardando cambios...');
  writeln();
end;

procedure agregarNovelas (var a : archivo_novelas);
var
  nNueva, n : novela;
  encontrada, continuar : boolean;
  opcion : integer;
begin
  reset(a);
  encontrada := false;
  continuar := true;
  writeln();
  writeln('Ingrese una nueva novela: ');
  writeln('Recuerde: no se puede ingresar una novela con un codigo existente.');
  writeln();
  while continuar do begin
    leerNovela(nNueva);
    while not EOF(a) do begin
      read(a, n);
      if n.id = nNueva.id then
        encontrada := true;
    end;
    if not encontrada then begin
      seek(a, fileSize(a));
      write(a, nNueva);
      writeln();
      writeln('------------------------------');
      writeln('Novela agregada correctamente.');
      writeln('------------------------------');
      writeln();
    end;
    seek(a, 0);
    encontrada := false;
    writeln();
    writeln('Desea agregar otra novela?');
    writeln('1. Si');
    writeln('2. No');
    writeln();
    write('Indique su opcion: '); readln(opcion);
    writeln();
    if opcion = 2 then
      continuar := false;
  end;
  close(a);
  writeln();
  writeln('Guardando datos...');
  writeln();
end;

var
  opcion : integer;
  nombre : string;
  novelas : archivo_novelas;
begin
  writeln('Bienvenido');
  writeln('==========');
  writeln();
  writeln();
  write('Ingrese el nombre del archivo: '); readln(nombre);
  assign(novelas, nombre);
  showMenu();
  write('Ingrese la opcion deseada: '); readln(opcion);
  while opcion <> 0 do begin
    case opcion of
      1: crearArchivo(novelas);
      2: modificarNovela(novelas);
      3: agregarNovelas(novelas);
    else writeln('Opcion invalida.');
    end;
    writeln();
    showMenu();
    writeln();
    write('Ingrese la opcion deseada: '); readln(opcion);
  end;
  writeln();
  writeln('Finalizando programa...');
  writeln();
  readln();
end.
