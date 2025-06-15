unit ULibro;
{$mode objfpc}

interface
uses sysUtils;
type
//importante cambiar este objeto y cambiar el toString del objeto si es necesario
{---------------------------------Libro---------------------------------}
	Libro = class
		private
			ISBN: string;
			titulo,autor:string;
			anio:integer;
			cantidadCopias:integer; 
		public
			constructor create(unISBN: string;
			untitulo,unautor:string;
			unanio:integer);

			function getISBN: string;
			function gettitulo:string;
			function getautor:string;
			function getanio:integer;
			
			function getCantidad:integer;
			procedure setCantidad(unaCantidad:integer);

			function toString:ansistring; override;// representacion del objeto
			procedure imprimir();
	end;
{---------------------------------Libro---------------------------------}


implementation


{---------------------------------Libro---------------------------------}
	constructor Libro.create(unISBN: string; untitulo,unautor:string; unanio:integer);
	begin
	ISBN:= unISBN;
	titulo:= untitulo;
	autor:= unautor;
	anio:= unanio;
	end;
	
	function Libro.getISBN: string;
	begin
	result:= ISBN;
	end;
	function Libro.gettitulo:string;
	begin
	result:= titulo;
	end;
	function Libro.getautor:string;
	begin
	result:= autor;
	end;
	function Libro.getanio:integer;
	begin
	result:= anio;
	end;		
	
	function Libro.getCantidad:integer;
	begin
	result:= cantidadCopias;
	end;
	procedure Libro.setCantidad(unaCantidad:integer);
	begin
	cantidadCopias:= unaCantidad;
	end;
	
	function Libro.toString:ansistring;
	begin
	result:=	' '+titulo
				+' '+autor
				//+' $'+Format('%.2f', [precio])
				+' '+intToStr(anio);				
	end;
	procedure Libro.imprimir();
	begin
	writeln(self.toString);
	end;
{---------------------------------Libro---------------------------------}


end.
