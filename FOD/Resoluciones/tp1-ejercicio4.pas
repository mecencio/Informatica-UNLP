program tp1Ejercicio4;

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
  writeln('Listado de empleados');
  while (not EOF(a)) do begin
    read(a, e);
    with e do
      writeln('DNI ', dni, ' ', apellido, ' ', nombre, ' edad: ', edad, ' numero empleado: ', numEmpleado);
  end;
  close(a);
end;

procedure listarEmpleadosBuscados (var a : archivo_empleado);
var
  e : empleado;
  valor : string;
begin
  write('Ingrese el nombre o apellido que desea buscar: ');
  readln(valor);
  reset(a);
  writeln();
  writeln('Empleados llamados ', valor);
  while (not EOF(a)) do begin
    read(a, e);
    with e do begin
      if ((apellido = valor) or (nombre = valor)) then
        writeln('DNI ', dni, ' ', apellido, ' ', nombre, ' edad: ', edad, ' numero empleado: ', numEmpleado);
    end;
  end;
  close(a);
end;

procedure listarEmpleadosMayores (var a : archivo_empleado);
var
  e: empleado;
begin
  writeln('Empleados mayores a 70 anios');
  reset(a);
  while (not EOF(a)) do begin
    read(a, e);
    with e do begin
      if (edad > 70) then
        writeln('DNI ', dni, ' ', apellido, ' ', nombre, ' edad: ', edad, ' numero empleado: ', numEmpleado);
    end;
  end;
  close(a);
end;

procedure agregarAlFinal (var a : archivo_empleado);
var
  e1, e2 : empleado;
  encontrado : boolean;
begin
  encontrado := false;
  reset(a);
  leer(e1);
  while (not EOF(a)) do begin
    read(a, e2);
    if (e2.numEmpleado = e1.numEmpleado) then
      encontrado := true;
  end;
  if (encontrado) then begin
    writeln();
    writeln('La persona ya se encuentra en el listado')
  end
  else begin
    write(a, e1);
    writeln();
    writeln('Persona agregada correctamente');
  end;
  close(a);
  writeln();
  writeln('------------------');
  writeln('Proceso finalizado');
  writeln('------------------');
  writeln();
end;

procedure modificarEdad (var a : archivo_empleado);
var
  e, nuEmpleado : empleado;
  aux : archivo_empleado;
  ruta : string;
begin
  ruta := 'C:\Users\nico_\OneDrive\Documentos\Facu\FOD\Resoluciones\aux.dat';
  assign(aux, ruta);
  writeln('Ingrese las personas que desea modificar la edad');
  writeln('Debe estar ordenada por numero de empleado');
  writeln('Ingrese el apellido "fin" para finalizar la carga de empleados a modificar');
  crearArchivo(aux);
  reset(a);
  reset(aux);
  nuEmpleado.numEmpleado := -1;
  while(not EOF(a)) do begin
    read(a, e);
	while (not EOF(aux) and ((nuEmpleado.numEmpleado = -1) or (nuEmpleado.numEmpleado <= e.numEmpleado))) do begin
	  if (nuEmpleado.numEmpleado = e.numEmpleado) then begin
	    e.edad := nuEmpleado.edad;
	    seek(a, filePos(a)-1);
	    write(a, e);
	  end;
      read(aux, nuEmpleado);
	end;
	if (EOF(aux)) then begin
	  if (nuEmpleado.numEmpleado = e.numEmpleado) then begin
	    e.edad := nuEmpleado.edad;
	    seek(a, filePos(a)-1);
	    write(a, e);
	  end;
	  if (e.numEmpleado > nuEmpleado.numEmpleado) then
	    seek(a, fileSize(a));
	end;
  end;
  close(aux);
  close(a);
  writeln();
  writeln('------------------');
  writeln('Proceso finalizado');
  writeln('------------------');
  writeln();
end;

var
  nomArchivo, ruta, opcion : string;
  empleados : archivo_empleado;
begin
  writeln('Bienvenido!!');
  writeln();
  write('Ingrese el nombre del archivo que desea crear o utilizar: '); readln(nomArchivo);
  writeln();writeln();
  ruta := 'C:\Users\nico_\OneDrive\Documentos\Facu\FOD\Resoluciones\' + nomArchivo + '.dat';
  assign(empleados, ruta);
  writeln('-----------------------------------------------');
  writeln('Opciones: ');
  writeln('1.- Crear un archivo de registros de empleados ');
  writeln();
  writeln('Abrir el archivo anteriormente indicado y: ');
  writeln('   2.- Buscar y listar empleados segun nombre o apellido ');
  writeln('   3.- Listar todos los empleados ');
  writeln('   4.- Listar empleados mayores de 70 anios ');
  writeln('   5.- Aniadir uno o mas empleados al final del archivo');
  writeln('   6.- Modificar la edad de uno o mas empleados');
  writeln('   7.- Exportar el contenido del archivo a un archivo de texto');
  writeln('   8.- Exportar los empleados que no tengan DNI cargado');
  writeln();
  write('Ingrese la opcion elegida: '); readln(opcion);
  if (opcion = '1') then crearArchivo(empleados)
  else if (opcion = '2') then listarEmpleadosBuscados(empleados)
  else if (opcion = '3') then listarEmpleados(empleados)
  else if (opcion = '4') then listarEmpleadosMayores(empleados)
  else if (opcion = '5') then agregarAlFinal(empleados)
  else if (opcion = '6') then modificarEdad(empleados)
  else writeln('La opcion no es correcta');
end.
