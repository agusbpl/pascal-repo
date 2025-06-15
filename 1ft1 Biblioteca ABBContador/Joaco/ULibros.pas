unit ULibros;
{$mode objfpc}

interface
	
uses SySutils;

type
	libro = class
		private
			titulo: string;
			autor: string;
			anio: integer;
			CantidadLibros: integer;
		public
			constructor create (unTitulo: string; unAutor: string; unAnio: integer);
			function getTitulo (): string;
			function getAutor (): string;
			function getAnio (): integer;
			function toString (): ansistring; override;
			function getCantidad (): integer;
			procedure aumentarCantidad (cantidad: integer);
	end;
	
implementation

constructor libro.create (unTitulo: string; unAutor: string; unAnio: integer);
begin
	titulo:= unTitulo;
	autor:= unAutor;
	anio:= unAnio;
	cantidadLibros:= 1;
end;

function libro.getTitulo (): string;
begin
	getTitulo:= titulo;
end;

function libro.getAutor (): string;
begin
	getAutor:= autor;
end;

function libro.getAnio (): integer;
begin
	getAnio:= anio;
end;

function libro.getCantidad (): integer;
begin
	getCantidad:= CantidadLibros;
end;

procedure libro.aumentarCantidad (cantidad: integer);
begin
	cantidadLibros:= cantidadLibros + cantidad;
end;
	

function libro.toString (): ansistring;
begin
	toString:= 'Titulo: ' + titulo + ' / Autor: ' + autor + ' / Anio: ' + intToStr (anio);
end;

end.
