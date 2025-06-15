program biblio;
uses UABBContadorBiblioteca,URandomGenerator,UCadena,UABBGenerico;
const
cant_libros = 10;
cant_ingresos = 30;
 
 type 
     vectorLibros = array [1..cant_libros] of Libro;
     procedimiento = procedure(unDato:TObject);
     
procedure CargarAutores(rg:randomgenerator);
begin
rg.addlabel('Eva Morales');
rg.addlabel('Miguel de Cervantes');
rg.addlabel('Jane Austen');
rg.addlabel('Luisa Perez');
rg.addlabel('Charles Dickens');
rg.addlabel('Gabriel Garcia Marquez');
rg.addlabel('Gabriel Rolon');
rg.addlabel('Anna Tod');
rg.addlabel('William Shakespear');
rg.addlabel('J. K . Rowling');
end;

procedure CargarTitulos (rg1:randomgenerator);
begin
rg1.addlabel('Queen');
rg1.addlabel('After');
rg1.addlabel('Harry Potter');
rg1.addlabel('La Cenicienta');
rg1.addlabel('Don Quijote de la Mancha');
rg1.addlabel('Orgullo y Prejuicio');
rg1.addlabel('David Copperfield');
rg1.addlabel('Cien anio de soledad');
rg1.addlabel('Duelo');
rg1.addlabel('Romeo y Julieta');
end;
     
procedure CargarVector (var v:vectorLibros;rg,rg1:randomgenerator);
var
i:integer;
begin 
    CargarTitulos(rg1);
    CargarAutores(rg);
   for i:=1 to cant_libros do 
       v[i]:=Libro.create(rg.getString(5),rg1.getlabel(),rg.getlabel(),rg.getInteger(1970,2025));
end;

procedure CargarArbol(abb:ABBContador;rg,rg1:randomgenerator);
var
ISBNclave:Comparable;
dato:TObject;
i:integer;
v:vectorLibros;
aux:integer;
begin
    CargarVector(v,rg,rg1);
     
    for i:= 1 to cant_ingresos do 
    begin
    // la clave usada al agrgar al BB tiene que ser el ISBN del objeto Libro.
           aux:= rg.getInteger(1,cant_libros); //genero numero aleatorio de 1 a 10.
          dato:=v[aux];  
          ISBNclave:=Cadena.create(Libro(dato).getISBN()); //le digon al compilador que el objeto dato es de tipo libro
          
          abb.agregar(ISBNclave,dato);
      end;
 end;
 
procedure imprimirAcotadoLibros (abb:ABBContador; ISBNMin,ISBNMax: string);
var
min,max:Comparable;
begin 
  min:=Cadena.create(ISBNMin);
  max:=Cadena.create(ISBNMax);
 abb.imprimirAcotado(min,max);
 end;
 
 
 procedure BuscarLibroBiblioteca (abb:ABBContador;ISBNBuscar:string);
 var
 busqueda:Comparable;
 existe:boolean;
 begin
     busqueda:=Cadena.create(ISBNBuscar);
     existe:=abb.existeElemento(busqueda);
     
     if existe = true then
        writeln('El libro existe')
     else
         writeln('El libro no existe');
end;
    
procedure Aumentar(elemento:TObject);
var
l:Libro;
begin
l:=Libro(elemento);
if (l.getCantidad() < 5 ) then 
l.aumentarCantidad(10);
end;

procedure AumentaCopiasMenos5 (abb:ABBContador);
var
ISBNClaveMin,ISBNClaveMax:Comparable;
begin
//Estas claves sirven como rango: voy a procesar todos los libros cuya clave este entre min y max.
ISBNClaveMin:=Cadena.create('aaaaaaaaaa');
ISBNClaveMax:=Cadena.create('zzzzzzzzzzz');
abb.procesar(ISBNClaveMin,ISBNClaveMax,@Aumentar);
end;

 //---------------------------PROGRAMA PRINCIPAL----------------------------
 var
 rg,rg1:RandomGenerator;
 abb:ABBContador;
 ISBNMin,ISBNMax,ISBNBuscar:string;
 begin
 //---------------------------PUNTO 1)-------------------------
  rg:=RandomGenerator.create();
 rg1:=RandomGenerator.create();
 abb:=ABBContador.create();
 CargarArbol(abb,rg,rg1);
abb.imprimirEnOrden();
 //-------------------------PUNTO 2)--------------------------
 write('Ingrese el ISBN mas chico : ');readln(ISBNMin);
 write('Ingrese el ISBN mas grande : ');readln(ISBNMax);
  imprimirAcotadoLibros(abb,ISBNMin,ISBNMax);
 //-------------------------PUNTO 3)------------------------------
 write('Ingrese ISBN que desee buscar: ');readln(ISBNBuscar);
 BuscarLibroBiblioteca(abb,ISBNBuscar);
 AumentaCopiasMenos5(abb);
 end.
 
 



 
