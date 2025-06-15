unit UABBHistorial;
{$mode objfpc}

interface
uses UABBGenerico,sysUtils,ULibro;
type

	ABBHistorial = class(ABBGenerico)
		public
			procedure agregar(unaClave:Comparable ;unDato:TObject); override;

	end;

	NodoHistorial = class(Nodo)
		private
			contador: integer;
			//contadorKg: real;
		public
			constructor create(unaClave: Comparable; unDato: TObject);
			procedure agregar(unNodo: Nodo); override;
			function toString(): ansistring; override;
	end;

implementation

{----------------------NodoHistorial----------------------}
    constructor NodoHistorial.create(unaClave: Comparable; unDato: TObject);
    begin
    inherited create(unaClave,unDato);
    contador:= 1;
    Libro(unDato).setCantidad(contador);
    end;
    
    procedure NodoHistorial.agregar(unNodo: Nodo);
	var e:Libro;
	begin
		e:= Libro(self.getDato);
		if ( unNodo.getClave().equals(self.getClave) )
		then begin
			if e.getCantidad > contador then contador := e.getCantidad +1 
			else begin
				contador:= contador+1;
				e.setCantidad(contador);
			end;
			//contadorKg:= contadorKg + e.getPeso;
		end
		else 
			inherited agregar(unNodo);
	end;
	
		
	function NodoHistorial.toString(): ansistring;
	var s:string;
	begin
		s:= self.getClave.toString+' '+self.getDato.toString;
		//como el posible aumento de stock se vio modificado solo en el objeto
		//actualizo la informacion en el nodo
		contador:= Libro(self.getDato).getCantidad; 
		s:= s + ' cantidad: '+intToStr(contador);
		result:= s + LineEnding;
	end;
{----------------------NodoHistorial----------------------}


{----------------------ABBHistorial----------------------}
	procedure ABBHistorial.agregar(unaClave:Comparable ;unDato:TObject);
	var n:Nodo;
	begin
	n:= NodoHistorial.create(unaClave,unDato);
	self.agregarNodo(n);
	end;
{----------------------ABBHistorial----------------------}
end.

