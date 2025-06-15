unit UComparableDoble;

{$mode objfpc}
interface
uses UABBGenerico;
type

Id = class
	private
		valor1:Comparable;
		valor2:Comparable;
	public
		constructor create(unValor1,unValor2:Comparable);

		function getValor1:Comparable;
		function getValor2:Comparable;
		function toString: ansistring;
end;


ComparableDoble = class(Comparable)
	private
		valor:Id;
	public
		constructor create(unId: Id);
		function getValor(): Id; // getter
		function toString(): ansistring; override; // devuelve el valor como string
		function equals(otroComparable: Comparable): boolean; override;
		function lessThan(otroComparable: Comparable): boolean; override;
		function greaterThan(otroComparable: Comparable): boolean; override;
		function lessThanOrEquals(otroComparable: Comparable): boolean; override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean; override;
	// Los cinco métodos de Comparable que ComparableDoble está obligado
	// a implementar.
end;


implementation
{------------------------ID------------------------}
	constructor Id.create(unValor1,unValor2:Comparable);
	begin
	valor1:= unValor1;
	valor2:= unValor2;
	end;
	function Id.getValor1:Comparable;
	begin
	result:= valor1;
	end;
	function Id.getValor2:Comparable;
	begin
	result:= valor2;
	end;
	function Id.toString:ansistring;
	begin
	result:= valor1.toString+' '+valor2.toString;
	end;
{------------------------ID------------------------}


{------------------------ComparableDoble------------------------}
	constructor ComparableDoble.create(unId: Id);
	begin
	valor:= unId;
	end;
	function ComparableDoble.getValor(): Id; // getter
	begin
	result:= valor;
	end;
	function ComparableDoble.toString(): ansistring; // devuelve el valor como string
	begin
	result:= valor.toString;
	end;
	function ComparableDoble.equals(otroComparable: Comparable): boolean;
	var otroId:Id;
	begin
	otroId:= ComparableDoble(otroComparable).getValor;
	result:= ( valor.getValor1 ).equals(otroId.getValor1) and
			 ( valor.getValor2 ).equals(otroId.getValor2);
	end;
	function ComparableDoble.lessThan(otroComparable: Comparable): boolean;
	var otroId:Id;
	begin
	otroId:= ComparableDoble(otroComparable).getValor;
	result:= ( valor.getValor1 ).lessThan(otroId.getValor1) or
	
			 ( valor.getValor1 ).equals(otroId.getValor1) and
			 ( valor.getValor2 ).lessThan(otroId.getValor2);
	end;
	function ComparableDoble.greaterThan(otroComparable: Comparable): boolean;
	var otroId:Id;
	begin
	otroId:= ComparableDoble(otroComparable).getValor;
	result:= ( valor.getValor1 ).greaterThan(otroId.getValor1) or
	
			 ( valor.getValor1 ).equals(otroId.getValor1) and
			 ( valor.getValor2 ).greaterThan(otroId.getValor2);
	end;
	function ComparableDoble.lessThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.lessThan(otroComparable)) or (self.equals(otroComparable)) );
	end;	
	function ComparableDoble.greaterThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.greaterThan(otroComparable)) or (self.equals(otroComparable)) );
	end;
	{------------------------ComparableDoble------------------------}
end.
