program PViajes;
//{$mode objfpc}


uses sysUtils,UABBAcumulador,UABBGenerico,UViaje,URandomGenerator,UFecha,UDateTime;

const cantidadAGenerar = 38;
	  //cantidadUnidades = 10;
	  	  
	  	  
//type
//	vViajes = array[1..cantidadViajes] of Viaje;
//	ListaDeObjetos = specialize LinkedList<TObject>;





function generarDato(rg:RandomGenerator):TObject;
var unKilometros:real;
	unMonto:real;
begin
	unKilometros:= rg.getreal(100,200);
	unMonto:= rg.getreal(10000,20000);
	generarDato:= Viaje.create( unKilometros, unMonto );
end;

function generarClave(rg:RandomGenerator):Comparable;
begin	
	generarClave:= Fecha.create( rg.getDate( Date.create(1,1,2024),Date.create(9,3,2024) ) );
	//writeln(Fecha(generarClave).toString); para debugging
end;


procedure cargarArbol(rg:RandomGenerator;abb:ABBAcumulador; var ultimaClave:Comparable);
var	i:integer;
	dato:TObject;	
	clave:Comparable;
//	v:vViajes;
begin
	for i:=1 to cantidadAGenerar do begin
		dato:= generarDato(rg);
		clave:= generarClave(rg);
			
		abb.agregar(clave, dato);
	end;
	ultimaClave:= clave;//saco el ultimo por referencia para usar luego
end;



procedure imprimirMayoresUnValor(abb:ABBAcumulador; unDate:Date);
var min:Comparable;
begin
	min:= Fecha.create(unDate);
	abb.imprimirMayores(min);
end;


procedure imprimirPromedioFechaPorParametro(abb:ABBGenerico;unaFecha:Date);
var o:TObject;
	existe:boolean;
	e:Acumulador;
	promedio: real;
begin
	abb.buscarElemento(Fecha.create(unaFecha), o, existe);
	if existe then begin
		e:= Acumulador(o);
		promedio:= (e.getKilometrosAcumulados / e.getcantidadViajes);
		write( 'el promedio de kilometros por viaje es de ',promedio:6:2 );
		writeln(' para la fecha ',unaFecha.toString);
	end
	else writeln('no se encuentra la fecha ',unaFecha.toString);
end;



procedure imprimirConCondicion(o:TObject);
var e:Acumulador;
	promedio:real;
begin
	e:= Acumulador(o);
	promedio:= (e.getMontoTotal / e.getcantidadViajes);
	if (promedio > 15000) then writeln(e.getFecha.toString);
end;

procedure imprimirPromediosMayoresA15000(abb:ABBGenerico);
var min,max:Comparable;
begin
	min:= Fecha.create(Date.create(1,1,2000));
	max:= Fecha.create(Date.create(1,1,2025));
	abb.procesar(min,max,@imprimirConCondicion);
end;




//MAIN PROGRAM
var rg: RandomGenerator;
	abb: ABBAcumulador;
	ultimaClave: Comparable;
	d:Date;
BEGIN
	rg:= RandomGenerator.create();
	abb:= ABBAcumulador.create();


{inciso 1}
	cargarArbol(rg, abb, ultimaClave);
	abb.imprimirEnOrden();
	writeln();
	writeln();
	writeln();
{inciso 2}
	d:= Fecha(ultimaClave).getValor;
	writeln('mayores que ',d.toString);
	writeln();
	imprimirMayoresUnValor(abb, d);
	writeln();
	writeln();
	writeln();
{inciso 3}
	imprimirPromedioFechaPorParametro(abb,d);
	writeln();
	writeln();
	writeln();
{inciso 4}
	writeln('fechas cuyo promedio entre monto y cantidad viajes fue mayor a $15000');
	imprimirPromediosMayoresA15000(abb);
END.
