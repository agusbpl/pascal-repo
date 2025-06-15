program Palquileres;

uses sysUtils,UABBLista,UABBGenerico,UConsulta,URandomGenerator,UCadena,
	 UDateTime,GenericLinkedList;

const cantidadConsultas = 40;
	  
	  cantidadPacientes = 10;
	  	  
type
	ListaDeObjetos = specialize LinkedList<TObject>;


{
1) Haga un módulo que genere 45 productos generados al azar y sin orden alguno.
Almacene los alquileres en un ABB ordenado por ID.
}
procedure addLabels(rg:RandomGenerator);
var i:integer;
begin
	for i:=1 to cantidadPacientes do rg.addLabel( intToStr(rg.getInteger(1000,2000)) );
//	rg.addLabel('indumentaria');
end;

function generarClave(rg1:RandomGenerator):Comparable;
begin
	generarClave:= Cadena.create(rg1.getLabel);
end;

function generarDato(rg:RandomGenerator):TObject;
var laFecha:Date;
	unMonto:real;	
begin
	laFecha:= rg.getDate( Date.create(1,1,2024),Date.create(1,1,2026) );
	unMonto:= rg.getReal(50,100);
			
	generarDato:= 
		Consulta.create(laFecha,unMonto);
end;



procedure cargarArbol(rg:RandomGenerator;abb:ABBLista; var ultimaClave:Comparable);
var	i:integer;
	dato:TObject;	
	clave:Comparable;
	
begin
	addLabels(rg);
	for i:=1 to cantidadConsultas do begin
		clave:= generarClave(rg);
		dato:= generarDato(rg);
	
		abb.agregar(clave, dato);
	end;
	ultimaClave:= clave;
end;

procedure imprimirEnOrden(abb:ABBLista);
begin
	abb.imprimirEnOrden();
end;


procedure existeElemento(abb:ABBLista; unaClave:Comparable);
begin
	if abb.existeElemento(unaClave) 
	then writeln('esta el Paciente ',unaClave.toString)
	else writeln('no existe el Paciente ',unaClave.toString);
end;


function esVerano(unaFecha:Date):boolean;
var d,m:integer;
	ok:boolean;
begin// 21/12 al 21/03
	m:= unaFecha.getMonth;
	d:= unaFecha.getDay;
	
	ok:= false;
	
	if ( (m = 12) and (d >= 21) ) then ok:= true
	else begin
		if (m <= 3) then begin
			if (m = 3) then begin
				if (d <= 21) then ok:= true;
			end
			else ok:= true;
		end;
	end;
	esVerano:= ok;
end;

procedure imprimir(o:TObject);
var	lT:ListaDeObjetos;
	e:Consulta;
begin
	lT:= ListaDeObjetos(o);
	lT.reset();
	while not lT.eol do begin
		e:= Consulta(lT.current());
		if ( esVerano(e.getFecha) )
		then writeln(e.getMonto:6:2);
		
		lT.next();
	end;
	writeln();
end;


procedure imprimirMontosVerano(abb:ABBLista;unDniMin:string);
var min,max:Comparable;
begin
	min:= Cadena.create(unDniMin);
	max:= Cadena.create('999999');

	abb.procesar(min,max, @imprimir);
end;



//MAIN PROGRAM
var rg: RandomGenerator;
	abb: ABBLista;
	unaClave: Comparable;
BEGIN
	rg:= RandomGenerator.create();
	//rg2:= RandomGenerator.create();
	abb:= ABBLista.create();
	
{inciso 1}
	cargarArbol(rg, abb, unaClave);
	
{inciso 2}
	imprimirEnOrden(abb);

{inciso 3}
//	unaClave:= Cadena.create('claveErronea');
	existeElemento(abb, unaClave);
	writeln();
{inciso 4}
	imprimirMontosVerano(abb,'1200');



{
	writeln();
	writeln();
	aumentarMontos(abb);
	abb.imprimirEnOrden();
	writeln();
	writeln();
	imprimirRubroIndumentaria(abb);
	writeln();
	unaCantidad:= 5;
	unId:= Id.create( Cadena.create('indumentaria') , Entero.create(70) );
	actualizarStock(abb,unId,unaCantidad);
	writeln();
	writeln();
	writeln();
	writeln('Consultas con Menos de Diez Unidades');
	writeln();
	imprimirStockMenosDeDiezUnidades(abb);
	writeln();
	writeln();
	writeln('Stock acotado');
	writeln();
	min:= ComparableDoble.create(Id.create(Cadena.create(''),Entero.create(-9999)));
	max:= ComparableDoble.create(Id.create(Cadena.create('zzzzzzzzz'),Entero.create(9999)));
	imprimirStockAcotado(abb,min,max);
}

END.
