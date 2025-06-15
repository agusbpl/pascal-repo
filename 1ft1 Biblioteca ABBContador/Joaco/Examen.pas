program examen;
{$mode objfpc}

uses UABBGenerico, UABBLibros, URandomGenerator, ULibros, UCadena;

procedure elegirLibro(unNumeroAlAzar: integer; var unISBN, unTitulo, unAutor: string; var unAnio: integer);
var 

	isbns: array[1..10] of string = ('9788426400260','9788416511563','9788449321894','9788419642806','9788498720853',
                                     '9789501298956','9789871093694','9788428216388','9789873752131','9781482949544');
    titulos: array[1..10] of string = ('1984','Superinteligencia','El cisne negro','Artificial','Ciudad permutacion',
                                       'Por que dormimos','El origen de las especies','La celula','De animales a dioses','Todos ustedes, zombies');
    autores: array[1..10] of string = ('Orwell','Bostrom','Taleb','Bilinkis','Egan',
                                       'Walker','Darwin','Alberts','Harari','Heinlein');
    anios: array[1..10] of integer = (1949,2014,2007,2023,1994,
                                      2017,1859,2008,2014,1959);
begin
	unISBN:= isbns[unNumeroAlAzar];
	unTitulo:= titulos[unNumeroAlAzar];
	unAutor:= autores[unNumeroAlAzar];
	unAnio:= anios[unNumeroAlAzar];
end;

procedure CargarLibros (abb: ABBLibros); //CARGA EL ARBOL DE LIBROS
var
	r: RandomGenerator;
	num, anio, i: integer;
	titulo, autor, ISBN: string;
	clave: comparable;
	dato: TObject;
begin
	r:= RandomGenerator.create ();
	for i:= 1 to 30 do
	begin
		num:= r.getInteger (1,10);
		elegirLibro (num, ISBN, titulo, autor, anio);
		dato:= libro.create (titulo, autor, anio);
		clave:= cadena.create (ISBN);
		abb.agregar (clave,dato);
	end;
end;

procedure ImprimirEntreISBN (abb: ABBLibros; ISBN1,ISBN2: string); //HACE COMPARABLE DOS VALORES E IMPRIME ACOTADO ENTRE ESOS DOS
var
	clave1,clave2: comparable;
begin
	clave1:= cadena.create (ISBN1);
	clave2:= cadena.create (ISBN2);
	abb.imprimirAcotado (clave1,clave2);
end;

procedure ExisteLibro (abb: ABBLibros; ISBN: string); //BUSCA SI EXISTE UN ISBN (LIBRO) EN EL ARBOL
var
	clave: comparable;
	ok: boolean;
begin
	clave:= cadena.create (ISBN);
	ok:= abb.existeElemento (clave);
	if ok = true then 
		writeln ('Existe el libro buscado')
	else
		writeln ('No existe el libro buscado');
end;

procedure Aumentar (unDato: TObject); //PROCEDIMIENTO PARA IMPLEMENTAR EN EL PROCESAR DEL ARBOL
var
	l: Libro;
begin
	l:= unDato as libro;
	if (l.getCantidad() < 5) then
	begin
		l.aumentarCantidad (10);
	end;
end;

procedure AumentarCopias (abb: ABBLibros); //PROCEDIMIENTO PARA IMPLEMENTAR EL PROCESAR DEL ARBOL
var
	clave1,clave2: comparable;
begin
	clave1:= cadena.create ('0');
	clave2:= cadena.create ('9999999999999');
	abb.procesar (clave1,clave2,@aumentar);
end;
	


//PROGRAMA PRINCIPAL
var
	abb: ABBLibros;
	ISBN1,ISBN2, ISBNBUSCAR: string;
begin
	abb:= ABBLibros.create ();
	CargarLibros (abb);//PUNTO 1
	writeln ('------------------------');
	write ('Dime un ISBN (minimo) para imprimir acotado: '); readln (ISBN1); //VALOR COMPARABLE 1
	write ('Dime otro ISBN (maximo) para imprimir acotado: '); readln (ISBN2); //VALOR COMPARABLE 2
	ImprimirEntreISBN (abb,ISBN1,ISBN2); //IMPRIMIR ENTRE LOS DOS VALORES ANTERIORES, PUNTO 2
	writeln ('------------------------');
	write ('Dime un ISBN para saber si se encuentra el libro: '); readln (ISBNBUSCAR); //BUSCA EL ELEMENTO, PUNTO 3
	ExisteLibro (abb, ISBNBUSCAR);
	writeln ('------------------------');
	AumentarCopias (abb); //AUMENTA LAS COPIAS MENORES A 5, EN 10 UNIDADES, PUNTO 4. NO SE IMPRIME CON EL TOSTRING DEL NODOLIBROS, PERO SI AUMENTA
end.
