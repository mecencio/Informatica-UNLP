program tp1Ejercicio3;

type
  empleado = record
    numEmpleado : integer;
    apellido : string;
    nombre : string;
    edad : 1..110;
    dni : integer;
  end;
  archivo_empleado = file of empleado;

procedure leer (var e : empleado);
begin
 with e do begin
   writeln();
   write('Ingrese el apellido del empleado: '); readln(apellido);
   if (apellido <> 'fin') then begin
     write('Ingrese el nombre del empleado: '); readln(nombre);
     write('Ingrese el numero del empleado: '); readln(numEmpleado);
     write('Ingrese la edad del empleado: '); readln(edad);
     write('Ingrese el DNI del empleado: '); readln(dni);
   end;
 end;
end;

procedure crearArchivo (var a : archivo_empleado);
var
  e : empleado;
begin
  leer(e);
  rewrite(a);
  while (e.apellido <> 'fin') do begin
    write(a, e);
    leer(e);
  end;
  close(a);
end;

procedure listarEmpleados (var a : archivo_empleado);
var
  e : empleado;
begin
  reset(a);
  while (not EOF(a)) do begin
    read(a, e);
    with e do
      writeln('DNI ', dni, ' ', apellido, ' ', nombre, ' edad: ', edad, ' numero empleado: ', numEmpleado);
  end;
end;

var
  nomArchivo, ruta, opcion : string;
  empleados : archivo_empleado;
begin
  writeln('Bienvenido!!');
  writeln();
  write('Ingrese el nombre del archivo que desea crear o utilizar: '); readln(nomArchivo);
  writeln();writeln();
  ruta := 'C:\Users\nicol\OneDrive\Documentos\Facu\FOD\Resoluciones\' + nomArchivo + '.dat';
  assign(empleados, ruta);
  writeln('-----------------------------------------------');
  writeln('Opciones: ');
  writeln('1.- Crear un archivo de registros de empleados ');
  writeln();
  writeln('Abrir el archivo anteriormente indicado y: ');
  writeln('   2.- Buscar y listar empleados segun nombre o apellido ');
  writeln('   3.- Listar todos los empleados ');
  writeln('   4.- Listar empleados mayores de 70 anios ');
  writeln();
  write('Ingrese la opcion elegida: '); readln(opcion);
  if (opcion = '1') then crearArchivo(empleados)
  else if (opcion = '2') then writeln(2)
  else if (opcion = '3') then listarEmpleados(empleados)
  else if (opcion = '4') then writeln(4)
  else writeln('La opcion no es correcta');
end.
