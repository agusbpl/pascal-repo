program parcial1;

uses UABBConsulta, UDateTime,URandomGenerator,UEntero,GenericLinkedList;

const    
cantidad_atenciones = 40;

type
ListaDeObjetos=specialize linkedlist <Consulta>;
procedimiento = procedure (unDato:TObject);

procedure CargarDatos(rg:randomgenerator; var dato:Consulta);
var
fecha,f1,f2:Date;
montoConsulta:real;
begin
f1:=Date.create(1,1,2025);
f2:=Date.create(1,4,2025);
fecha:=rg.getDate(f1,f2);
montoConsulta:=rg.getReal(1200,20000);

dato:=Consulta.create(montoConsulta,fecha);
end;

procedure GenerarClave(var claveDNI:Entero; rg:randomgenerator);
begin
claveDNI:=Entero.create(rg.getInteger(1,10));
end;

procedure CargarArbol(var abb:ABBConsulta; rg:randomgenerator);
var
claveDNI:Entero;
dato:Consulta;
i:integer;
begin
for i:= 1 to cantidad_atenciones do
begin
        CargarDatos(rg,dato);
        GenerarClave(claveDNI,rg);
        
        abb.agregar(claveDNI,dato);
end;
end;

procedure imprimirpaciente (abb:ABBConsulta);
begin
abb.imprimirEnOrden();
end;

procedure ExistePaciente(abb:ABBConsulta;buscarDNI:integer);
var
existeDNI:boolean;
begin
existeDNI:=abb.existeElemento(Entero.create(buscarDNI));
if  existeDNI = true then
  writeln('El paciente EXISTE')
else
   writeln('NO EXISTE el paciente');
end;

function esVerano(unaFecha:Date):boolean;

var
  mes, dia: integer;
begin
  mes := unaFecha.getMonth;
  dia := unaFecha.getDay;
  esVerano := ((mes = 12) and (dia >= 21)) or
              (mes = 1) or (mes = 2) or
              ((mes = 3) and (dia <= 20));
end;



procedure consultaVerano (elemento:TObject);            
var
listaConsulta:ListaDeObjetos;
unaConsulta:Consulta;
begin
listaConsulta:=ListaDeObjetos(elemento);
listaConsulta.reset();
while (not listaConsulta.eol()) do
begin
      unaConsulta:= Consulta(listaConsulta.current()) ;
      
      if esVerano(unaConsulta.getFecha) then
      begin
      writeln('Montos abonados: $',unaConsulta.getvalorConsulta:0:2 );
      end;
 listaConsulta.next();
 end;
end;

var
rg:randomgenerator;
abb:ABBConsulta;
dniMin:integer;
buscarDNI:integer;
begin
rg:=RandomGenerator.create();
abb:=ABBConsulta.create();
CargarArbol(abb,rg);
imprimirpaciente(abb);
writeln('---------------------');
buscarDNI:=rg.getinteger(1,10);
writeln('Buscar paciente con dni: ', buscarDNI);
ExistePaciente(abb,buscarDNI);
writeln('---------------------');
writeln('Ingrese un DNI minimo para imprimir los mayores a este: ');
readln(dniMin);

abb.procesar(Entero.create(dniMin),Entero.create(10),@consultaVerano);
end.

