program tp1Ejercicio4;

type
  rango_edad=1..110;
  cadena15=string[15];
  empleado = record
    nro: integer;
    apellido: cadena15;
    nombre: cadena15;
    edad: rango_edad;
    dni: longint;
  end;
  
  archivo_empleados = file of empleado;

procedure leerEmpleado (var e : empleado);
begin
  with e do begin
    write('Ingrese el apellido: '); readln(apellido);
    if (apellido <> 'fin') then begin
      write('Ingrese el nombre: '); readln(nombre);
      write('Ingrese el nro de empleado: '); readln(nro);
      write('Ingrese la edad: '); readln(edad);
      write('Ingrese el DNI: '); readln(dni);
    end;
  end;
end;

procedure crearArchivo (var a : archivo_empleados);
var
  e : empleado;
begin
  rewrite(a);
  leerEmpleado(e);
  while (e.apellido <> 'fin') do begin
    write(a, e);
    writeln();
    writeln('Empelado cargado');
    writeln();
    leerEmpleado(e);
  end;
  close(a);
end;

procedure listarNombreOApellido (var a : archivo_empleados);
var
  e : empleado;
  dato : cadena15;
begin
  write('Ingrese el nombre o apellido que desea listar: ');
  readln(dato);
  writeln();
  reset(a);
  while (not EOF(a)) do begin
    read(a, e);
    with e do begin
      if ((nombre = dato) or (apellido = dato)) then begin
        writeln('Empleado nro: ', nro, ', Nombre y apellido: ',apellido,' ',nombre,' DNI: ',dni,' edad: ', edad);
      end;
    end;
  end;
  writeln();
  close(a);
end;

procedure listarEmpleados(var a : archivo_empleados);
var
  e : empleado;
begin
  reset(a);
  writeln('Listado de empleados: ');
  writeln();
  while (not EOF(a)) do begin
    read(a, e);
    with e do begin
      writeln('Empleado nro: ', nro, ', Nombre y apellido: ',apellido,' ',nombre,' DNI: ',dni,' edad: ', edad);
    end;
  end;
  writeln();
  close(a);
end;

procedure listarMayores (var a : archivo_empleados);
var
  e : empleado;
begin
  reset(a);
  writeln('Listado de empleados mayores a 70 anios: ');
  writeln();
  while (not EOF(a)) do begin
    read(a, e);
    with e do begin
      if (e.edad > 70) then
        writeln('Empleado nro: ', nro, ', Nombre y apellido: ',apellido,' ',nombre,' DNI: ',dni,' edad: ', edad);
    end;
  end;
  writeln();
  close(a);
end;

procedure aniadirEmpleados (var a : archivo_empleados);
var
  e, aux : empleado;
  opcion : integer;
  existe, continuar : boolean;
begin
  reset(a);
  continuar := true;
  while continuar do begin
    existe := false;
    writeln();
    writeln('Ingrese los datos del empleado a ingresar: ');
    writeln();
    leerEmpleado(e);
    while (not EOF(a) and not existe) do begin
      read(a, aux);
      if (e.nro = aux.nro) then existe := true;
    end;
    if existe then begin
      writeln();
      writeln('El nro de empleado ya se encuentra registrado');
      writeln();
    end
    else begin
      seek(a, fileSize(a));
      write(a, e);
      writeln();
      writeln('Empleado ingresado correctamente');
      writeln();
    end;
    writeln('¿Desea ingresar otro empleado?');
    writeln('  1.- Si');
    writeln('  2.- No');
    writeln();
    write('Ingrese su opcion: ');readln(opcion);
    if (opcion <> 1) then continuar := false;
    seek(a, 0);
    writeln();
  end;
  writeln();
  close(a);
end;

procedure modificarEdad (var a : archivo_empleados);
var
  e : empleado;
  encontrado, continuar: boolean;
  opcion, nro : integer;
begin
  reset(a);
  continuar := true;
  while continuar do begin
    encontrado := false;
    writeln();
    write('Ingrese el nro de empleado que desea modificar: '); readln(nro);
    writeln();
    while (not EOF(a) and not encontrado) do begin
      read(a, e);
      if (e.nro = nro) then encontrado := true;
    end;
    if encontrado then begin
      seek(a, filePos(a)-1);
      write('Ingrese la nueva edad: ');readln(e.edad);
      writeln();
      write(a, e);
      writeln('Cambio ingresado correctamente');
      writeln();
    end
    else begin
      writeln('El empleado con ese nro no se encuentra en el listado');
      writeln();
    end;
    writeln('¿Desea ingresar otro empleado?');
    writeln('  1.- Si');
    writeln('  2.- No');
    writeln();
    write('Ingrese su opcion: ');readln(opcion);
    if (opcion <> 1) then continuar := false;
    seek(a, 0);
    writeln();
  end; 
  writeln();
  close(a);
end;

procedure exportarArchivo (var a : archivo_empleados; filtro : boolean);
var
  aux : text;
  e : empleado;
begin
  reset(a);
  if filtro then begin
    assign(aux, 'C:\Program Files\Facu\FOD\Resoluciones\TP1\faltaDNIEmpleado.txt');
    rewrite(aux);
    while not EOF(a) do begin
      read(a, e);
      if(e.dni = 0) then writeln(aux, 'nro: ', e.nro, ' apellido y nombre: ', e.apellido,' ', e.nombre,' edad: ',e.edad,' DNI: ',e.dni);
    end;
  end
  else begin
    assign(aux, 'C:\Program Files\Facu\FOD\Resoluciones\TP1\todos_empleados.txt');
    rewrite(aux);
    while not EOF(a) do begin
      read(a, e);
      writeln(aux, 'nro: ', e.nro, ' apellido y nombre: ', e.apellido,' ', e.nombre,' edad: ',e.edad,' DNI: ',e.dni);
    end;
  end;
  writeln();
  writeln('Archivo exportado exitosamente');
  writeln();
  writeln();
  close(a);
  close(aux);
end;

procedure menu (var a : archivo_empleados);
var
  opcion : integer;
  continuar : boolean;
begin
  continuar := true;
  while continuar do begin
    writeln('Ingrese que opcion desea realizar: ');
    writeln('1.- Crear y completar un archivo de empleados');
    writeln('2.- Listar los empleados que tengan un nombre o apellido determinado');
    writeln('3.- Listar todos los empleados');
    writeln('4.- Listar los empleados mayores de 70 anios');
    writeln('5.- Aniadir uno o mas empleados al final del archivo');
    writeln('6.- Modificar edad de uno o mas empleados');
    writeln('7.- Exportar el contenido al archivo "todos_empleados.txt"');
    writeln('8.- Exportar al archivo "faltaDNIEmpleado.txt" los empleados con DNI 00');
    writeln('Ingrese cualquier otro numero para finalizar el programa');
    writeln();
    write('Ingrese la opcion elegida: '); readln(opcion);
    writeln();
    case opcion of
      1: crearArchivo(a);
      2: listarNombreOApellido(a);
      3: listarEmpleados(a);
      4: listarMayores(a);
      5: aniadirEmpleados(a);
      6: modificarEdad(a);
      7: exportarArchivo(a,false);
      8: exportarArchivo(a, true);
      else begin
        writeln('Finalizando programa...');
        continuar := false;
      end;
    end;
  end;
end;

var
  empleados : archivo_empleados;
  ruta, nombreArchivo : string;
begin
  write('Ingrese el nombre del archivo que desea crear o modificar: '); readln(nombreArchivo);
  writeln();
  ruta := 'C:\Program Files\Facu\FOD\Resoluciones\TP1\' + nombreArchivo + '.dat';
  assign(empleados, ruta);
  menu(empleados);
end.
