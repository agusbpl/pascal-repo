unit UABBLista;
{$mode objfpc}

interface
uses	UEntero,UConsulta,
		UABBGenerico,sysUtils,GenericLinkedList,UDateTime;
type
//importante cambiar este objeto y cambiar el toString del objeto si es necesario
{---------------------------------NodoLista---------------------------------}
	NodoLista = class(Nodo)
		type
			ListaDeObjetos = specialize LinkedList<TObject>;
		private
			elementos: ListaDeObjetos;
//			procedure insertarOrdenado(l:ListaDeObjetos;unDato:TObject);
		public
			constructor create(unaClave: Comparable; unDato: TObject);
			procedure agregar(unNodo: Nodo); override;
			function toString(): ansistring; override;
			function devolverElemento(): TObject; override;
	end;
{---------------------------------NodoLista---------------------------------}
	
{---------------------------------ABBLista---------------------------------}	
	ABBLista = class(ABBGenerico)
	public
		procedure agregar(unaClave:Comparable ;unDato:TObject); override;

	end;
{---------------------------------ABBLista---------------------------------}	
	
	
implementation

{---------------------------------NodoLista---------------------------------}
    constructor NodoLista.create(unaClave: Comparable; unDato: TObject);
    begin
    inherited create(unaClave,unDato);
    elementos:= ListaDeObjetos.create();
	elementos.add(unDato);
    end;

{
	procedure NodoLista.insertarOrdenado(l:ListaDeObjetos;unDato:TObject);
	begin
		l.reset();
		while ( (not(l.eol)) and (Consulta(l.current()).getCodigoProducto < Consulta(unDato).getCodigoProducto) ) do
		begin
			l.next();
		end;
		l.insertCurrent( unDato );
	end;
}
    
    procedure NodoLista.agregar(unNodo: Nodo);
	begin
		if ( unNodo.getClave().equals(self.getClave) )
		then begin
//			insertarOrdenado(elementos, unNodo.getDato);
			elementos.add(unNodo.getDato);
		end
		else 
			inherited agregar(unNodo);
	end;
	
	
	function NodoLista.toString(): ansistring;
	var s:string;
		montoTotal:real;
	begin
	montoTotal:=0;
	elementos.reset();
	s:= self.getClave.toString()+' ( '+ LineEnding+'  ';

	while not elementos.eol do
	begin
		s:= s + (elementos.current as Consulta).toString;
		//en esta linea en vez de Consulta el objeto del que este conformado la lista
		montoTotal:= montoTotal + ( Consulta(elementos.current).getMonto);
		
		elementos.next();
		if not elementos.eol then s:= s + ', ';
	end;
	s:= s + ')'+LineEnding+LineEnding;
	result:= s + '| monto total($'+Format('%.2f', [montoTotal])+')'+LineEnding+LineEnding;
	end;
	

	function NodoLista.devolverElemento(): TObject;
	begin
	result:= elementos;
	end;
{---------------------------------NodoLista---------------------------------}


{---------------------------------ABBLista---------------------------------}
	procedure ABBLista.agregar(unaClave:Comparable ;unDato:TObject);
	var n:Nodo;
	begin
	n:= NodoLista.create(unaClave,unDato);
	self.agregarNodo(n);
	end;
{---------------------------------ABBLista---------------------------------}
end.
