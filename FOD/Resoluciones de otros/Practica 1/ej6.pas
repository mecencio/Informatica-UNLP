
program ejercicio5;
const
	END_PROGRAM=8;
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
procedure archivosConMenorStockQueElMinimo(var logico: archivo);
	var
		c: celular;
		fisico: cadena15;
	begin
		write('Ingrese el nombre del archivo que desea procesar: ');readln(fisico);
		assign(logico, fisico);
		reset(logico);
		while not eof(logico) do begin
			read(logico, c);
			if(c.stock_disponible<c.stock_minimo) then
				imprimirCelular(c);
		end;
		close(logico);
	end;
procedure archivosQueContienenDescripcionEspecifica(var logico: archivo);
	var
		cadena, fisico: cadena15;
		c: celular;
	begin
		write('Ingrese el nombre del archivo que desea procesar: ');readln(fisico);
		assign(logico, fisico);
		reset(logico);
		write('Ingrese una cadena: ');
		readln(cadena);
		while not eof(logico) do begin
			read(logico, c);
			if(cadena=c.descripcion) then
				imprimirCelular(c)
			else
				writeln('No contiene ',cadena);
		end;
		close(logico);
	end;
procedure exportarATXT(var logico: archivo; var txt: text);
	var
		c: celular;
		fisico: cadena15;
	begin
		write('Ingrese el nombre del archivo que desea procesar: ');readln(fisico);
		assign(logico, fisico);
		assign(txt, 'celulares.txt');
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
procedure leerCelular(var c: celular);
	begin
		writeln('---------- Nuevo Celular ----------');
		with c do begin
			write('Ingrese el codigo: '); readln(cod);
			write('Ingrese el nombre: '); readln(nombre);
			write('Ingrese la descripcion: '); readln(descripcion);
			write('Ingrese la marca: '); readln(marca);
			write('Ingrese el precio: '); readln(precio);
			write('Ingrese el stock minimo: '); readln(stock_minimo);
			write('Ingrese el stock disponible: '); readln(stock_disponible);
		end;
	end;
procedure agregarCelular(var logico: archivo);
	var
		c, c2: celular;
		fisico: cadena15;
		existe: boolean;
	begin
		existe:=false;
		write('Ingrese el nombre del archivo que desea procesar: ');readln(fisico);
		assign(logico, fisico);
		reset(logico);
		leerCelular(c2);
		while not eof(logico) and (not existe) do begin
			read(logico, c);
			if(c.cod=c2.cod) then
				existe:=true;
		end;
		if(existe=false) then begin
			write(logico, c2);
			writeln('Celular agregado exitosamente');
		end
		else
			writeln('El celular ya se encuentra en el archivo.');
		close(logico);
	end;
procedure modificarStock(var logico: archivo);
	var
		fisico: cadena15;
		c: celular;
		stock_nuevo, cod_celular: integer;
		ok: boolean;
	begin
		ok:=false;
		write('Ingrese el nombre del archivo que desea procesar: ');readln(fisico);
		assign(logico, fisico);
		reset(logico);
		write('Ingrese el codigo del celular al cual desea modificar el stock: '); readln(cod_celular);
		while not eof(logico) and (not ok) do begin
			read(logico, c);
			if(c.cod=cod_celular) then begin
				write('Ingrese el nuevo stock: '); readln(stock_nuevo);
				c.stock_disponible:=stock_nuevo;
				seek(logico, filepos(logico)-1);
				write(logico, c);
				ok:=true;
			end;
		end;
		if(ok) then
			writeln('Stock modificado.')
		else
			writeln('El celular indicado no se encontro en el archivo.');
		close(logico);
	end;
procedure exportarSinStock(var logico: archivo);
	var
		txt: text;
		c: celular;
		fisico: cadena15;
	begin
		write('Ingrese el nombre del archivo que desea procesar: ');readln(fisico);
		assign(logico, fisico);
		assign(txt, 'sinStock.txt');
		reset(logico);
		rewrite(txt);
		while not eof(logico) do begin
			read(logico, c);
			if(c.stock_disponible=0) then begin
				writeln(txt,c.cod,c.precio,c.marca);
				writeln(txt,c.stock_disponible,c.stock_minimo,c.descripcion);
				writeln(txt,c.nombre);
			end;
		end;
		close(logico);
		close(txt);
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
		writeln('5. Agregar celular.');
		writeln('6. Modificar stock.');
		writeln('7. Exportar a TXT aquellos sin stock.');
		writeln('8. Finalizar programa.');
		readln(opcion);
		case opcion of
			1:	begin
					crearArchivoBinarioDesdeTexto(logico, txt)
				end;
			2:	begin
					archivosConMenorStockQueElMinimo(logico)
				end;
			3:	begin
					archivosQueContienenDescripcionEspecifica(logico)
				end;
			4:	begin
					exportarATXT(logico, txt)
				end;
			5:	begin
					agregarCelular(logico)
				end;
			6:	begin
					modificarStock(logico)
				end;
			7:	begin
					exportarSinStock(logico)
				end;
			8:	begin
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
