unit UABBAcumulador;
{$mode objfpc}

interface
uses UABBGenerico,sysUtils,UPrecipitacion,UFecha,UEntero,UDateTime;

type
{------------------------------Acumulador------------------------------}
	Acumulador = class
		private
			codigoEstacion: integer;
			acumuladoPrecipitacion: real;
			ultimaFecha: Fecha;
		public
			constructor create( unCodigoEstacion:integer; unAcumuladoPrecipitacion: real; unaUltimaFecha: Date );
			
			procedure acumularDatosPrecipitacion(unaPrecipitacion: Precipitacion);
			
			function getCodigoEstacion: integer;
			
			function getAcumuladoPrecipitacion: real;
			procedure setAcumuladoPrecipitacion(unmilimetros: real);
			
			function getUltimaFecha: Fecha;
			procedure setUltimaFecha(unaFecha: Fecha);
			
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

    constructor Acumulador.create( unCodigoEstacion:integer; unAcumuladoPrecipitacion: real; unaUltimaFecha: Date );
    begin
    codigoEstacion:= unCodigoEstacion;
    acumuladoPrecipitacion:= unAcumuladoPrecipitacion;
	ultimaFecha:= Fecha.create(unaUltimaFecha);
    end;
    
    procedure Acumulador.acumularDatosPrecipitacion(unaPrecipitacion: Precipitacion);
    var otraFecha:Fecha;
    begin
    acumuladoPrecipitacion:=
		acumuladoPrecipitacion + unaPrecipitacion.getmilimetros;
		
    otraFecha:= Fecha.create(unaPrecipitacion.getfechaRegistro); 
    
    if otraFecha.greaterThan(ultimaFecha)
    then ultimaFecha:= otraFecha;
    
    end;
    
    
	function Acumulador.getCodigoEstacion: integer;
	begin
	result:= CodigoEstacion;
	end;
	
	function Acumulador.getAcumuladoPrecipitacion: real;
	begin
	result:= acumuladoPrecipitacion;
	end;
	procedure Acumulador.setAcumuladoPrecipitacion(unmilimetros: real);
	begin
	acumuladoPrecipitacion:= unmilimetros;
	end;
			
	function Acumulador.getUltimaFecha: Fecha;
	begin
	result:= ultimaFecha;
	end;
	procedure Acumulador.setUltimaFecha(unaFecha: Fecha);
	begin
	ultimaFecha:= unaFecha;
	end;    
	
	function Acumulador.toString(): ansistring;
	var s:string;
	begin
		s:= ' codigo estacion: '+intToStr(codigoEstacion);
		s:= s + ' precipitacion acumulada: '+Format('%.2f', [acumuladoPrecipitacion]);
		s:= s + ' ultima fecha: '+ultimaFecha.toString;
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
		Acumulador.create(Entero(self.getClave()).getValor, Precipitacion(unDato).getmilimetros, Precipitacion(unDato).getfechaRegistro);
    end;
    
    procedure NodoAcumulador.agregar(unNodo: Nodo);
	var e:Precipitacion;
	begin
		e:= Precipitacion(unNodo.getDato);
		if ( unNodo.getClave().equals(self.getClave) )
		then begin
			acumulado.acumularDatosPrecipitacion(e);
		end
		else 
			inherited agregar(unNodo);
	end;
	
		
	function NodoAcumulador.toString(): ansistring;
	var s:string;
	begin
		//s:= self.getClave.toString + ' '+self.getDato.toString;
		s:= acumulado.toString;
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
