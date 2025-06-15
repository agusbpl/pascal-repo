unit Uentero;
{$mode objfpc}

interface
uses UABBgenerico,sysutils;
type

	entero = class (comparable)
		private
		valor : integer;
		public
		constructor create(unValor: integer); // constructor
		function getValor(): integer; // getter
		function toString(): ansistring; override; // devuelve el nombre como string
		function equals(otroComparable: Comparable): boolean;override;
		function lessThan(otroComparable: Comparable): boolean;override;
		function greaterThan(otroComparable: Comparable): boolean;override;
		function lessThanOrEquals(otroComparable: Comparable): boolean;override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean;override;
		end;
		
implementation
	constructor entero.create(unValor: integer); // constructor
	begin
		valor := unValor;
		end;
	
	
	function entero.getValor(): integer; // getter
		begin
		getValor := valor;
		end;
		
	function entero.toString(): ansistring; // devuelve el nombre como string
		begin
		toString := inttostr(valor);
		end;
		
	function entero.equals(otroComparable: Comparable): boolean;
	begin
		equals := valor = (otroComparable as entero).getValor();
		end;
		
		function entero.lessThan(otroComparable: Comparable): boolean;
		begin
	lessThan:= valor < (otroComparable as entero).getvalor();
	end;

		function entero.greaterThan(otroComparable: Comparable): boolean;
		begin
		greaterThan:= valor > (otroComparable as entero).getvalor();
		end;
		
		function entero.lessThanOrEquals(otroComparable: Comparable): boolean;
		begin
		lessThanOrEquals:= valor <= (otroComparable as entero).getvalor();
		end;
		
		function entero.greaterThanOrEquals(otroComparable: Comparable): boolean;
		begin
		greaterThanOrEquals:= valor >= (otroComparable as entero).getvalor();
		end;
end.
