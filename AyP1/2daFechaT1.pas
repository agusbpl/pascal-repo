{
Un salón de eventos necesita administrar la información de las reservas
 de marzo de 2024. 
* Se dispone de una lista con la información de las reservas. 
* De cada reserva se conoce: número de reserva, DNI del cliente, 
* día del evento (1..cantidadDiasMes), hora de inicio, hora de fin y categoría de servicio (1..18). 
Además, se dispone de una vector con el precio por hora de reserva de acuerdo a cada categoría de servicio.

Se pide recorrer la lista una sola vez para:

  a)Generar una nueva lista con número y precio total de cada reserva. 
  Esta estructura debe generarse ordenada por el precio total de cada reserva.
  b)Informar los dos días del mes con menor cantidad de reservas de clientes con DNI impar.
  c)Informar el porcentaje de reservas de eventos que inicien después
   de las 12hs y se produzcan en la segunda quincena.
Nota: La hora de fin no excede las 23hs. Hacer el programa Principal. Modularizar
}

program salonEventos;

uses GenericLinkedList;

const
	cantidadCategorias = 18;
	cantidadDiasMes = 31;

type

//vector precio hora por categoria
	vPrecioHoraPorCategoria = array [1..cantidadCategorias] of real;
//vector precio hora por categoria

//lista de reservas
	reserva = record 
		numeroReserva, dniCliente: integer;
		diaEvento, horaInicio, horaFin: integer;
		categoriaServicio:integer;
	end;
	
	lReservas = specialize linkedList<reserva>;
//lista de reservas
//lista nueva
	nuevoE = record
		numeroReserva: integer;
		precioTotal: real;
	end; 
	lNuevoE = specialize linkedList<nuevoE>;
//lista nueva

//vector contador
	vContador = array[1..cantidadDiasMes] of integer;
//vector contador


function generarReserva:reserva;
var r:reserva;
begin
	r.numeroReserva:= random(10)+10;
	r.dniCliente:= random(15)-1;
	r.diaEvento:= random(cantidadDiasMes)+1;
	r.horaInicio:= random(12)+1;
	r.horaFin:= r.horaInicio + random(5)+1;
	r.categoriaServicio:= random(cantidadCategorias)+1;
	
	generarReserva:= r;
end;

//se dispone lista reservas
procedure cargarListaReservas(var l:lReservas);
var r:reserva;
begin
	l:= lReservas.create();
	r:= generarReserva();
	while not (r.dniCliente = -1) do begin
		l.add(r);
		r:= generarReserva();
	end;
end; 
procedure imprimirReserva(r:reserva);
begin
	write(r.numeroReserva,' ');
	write(r.dniCliente,' ');
	write(r.diaEvento,' ');
	write(r.horaInicio,' ');
	write(r.horaFin,' ');
	write(r.categoriaServicio,' ');
	writeln;
end;
procedure imprimirListaReservas(l:lReservas);
begin
	while not(l.eol) do begin
	imprimirReserva(l.current);
	l.next();
	end;
end;
//se dispone lista reservas

//se dispone vector precioHora
procedure cargarVectorPrecioHora(var v:vPrecioHoraPorCategoria);
var i:integer;
begin
	for i:=1 to cantidadCategorias do begin
		v[i]:= (random(50)+1) + (1 / (random(10)+1)); 
	end; 
end;

procedure imprimirVector(v: vPrecioHoraPorCategoria);
var i:integer;
begin
	for i:=1 to cantidadCategorias do begin
		writeln('categoria[',i,']:',v[i]:6:2,' por hora');
	end;
end;
//se dispone vector precioHora


procedure insertarOrdenado(lN:lNuevoE; e:NuevoE);
begin
	lN.reset();
	while ( (not(lN.eol)) and (lN.current().precioTotal < e.precioTotal) ) do
	begin
		lN.next();
	end;
	lN.insertCurrent(e);
end;

procedure agregarAListaNueva(r: reserva; v: vPrecioHoraPorCategoria; lN: lNuevoE);
var e:NuevoE;
begin
	e.numeroReserva:= r.numeroReserva;
	e.precioTotal:=( (r.horaFin - r.horaInicio) * v[r.categoriaServicio] );
	insertarOrdenado(lN, e);
end;

procedure resetearVContador(var v:vContador);
begin
	for i:=1 to cantidadDiasMes do v[i]:=0;
end;

procedure contarReservasDniImpar(r:reserva; var v:vContador);
begin
	if ( (r.dniCliente mod 2) = 1 )
	then v[r.diaEvento]:= v[r.diaEvento] +1;
end;

procedure recorrerLista(l:lReservas; v: vPrecioHoraPorCategoria; var lN:lNuevoE);
var vC:vContador;
begin
	l.reset();
	lN:= lNuevoE.create();
	resetearVContador(vC);
	
	while (not l.eol) do begin
	//a
		agregarAListaNueva(l.current(), v, lN);
			
	//b)Informar los dos días del mes con menor cantidad de reservas
		//de clientes con DNI impar.
		contarReservasDniImpar(vC, l.current());
		
	//c)Informar el porcentaje de reservas de eventos que inicien 
	//después de las 12hs y se produzcan en la segunda quincena.
		contarReservasDespues12YDiaMayor15(cantReservasMas12hsMas15Dia, l.current());
		cantidadReservas:= cantidadReservas +1;
	
	//avanzo al siguiente nodo de la lista
		l.next();
	end;
	
	
end;

procedure imprimirLNueva(l:lNuevoE);
begin
	l.reset();
	while not l.eol do begin
		writeln('reserva[',l.current().numeroReserva,'] ($',l.current().precioTotal:6:2,')');
		l.next();
	end;
end;


//main program
VAR
	l: lReservas;
	v: vPrecioHoraPorCategoria;
	ln: lNuevoE;
BEGIN
	randomize;
	//SE DISPONE
	cargarListaReservas(l); 
	imprimirListaReservas(l);
	writeln;
	writeln;
	cargarVectorPrecioHora(v); 
	imprimirVector(v);
	//SE DISPONE
	
	recorrerLista(l,v,ln);
	writeln;
	writeln;
	imprimirLNueva(ln);
END.
