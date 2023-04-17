program ejercicio3;
type
	rango_edad=1..100;
	cadena15=string[15];
	empleado=record
		nro: integer;
		apellido: cadena15;
		nombre: cadena15;
		edad: rango_edad;
		dni: longint;
	end;
	archivo=file of empleado;
procedure leerEmpleado(var e: empleado);
	begin
		writeln('---------- Nuevo empleado ----------');
		write('Ingrese el numero de empleado: '); readln(e.nro);
		write('Ingrese el apellido del empleado: '); readln(e.apellido);
		if(e.apellido<>'fin') then begin
			write('Ingrese el nombre del empleado: '); readln(e.nombre);
			write('Ingrese la edad del empleado: '); readln(e.edad);
			write('Ingrese el DNI del empleado: '); readln(e.dni);
		end;
	end;
procedure cargarArchivo(var logico: archivo);
	var
		fisico: cadena15;
		e: empleado;
	begin
		write('Ingrese el nombre del Archivo: ');readln(fisico);
		assign(logico, fisico);
		rewrite(logico);
		leerEmpleado(e);
		while(e.apellido<>'fin') do begin
			write(logico, e);
			leerEmpleado(e);
		end;
		close(logico);
	end;
procedure imprimirEmpleado(e: empleado);
	begin
		writeln('---------------------');
		writeln('Numero: ',e.nro);
		writeln('Apellido: ',e.apellido);
		writeln('Nombre: ',e.nombre);
		writeln('Edad: ',e.edad);
		writeln('DNI: ',e.dni);
	end;
procedure opcionDosUno(var logico: archivo);
	var
		nombreApellido: cadena15;
		e: empleado;
	begin
		write('Ingrese el nombre o apellido por el cual quiere filtar los datos: '); readln(nombreApellido);
		while not eof(logico) do begin
			read(logico, e);
			if(e.apellido=nombreApellido) or (e.nombre=nombreApellido) then
				imprimirEmpleado(e);
		end;
	end;
procedure opcionDosDos(var logico: archivo);
	var
		e: empleado;
	begin
		while not eof(logico) do begin
			read(logico, e);
			imprimirEmpleado(e);
		end;
	end;
procedure opcionDosTres(var logico: archivo);
	var
		e: empleado;
	begin
		while not eof(logico) do begin
			read(logico, e);
			if(e.edad>70) then
				imprimirEmpleado(e);
		end;
	end;
procedure listarEnPantalla(var logico: archivo);
	var
		opcion: integer;
	begin
		writeln('2.1 Listar en pantalla los datos de empledos que tengan un nombre o apellido determinado.');
		writeln('2.2 Listar en pantalla los empleados de a uno por linea.');
		writeln('2.3 Listar en pantalla empleados mayores de 70 anios, proximos a jubilarse.');
		readln(opcion);
		if(opcion=1) then
			opcionDosUno(logico)
		else if(opcion=2) then
				opcionDosDos(logico)
			else
				opcionDosTres(logico);
	end;
procedure subMenu(var logico: archivo);
	var
		fisico: cadena15;
	begin
		write('Ingrese el nombre del Archivo: ');readln(fisico);
		assign(logico, fisico);
		reset(logico);
		listarEnPantalla(logico);
		close(logico);
	end;
procedure menu(var logico: archivo; var opcion: integer);
	begin
		writeln('1. Crear un archivo de empleados.');
		writeln('2. Abrir un archivo.');
		writeln('3. Finalizar programa.');
		readln(opcion);
		if(opcion=1) then
			cargarArchivo(logico)
		else if(opcion=2) then
				subMenu(logico)
			else
				write('Finalizando programa...');
	end;
var
	logico: archivo;
	opcion: integer;
begin
	opcion:=0;
	while(opcion<>3) do
		menu(logico, opcion);
	readln();
end.
