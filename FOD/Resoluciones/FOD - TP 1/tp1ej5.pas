program ejercicio5;

type
  celular = record
    id : integer;
    nombre : string;
    desc : string;
    marca : string;
    precio : real;
    stockMin : integer;
    stockDisp : integer;
  end;
  archivo_celulares = file of celular;

procedure showMenu();
begin
  writeln();
  writeln('================');
  writeln('      MENU      ');
  writeln('================');
  writeln();
  writeln('1. Crear archivo a partir de archivo "celulares.txt".');
  writeln('2. Listar celulares con stock menor al minimo.');
  writeln('3. Buscar y listar celulares segun descripcion.');
  writeln('4. Exportar datos a archivo "celulares.txt".');
  writeln('0. Salir');
  writeln();
end;

procedure mostrarCelular (c : celular);
begin
  writeln('----------------------------------');
  with c do begin
    writeln('Codigo: ', id,' - nombre: ', nombre);
    writeln('Descripcion: ', desc, ' - marca: ',marca);
    writeln('Precio: ',precio:1:2,' - Stock Minimo: ',stockMin,' - Stock Disponible: ',stockDisp);
  end;
  writeln('----------------------------------');
end;

procedure crearArchivo (var a : archivo_celulares);
var
  aText : Text;
  c : celular;
begin
  assign(aText, 'celulares.txt');
  reset(aText);
  rewrite(a);
  while not EOF(aText) do begin
    with c do begin
      readln(aText, id, precio, marca);
      readln(aText, stockDisp, stockMin, desc);
      readln(aText, nombre);
    end;
    mostrarCelular(c);
    write(a, c);
  end;
  close(aText);
  close(a);
  writeln();
  writeln('Finalizando la creacion del archivo...');
  writeln();
end;

procedure listarStockBajo (var a : archivo_celulares);
var
  c : celular;
begin
  writeln();
  writeln('-----------------------------------------------------------');
  writeln('Listado de celulares con stock disponible menor al minimo: ');
  writeln('-----------------------------------------------------------');
  writeln();
  reset(a);
  while not EOF(a) do begin
    read(a, c);
    if c.stockMin > c.stockDisp then
      mostrarCelular(c);
  end;
  close(a);
  writeln();
  writeln('Finalizando impresion...');
  writeln();
end;

procedure buscarPorDescripcion (var a : archivo_celulares);
var
  desc : string;
  c : celular;
begin
  writeln();
  writeln('Busqueda de celulares por descripción: ');
  writeln();
  writeln();
  write('Ingrese la descripcion que debe contener el celular: ');
  readln(desc);
  reset(a);
  while not EOF(a) do begin
    read(a, c);
    if (c.desc = desc) then
      mostrarCelular(c);
  end;
  close(a);
  writeln();
  writeln('Finalizando impresion...');
  writeln();
end;

procedure exportarATexto (var a : archivo_celulares);
var
  aText : Text;
  c : celular;
begin
  writeln();
  writeln('Preparando la creacion del nuevo archivo.');
  writeln();
  writeln();
  assign(aText, 'celulares.txt');
  rewrite(aText);
  reset(a);
  while not EOF(a) do begin
    read(a, c);
    with c do begin
      writeln(aText,id,' ',precio:1:2,marca);
      writeln(aText,stockDisp,' ',stockMin,desc);
      writeln(aText,nombre);
    end;
  end;
  close(a);
  close(aText);
  writeln();
  writeln('Finalizando creacion...');
  writeln();
end;

var
  opcion : integer;
  celulares : archivo_celulares;
  nombre : string;
begin
  writeln('Bienvenido!!');
  write('Ingrese el nombre del archivo: '); readln(nombre);
  assign(celulares, nombre);
  writeln();
  showMenu();
  writeln();
  write('Ingrese la opcion deseada: '); readln(opcion);
  while opcion <> 0 do begin
    case opcion of
      1: crearArchivo(celulares);
      2: listarStockBajo(celulares);
      3: buscarPorDescripcion(celulares);
      4: exportarATexto(celulares);
    else writeln('La opcion ingresada no es una opcion valida.');
    end;
    writeln();
    writeln();
    showMenu();
    writeln();
    write('Ingrese la opcion deseada: '); readln(opcion);
  end;
  writeln();
  writeln();
  writeln('Finalizando programa...');
  readln();
end.
