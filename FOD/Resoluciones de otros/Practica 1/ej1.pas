program ejercicio1;
const
	maxNum=30000;
type
	archivo=file of integer;
	cadena15=string[15];
var
	arc_logico: archivo;
	arc_fisico: cadena15;
	num: integer;
begin
	write('Ingrese el nombre del Archivo: ');
	readln(arc_fisico);
	assign(arc_logico, arc_fisico);
	rewrite(arc_logico);
	write('Ingrese un numero: ');
	readln(num);
	while num<>maxNum do begin
		write(arc_logico, num);
		write('Ingrese un numero: ');
		readln(num);
	end;
	close(arc_logico);
end.
