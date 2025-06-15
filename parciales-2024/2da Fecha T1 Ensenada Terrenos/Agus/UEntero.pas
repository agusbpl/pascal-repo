unit UEntero;

{$mode objfpc}
interface
uses UABBGenerico,sysUtils;
type

Entero = class(Comparable)
	private
		valor:integer;
	public
		constructor create(unValor:integer);
		function getValor(): integer; // getter
		function toString(): ansistring; override; // devuelve el valor como integer
		function equals(otroComparable: Comparable): boolean; override;
		function lessThan(otroComparable: Comparable): boolean; override;
		function greaterThan(otroComparable: Comparable): boolean; override;
		function lessThanOrEquals(otroComparable: Comparable): boolean; override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean; override;
	// Los cinco métodos de Comparable que Entero está obligado
	// a implementar.
end;


implementation

	constructor Entero.create(unValor:integer);
	begin
	valor:= unValor;
	end;
	function Entero.getValor(): integer; // getter
	begin
	result:= valor;
	end;
	function Entero.toString(): ansistring; // devuelve el valor como ansistring
	begin
	result:= intToStr(valor);
	end;
	function Entero.equals(otroComparable: Comparable): boolean;
	begin
	result:= ( valor ) = (otroComparable as Entero).getValor;
	end;
	function Entero.lessThan(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ) < (otroComparable as Entero).getValor );
	end;	
	function Entero.greaterThan(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ) > (otroComparable as Entero).getValor )
	end;	
	function Entero.lessThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.lessThan(otroComparable)) or (self.equals(otroComparable)) );
	end;	
	function Entero.greaterThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.greaterThan(otroComparable)) or (self.equals(otroComparable)) );
	end;
end.
