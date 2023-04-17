program ejercicio5;
const
	END_PROGRAM=5;
type
	cadena15=string[15];
	cadena10=string[10];
	celular=record
		cod: integer;
		nombre: cadena10;
		descripcion: cadena15;
		precio: integer;
		marca: cadena15;
		stock_minimo: integer;
		stock_disponible: integer;
	end;
	archivo=file of celular;
procedure crearArchivoBinarioDesdeTexto(var logico: archivo; var txt: text);
	var	
		fisico: cadena10;
		c: celular;
	begin
		reset(txt);
		write('Ingrese el nombre del archivo que desea crear: '); readln(fisico);
		assign(logico, fisico);
		rewrite(logico);
		while not eof(txt) do begin
			readln(txt,c.cod,c.precio,c.marca);
			readln(txt,c.stock_disponible,c.stock_minimo,c.descripcion);
			readln(txt,c.nombre);
			write(logico, c);
		end;
		close(txt);
		close(logico);
	end;
procedure imprimirCelular(c: celular);
	begin
		with c do begin
			writeln('Codigo: ',cod);
			writeln('Nombre: ',nombre);
			writeln('Descripcion: ',descripcion);
			writeln('Marca: ',marca);
			writeln('Precio: $',precio);
			writeln('Stock: ',stock_disponible);
		end;
	end;
procedure incisoB(var logico: archivo);
	var
		c: celular;
	begin
		assign(logico, 'celulares');
		reset(logico);
		while not eof(logico) do begin
			read(logico, c);
			if(c.stock_disponible<c.stock_minimo) then
				imprimirCelular(c);
		end;
		close(logico);
	end;
procedure incisoC(var logico: archivo);
	var
		cadena: cadena15;
		c: celular;
	begin
		write('Ingrese una cadena: ');
		readln(cadena);
		assign(logico, 'celulares');
		reset(logico);
		while not eof(logico) do begin
			read(logico, c);
			if(cadena=c.descripcion) then
				imprimirCelular(c)
			else
				writeln('No contiene ',cadena);
		end;
		close(logico);
	end;
procedure incisoD(var logico: archivo; var txt: text);
	var
		c: celular;
	begin
		assign(logico, 'celulares');
		assign(txt, 'celulares2.txt');
		rewrite(txt);
		reset(logico);
		while not eof(logico) do begin
			read(logico,c);
			writeln(txt,c.cod,c.precio,c.marca);
			writeln(txt,c.stock_disponible,c.stock_minimo,c.descripcion);
			writeln(txt,c.nombre);
		end;
		close(txt);
		close(logico);
	end;
procedure menu(var opcion: integer);
	var
		logico: archivo;
		txt: text;
	begin
		writeln('1. Importar desde "celulares.txt".');
		writeln('2. Mostrar celulares que tienen menor stock que el minimo.');
		writeln('3. Mostrar celulares que tengan una descripcion proporcionada por el usuario.');
		writeln('4. Exportar archivo creado en OPCION 1 a un archivo de texto denominado "celulares.txt"');
		writeln('5. Finalizar programa.');
		readln(opcion);
		case opcion of
			1:	begin
					crearArchivoBinarioDesdeTexto(logico, txt)
				end;
			2:	begin
					incisoB(logico)
				end;
			3:	begin
					incisoC(logico)
				end;
			4:	begin
					incisoD(logico, txt)
				end;
			5:	begin
					write('Finalizando programa...')
				end;
			else write('Flaco la opcion esa es incorrecta')
		end;
	end;
var
	opcion: integer;
begin
	opcion:=0;
	while(opcion<>END_PROGRAM) do
		menu(opcion);
	readln;
end.
