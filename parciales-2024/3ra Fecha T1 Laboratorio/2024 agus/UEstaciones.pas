unit UEstaciones;
{$mode objfpc}

interface
uses UABBGenerico, UEntero, UContadorReales, UDateTime, sysutils;

    type
        Precipitacion = class
            private
                ml : real;
                fecha : Date;
            public
                constructor create(unosMl : real; unaFecha : Date);

                function getMl() : real;
                function getFecha() : Date;

                function toString() : ansistring; override;
        end;  

        NodoEstacion = class (Nodo)
            private
                totalMl : ContadorReales;
                ultimaFecha : Date;
            public
                constructor create(unaClave: Comparable; unDato: TObject);
                            
                procedure agregar(unNodo: Nodo); override;
                function toString(): ansistring; override;

                function devolverElemento(): TObject; override;
        end;

        ABBEstaciones = class (ABBGenerico)
            public
                procedure agregar(unaClave: Comparable; unDato: TObject); override;
        end;

implementation


////////////////////////////// PRECIPITACION INICIO //////////////////////////////

    constructor Precipitacion.create(unosMl : real; unaFecha : Date);
    begin
        ml:= unosMl;
        fecha:= unaFecha;
    end;

    function Precipitacion.getMl() : real;
    begin
        getMl:= ml;
    end;

    function Precipitacion.getFecha() : Date;
    begin
        getFecha:= fecha;
    end;

    function Precipitacion.toString() : ansistring;
    begin
        toString:= fecha.toString() + ' - Ml:' + FloatToStrF(ml, ffnumber, 2, 2);
    end;

          
////////////////////////////// PRECIPITACION FINAL ///////////////////////////////

////////////////////////////// NODOESTACION INICIO ///////////////////////////////

    constructor NodoEstacion.create(unaClave: Comparable; unDato: TObject);
    var
        unaPrecipitacion : Precipitacion;
    begin
        inherited create(unaClave, unDato);
        unaPrecipitacion:= unDato as Precipitacion;
        totalMl:= ContadorReales.create();
        totalMl.acumular(unaPrecipitacion.getMl());
        ultimaFecha:= unaPrecipitacion.getFecha();
    end;

    procedure NodoEstacion.agregar(unNodo: Nodo);
    var
        unaPrecipitacion : Precipitacion;
    begin
        if unNodo.getClave().equals(self.getClave()) then begin
            unaPrecipitacion:= UnNodo.getDato() as Precipitacion;
            totalMl.acumular(unaPrecipitacion.getMl());
            ultimaFecha:= unaPrecipitacion.getFecha();
        end
        else
            inherited agregar(unNodo);
    end;

    function NodoEstacion.toString(): ansistring;
    var
        text, header : ansistring;
        i : integer;
    begin
        text:= '';
        header:= '| ' + 'Estacion ' + self.getClave().toString() + ' |';
        for i:= 1 to Length(header) do begin
            text:= text + '-';
        end;
        text:= text + LineEnding + header + LineEnding;
        for i:= 1 to Length(header) do begin
            text:= text + '-';
        end;
        text:= text + LineEnding;

        toString:= text + 'Ultima fecha: ' + ultimaFecha.toString() + ' | total Ml: ' + FloatToStrF(totalMl.getAcumulado(), ffnumber, 2, 2);
    end;

    
    function NodoEstacion.devolverElemento(): TObject;
    begin
        devolverElemento:= totalMl;
    end;
////////////////////////////// NODOESTACION FINAL ////////////////////////////////
        
////////////////////////////// ABBESTACIONES INICIO ///////////////////////////////

    procedure ABBEstaciones.agregar(unaClave: Comparable; unDato: TObject);
    var
        n: Nodo;
    begin
        n:= NodoEstacion.create(unaClave, unDato);
        self.agregarNodo(n);
    end;

////////////////////////////// ABBESTACIONES FINAL ////////////////////////////////

end.