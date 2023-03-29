program tp1Ejercicio2;

type
  archivo_enteros = file of integer;
var
  enteros : archivo_enteros;
  num, cant, sum, cantTotal : integer;
  ruta, nomArchivo : string;
begin
  writeln('Bienvenido!!');
  cant := 0;
  sum := 0;
  cantTotal := 0;
  write('Ingrese el nombre del archivo: ');
  readln(nomArchivo); // C:\Users\nicol\OneDrive\Documentos\Facu\FOD\Resoluciones\tp1Ej1.dat
  ruta := 'C:\Users\nicol\OneDrive\Documentos\Facu\FOD\Resoluciones\' + nomArchivo + '.dat';
  assign(enteros, ruta);
  reset(enteros);
  writeln();
  writeln('Listado de numeros en el archivos: ');
  while (not EOF(enteros)) do begin
    read(enteros, num);
    writeln(num);
    if (num < 1500) then
	  cant := cant + 1;
	cantTotal := cantTotal +1;
	sum := sum + num;
  end;
  writeln('Fin del archivo');
  writeln();
  writeln('-------------------------------------------------');
  writeln('La cantidad de numeros menores a 1500 es ', cant);
  writeln('El promedio de los numeros ingresados es ', sum/cantTotal:1:2);
  writeln('-------------------------------------------------');
  writeln();
  writeln('Termino el programa');
end.
