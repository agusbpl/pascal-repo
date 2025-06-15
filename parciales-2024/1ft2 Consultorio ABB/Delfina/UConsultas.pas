UNIT  Uconsultas;
{$mode objfpc}
//---------------------------------------------------------------------------------
INTERFACE
USES UABBGenerico,Genericlinkedlist,UdateTime,sysutils;

type

//--------------------------    Consulta      -------------------------------------
Consulta=class
private
Fecha:date;
Valorabonado:real;


public
constructor create(unafecha:date;unvalorabonado:real);
function getfecha:date;
function getvalorabonado:real;
function getdia:integer;
function getmes:integer;
function getanio:integer;
function tostring:ansistring;override;
end;


//----------------------------   NODO LISTA  Consultas       ------------------------------------------
lista=specialize  linkedlist <consulta>;

nodopaciente = class(Nodo)
PRIVATE
listaconsultas:  lista;

public
constructor create(clave: Comparable; dato: TObject);
procedure agregar(unNodo: Nodo); override;
function toString(): ansistring; override;
function devolverElemento():Tobject ;override;
end;



//---------------------------------------------------------------------------------

abbconsulta = class(ABBgenerico)
public
procedure agregar(Clave: Comparable; Dato: TObject);override;
end;

IMPLEMENTATION 


//----------------------------- IMPLEMENTACION CONSULTA ----------------------------------
CONSTRUCTOR consulta.create(unafecha:date;unvalorabonado:real);
begin
fecha:=unafecha;
valorabonado:=unvalorabonado;
unvalorabonado:=valorabonado;
end;

function consulta.getfecha:date;
begin
getfecha:=fecha;
end;
function consulta.getvalorabonado:real;
begin
getvalorabonado:=valorabonado;
end;
function consulta.getdia:integer;
begin
getdia:=fecha.getday;
end;
function consulta.getmes:integer;
begin
getmes:=fecha.getmonth;
end;
function consulta.getanio:integer;
begin
getanio:=fecha.getYear;
end;

function consulta.toString: ansistring;
var
s:ansistring;
begin
  s:=   ' Fecha : ' + fecha.tostring()+ LineEnding;
  s:=  s + 'Valor abonado: ' + FloatToStr(valorabonado) + LineEnding;
  toString := s;
end;


//------------------------------    IMPLEMENTACION NODO LISTA          -----------------------------------



//CREO NODO
constructor nodopaciente.create(Clave: Comparable;Dato: TObject);
begin

inherited create(Clave, Dato);
listaconsultas:= lista.create();
listaconsultas.add(Dato as consulta)

end;

function nodopaciente.devolverElemento(): Tobject;
begin
devolverElemento:=listaconsultas;
end;
//AGREGAR
procedure nodopaciente.agregar(unNodo: Nodo);
begin
if unNodo.getClave().equals(self.getClave())
then
listaconsultas.add(unNodo.getDato() as consulta)

else
inherited agregar(unNodo);
end;

function nodopaciente.toString: ansistring;
var
 s: ansistring;
 totalmonto:real;
begin
  s := 'DNI: ' + self.getClave().toString() + LineEnding;
  s := s + '-----------------------------------------' + LineEnding;
  s := s + 'Consultas:' + LineEnding;
  totalmonto:=0;
  
  listaconsultas.reset();
  while not listaconsultas.eol() do
  begin
		totalmonto:=totalmonto+listaconsultas.current.getvalorabonado;

 {   s := s + listavtas.current.toString() + LineEnding;} // este si quiere imprimir lo de adentro
    listaconsultas.next();
       
  end;
  //calculos
  s:=  s + 'Monto total abonado: ' + FloatToStr(totalmonto)+ LineEnding;
  s := s + '-----------------------------------------' + LineEnding;
  toString := s;
end;


//------------------------------    IMPLEMENTACION ABB LISTA          -----------------------------------


procedure abbconsulta.agregar(Clave: Comparable; Dato: TObject);
 var n: Nodo;
begin
n:= nodopaciente.create(Clave, Dato);
self.agregarNodo(n);
end;


		
end.


