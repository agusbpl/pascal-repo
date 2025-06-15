unit UCadena;

{$mode objfpc}


interface
uses uabbgenerico;
	type
		Cadena = class(comparable)
			private
				valor: string;
			public
				constructor create(unValor: string);
				function getvalor():string;
				function toString(): ansistring; override;
				function equals(otroComparable: Comparable): boolean;   reintroduce; override;
				function lessThan(otroComparable: Comparable): boolean; override;
				function greaterThan(otroComparable: Comparable): boolean; override;
				function lessThanOrEquals(otroComparable: Comparable): boolean; override;
				function greaterThanOrEquals(otroComparable: Comparable): boolean; override;
		end;

implementation

	constructor cadena.create(unValor: string);
	begin
		valor:= unValor;
	end;
	
	function cadena.getValor(): string;
	begin
		getValor:= valor;
	end;
	
	function cadena.toString(): ansistring;
	begin
		toString:= valor;
	end;
	
	function cadena.equals(otroComparable: Comparable): boolean;
	var
		otraCadena: cadena;
	begin
		otraCadena:= otroComparable as Cadena;
		equals:= valor = otraCadena.getValor();
	end;
	
	function cadena.lessThan(otroComparable: Comparable): boolean;
	begin
		lessThan:= valor < (otroComparable as Cadena).getValor();
	end;
	
	function cadena.greaterThan(otroComparable: Comparable): boolean;
	begin
		greaterThan:= valor > (otroComparable as Cadena).getValor();
	end;
	
	function cadena.lessThanOrEquals(otroComparable: Comparable): boolean;
	begin
		lessThanOrEquals:= valor <= (otroComparable as Cadena).getValor();
	end;
	function cadena.greaterThanOrEquals(otroComparable: Comparable): boolean; 
	begin
		greaterThanOrEquals:= valor >= (otroComparable as Cadena).getValor();
	end;
end.

