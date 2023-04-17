program ejercicio1;
const
	valoralto=9999;
type
	cadena15=string[15];
	empleado=record
		cod: integer;
		nombre: cadena15;
		comision: real;
	end;
	archivo=file of empleado;
procedure leerEmpleado(var e: empleado);
	begin
		writeln('---------- Nuevo Empleado ----------');
		with e do begin
			write('Ingrese el codigo: '); readln(cod);
			if(cod>0) then begin
				write('Ingrese el nombre: '); readln(nombre);
				write('Ingrese la comision: '); readln(comision);
			end
			else
				writeln('Codigo no valido')
		end;
	end;
procedure cargarArchivo(var comisiones: archivo);
	var
		e: empleado;
	begin
		rewrite(comisiones);
		leerEmpleado(e);
		while(e.cod>0) do begin
			write(comisiones, e);
			leerEmpleado(e);
		end;
		close(comisiones);
	end;
procedure leer(var comisiones: archivo; var e: empleado);
	begin
		if (not(eof(comisiones))) then 
			read (comisiones, e)
		else 
			e.cod := valoralto;
	end;

procedure compactar(var comisiones: archivo; var comisiones_compact: archivo);
	var
		e, aux: empleado;
		total_comisiones: real;
	begin
		reset(comisiones);
		rewrite(comisiones_compact);
		leer(comisiones, e);
		while(e.cod<>valoralto) do begin
			aux:=e;
			total_comisiones:=0;
			while(aux.cod=e.cod) do begin
				total_comisiones:=total_comisiones + e.comision;
				leer(comisiones, e);
			end;
			aux.comision:=total_comisiones;
			write(comisiones_compact, aux);
		end;
		close(comisiones);
		close(comisiones_compact);
	end;
procedure imprimirArchivo(var comisiones: archivo);
	var
		e: empleado;
	begin
		reset(comisiones);
		while not eof(comisiones) do begin
			read(comisiones, e);
			writeln('Empleado: ',e.cod,', ',e.nombre,', ',e.comision:1:0);
		end;
		close(comisiones);
	end;
var
	comisiones, comisiones_compact: archivo;
begin
	assign(comisiones, 'comisiones.dat');
	assign(comisiones_compact, 'comisiones_compact');
	//cargarArchivo(comisiones);
	imprimirArchivo(comisiones);
	compactar(comisiones, comisiones_compact);
	writeln();
	imprimirArchivo(comisiones_compact)
end.
