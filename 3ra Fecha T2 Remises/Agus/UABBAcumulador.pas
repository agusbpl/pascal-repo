unit UABBAcumulador;
{$mode objfpc}

interface
uses UABBGenerico,sysUtils,UViaje,UFecha,UDateTime;

type
{------------------------------Acumulador------------------------------}
	Acumulador = class
		private
			cantidadViajes: integer;
			kilometrosAcumulados: real;
			montoTotal: real;
			laFecha: Date;
		public
			constructor create( unKilometrosAcumulados: real; unMonto: real;
																unaFecha: Date );
			
			procedure acumularDatosViaje(unViaje: Viaje);
			
			function getcantidadViajes: integer;
			
			function getKilometrosAcumulados: real;
			procedure setKilometrosAcumulados(unaCantidadKilometros: real);
			
			function getMontoTotal: real;
			procedure setMontoTotal(unMonto: real);
			
			function getFecha: Date;
			//procedure setlaFecha(unaFecha: Fecha);
			
			function toString(): ansistring; override;
			procedure imprimir;
	end;
{------------------------------Acumulador------------------------------}

{------------------------------NodoAcumulador------------------------------}
	NodoAcumulador = class(Nodo)
		private
			acumulado:Acumulador;
		public
			constructor create(unaClave: Comparable; unDato: TObject);
			procedure agregar(unNodo: Nodo); override;
			function toString(): ansistring; override;
			function devolverElemento():TObject; override;

	end;
{------------------------------NodoAcumulador------------------------------}

{------------------------------ABBAcumulador------------------------------}
ABBAcumulador = class(ABBGenerico)
	public
		procedure agregar(unaClave:Comparable ;unDato:TObject); override;

end;
{------------------------------ABBAcumulador------------------------------}	


implementation

	
{------------------------------Acumulador------------------------------}

    constructor Acumulador.create( unKilometrosAcumulados: real; unMonto: real;
																unaFecha: Date );
    begin
    cantidadViajes:= 1;
    KilometrosAcumulados:= unKilometrosAcumulados;
    montoTotal:= unMonto;
	laFecha:= unaFecha;
    end;
    
    procedure Acumulador.acumularDatosViaje(unViaje: Viaje);
    begin
    cantidadViajes:= cantidadViajes +1; 
    KilometrosAcumulados:= KilometrosAcumulados + unViaje.getKilometros;
	MontoTotal:= MontoTotal + unViaje.getMonto;
    end;
    
    
	function Acumulador.getcantidadViajes: integer;
	begin
	result:= cantidadViajes;
	end;
	
	function Acumulador.getKilometrosAcumulados: real;
	begin
	result:= KilometrosAcumulados;
	end;
	procedure Acumulador.setKilometrosAcumulados(unaCantidadKilometros: real);
	begin
	KilometrosAcumulados:= unaCantidadKilometros;
	end;
	
	function Acumulador.getMontoTotal: real;
	begin
	result:= MontoTotal;
	end;
	procedure Acumulador.setMontoTotal(unMonto: real);
	begin
	MontoTotal:= unMonto;
	end;
			

	function Acumulador.getFecha: Date;
	begin
	result:= laFecha;
	end;
{	procedure Acumulador.setlaFecha(unaFecha: Fecha);
	begin
	laFecha:= unaFecha;
	end;    
}
	
	function Acumulador.toString(): ansistring;
	var s:string;
	begin
		s:= ' cantidad viajes: '+intToStr(cantidadViajes);
		s:= s + ' kilometros acumulados: '+Format('%.2f', [KilometrosAcumulados]);
		s:= s + ' monto total acumulado: '+Format('%.2f', [montoTotal]);
		//s:= s + ' en la fecha: '+laFecha.toString;
		result:= s ;
	end;
	
	procedure Acumulador.imprimir;
	begin
		writeln(self.toString);
	end;
{------------------------------Acumulador------------------------------}

{------------------------------NodoAcumulador------------------------------}

    constructor NodoAcumulador.create(unaClave: Comparable; unDato: TObject);
    begin
    inherited create(unaClave,unDato);
    acumulado:= 
		Acumulador.create(Viaje(unDato).getKilometros, Viaje(unDato).getMonto, Fecha(self.getClave()).getValor);
		//acumulado.imprimir;
    end;
    
    procedure NodoAcumulador.agregar(unNodo: Nodo);
	var e:Viaje;
	begin
		e:= Viaje(unNodo.getDato);
		if ( unNodo.getClave().equals(self.getClave) )
		then begin
			//writeln(Fecha(self.getClave).toString,' ');e.imprimir;
			acumulado.acumularDatosViaje(e);
			//acumulado.imprimir;
		end
		else 
			inherited agregar(unNodo);
	end;
	
		
	function NodoAcumulador.toString(): ansistring;
	var s:string;
	begin
		s:= self.getClave.toString;// + ' '+self.getDato.toString;
		s:= s + acumulado.toString;
		result:= s + LineEnding;
	end;
	
	function NodoAcumulador.devolverElemento():TObject;
	begin
	result:= acumulado;
	end;
{------------------------------NodoAcumulador------------------------------}

{------------------------------ABBAcumulador------------------------------}
	procedure ABBAcumulador.agregar(unaClave:Comparable ;unDato:TObject);
	var n:Nodo;
	begin
	n:= NodoAcumulador.create(unaClave,unDato);
	self.agregarNodo(n);
	end;
{------------------------------ABBAcumulador------------------------------}
	
end.
