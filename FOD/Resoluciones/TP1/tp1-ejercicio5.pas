program ej5;

type
  cadena15 = string[15];
  celular = record
    cod : integer;
    nombre : cadena15;
    desc : string;
    marca : cadena15;
    precio : real;
    stockMin : integer;
    stockDisp : integer;
  end;
  
  archivo_celulares = file of celular;

procedure listar (var a : archivo_celulares);
var
  c : celular;
begin
  reset(a);
  while not EOF(a) do begin
    read(a, c);
    with c do
      writeln('cod: ', cod,' nombre: ',nombre,' desc: ',desc,' marca: ',marca,' precio: ',precio:1:2,' stock min: ',stockMin,' stock disp: ',stockDisp);
  end;
  close(a);
end;

procedure crearNuevoArchivo();
var
  a : archivo_celulares;
  carga : text;
  c : celular;
  nomArchivo : string;
begin
  assign(carga, 'celulares.txt');
  write('Ingrese el nombre del archivo que desea crear: ');readln(nomArchivo);
  assign(a, nomArchivo);
  reset(carga);
  rewrite(a);
  while not EOF(carga) do begin
    readln(carga,c.cod,c.precio,c.marca);
    readln(carga,c.stockDisp,c.stockMin,c.desc);
    readln(carga,c.nombre);
    write(a, c);
  end;
  close(a);
  close(carga);
  writeln();writeln();writeln();writeln();
  listar(a);
  writeln();writeln();writeln();writeln();
end;

procedure menu ();
var
  opcion : integer;
  continuar : boolean;
begin
  continuar := true;
  while continuar do begin
    writeln();
    writeln('========');
    writeln('  Menu: ');
    writeln('========');
    writeln();
    writeln('1.- Crear un archivo y cargarlo con datos ingresados desde "celulares.txt"');
    writeln('2.- Listar los celulares que tengan stock menos al minimo');
    writeln('3.- Listar celulares con descripcion a indicar');
    writeln('4.- Exportar el archivo creado en "celulares.txt"');
    writeln();
    write('Ingrese la opcion deseada: ');readln(opcion);
    case opcion of
      1: crearNuevoArchivo();
      2: writeln(2);
      3: writeln(3);
      4: writeln(4);
      else continuar := false;
    end;
  end;
end;

begin
  writeln('Bienvenido!!');
  menu();
  writeln();
  writeln();
  writeln();
  writeln('Finalizando programa...');
  readln();
end.
