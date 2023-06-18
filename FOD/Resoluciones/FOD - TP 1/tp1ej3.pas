program ejercicio3;

type
  rango_edad = 0..100;
  empleado = record
    id : integer;
    apellido : string;
    nombre : string;
    edad : rango_edad;
    dni : longInt;
  end;
  
  archivo_empleados = file of empleado;

procedure showMenu ();
begin
  writeln('------------------');
  writeln('       MENU       ');
  writeln('------------------');
  writeln();
  writeln('Elija una de las siguientes opciones');
  writeln();
  writeln('1. Crear archivo de empleados y completarlo');
  writeln();
  writeln('Abrir el archivo de empleados y: ');
  writeln('  2. Listar empleados con determinado nombre o apellido.');
  writeln('  3. Listar en pantalla los empleados.');
  writeln('  4. Listar en pantalla empleados mayores a 70 anios.');
  writeln();
  writeln('0. Salir');
end;

procedure leerEmpleado (var e : empleado);
begin
  writeln();
  writeln('Nuevo empleado');
  writeln();
  with e do begin
    write('Ingrese el apellido del empleado: '); readln(apellido);
    if apellido <> 'fin' then begin
      write('Ingrese el nombre: ');readln(nombre);
      write('Ingrese el numero de empleado: ');readln(id);
      write('Ingrese la edad: ');readln(edad);
      write('Ingrese el DNI: ');readln(dni);
    end;
  end;
end;

procedure crearArchivo (var archivo : archivo_empleados);
var
  e : empleado;
begin
  rewrite(archivo);
  leerEmpleado(e);
  while e.apellido <> 'fin' do begin
    write(archivo, e);
    leerEmpleado(e);
  end;
  writeln(); writeln();
  writeln('Finalizando la creacion del archivo...');
  writeln(); writeln();
end;

procedure imprimirEmpleado (e : empleado);
begin
  with e do
    writeln('Numero empleado: ', id, ' Nombre y apellido: ', apellido, ' ', nombre,' edad: ', edad, ' DNI: ', dni);
end;

procedure buscarEmpleados (var a : archivo_empleados);
var
  e : empleado;
  buscar : string;
begin
  reset(a);
  write('Ingrese el nombre o apellido del/de los empleado/s a buscar: ');
  readln(buscar);
  writeln();
  writeln('Resultados: ');
  writeln('==========');
  writeln();
  while not EOF(a) do begin
    read(a, e);
    if (e.nombre = buscar) or (e.apellido = buscar) then
      imprimirEmpleado(e);
  end;
  writeln();
  writeln('Finalizando busqueda...');
  writeln();
end;

procedure listarEmpleados(var a : archivo_empleados);
var
  e : empleado;
begin
  reset(a);
  writeln();
  writeln('Listado de empleados: ');
  writeln('====================');
  writeln();
  while not EOF(a) do begin
    read(a, e);
    imprimirEmpleado(e);
  end;
  writeln();
  writeln('Finalizando impresion...');
  writeln();
end;

procedure listarMayores (var a : archivo_empleados);
var
  e : empleado;
begin
  reset(a);
  writeln();
  writeln('Listado de empleados mayores a 70 anios: ');
  writeln('=======================================');
  writeln();
  while not EOF(a) do begin
    read(a, e);
    if e.edad >= 70 then
      imprimirEmpleado(e);
  end;
  writeln();
  writeln('Finalizando impresion...');
  writeln();
end;
  
var
  empleados : archivo_empleados;
  nombre : string;
  opcion : integer;
begin
  writeln('Bienvenido!!');
  writeln();
  write('Ingrese el nombre del archivo: ');
  readln(nombre);
  assign(empleados, nombre);
  showMenu();
  writeln();
  write('Ingrese la opcion deseada: '); readln(opcion);
  writeln();
  while opcion <> 0 do begin
    case opcion of
      1: crearArchivo(empleados);
      2: buscarEmpleados(empleados);
      3: listarEmpleados(empleados);
      4: listarMayores(empleados);
      0: writeln();
    else writeln('La opcion ingresada no es valida.');
    end;
    writeln();
    showMenu();
    write('Ingrese la opcion deseada: '); readln(opcion);
    writeln()
  end;
  writeln();
  writeln('Finalizando programa...');
  writeln();
  readln();
end.
