unit UCadena;
{$mode objfpc}

interface

uses UABBGenerico;

type
	Cadena = class (Comparable)
		private 
			Valor: string;
		public
			constructor create (unValor: string);
			function getValor (): string;
			function toString (): ansistring; override;
			function equals (otroComparable: Comparable): boolean; override;
			function lessThan (otroComparable: Comparable): boolean; override;
			function greaterThan (otroComparable: Comparable): boolean; override;
			function lessThanOrEquals (otroComparable: Comparable): boolean; override;
			function greaterThanOrEquals (otroComparable: Comparable): boolean; override;
	end;

Implementation

constructor Cadena.create (unValor: string);
begin
	Valor:= unValor;
end;

function Cadena.getValor (): string;
begin
	getValor:= Valor;
end;

function Cadena.toString (): ansistring;
begin
	toString:= Valor;
end;

function Cadena.equals (otroComparable: Comparable): boolean;
var
	otraCadena: Cadena;
begin
	otraCadena:= otroComparable as Cadena;
	equals:= self.Valor = otraCadena.getValor ();
end;

function Cadena.lessThan (otroComparable: Comparable): boolean;
begin
	lessThan:= self.Valor < (otroComparable as Cadena).getValor ();
end;

function Cadena.greaterThan (otroComparable: Comparable): boolean;
begin
	greaterThan:= self.Valor > (otroComparable as Cadena).getValor ();
end;

function Cadena.lessThanOrEquals (otroComparable: Comparable): boolean;
var
	otraCadena: Cadena;
begin
	otraCadena:= otroComparable as Cadena;
	if (self.Valor < otraCadena.getValor ()) or (self.Valor = otraCadena.getValor ()) then
		lessThanOrEquals:= true
	else
		lessThanOrEquals:= false;
end;

function Cadena.greaterThanOrEquals (otroComparable: Comparable): boolean;
var
	otraCadena: Cadena;
begin
	otraCadena:= otroComparable as Cadena;
	if (self.Valor > otraCadena.getValor ()) or (self.Valor = otraCadena.getValor ()) then
		greaterThanOrEquals:= true
	else
		greaterThanOrEquals:= false;
end;

end.
