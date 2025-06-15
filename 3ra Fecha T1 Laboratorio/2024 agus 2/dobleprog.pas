program dobleprog;
uses UABBGenerico,UComparableTriple, ucadena,Uentero;
var dob1,dob2,dob3,dob4:ComparableTriple;
begin
    dob1:= ComparableTriple.create(cadena.create('a'),entero.create(9),entero.create(110));
    dob2:= ComparableTriple.create(cadena.create('a'),entero.create(8),entero.create(120));
    
    writeln('---------------------------');
    writeln(dob1.lessThan(dob2));
    writeln('---------------------------');
end.
