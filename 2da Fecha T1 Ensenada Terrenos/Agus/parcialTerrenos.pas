program PEnsenadaTerrenos;

uses sysUtils,UABBGenerico,UTerreno,URandomGenerator,UCadena,UEntero,UComparableDoble;

const cantidadTerrenos = 45;
	  
	  cantidadInmuebles = 3;
	  cantidadUnidades = 15;
	  	  
//type
//	ListaDeObjetos = specialize LinkedList<TObject>;


{
1) Haga un módulo que genere 45 productos generados al azar y sin orden alguno.
Almacene los terrenos en un ABB ordenado por ID.
}
procedure addLabels(rg:RandomGenerator);
//var i:integer;
begin
//	for i:=1 to cantidadInmuebles-1 do rg.addLabel(rg.getString(12));
	rg.addLabel('priv');
	rg.addLabel('negocio');
	rg.addLabel('club');
	rg.addLabel('baldio');
end;


function generarDato(rg:RandomGenerator;var manzana,superficie:integer;
											var tipoInmueble:string):TObject;
var valorFiscal:real;
	propietario:string;
	parcela:integer;		
begin
	manzana:= rg.getInteger(1,10);
	parcela:= rg.getInteger(1,10);
	superficie:= rg.getInteger(1,10);
	valorFiscal:= rg.getReal(50,100);
	propietario:= rg.getString(4);
	tipoInmueble:= rg.getLabel();
				
	generarDato:= 
		Terreno.create(manzana,parcela,superficie,valorFiscal,
									propietario,tipoInmueble);
end;



function generarClave1(manzana:integer;inmueble:string):Comparable;
var valor1,valor2:Comparable;
	unId:Id;
begin	
	valor1:= Entero.create(manzana);
	valor2:= Cadena.create(inmueble);
	unId:= Id.create(valor1,valor2);
	
	generarClave1:= ComparableDoble.create(unId);
end;

function generarClave2(superficie:integer):Comparable;
begin	
	generarClave2:= Entero.create(superficie);
end;

procedure cargarArboles(rg:RandomGenerator; abb1,abb2:ABBGenerico);
var	i:integer;
	dato:TObject;	
	clave1:Comparable;
	clave2:Comparable;	
	manzana,superficie:integer;
	inmueble:string;
begin
	addLabels(rg);
	for i:=1 to cantidadTerrenos do begin
		dato:= generarDato(rg,manzana,superficie,inmueble);
		clave1:= generarClave1(manzana,inmueble);
		clave2:= generarClave2(superficie);
	
		abb1.agregar(clave1, dato);
		abb2.agregar(clave2, dato);
	end;
end;
{


2) Haga un módulo que reciba el ABB generado y permita aumentar el precio un 15 %.
procedure aumentar(o:TObject);
var	e:Terreno;
begin
	e:= Terreno(o);
	e.setPrecio(e.getPrecio*1.15);
end;


procedure aumentarPrecios(abb:ABBGenerico);
var min,max:ComparableDoble;
begin
	min:= ComparableDoble.create(Id.create(Cadena.create(''),Entero.create(-9999)));
	max:= ComparableDoble.create(Id.create(Cadena.create('zzzzzzzzzzz'),Entero.create(9999)));
	abb.procesar(min,max,@aumentar);
end;


3) Haga un módulo que reciba el ABB generado e imprima toda la información de los
productos cuyo rubro es “indumentaria”.

procedure imprimirRubroIndumentaria(abb:ABBGenerico);
var min,max:ComparableDoble;
	Rubro:string;
begin
	Rubro:= 'indumentaria';
	min:= ComparableDoble.create(Id.create(Cadena.create(Rubro),Entero.create(-9999)));
	max:= ComparableDoble.create(Id.create(Cadena.create(Rubro),Entero.create(9999)));
	abb.imprimirAcotado(min,max);
end;



4) Haga un módulo que reciba el ABB generado, un ID de producto y una cantidad
vendida y actualice el stock de dicho producto.

procedure actualizarStock(abb:ABBGenerico;unId:Id;unaCantidad:integer);
var o:TObject;
	existe:boolean;
	e:Terreno;
	nuevoStock:integer;
begin
	abb.buscarElemento(ComparableDoble.create(unId), o, existe);
	if existe then begin
		e:= Terreno(o);
		nuevoStock:= e.getStock - unaCantidad;
		if nuevoStock>=0 then begin
			e.setStock( nuevoStock );
			writeln('stock actualizado de (',unId.toString,') nueva cantidad: ',nuevoStock);
		end
		else writeln('no hay suficiente stock en (',unId.toString,')');
	end
	else writeln('no se encuentra el id del producto');
end;



5) Haga un módulo que reciba el ABB generado e imprima aquellos productos con un
stock menor a 10 unidades.


function condicion(e:Terreno):boolean;
begin
	condicion:=( (e.getStock) < (10) );
end;

procedure imprimirConCondicion(o:TObject);
begin
	if condicion(Terreno(o)) then Terreno(o).imprimir;
end;

procedure imprimirStockMenosDeDiezUnidades(abb:ABBGenerico);
var min,max:ComparableDoble;
begin
	min:= ComparableDoble.create(Id.create(Cadena.create(''),Entero.create(-9999)));
	max:= ComparableDoble.create(Id.create(Cadena.create('zzzzzzzzzzz'),Entero.create(9999)));
	abb.procesar(min,max,@imprimirConCondicion);
end;




6) Haga un módulo que reciba el ABB generado y dos ID de producto e imprima el stock
actual de todos los productos que se encuentran entre los dos ID.

procedure imprimirStocks(o:TObject);
begin
	writeln('(',Terreno(o).getId.toString,'): ',Terreno(o).getStock);
end;

procedure imprimirStockAcotado(abb:ABBGenerico; min,max: ComparableDoble);
begin
	abb.procesar(min,max,@imprimirStocks);
end;


}



procedure imprimirS(o:TObject);
begin
	if ( (Terreno(o).getSuperficie > 3) and (Terreno(o).getSuperficie < 7) )
	then Terreno(o).imprimir; 
end;

procedure imprimirEntreSuperficies(abb:ABBGenerico);
var min,max:ComparableDoble;
begin
	min:= ComparableDoble.create(Id.create(Entero.create(-9999),Cadena.create('')));
	max:= ComparableDoble.create(Id.create(Entero.create(9999),Cadena.create('zzzzzzzzzzz')));
	abb.procesar(min,max,@imprimirS);
end;


procedure imprimirP(o:TObject);
begin
	if ( (Terreno(o).getParcela > 3) and (Terreno(o).getParcela < 7) )
	then Terreno(o).imprimir; 
end;

procedure imprimirEntreParcelas(abb:ABBGenerico);
var min,max:Comparable;
begin
	min:= Entero.create(-9999);
	max:= Entero.create(9999);
	abb.procesar(min,max,@imprimirP);
end;


procedure aumento10porciento(o:TObject);
var nuevoVFiscal: real;
begin
	if (Terreno(o).getSuperficie < 150)
	then begin
		nuevoVFiscal:= Terreno(o).getValorFiscal * 1.10;
		Terreno(o).setValorFiscal( nuevoVFiscal ); 		
	end;
end;

procedure aumentarValoresFiscalesSuperficiesMenoresA150(abb:ABBGenerico);
var min,max:Comparable;
begin
	min:= Entero.create(-9999);
	max:= Entero.create(9999);
	abb.procesar(min,max,@aumento10porciento);
end;



//MAIN PROGRAM
var rg: RandomGenerator;
	abb1,abb2: ABBGenerico;
BEGIN
	rg:= RandomGenerator.create();
	//rg2:= RandomGenerator.create();
	abb1:= ABBGenerico.create();
	abb2:= ABBGenerico.create();
	

	cargarArboles(rg, abb1,abb2);
	abb1.imprimirEnOrden();
	writeln();
	writeln();
	abb2.imprimirEnOrden();
	writeln();
	writeln();	
	writeln('imprimir entre superficies >3 y <7');	
	writeln();	
	imprimirEntreSuperficies(abb1);
	writeln();
	writeln();
	imprimirEntreParcelas(abb2);
	writeln();
	writeln();
	aumentarValoresFiscalesSuperficiesMenoresA150(abb2);
	abb2.imprimirEnOrden();
END.
