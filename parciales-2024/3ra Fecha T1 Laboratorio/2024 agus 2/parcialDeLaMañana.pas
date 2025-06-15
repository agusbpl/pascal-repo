(*Tema 1. El laboratorio de análisis climático desea mantener actualizados los registros 
de precipitación de sus estaciones de monitoreo.
1) Haga un módulo que simule 45 ingresos de datos de precipitaciones (código único de estación,
 fecha y milimetros de precipitación en esa fecha). Los datos de las precipitaciones
  (generadas al azar) no tienen orden alguno. Almacene el acumulado de las precipitaciones
   y la fecha del último dato registrado en un ABB ordenado por código único de estación.
2) Haga un módulo que reciba el ABB e imprima la información (código único, total acumulado
 de precipitación y última fecha del registro) de todas las estaciones entre dos códigos 
 únicos recibidos como parámetro.
3) Haga un módulo que reciba el ABB e imprima la información (código único, total acumulado 
de precipitación y última fecha del registro) de todas las estaciones cuya fecha de último
 registro se dio en mayo.5
4) Haga un módulo que reciba el ABB y resetee en cero el acumulado de precipitación y fecha
 del último registro 1-ene-1900 a una determinada estación (el código único se recibe por 
 parámetro el cual podría no existir dentro del ABB*)


program examenPrecipitaciones;

{$mode objfpc}

uses GenericLinkedList, URandomGenerator, UABBGenerico, ucadena, Uentero, UAcumuladorManual, UAcumuladores, sysutils, UDateTime;

const CANTIDAD_A_SIMULAR = 15;

type
    Procedimiento = procedure(unObject: Tobject);
    
/////////////////////////////////
//modulos del ejercicio

procedure cargaDatos(rg:randomgenerator;var unMilimetros:real;var unaFecha:date;var unCodigoUnico: integer);
var
    milimetrosV: array [1..7] of real = (12.3, 15.4, 18.9, 3.14, 10.15, 78.6, 19.55);
    codigoUnicoV: array [1..7] of integer = (6465, 7415, 1252, 7266, 1234, 4522, 7531);
    
    NumeroAlAzar:integer;
begin
    NumeroAlAzar:= rg.getInteger(1, 7);
    
    unaFecha:= rg.getDate(date.create(25,10,23),date.create(10,10,24));
    unMilimetros:= milimetrosV[NumeroAlAzar];
    unCodigoUnico:= codigoUnicoV[NumeroAlAzar];
end;

procedure cargaprecipitaciones(arbol: ABBAcumulador);
var
    unMilimetros:real;
    unaFecha:date;
    unCodigoUnico: integer;
    i: integer;
    p: precipitacion;
    rg: randomgenerator;
begin
    rg:= randomgenerator.create();
    for i:= 1 to CANTIDAD_A_SIMULAR do 
    begin
        cargaDatos(rg, unMilimetros, unaFecha, unCodigoUnico);
        p:= precipitacion.create(unMilimetros, unaFecha, unCodigoUnico);
        writeln(p.toString);
        arbol.agregar(entero.create(unCodigoUnico), p);
    end;
end;
procedure mostrarAcotado(arbol: ABBAcumulador; unCodigoUnicoMin, unCodigoUnicoMax: integer);
begin
    arbol.imprimirAcotado(entero.create(unCodigoUnicoMin), entero.create(unCodigoUnicoMax));
end;
{

function existeprecipitacion(arbol: ABBAcumulador; unCodigoUnicoABuscar: integer): boolean;
begin
    existeprecipitacion:= arbol.existeElemento(cadena.create(unCodigoUnicoABuscar));
end;

procedure  empezarAcumular(unObject: TObject);
var 
    actualAcumulado: acumuladorManual;
begin
    actualAcumulado:= unObject as acumuladorManual;
    if (actualAcumulado.getCantidad() < 5) then
        actualAcumulado.acumular(10);
end;

procedure revisarAcumulado(arbol: ABBAcumulador);
begin
    arbol.procesar(entero.create(0), entero.create(100000), @empezarAcumular);
    writeln();
end;}

//cuerpo principal
var
    arbol: ABBAcumulador;
begin
    arbol:= ABBAcumulador.create();//instancia del arbol

    //literal 1
    cargaprecipitaciones(arbol);//carga y va imprimiendo conforme carga
    writeln;writeln;

    //literal 2
    mostrarAcotado(arbol, 7000, 8000);
    writeln();
    
    
    
    {
    //literal 3
    writeln('existe precipitacion: ', existeprecipitacion(arbol, 459));
    writeln();
    
    arbol.imprimirEnOrden();

    //literal 4
    writeln();
    revisarAcumulado(arbol);
}

    arbol.imprimirEnOrden();
end.