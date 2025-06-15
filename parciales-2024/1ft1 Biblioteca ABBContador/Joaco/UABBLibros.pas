unit UABBLibros;
{$mode objfpc}

interface

uses sysutils, UABBGenerico, UNodoLibros, ULibros;

type
	ABBLibros = class (ABBGenerico)
		public
			procedure agregar (unaClave: comparable; unDato: TObject); override;
	end;
	
implementation

procedure ABBLibros.agregar (unaClave: comparable; unDato: TObject);
var
	n: Nodo;
begin
	n:= NodoLibros.create (unaClave, unDato);
	self.agregarNodo (n);
end;

end.
