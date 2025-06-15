unit UNodoLibros;
{$mode objfpc}

interface

uses sysutils, UABBGenerico, ULibros;

type
	NodoLibros = class (Nodo)
		private
			CopiasDisponibles: integer;
		public
			constructor create (unaClave: comparable; unDato: TObject);
			procedure agregar (unNodo: Nodo); override;
			function toString (): ansistring; override;
			procedure procesar (queHacer: procedimiento); override;
			function getCantidad (): integer;
	end;
	
implementation

constructor NodoLibros.create (unaClave: Comparable; unDato: TObject);
begin
	inherited create (unaClave, unDato);
	CopiasDisponibles:= 1;
end;

procedure NodoLibros.agregar (unNodo: Nodo);
begin
	if unNodo.getClave().equals(self.getClave()) then
	begin
		CopiasDisponibles:= CopiasDisponibles + 1;
		((self.getDato) as libro).aumentarCantidad (1);
	end
	else
		inherited agregar (unNodo);
end;

function NodoLibros.toString (): ansistring;
begin
	toString:= inherited toString()+ ' (Unidades Disponibles: ' + IntToStr(CopiasDisponibles) + ')';
end;

procedure NodoLibros.procesar(queHacer: Procedimiento); 
begin
	if (CopiasDisponibles < 5) then
	begin
		if inherited getDato() = nil then
			queHacer(inherited getClave())
		else
			queHacer(inherited getDato());
	end;
end;

function NodoLibros.getCantidad (): integer;
begin
	getCantidad:= CopiasDisponibles;
end;

end.
