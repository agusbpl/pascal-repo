unit UCadena;

{$mode objfpc}
interface
uses UABBGenerico;
type

Cadena = class(Comparable)
	private
		valor:string;
	public
		constructor create(unValor:string);
		function getValor(): string; // getter
		function toString(): ansistring; override; // devuelve el valor como string
		function equals(otroComparable: Comparable): boolean; override;
		function lessThan(otroComparable: Comparable): boolean; override;
		function greaterThan(otroComparable: Comparable): boolean; override;
		function lessThanOrEquals(otroComparable: Comparable): boolean; override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean; override;
	// Los cinco métodos de Comparable que Cadena está obligado
	// a implementar.
end;


implementation

	constructor Cadena.create(unValor:string);
	begin
	valor:= unValor;
	end;
	function Cadena.getValor(): string; // getter
	begin
	result:= valor;
	end;
	function Cadena.toString(): ansistring; // devuelve el valor como string
	begin
	result:= valor;
	end;
	function Cadena.equals(otroComparable: Comparable): boolean;
	begin
	result:= ( valor ) = (otroComparable as Cadena).getValor;
	end;
	function Cadena.lessThan(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ) < (otroComparable as Cadena).getValor );
	end;	
	function Cadena.greaterThan(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ) > (otroComparable as Cadena).getValor )
	end;	
	function Cadena.lessThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.lessThan(otroComparable)) or (self.equals(otroComparable)) );
	end;	
	function Cadena.greaterThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.greaterThan(otroComparable)) or (self.equals(otroComparable)) );
	end;
end.
