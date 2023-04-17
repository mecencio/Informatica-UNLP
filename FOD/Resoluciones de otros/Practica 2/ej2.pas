program ejercicio2;
const
	END_PROGRAM='z';
	COD_FAILED=9999;
type
	cadena15=string[15];
	alumno=record
		cod: integer;
		apellido: cadena15;
		nombre: cadena15;
		cursadas: integer;
		finales: integer;
	end;
	info_materia=record
		cod_alumno: integer;
		materia: cadena15;
		cursada: boolean;
		final: boolean;
	end;
	maestro=file of alumno;
	detalle=file of info_materia;
	texto=file of text;
procedure leerAlumno(var a: alumno);
	begin
		writeln('---- Nuevo Alumno ----');
		with a do begin
			write('Ingrese el codigo: '); readln(cod);
			if(cod<>COD_FAILED) then begin
				write('Ingrese el apellido: '); readln(apellido);
				write('Ingrese el nombre: '); readln(nombre);
				write('Ingrese la cantidad de cursadas aprobadas: '); readln(cursadas);
				write('Ingrese la cantidad de finales aprobados: '); readln(finales);
			end;
		end;
	end;
procedure cargarMaestro(var file_maestro: maestro);
	var
		a: alumno;
	begin
		rewrite(file_maestro);
		leerAlumno(a);
		while a.cod<>COD_FAILED do begin
			write(file_maestro, a);
			leerAlumno(a);
		end;
		close(file_maestro);
	end;
procedure imprimirMaestro(var file_maestro: maestro);
	var
		a: alumno;
	begin
		reset(file_maestro);
		while not eof(file_maestro) do begin
			read(file_maestro, a);
			writeln();
			with a do begin
				writeln('Codigo: ',cod);
				writeln(apellido);
				writeln(nombre);
				writeln(cursadas,' cursadas.');
				writeln(finales,' finales.');
			end;
			writeln();
		end;
		close(file_maestro);
	end;
procedure leerInfo(var i: info_materia);
	var
		cadena: cadena15;
	begin
		writeln('---- Nueva Informacion ----');
		with i do begin
			write('Ingrese el codigo de alumno: '); readln(cod_alumno);
			if(cod_alumno<>COD_FAILED) then begin
				write('Ingrese la materia: '); readln(materia);
				write('Ingrese "SI" si tiene la cursada aprobada o "NO" en caso contrario: '); readln(cadena);
				if(cadena='SI') then
					cursada:=true
				else
					cursada:=false;
				write('Ingrese "SI" si tiene el final aprobado o "NO" en caso contrario:'); readln(cadena);
				if(cadena='SI') then
					final:=true
				else
					final:=false;
			end;
		end;
	end;
procedure cargarDetalle(var file_detalle: detalle);
	var
		i: info_materia;
	begin
		rewrite(file_detalle);
		leerInfo(i);
		while(i.cod_alumno<>COD_FAILED) do begin
			write(file_detalle, i);
			leerInfo(i);
		end;
		close(file_detalle);
	end;
procedure imprimirDetalle(var file_detalle: detalle);
	var
		i: info_materia;
	begin
		reset(file_detalle);
		while not eof(file_detalle) do begin
			read(file_detalle, i);
			with i do begin
				writeln();
				writeln('Codigo de alumno: ',cod_alumno);
				writeln('Materia: ',materia);
				writeln('Cursada: ',cursada);
				writeln('Final: ',final);
				writeln();
			end;
		end;
		close(file_detalle);
	end;
procedure leer(var file_detalle: detalle; var i: info_materia);
	begin
		if(not eof(file_detalle)) then
			read(file_detalle, i)
		else
			i.cod_alumno:=COD_FAILED;
	end;
procedure actualizarMaestro(var file_maestro: maestro; var file_detalle: detalle);
	var
		a: alumno;
		i: info_materia;
		aux: integer;
	begin
		reset(file_maestro);
		reset(file_detalle);
		leer(file_detalle, i);
		read(file_maestro, a);
		while (i.cod_alumno<>COD_FAILED) do begin
			aux:=i.cod_alumno;
			while(aux=i.cod_alumno) do begin
				if(i.cursada) then begin
					a.cursadas:=a.cursadas + 1;
					if(i.final) then
						a.finales:=a.finales + 1;
				end;
				leer(file_detalle, i);
			end;
			while(a.cod<>aux) do begin
				read(file_maestro, a);
			end;
			seek(file_maestro, filepos(file_maestro) - 1);
			write(file_maestro, a);
			if(not eof(file_maestro)) then
				read(file_maestro, a);
		end;
		close(file_maestro);
		close(file_detalle);
	end;
procedure exportarATexto(var file_maestro: maestro; var file_text: texto);
	var
		a: alumno;
		counter: integer;
	begin
		reset(file_maestro);
		rewrite(file_text);
		while not eof(file_maestro) do begin
			read(file_maestro, a);
			counter:=0;
			//ACA DEBERIA IR TODO EL PROCESO PERO TENGO QUE CAMBIAR EL REGISTRO DE ALUMNO Y NO TENGO GANAS.
		end;
		close(file_maestro);
		close(file_text);
	end;
procedure menu(var opcion: char; var file_maestro: maestro; var file_detalle: detalle; var file_text: texto);
	begin
		writeln('A. Actualizar el archivo maestro.');
		writeln('B. Exportar alumnos que tienen mas de 4 materias aprobadas sin final.');
		writeln('C. Imprimir archivo maestro.');
		writeln('D. Imprimir archivo detalle.');
		writeln('Z. Finalizar programa.');
		readln(opcion);
		case opcion of
			'a':begin
					actualizarMaestro(file_maestro, file_detalle);
				end;
			'b':begin
					exportarATexto(file_maestro, file_text);
				end;
			'c':begin
					imprimirMaestro(file_maestro);
				end;
			'd':begin
					imprimirDetalle(file_detalle);
				end;
		end;
	end;
var
	opcion: char;
	file_maestro: maestro;
	file_detalle: detalle;
	file_text: texto;
begin
	opcion:='x';
	assign(file_maestro, 'alumnos.dat');
	assign(file_detalle, 'detalle.dat');
	assign(file_text, 'toTexto.txt');
	//cargarMaestro(file_maestro);
	//cargarDetalle(file_detalle);
	while(opcion<>END_PROGRAM) do begin
		menu(opcion, file_maestro, file_detalle, file_text);
	end;
end.
