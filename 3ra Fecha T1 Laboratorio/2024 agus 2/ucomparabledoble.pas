unit UComparableDoble;

{$mode objfpc}


interface
uses uabbgenerico{, ucadena, Uentero, ufecha};
	type
		ComparableDoble = class(comparable)
			private
				comparable1: comparable;
                comparable2: comparable;
			public
            	constructor create(uncomparable1, uncomparable2: comparable);
            	function getComparable1(): comparable;
				function getComparable2(): comparable;
                function getValor(): ansistring;
				function toString(): ansistring; override;
				function equals(otroComparable: Comparable): boolean;   reintroduce; override;
				function lessThan(otroComparable: Comparable): boolean; override;
				function greaterThan(otroComparable: Comparable): boolean; override;
				function lessThanOrEquals(otroComparable: Comparable): boolean; override;
				function greaterThanOrEquals(otroComparable: Comparable): boolean; override;
		end;

implementation

	constructor ComparableDoble.create(uncomparable1, uncomparable2: comparable);
	begin
		comparable1:= uncomparable1;
        comparable2:= uncomparable2;
	end;
	
	function ComparableDoble.getComparable1(): comparable;
	begin
		getComparable1:= comparable1;
	end;

    function ComparableDoble.getComparable2(): comparable;
	begin
		getComparable2:= comparable2;
	end;


	function ComparableDoble.getValor(): ansistring;
	begin
		getValor:= comparable1.toString +' '+ comparable2.toString;
	end;

	
	function ComparableDoble.toString(): ansistring;
	begin
		toString:= comparable1.toString +' '+ comparable2.toString;
	end;
	
	function ComparableDoble.equals(otroComparable: Comparable): boolean;
	var
		otroComparableDoble: ComparableDoble;
	begin
		otroComparableDoble:= otroComparable as ComparableDoble;
		equals:=((comparable1.equals(otroComparableDoble.getComparable1)) and
                 (comparable2.equals(otroComparableDoble.getComparable2)));
	end;
	
	function ComparableDoble.lessThan(otroComparable: Comparable): boolean;
	var
		otroComparableDoble: ComparableDoble;
	begin
		otroComparableDoble:= otroComparable as ComparableDoble;
		lessThan:=(
                 (comparable1.lessThan(otroComparableDoble.getComparable1))  or
                 ((comparable1.equals(otroComparableDoble.getComparable1))   and
                 (comparable2.lessThan(otroComparableDoble.getComparable2)))
                 );
	end;
	

	function ComparableDoble.greaterThan(otroComparable: Comparable): boolean;
	var
		otroComparableDoble: ComparableDoble;
	begin
		otroComparableDoble:= otroComparable as ComparableDoble;
		greaterThan:=(
                 (comparable1.greaterThan(otroComparableDoble.getComparable1))  or
                 ((comparable1.equals(otroComparableDoble.getComparable1))      and
                 (comparable2.greaterThan(otroComparableDoble.getComparable2)))
                 );
	end;

	function ComparableDoble.lessThanOrEquals(otroComparable: Comparable): boolean;
	var
		otroComparableDoble: ComparableDoble;
	begin
		otroComparableDoble:= otroComparable as ComparableDoble;
		lessThanOrEquals:=(
                        (self.lessThan(otroComparableDoble as Comparable))  or
                        (self.equals(otroComparableDoble as Comparable))
                        );
	end;
	
    function ComparableDoble.greaterThanOrEquals(otroComparable: Comparable): boolean;
	var
		otroComparableDoble: ComparableDoble;
	begin
		otroComparableDoble:= otroComparable as ComparableDoble;
		greaterThanOrEquals:=(
                            (self.greaterThan(otroComparableDoble as Comparable))  or
                            (self.equals(otroComparableDoble as Comparable))
                            );
	end;
end.

