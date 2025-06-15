unit UContadorReales;
{$mode objfpc}

interface

    type
        ContadorReales = class
            private
                acumulador : real;
            public
                constructor create();
                
                function getAcumulado() : real;
                function equalsto(unContador : ContadorReales) : boolean;
                procedure reset();
                procedure incrementar();
                procedure acumular(unaCantidad : real);
        end;

implementation

    constructor ContadorReales.create();
    begin
        acumulador:= 0;
    end;
                
    function ContadorReales.getAcumulado() : real;
    begin
        getAcumulado:= acumulador;
    end;

    function ContadorReales.equalsto(unContador : ContadorReales) : boolean;
    begin
        equalsto:= acumulador = unContador.getAcumulado();
    end;

    procedure ContadorReales.reset();
    begin
        acumulador:= 0;
    end;

    procedure ContadorReales.incrementar();
    begin
        acumulador:= acumulador + 1;
    end;

    procedure ContadorReales.acumular(unaCantidad : real);
    begin
        acumulador:= acumulador + unaCantidad;
    end;    

end.