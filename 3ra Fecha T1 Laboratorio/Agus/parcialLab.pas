program PPrecipitaciones;
//{$mode objfpc}


uses sysUtils,UABBAcumulador,UABBGenerico,UPrecipitacion,URandomGenerator,UEntero,UFecha,UDateTime;

const cantidadAGenerar = 5;
	  //cantidadUnidades = 10;
	  	  
	  	  
//type
//	vPrecipitaciones = array[1..cantidadPrecipitaciones] of Precipitacion;
//	ListaDeObjetos = specialize LinkedList<TObject>;


{
1) Haga un módulo que genere 45 productos generados al azar y sin orden alguno.
Almacene los Precipitaciones en un ABB ordenado por ID.
}


function generarDato(rg:RandomGenerator):TObject;
var unmilimetros:real;
	unafechaRegistro:Date;
begin
	unmilimetros:= rg.getreal(100,200);
	unafechaRegistro:= rg.getDate(Date.create(1,1,2024),Date.create(1,1,2026));		
	generarDato:= Precipitacion.create(unmilimetros,unafechaRegistro);
end;

function generarClave(rg:RandomGenerator):Comparable;
begin	
	generarClave:= Entero.create( rg.getInteger(1,20) );
end;


procedure cargarArbol(rg:RandomGenerator;abb:ABBAcumulador; var ultimaClave:Comparable);
var	i:integer;
	dato:TObject;	
	clave:Comparable;
//	v:vPrecipitaciones;
begin
	for i:=1 to cantidadAGenerar do begin
		dato:= generarDato(rg);
		clave:= generarClave(rg);
			
		abb.agregar(clave, dato);
	end;
	ultimaClave:= clave;//saco el ultimo por referencia para usar luego
end;


procedure imprimirAcotado(abb:ABBAcumulador; LimiteMin,LimiteMax: integer);
begin
	abb.imprimirAcotado( Entero.create(LimiteMin) , Entero.create(LimiteMax) );
end;



function condicion(e:Acumulador):boolean;
begin
	condicion:=( (e.getUltimaFecha.getValor).getMonth = (5) );
end;

procedure imprimirConCondicion(o:TObject);
begin
	if condicion(Acumulador(o)) then Acumulador(o).imprimir;
end;

procedure imprimirUltimoRegistroMayo(abb:ABBAcumulador);
var min,max:Comparable;
begin
	min:= Entero.create(-9999);
	max:= Entero.create(9999);
	abb.procesar(min,max,@imprimirConCondicion);
end;


procedure resetearAcumulador(abb:ABBGenerico;unCodigoUnidad:integer);
var o:TObject;
	existe:boolean;
	e:Acumulador;
begin
	abb.buscarElemento(Entero.create(unCodigoUnidad), o, existe);
	if existe then begin
		e:= Acumulador(o);
		e.setAcumuladoPrecipitacion(0);
		e.setUltimaFecha( Fecha.create(Date.create(1,1,1900)) );
		writeln('el codigo unico fue reseteado con exito');
		write('informacion actual: ');e.imprimir;
	end
	else writeln('no se encuentra el codigo unico ',unCodigoUnidad);
end;






//MAIN PROGRAM
var rg: RandomGenerator;
	abb: ABBAcumulador;
	ultimaClave: Comparable;
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
	imprimirAcotado(abb,4,7);
	writeln();
	writeln();
	writeln();
{inciso 3}
	imprimirUltimoRegistroMayo(abb);
	writeln();
	writeln();
	writeln();
{inciso 4}
	resetearAcumulador(abb,5);

END.
