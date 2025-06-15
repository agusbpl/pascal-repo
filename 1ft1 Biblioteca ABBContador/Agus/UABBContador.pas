unit UABBContador;
{$mode objfpc}

interface
uses UABBGenerico,sysUtils,ULibro,UCadena;

type
{------------------------------Contador------------------------------}
	Contador = class
		private
			CantidadCopias: integer;

		public
			constructor create();	
			
			function getCantidadCopias: integer;	
			procedure sumarCopias(unaCantidadCopias: integer);
						
			function toString(): ansistring; override;
			procedure imprimir;
	end;
{------------------------------Contador------------------------------}

{------------------------------NodoContador------------------------------}
	NodoContador = class(Nodo)
		private
			Contado:Contador;
		public
			constructor create(unaClave: Comparable; unDato: TObject);
			procedure agregar(unNodo: Nodo); override;
			function toString(): ansistring; override;
			function devolverElemento():TObject; override;

	end;
{------------------------------NodoContador------------------------------}

{------------------------------ABBContador------------------------------}
ABBContador = class(ABBGenerico)
	public
		procedure agregar(unaClave:Comparable ;unDato:TObject); override;

end;
{------------------------------ABBContador------------------------------}	


implementation

	
{------------------------------Contador------------------------------}

    constructor Contador.create();
    begin
    CantidadCopias:= 1;
    end; 

	function Contador.getCantidadCopias: integer;
	begin
	result:= CantidadCopias;
	end;
	
	procedure Contador.sumarCopias(unaCantidadCopias: integer);
	begin
	CantidadCopias:= CantidadCopias + unaCantidadCopias;
	end;
	
	function Contador.toString(): ansistring;
	begin
		result:= ' cantidad copias: '+intToStr(CantidadCopias);
	end;
	
	procedure Contador.imprimir;
	begin
		writeln(self.toString);
	end;
{------------------------------Contador------------------------------}

{------------------------------NodoContador------------------------------}

    constructor NodoContador.create(unaClave: Comparable; unDato: TObject);
    begin
    inherited create(unaClave,unDato);
    Contado:= Contador.create();
    //writeln(Cadena(self.getClave()).toString);Contado.imprimir();
    end;
    
    procedure NodoContador.agregar(unNodo: Nodo);
	begin
		if ( unNodo.getClave().equals(self.getClave) )
		then begin
			//writeln(Cadena(self.getClave()).toString);
			//Contado.imprimir;write(' paso a ser ');
			Contado.sumarCopias(1);
			//Contado.imprimir;
		end
		else 
			inherited agregar(unNodo);
	end;
	
		
	function NodoContador.toString(): ansistring;
	var s:string;
	begin
		s:= self.getClave.toString+' '+self.getDato.toString;
		s:= s + Contado.toString;
		result:= s + LineEnding;
	end;
	
	function NodoContador.devolverElemento():TObject;
	begin
	result:= Contado;
	end;
{------------------------------NodoContador------------------------------}

{------------------------------ABBContador------------------------------}
	procedure ABBContador.agregar(unaClave:Comparable ;unDato:TObject);
	var n:Nodo;
	begin
	n:= NodoContador.create(unaClave,unDato);
	self.agregarNodo(n);
	end;
{------------------------------ABBContador------------------------------}
	
end.
