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
procedure agregarEmpleado(var logico: archivo);
	var
		e, aux: empleado;
		existe: boolean;
	begin
		existe:= false;
		reset(logico);
		leerEmpleado(aux);
		while not eof(logico) and (existe=false) do begin
			read(logico, e);
			if(e.nro=aux.nro) then
				existe:= true
			else
				existe:=false;
		end;
		if(existe=false) then begin
			write(logico, aux);
			writeln('Empleado agregado exitosamente.');
		end
		else
			writeln('Empleado ya existente.');
		close(logico);
	end;
procedure modificarEdad(var logico: archivo);
	var
		edad: rango_edad;
		nroEmpleado: integer;
		modifique: boolean;
		e: empleado;
	begin
		modifique:= false;
		reset(logico);
		write('Ingrese el numero de Empleado al que le desea modificar la edad: '); readln(nroEmpleado);
		write('Ingrese la edad: '); readln(edad);
		while not eof(logico) and (not modifique) do begin
			read(logico, e);
			if(e.nro=nroEmpleado) then begin
				e.edad:=edad;
				seek(logico, filepos(logico)-1);
				write(logico, e);
				modifique:=true;
			end;
		end;
		if (modifique) then
			writeln('Empleado ',nroEmpleado,' modificado.')
		else
			writeln('Empleado ',nroEmpleado,' no encontrado en la base de datos.');
		close(logico);
	end;
procedure exportarArchivo(var logico: archivo; nombre_archivo: cadena15; filtro: boolean);
	var
		e: empleado;
		nuevo_archivo: text;
	begin
		assign(nuevo_archivo, nombre_archivo);
		rewrite(nuevo_archivo);
		reset(logico);
		if(filtro) then begin
			while not eof(logico) do begin
				read(logico, e);
				if(e.dni=00) then
					writeln(nuevo_archivo,'Numero de empleado: ',e.nro,'Apellido: ',e.apellido,'Nombre: ',e.nombre,'Edad: ',e.edad,'DNI: ',e.dni);
			end;
		end
		else begin
			while not eof(logico) do begin
				read(logico, e);
				writeln(nuevo_archivo,' ',e.nro,' ',e.apellido,' ',e.nombre,' ',e.edad,' ',e.dni)
			end;
		end;
		close(logico);
		close(nuevo_archivo);
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
		writeln('3. Agregar empleado a archivo.');
		writeln('4. Modificar edad de empleado.');
		writeln('5. Exportar archivo de empleados en .txt');
		writeln('6. Exportar archivo de empleados que no tienen cargado su DNI en .txt');
		writeln('7. Finalizar programa.');
		readln(opcion);
		case opcion of
			1: 	begin
					cargarArchivo(logico);
				end;
			2: 	begin
					subMenu(logico);
				end;
			3:	begin
					agregarEmpleado(logico);
				end;
			4:	begin
					modificarEdad(logico);
				end;
			5:	begin
					exportarArchivo(logico, 'todos_empleados', false);
				end;
			6:	begin
					exportarArchivo(logico, 'faltaDNIEmpleado', true);
				end;
			else write('Finalizando programa...');
		end;
	end;
var
	logico: archivo;
	opcion: integer;
begin
	opcion:=0;
	while(opcion<>7) do
		menu(logico, opcion);
	readln();
end.
