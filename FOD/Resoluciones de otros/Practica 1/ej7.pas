program ejercicio7;
const
	END_PROGRAM='z';
type
	cadena15=string[15];
	novela=record
		cod: integer;
		name: cadena15;
		gen: cadena15;
		price: integer;
	end;
	binario=file of novela;
procedure createFile(var archivo: binario; var txt: text);
	var
		name_binario: cadena15;
		n: novela;
	begin
		assign(txt, 'novelas.txt');
		reset(txt);
		write('Ingrese un nombre para el archivo: '); readln(name_binario);
		assign(archivo, name_binario);
		rewrite(archivo);
		while not eof(txt) do begin
			readln(txt,n.cod,n.price,n.gen);
			readln(txt,n.name);
			write(archivo, n);
		end;
		close(txt);
		close(archivo);
	end;
procedure leerNovela(var n: novela);
	begin
		writeln('-------- Nueva novela --------');
		with n do begin
			write('Codigo: '); readln(cod);
			write('Nombre: '); readln(name);
			write('Genero: '); readln(gen);
			write('Precio: '); readln(price);
		end;
	end;
procedure addNovela(var archivo: binario);
	var
		n, n2: novela;
		name_binario: cadena15;
		existe: boolean;
	begin
		existe:=false;
		write('Ingrese el nombre del archivo que desea procesar: '); readln(name_binario);
		assign(archivo, name_binario);
		reset(archivo);
		leerNovela(n2);
		while not eof(archivo) and (not existe) do begin
			read(archivo, n);
			if(n.cod=n2.cod) then
				existe:=true;
		end;
		if(existe=false) then begin
			write(archivo, n2);
			writeln('Novela agregada exitosamente.');
		end
		else
			write('La novela ya existe');
		close(archivo);
	end;
procedure updateMenu();
	var
		option: char;
	begin
		writeln('B.a. Agregar novela.');
		writeln('B.b. Actualizar novela.');
		readln(option);
		case option of
			'a':	begin
					end;
			'b':	begin
					end;
			else writeln('Opcion no valida.');
		end;
	end;
procedure printNovela(n: novela);
	begin
		writeln();
		with n do begin
			writeln('Codigo: ',cod);
			writeln('Nombre: ',name);
			writeln('Genero: ',gen);
			writeln('Precio: ',price);
		end;
		writeln();
	end;
procedure printFile(var archivo: binario);
	var
		name_binario: cadena15;
		n: novela;
	begin
		write('Ingrese el nombre del archivo que desea procesar: '); readln(name_binario);
		assign(archivo, name_binario);
		reset(archivo);
		while not eof(archivo) do begin
			read(archivo, n);
			printNovela(n);
		end;
		close(archivo);
	end;
procedure showMenu(var option: char);
	var
		archivo: binario;
		txt: text;
	begin
		writeln('A. Crear archivo a partir de TXT.');
		writeln('B. Actualizar archivo.');
		writeln('C. Imprimir archivo.');
		writeln('Z. Finalizar programa.');
		readln(option);
		case option of
			'a':	begin
						createFile(archivo, txt)
					end;
			'b':	begin
					end;
			'c': 	begin
						printFile(archivo);
					end;
			'z':	begin
						writeln('Finalizando programa...')
					end;
			else writeln('Opcion no valida.')
		end;
	end;
var
	option: char;
begin
	option:='x';
	while option<>END_PROGRAM do
		showMenu(option);
end.
