program Parcial;
{$mode objfpc}

uses UEntero, UEstaciones, UMyTools, UDateTime, URandomGenerator, sysutils;

const
    CANTPRECIPITACIONES = 15;



function generarPrecipitacion() : Precipitacion;
var
    mlRandom : real;
    fechaRandom : Date;
    tools : Tool;
    rg : RandomGenerator;
begin
    tools:= Tool.create();
    rg:= RandomGenerator.create();
    mlRandom:= rg.getReal(1, 100);
    fechaRandom:= tools.generateRandomDate(2000, 2024);
    generarPrecipitacion:= Precipitacion.create(mlRandom, fechaRandom);
end;

function generarCodigo() : Entero;
var
    rg : RandomGenerator;
begin
    rg:= RandomGenerator.create();
    generarCodigo:= Entero.create(rg.getInteger(1, 10));
end;

procedure cargarPrecipitaciones(abb : ABBEstaciones);
var
    precipitacionRandom : Precipitacion;
    codigoRandom : Entero;
    i : integer;
    debugtext : string;
begin

    for i:= 1 to CANTPRECIPITACIONES do begin
        precipitacionRandom:= generarPrecipitacion();
        codigoRandom:= generarCodigo();
        abb.agregar(codigoRandom, precipitacionRandom);
        debugtext:= 'ESTACION ' + codigoRandom.toString() + LineEnding + precipitacionRandom.toString() + '- ml:' + FloatToStrF(precipitacionRandom.getMl(), ffnumber, 2, 2) + LineEnding + '-------------------------';
        writeln(debugtext);
    end;
end;



// main program
var 
    abb : ABBEstaciones;
    tools : Tool;
    cod1, cod2 : integer;
begin
    abb:= ABBEstaciones.create();
    tools:= Tool.create();

    tools.printTitle('Inciso 1');
    cargarPrecipitaciones(abb);
    abb.imprimirEnOrden();

    tools.printTitle('Inciso 1');
    writeln('Ingrese dos codigos entre los cuales imprimir la info.');
    cod1:= tools.inputInteger('Codigo inicial: ');
    cod2:= tools.inputInteger('Codigo final:');
    abb.imprimirAcotado(Entero.create(cod1), Entero.create(cod2));
end.