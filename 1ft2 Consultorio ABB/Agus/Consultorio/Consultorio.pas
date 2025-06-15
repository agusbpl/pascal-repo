program Palquileres;

uses sysUtils,UABBLista,UABBGenerico,UConsulta,URandomGenerator,UCadena,
	 UDateTime,GenericLinkedList;

const cantidadConsultas = 40;
	  
	  cantidadPacientes = 10;
	  	  
type
	ListaDeObjetos = specialize LinkedList<TObject>;


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



procedure cargarArbol(abb:ABBLista; var ultimaClave:Comparable);
var	i:integer;
	dato:TObject;	
	clave:Comparable;
	rg: RandomGenerator;
begin
	rg:= RandomGenerator.create();
	//rg2:= RandomGenerator.create();
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
var mes,dia:integer;
begin// 21/12 al 21/03
	mes:= unaFecha.getMonth;
	dia:= unaFecha.getDay;
	
	esVerano := ((mes = 12) and (dia >= 21)) or
				 (mes = 1) or (mes = 2) or
				((mes = 3) and (dia <= 21));
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
		then writeln('monto: ',e.getMonto:6:2);
		
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
var abb: ABBLista;
	unaClave: Comparable;
BEGIN
	abb:= ABBLista.create();
	
{inciso 1}
	cargarArbol(abb, unaClave);
	
{inciso 2}
	imprimirEnOrden(abb);

{inciso 3}
	//unaClave:= Cadena.create('claveErronea');
	existeElemento(abb, unaClave);
	writeln();
{inciso 4}
	imprimirMontosVerano(abb,'1200');

END.
