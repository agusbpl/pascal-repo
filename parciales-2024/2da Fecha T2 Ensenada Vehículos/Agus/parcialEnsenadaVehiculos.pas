program PEnsenadaVehiculos;

uses sysUtils,UABBGenerico,UVehiculo,URandomGenerator,UCadena,
	 UFecha,UDateTime;

const cantidadVehiculos = 50;
	  
	  cantidadMarcas = 5;
	  cantidadNombres = 7;
	  	  
//type
//	ListaDeObjetos = specialize LinkedList<TObject>;


{
1) Haga un módulo que genere 45 productos generados al azar y sin orden alguno.
Almacene los Vehiculos en un ABB ordenado por ID.
}
procedure addLabelsMarcas(rg:RandomGenerator);
var i:integer;
begin
	for i:=1 to cantidadMarcas-1 do rg.addLabel(rg.getString(6));
	rg.addLabel('toyota');
end;

procedure addLabelsColores(rg:RandomGenerator);
begin
	rg.addLabel('amarillo');
	rg.addLabel('rojo');
	rg.addLabel('azul');
	rg.addLabel('magenta');
end;

procedure addLabelsNombres(rg:RandomGenerator);
var i:integer;
begin
	for i:=1 to cantidadNombres-1 do rg.addLabel(rg.getString(5));
	rg.addLabel('marcos');
end;


function generarPropietario(rg:RandomGenerator):Propietario;
var nombre:string;
	apellido:string;
	dni:integer;
	fechaAdquisicion:Date;
begin
	fechaAdquisicion:=rg.getDate(Date.create(1,1,2025),Date.create(1,1,2026));
	dni:= rg.getInteger(1,10);
	nombre:= rg.getLabel();
	apellido:= rg.getString(4);
				
	generarPropietario:= 
		Propietario.create(nombre,apellido,dni,fechaAdquisicion);
end;



function generarDato(rg,rg2,rg3:RandomGenerator;var marca:string;
									var fechaAdquisicion:Date):TObject;
var	patente:string;
	dueno:Propietario;
	Color:string;
	Modelo:string;
begin
	patente:= rg.getString(6);
	dueno:= generarPropietario(rg3); 
		fechaAdquisicion:= dueno.getFecha();
	marca:= rg.getLabel();
	color:= rg2.getLabel();
	Modelo:= rg.getString(6);
				
	generarDato:= 
		Vehiculo.create(patente,dueno,Color,marca,Modelo);
end;



function generarClave1(marca:string):Comparable;
begin	
	generarClave1:= Cadena.create(marca);
end;

function generarClave2(fechaAdquisicion:Date):Comparable;
begin	
	generarClave2:= Fecha.create(fechaAdquisicion);
end;

procedure cargarArboles(rg1,rg2,rg3:RandomGenerator; abb1,abb2:ABBGenerico);
var	i:integer;
	dato:TObject;	
	clave1:Comparable;
	clave2:Comparable;	
	marca:string;
	fechaAdquisicion:Date;
begin
	addLabelsMarcas(rg1);
	addLabelsColores(rg2);
	addLabelsNombres(rg3);
	for i:=1 to cantidadVehiculos do begin
		dato:= generarDato(rg1,rg2,rg3,marca,fechaAdquisicion);
		clave1:= generarClave1(marca);
		clave2:= generarClave2(fechaAdquisicion);
	
		abb1.agregar(clave1, dato);
		abb2.agregar(clave2, dato);
	end;
end;


{


procedure imprimirS(o:TObject);
begin
	if ( (Vehiculo(o).getSuperficie > 3) and (Vehiculo(o).getSuperficie < 7) )
	then Vehiculo(o).imprimir; 
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
	if ( (Vehiculo(o).getParcela > 3) and (Vehiculo(o).getParcela < 7) )
	then Vehiculo(o).imprimir; 
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
	if (Vehiculo(o).getSuperficie < 150)
	then begin
		nuevoVFiscal:= Vehiculo(o).getValorFiscal * 1.10;
		Vehiculo(o).setValorFiscal( nuevoVFiscal ); 		
	end;
end;

procedure aumentarValoresFiscalesSuperficiesMenoresA150(abb:ABBGenerico);
var min,max:Comparable;
begin
	min:= Entero.create(-9999);
	max:= Entero.create(9999);
	abb.procesar(min,max,@aumento10porciento);
end;

}
procedure imprimirAcotadoUnValor(abb:ABBGenerico; valor:string);
var min,max:Comparable;
begin
	min:= Cadena.create(valor);
	max:= Cadena.create(valor);
	abb.imprimirAcotado(min,max);
end;

	
procedure imprimirMayoresUnValor(abb:ABBGenerico; unDate:Date);
var min:Comparable;
begin
	min:= Fecha.create(unDate);
	abb.imprimirMayores(min);
end;



procedure cambiarColor(o:TObject);
begin
	if (Vehiculo(o).getDueno.getNombre = 'marcos')
	then begin
		Vehiculo(o).setColor('verde');
	end;
end;

procedure cambiarColorVehiculosDeMarcos(abb:ABBGenerico);
var min,max:Comparable;
begin
	min:= Cadena.create('');
	max:= Cadena.create('zzzzzzzzzz');
	abb.procesar(min,max,@cambiarColor);
end;




//MAIN PROGRAM
var rg,rg2,rg3: RandomGenerator;
	abb1,abb2: ABBGenerico;
BEGIN
	rg:= RandomGenerator.create();
	rg2:= RandomGenerator.create();
	rg3:= RandomGenerator.create();
	abb1:= ABBGenerico.create();
	abb2:= ABBGenerico.create();
	
	cargarArboles(rg,rg2,rg3, abb1,abb2);
{
	abb1.imprimirEnOrden();
	writeln();
	writeln();
	abb2.imprimirEnOrden();
}	
	imprimirAcotadoUnValor(abb1,'toyota');
	writeln();
	writeln();
	writeln();
	writeln();
	imprimirMayoresUnValor(abb2,Date.create(5,4,2025));
	writeln();
	writeln();
	writeln();
	writeln();
	cambiarColorVehiculosDeMarcos(abb1);
	abb1.imprimirEnOrden();

{
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
}
END.
