program vtas;

uses UConsultas, URandomGenerator, UDateTime, GenericLinkedList, UABBGenerico,UEntero;

type
  lista = specialize linkedlist<consulta>;
	procedimiento=procedure(elemento:Tobject);
	


{1) Haga un módulo que simule 40  atenciones de pacientes. Los pacientes y sus consutas generados al
 azar almacenelos en un arbol por dni}
procedure simularconsulta(var arbol: abbconsulta);
var
  dni,  i: integer;
  valorabonado: real;
  fecha: date;
  fmin, fmax: date;
  clave: entero;
  dato: TObject;
  rg: randomgenerator;
begin
  rg := randomgenerator.create;
  for i := 1 to 40 do 
  begin
    dni := rg.getInteger(1, 10);
    valorabonado:=rg.getreal(1,9999.99);
    fmin := date.create(1, 1, 2020);
    fmax := date.create(31, 12, 2024);
    fecha := rg.getDate(fmin, fmax);  
    clave := Entero.create(dni); 
    dato := consulta.create(fecha, valorabonado);
    arbol.agregar(clave, dato);
  end;     
end;

{    PUNTO 2    ARBOL ACUMULADO  x DNI                                 }
  procedure imprimirtotal(arbol:abbconsulta);
  begin
  arbol.imprimirEnOrden;
  end;

{Punto 3}

procedure   existeelemento(arbol:abbconsulta;dni:integer);
begin
 if (arbol.existeElemento(entero.create(dni))) then
 writeln('Existe en el arbol el DNI ', dni) else
 writeln('No Existe en el arbol el DNI', dni)
end;

{Punto 4}

function EsVerano(unaconsulta:consulta): Boolean;
var
mes,dia:integer;
begin
dia:=unaconsulta.getdia;
mes:=unaconsulta.getmes;
  if (mes = 12) and (dia >= 21) then
    EsVerano := True
  else if (mes = 1) or (mes = 2) then
    EsVerano := True
  else if (mes = 3) and (dia <= 21) then
    EsVerano := True
  else
    EsVerano := False;
end;

procedure consultasverano(elemento:Tobject);
var
l:lista;
unaconsulta:consulta;
begin
l:=lista(elemento);
l.reset();
while not l.eol do
begin
unaconsulta:=l.current();

if esverano(unaconsulta) then 
begin
write('Montos abonados');
writeln(unaconsulta.tostring);
end;
l.next();
end;

end;



var
  arbol: abbconsulta;
dni:integer;
begin
  arbol := abbconsulta.create();
  simularconsulta(arbol);
  
  writeln('-----------------------------------------------------------------------------');
  writeln('             PUNTO 2    ARBOL ACUMULADO  x DNI                                 ');
  writeln('-----------------------------------------------------------------------------');
   imprimirtotal(arbol);

 

 writeln('-----------------------------------------------------------------------------');
 writeln('             PUNTO 3   Busqueda de paciente x DNI                                                   ');
 writeln('-----------------------------------------------------------------------------');  
  
  writeln('Ingrese el DNI');
  readln(dni);
  existeelemento(arbol,dni);
 
 writeln('-----------------------------------------------------------------------------');
 writeln('             PUNTO 4   Consultas de Verano                                              ');
 writeln('-----------------------------------------------------------------------------');  
 writeln('Ingrese un DNI minimo para buscar');
    readln(dni);

  arbol.procesar(entero.create(dni),entero.create(10),@consultasverano);

  
  
end.
