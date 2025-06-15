unit UComparableTriple;

{$mode objfpc}


interface
uses uabbgenerico{, ucadena, Uentero, ufecha};
	type
		ComparableTriple = class(comparable)
			private
				comparable1: comparable;
                comparable2: comparable;
                comparable3: comparable;

			public
				constructor create(uncomparable1, uncomparable2, uncomparable3: comparable);
            
				function getComparable1(): comparable;
				function getComparable2(): comparable;
				function getComparable3(): comparable;
				function toString(): ansistring; override;
				function equals(otroComparable: Comparable): boolean;   reintroduce; override;
				function lessThan(otroComparable: Comparable): boolean; override;
				function greaterThan(otroComparable: Comparable): boolean; override;
				function lessThanOrEquals(otroComparable: Comparable): boolean; override;
				function greaterThanOrEquals(otroComparable: Comparable): boolean; override;
		end;



implementation

	constructor ComparableTriple.create(uncomparable1, uncomparable2, uncomparable3: comparable);
	begin
		comparable1:= uncomparable1;
        comparable2:= uncomparable2;
		comparable3:= uncomparable3;
	end;
	
	function ComparableTriple.getComparable1(): comparable;
	begin
		getComparable1:= comparable1;
	end;

    function ComparableTriple.getComparable2(): comparable;
	begin
		getComparable2:= comparable2;
	end;

    function ComparableTriple.getComparable3(): comparable;
	begin
		getComparable3:= comparable3;
	end;
	
	function ComparableTriple.toString(): ansistring;
	begin
		toString:= comparable1.toString +' '+ comparable2.toString +' '+ comparable3.toString;
	end;
	
	function ComparableTriple.equals(otroComparable: Comparable): boolean;
	var
		otroComparableTriple: ComparableTriple;
	begin
		otroComparableTriple:= otroComparable as ComparableTriple;
		equals:=(
				(comparable1.equals(otroComparableTriple.getComparable1)) and
                (comparable2.equals(otroComparableTriple.getComparable2)) and
				(comparable3.equals(otroComparableTriple.getComparable3)) 
				);
	end;
	
	function ComparableTriple.lessThan(otroComparable: Comparable): boolean;
	var
		otroComparableTriple: ComparableTriple;
	begin
		otroComparableTriple:= otroComparable as ComparableTriple;
		lessThan:=(
                 (comparable1.lessThan(otroComparableTriple.getComparable1))  or
                 
				 ((comparable1.equals(otroComparableTriple.getComparable1))   and
                 (comparable2.lessThan(otroComparableTriple.getComparable2))) or
                 
				 ((comparable1.equals(otroComparableTriple.getComparable1))   and
                 (comparable2.equals(otroComparableTriple.getComparable2))	  and
				 (comparable3.lessThan(otroComparableTriple.getComparable3)))		 
				 );
	end;
	

	function ComparableTriple.greaterThan(otroComparable: Comparable): boolean;
	var
		otroComparableTriple: ComparableTriple;
	begin
		otroComparableTriple:= otroComparable as ComparableTriple;
		greaterThan:=(
                 (comparable1.greaterThan(otroComparableTriple.getComparable1))  or
                 
				 ((comparable1.equals(otroComparableTriple.getComparable1))   and
                 (comparable2.greaterThan(otroComparableTriple.getComparable2))) or
                 
				 ((comparable1.equals(otroComparableTriple.getComparable1))   and
                 (comparable2.equals(otroComparableTriple.getComparable2))	  and
				 (comparable3.greaterThan(otroComparableTriple.getComparable3)))		 
				 );
	end;

	function ComparableTriple.lessThanOrEquals(otroComparable: Comparable): boolean;
	var
		otroComparableTriple: ComparableTriple;
	begin
		otroComparableTriple:= otroComparable as ComparableTriple;
		lessThanOrEquals:=(
                        (self.lessThan(otroComparableTriple as Comparable))  or
                        (self.equals(otroComparableTriple as Comparable))
                        );
	end;
	
    function ComparableTriple.greaterThanOrEquals(otroComparable: Comparable): boolean;
	var
		otroComparableTriple: ComparableTriple;
	begin
		otroComparableTriple:= otroComparable as ComparableTriple;
		greaterThanOrEquals:=(
                            (self.greaterThan(otroComparableTriple as Comparable))  or
                            (self.equals(otroComparableTriple as Comparable))
                            );
	end;
end.

