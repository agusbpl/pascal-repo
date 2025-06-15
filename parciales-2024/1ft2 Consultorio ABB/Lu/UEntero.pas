unit UEntero;
{$mode objfpc}

interface

uses UABBGenerico, sysutils;

type
	Entero = class (Comparable)
		private 
			Valor: integer;
		public
			constructor create (unValor: integer);
			function getValor (): integer;
			function toString (): ansistring; override;
			function equals (otroComparable: Comparable): boolean; override;
			function lessThan (otroComparable: Comparable): boolean; override;
			function greaterThan (otroComparable: Comparable): boolean; override;
			function lessThanOrEquals (otroComparable: Comparable): boolean; override;
			function greaterThanOrEquals (otroComparable: Comparable): boolean; override;
	end;

Implementation

constructor Entero.create (unValor: integer);
begin
	Valor:= unValor;
end;

function Entero.getValor (): integer;
begin
	getValor:= Valor;
end;

function Entero.toString (): ansistring;
begin
	toString:= intToStr (valor);
end;

function Entero.equals (otroComparable: Comparable): boolean;
var
	otroEntero: entero;
begin
	otroEntero:= otroComparable as Entero;
	equals:= self.Valor = otroEntero.getValor ();
end;

function Entero.lessThan (otroComparable: Comparable): boolean;
begin
	lessThan:= self.Valor < (otroComparable as Entero).getValor ();
end;

function Entero.greaterThan (otroComparable: Comparable): boolean;
begin
	greaterThan:= self.Valor > (otroComparable as Entero).getValor ();
end;

function Entero.lessThanOrEquals (otroComparable: Comparable): boolean;
var
	otroEntero: entero;
begin
	otroEntero:= otroComparable as Entero;
	if (self.Valor < otroEntero.getValor ()) or (self.Valor = otroEntero.getValor ()) then
		lessThanOrEquals:= true
	else
		lessThanOrEquals:= false;
end;

function Entero.greaterThanOrEquals (otroComparable: Comparable): boolean;
var
	otroEntero: entero;
begin
	otroEntero:= otroComparable as Entero;
	if (self.Valor > otroEntero.getValor ()) or (self.Valor = otroEntero.getValor ()) then
		greaterThanOrEquals:= true
	else
		greaterThanOrEquals:= false;
end;

end.
