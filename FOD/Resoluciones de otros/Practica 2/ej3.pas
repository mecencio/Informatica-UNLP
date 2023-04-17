program ejercicio3;
const COD_FAIL=9999;
type
	string15=string[15];
	string30=string[30];
	product=record
		cod: integer;
		name: string15;
		description: string30;
		stock: integer;
		stock_min: integer;
		price: real;
	end;
	detail=record
		cod: integer;
		quantity: integer;
	end;
	products=file of product;
	daily=file of detail;
	file_daily=array[1..30] of daily;
	records_detail=array[1..30] of detail;
procedure readProduct(var p: product);
	begin
		writeln('---- Nuevo Producto ----');
		with p do begin
			write('Ingrese el codigo: '); readln(cod);
			if cod<>COD_FAIL then begin
				write('Ingrese el nombre: '); readln(name);
				write('Ingrese la descripcion: '); readln(description);
				write('Ingrese el stock: '); readln(stock);
				write('Ingrese el stock minimo: '); readln(stock_min);
				write('Ingrese el precio: '); readln(price);
			end;
		end;
	end;
procedure completeFile(var master: products);
	var
		p: product;
	begin
		rewrite(master);
		readProduct(p);
		while p.cod<>COD_FAIL do begin
			write(master, p);
			readProduct(p);
		end;
		close(master);
	end;
procedure readDaily(var file_detail: daily; var d: detail);
	begin
		if not eof(file_detail) then
			read(file_detail, d)
		else
			d.cod:=COD_FAIL;
	end;
procedure minium(var rec_det: records_detail; var min: detail; var data: file_daily); //INCOMPLETO
	var
		i: integer;
	begin
		min:= rec_det[i];
		readDaily(data[i], rec_det[i]);
	end;
procedure showRecord(p: product);
	begin
		writeln();
		with p do begin
			writeln('Codigo: ', cod);
			writeln('Nombre: ', name);
			writeln('Descripcion: ', description);
			writeln('Stock: ', stock);
			writeln('Stock Minimo: ', stock_min);
			writeln('Precio: ', price:1:0);
		end;
	end;
procedure showFile(var master: products);
	var
		p: product;
	begin
		reset(master);
		while not eof(master) do begin
			read(master, p);
			showRecord(p);
		end;
		close(master);
	end;
var
	master: products;
begin
	assign(master, 'products.dat');
	//completeFile(master); Se dispone
	showFile(master);
end.
