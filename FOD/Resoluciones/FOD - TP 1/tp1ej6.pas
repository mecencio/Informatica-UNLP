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
  writeln('Abrir un archivo y: ');
  writeln('  2. Listar celulares con stock menor al minimo.');
  writeln('  3. Buscar y listar celulares segun descripcion.');
  writeln('  4. Exportar datos a archivo "celulares.txt".');
  writeln('  5. Agregar nuevos celulares.');
  writeln('  6. Modificar el stock de un celular dado.');
  writeln('  7. Exportar celulares sin stock a "sinStock.txt".');
  writeln();
  writeln('0. Salir');
  writeln();
end;

procedure leerCelular (var c : celular);
begin
  with c do begin
    write('Ingrese el nombre del celular: '); readln(nombre);
    if nombre <> 'fin' then begin
      write('Ingrese el codigo del celular: '); readln(id);
      write('Ingrese la descripcion: '); readln(desc);
      write('Ingrese la marca: '); readln(marca);
      write('Ingrese el precio: '); readln(precio);
      write('Ingrese el stock Minimo: '); readln(stockMin);
      write('Ingrese el stock disponible: '); readln(stockDisp);
    end;
  end;
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

procedure aniadirCelulares (var a : archivo_celulares);
var
  cNuevo, c : celular;
  encontrado : boolean;
begin
  writeln();
  reset(a);
  encontrado := false;
  writeln('Ingrese los datos del celular: ');
  writeln('Recuerde: Para terminar debe ingresar un celular con nombre "fin".');
  writeln(); writeln();
  leerCelular(cNuevo);
  while cNuevo.nombre <> 'fin' do begin
    while not EOF(a) and not encontrado do begin
      read(a, c);
      if (c.nombre = cNuevo.nombre) then
        encontrado := true;
    end;
    if not encontrado then begin
      seek(a, fileSize(a));
      write(a, cNuevo);
      writeln(); writeln('---------------------------------');
      writeln('Celular registrado correctamente.');
      writeln('---------------------------------'); writeln();
    end;
    seek(a, 0);
    encontrado := false;
    writeln();
    writeln('Ingrese los datos del celular: ');
    writeln();
    leerCelular(cNuevo);
  end;
  close(a);
  writeln();
  writeln('Finalizando carga de datos...');
  writeln();
end;

procedure modificarStockDisponible (var a : archivo_celulares);
var
  cNuevo, c : celular;
  encontrado : boolean;
begin
  reset(a);
  encontrado := false;
  writeln();
  writeln('Modificacion de stock: ');
  writeln('Para terminar, ingrese el nombre de celular "fin".');
  writeln();
  write('Ingrese el nombre del celular: '); readln(cNuevo.nombre);
  while cNuevo.nombre <> 'fin' do begin
    write('Ingrese el nuevo stock disponible: '); readln(cNuevo.stockDisp);
    writeln();
    while not EOF(a) and not encontrado do begin
      read(a, c);
      if c.nombre = cNuevo.nombre then begin
        c.stockDisp := cNuevo.stockDisp;
        encontrado := true;
        seek(a, filePos(a)-1);
        write(a, c);
        writeln();
        writeln('--------------------------------');
        writeln('Cambios guardados correctamente.');
        writeln('--------------------------------');
        writeln();
      end;
    end;
    seek(a, 0);
    encontrado := false;
    writeln();
    write('Ingrese el nombre del celular: '); readln(cNuevo.nombre);
  end;
  close(a);
  writeln();
  writeln('Guardando cambios...');
  writeln(); writeln();
end;

procedure exportarSinStock (var a : archivo_celulares);
var
  sinStock : Text;
  c : celular;
begin
  assign(sinStock, 'SinStock.txt');
  rewrite(sinStock);
  reset(a);
  writeln();
  writeln('Creando nuevo archivo...');
  writeln();
  while not EOF(a) do begin
    read(a, c);
    if c.stockDisp = 0 then begin
      writeln(sinStock, c.id, ' ', c.precio:1:2, ' ', c.marca);
      writeln(sinStock, c.stockDisp, ' ', c.stockMin, ' ', c.desc);
      writeln(sinStock, c.nombre);
    end;
  end;
  close(a);
  close(sinStock);
  writeln();
  writeln('Finalizando creacion del archivo...');
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
      5: aniadirCelulares(celulares);
      6: modificarStockDisponible(celulares);
      7: exportarSinStock(celulares);
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
