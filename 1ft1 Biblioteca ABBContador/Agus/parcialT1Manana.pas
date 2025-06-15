program Parcial;
//{$mode objfpc}


uses sysUtils,UABBContador,UABBGenerico,ULibro,URandomGenerator,UCadena;

const cantidadAGenerar = 30;
	  cantidadLibros = 10;
	  	  
type
	vLibros = array[1..cantidadLibros] of Libro;
//type
//	ListaDeObjetos = specialize LinkedList<TObject>;


procedure cargarVectorLibros(rg:RandomGenerator; var v:vLibros);
var i:integer;
begin
	for i:=1 to cantidadLibros do 
		v[i]:= Libro.create(rg.getString(8),rg.getString(5),rg.getString(6),rg.getInteger(2020,2025));
end;

function generarDato(rg:RandomGenerator; v:vLibros):TObject;
begin		
	generarDato:= v[ rg.getInteger(1,cantidadLibros) ];
end;

function generarClave(ISBN:string):Comparable;
begin	
	generarClave:= Cadena.create(ISBN);
end;


procedure cargarArbol(abb:ABBContador; var ultimaClave:Comparable);
var	i:integer;
	dato:TObject;	
	clave:Comparable;
	v:vLibros;
	rg: RandomGenerator;
begin
	rg:= RandomGenerator.create();
	cargarVectorLibros(rg,v);
	for i:=1 to cantidadAGenerar do begin
		dato:= generarDato(rg,v);
		clave:= generarClave(Libro(dato).getISBN);
			
		abb.agregar(clave, dato);
	end;
	ultimaClave:= clave;//saco el ultimo por referencia para usar luego
end;

procedure imprimirAcotado(abb:ABBContador; LimiteMin,LimiteMax: string);
begin
	abb.imprimirAcotado( Cadena.create(LimiteMin) , Cadena.create(LimiteMax) );
end;

procedure existeElemento(abb:ABBContador; unaClave: string);
begin
	if abb.existeElemento(Cadena.create(unaClave)) then writeln('el elemento existe')
	else writeln('el elemento no existe');
end;


procedure aumentar(o:TObject);
begin
	if (Contador(o).getCantidadCopias < 5)
	then Contador(o).sumarCopias(10);
end;

procedure aumentarStocksMenoresDe5(abb:ABBGenerico);
var min,max:Comparable;
begin
	min:= Cadena.create('');
	max:= Cadena.create('zzzzzzzzzzz');
	abb.procesar(min,max,@aumentar);
end;




//MAIN PROGRAM
var abb: ABBContador;
	ultimaClave:Comparable;
	unISBN:string;
BEGIN
	abb:= ABBContador.create();
{inciso 1}
	cargarArbol(abb, ultimaClave);
	abb.imprimirEnOrden();
	writeln();
	writeln();
	writeln();	
{inciso 2}
	imprimirAcotado(abb,'fff','jjj');
	writeln();
	writeln();
{inciso 3}
	write('buscar en el arbol: ');
	unISBN:= Cadena(ultimaClave).getValor; writeln(unISBN);	
	//unISBN:= 'claveErronea'; writeln(unISBN); //para testear
	writeln();
	writeln();	
	existeElemento(abb,unISBN);
	writeln();
	writeln();
{inciso 4}
	aumentarStocksMenoresDe5(abb);
	writeln();
	writeln();
	abb.imprimirEnOrden();
END.
