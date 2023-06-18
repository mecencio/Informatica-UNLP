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
  writeln('  5. Agregar empleados al final.');
  writeln('  6. Modificar la edad de uno o varios empleados.');
  writeln('  7. Exportar el archivo de empleados a un nuevo archivo txt.');
  writeln('  8. Obtener un nuevo archivo con los empleados con DNI faltantes.');
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
  close(archivo);
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
  close(a);
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
  close(a);
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
  close(a);
  writeln();
  writeln('Finalizando impresion...');
  writeln();
end;

procedure agregarEmpleados (var a : archivo_empleados);
var
  eNuevo, e : empleado;
  encontrado : boolean;
begin
  reset(a);
  encontrado := false;
  writeln();
  writeln('Ingrese los datos del nuevo empleado: ');
  writeln();
  leerEmpleado(eNuevo);
  writeln();
  while eNuevo.apellido <> 'fin' do begin
    while not EOF(a) and not encontrado do begin
      read(a, e);
      if (e.id = eNuevo.id) then
        encontrado := true;
    end;
    if not encontrado then begin
      seek(a, fileSize(a));
      write(a, eNuevo);
    end;
    encontrado := false;
    seek(a, 0);
    writeln();
    writeln('INgrese los datos del nuevo empleado: ');
    writeln();
    leerEmpleado(eNuevo);
    writeln();
  end;
  close(a);
  writeln();
  writeln('Finalizando carga de archivo...');
  writeln();
end;

procedure modificarEdad(var a : archivo_empleados);
var
  eNuevo, e : empleado;
  encontrado, continuar : boolean;
  opcion : integer;
begin
  reset(a);
  encontrado := false;
  continuar := true;
  writeln();
  writeln('Ingrese los datos del empleado a modificar: ');
  writeln();
  while continuar do begin
    write('Ingrese el numero de empleado: ');readln(eNuevo.id);
    write('Ingrese la nueva edad: ');readln(eNuevo.edad);
    seek(a, 0);
    while not EOF(a) and not encontrado do begin
      read(a, e);
      if (e.id = eNuevo.id) then begin
        encontrado := true;
        e.edad := eNuevo.edad;
        seek(a, filePos(a)-1);
        write(a, e);
      end;
    end;
    writeln();
    writeln('Indique si desea modificar la edad de otro empleado');
    writeln('  1. Si.');
    writeln('  2. No.');
    writeln();
    write('Ingrese la opcion elegida: ');readln(opcion);
    if opcion = 2 then
      continuar := false;
  end;
  close(a);
  writeln();
  writeln('Finalizando modificaciones...');
  writeln()
end;

procedure exportarArchivo (var a : archivo_empleados);
var
  e : empleado;
  aText : Text;
begin
  reset(a);
  assign(aText, 'todos_empleados.txt');
  rewrite(aText);
  while not EOF(a) do begin
    read(a, e);
    writeln(aText, e.id,'	',e.apellido,'	',e.nombre,'	',e.edad,'	',e.dni);
  end;
  close(a);
  close(aText);
  writeln();
  writeln('Finalizando la creacion del archivo...');
  writeln();
end;

procedure exportarDocFaltante (var a : archivo_empleados);
var
  e : empleado;
  aText : Text;
begin
  reset(a);
  assign(aText, 'faltaDNIEmpleado.txt');
  rewrite(aText);
  while not EOF(a) do begin
    read(a, e);
    if (e.dni = 00) then
      writeln(aText, e.id,'	',e.apellido,'	',e.nombre,'	',e.edad,'	',e.dni);
  end;
  close(a);
  close(aText);
  writeln();
  writeln('Finalizando la creacion del archivo...');
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
      5: agregarEmpleados(empleados);
      6: modificarEdad(empleados);
      7: exportarArchivo(empleados);
      8: exportarDocFaltante(empleados);
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
