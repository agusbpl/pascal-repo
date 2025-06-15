unit UEntero;
{$mode objfpc}

interface
uses UABBGenerico, sysutils;

type
    Entero = class (Comparable)
        private
            dato : integer;
        public
            constructor create(unDato : integer);

            function getDato() : integer;
            function toString() : ansistring; override;

            function equals(otroComparable: Comparable): boolean; override;
            function lessThan(otroComparable: Comparable): boolean; override;
            function greaterThan(otroComparable: Comparable): boolean; override;
            function lessThanOrEquals(otroComparable: Comparable): boolean; override;
            function greaterThanOrEquals(otroComparable: Comparable): boolean; override;
    end;

implementation

    constructor Entero.create(unDato : integer);
    begin
        dato:= unDato;
    end;

    function Entero.getDato() : integer;
    begin
        getDato:= dato;
    end;

    function Entero.toString() : ansistring;
    begin
        toString:= IntToStr(dato);
    end;

    function Entero.equals(otroComparable: Comparable): boolean;
    var
        otroDato : Entero;
    begin
        otroDato:= otroComparable as Entero;
        equals:= dato = otroDato.getDato();
    end;

    function Entero.lessThan(otroComparable: Comparable): boolean;
    var
        otroDato : Entero;
    begin
        otroDato:= otroComparable as Entero;
        lessThan:= dato < otroDato.getDato();
    end;

    function Entero.greaterThan(otroComparable: Comparable): boolean;
    var
        otroDato : Entero;
    begin
        otroDato:= otroComparable as Entero;
        greaterThan:= dato > otroDato.getDato();
    end;

    function Entero.lessThanOrEquals(otroComparable: Comparable): boolean;
    var
        otroDato : Entero;
    begin
        otroDato:= otroComparable as Entero;
        lessThanOrEquals:= dato <= otroDato.getDato();
    end;

    function Entero.greaterThanOrEquals(otroComparable: Comparable): boolean;
    var
        otroDato : Entero;
    begin
        otroDato:= otroComparable as Entero;
        greaterThanOrEquals:= dato >= otroDato.getDato();
    end;

end.