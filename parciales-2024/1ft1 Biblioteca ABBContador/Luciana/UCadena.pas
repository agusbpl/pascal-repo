unit UCadena;

{$mode objfpc}

interface
uses UABBGenerico;
type

     Cadena = class (Comparable)
        private
           dato:string;
        public
            constructor create(unValor:string);
            function getValor():string;
            function toString():ansistring ; override;  //devuleve el vlaor como string.
            function equals(otroComparable:Comparable):boolean; override;
            function lessThan(otroComparable:Comparable):boolean; override;
            function greaterThan(otroComparable:Comparable):boolean; override;
            function lessThanorEquals(otroComparable:Comparable):boolean; override;
            function greaterThanorEquals(otroComparable:Comparable):boolean; override;
            //los 5 metodos de comparable que cadena esta obligado a implementar.
        end;
        
implementation
uses SysUtils;

        constructor Cadena.create(unValor:string);
        begin
        dato:=unValor;
        end;
        
        function Cadena.getValor():string;
        begin
        getValor:=dato;
        end;
        
        function Cadena.toString():ansistring;
        begin
        toString:= dato;
        end;
            
        function Cadena.equals(otroComparable:Comparable):boolean;
        begin
        equals:= dato = (otroComparable as Cadena).getValor();
        end;
        
        function Cadena.lessThan(otroComparable:Comparable):boolean;
        begin
        lessThan:= dato < (otroComparable as Cadena).getValor();
        end;
        
        function Cadena.greaterThan(otroComparable:Comparable):boolean;
        begin
        greaterThan:= dato > (otroComparable as Cadena).getValor();
        end;
        
        function Cadena.lessThanorEquals(otroComparable:Comparable):boolean;
        begin
        lessThanorEquals:= dato <= (otroComparable as Cadena).getValor();
        end;
        
        function Cadena.greaterThanorEquals(otroComparable:Comparable):boolean;
        begin
        greaterThanorEquals:= dato >= (otroComparable as Cadena).getValor();
        end;
        
        end.
