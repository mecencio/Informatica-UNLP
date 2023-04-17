program ejercicio2;
const
	numMax=1500;
type
	archivo=file of integer;
	cadena15=string[15];
procedure procesar(var arc_logico: archivo);
	var
		total, cant, nro: integer;
		promedio: real;
	begin
		cant:= 0;
		total:= 0;
		reset(arc_logico);
		while not eof (arc_logico) do begin
			read(arc_logico, nro);
			if(nro<numMax) then
				cant:=cant + 1;
			total:=total + nro;
			writeln(nro);
		end;
		writeln('Cantidad de numeros menores a ',numMax,' es: ',cant);
		promedio:=total/fileSize(arc_logico);
		writeln('El promedio de los numeros ingresados es: ',promedio:1:1);
		close(arc_logico);
	end;
var
	arc_logico: archivo;
	arc_fisico: cadena15;
begin
	write('Ingrese el nombre del Archivo: ');
	readln(arc_fisico);
	assign(arc_logico, arc_fisico);
	procesar(arc_logico);
end.
