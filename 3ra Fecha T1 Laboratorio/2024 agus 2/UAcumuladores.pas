unit Uacumuladores;      
{$mode objfpc}

interface

uses UABBGenerico, sysutils, UAcumuladorManual, UDateTime;

type


	precipitacion =  class
    private   
        milimetros:real;
        fecha:date;
        codigoUnico: integer; 
    public
        constructor create(unMilimetros:real;unaFecha:date;unCodigoUnico: integer);
        function getMilimetros:real;
        function toString(): ansistring; override;
    end;

	nodoacumulador = class(nodo)
		private
			acumulador: acumuladorManual;
			
		public
			constructor create(unaClave: Comparable; unDato: TObject);
			procedure agregar(unNodo: Nodo); override;
			function toString(): ansistring; override;
			function devolverElemento(): Tobject; override;
	end;
	
	ABBAcumulador = class(ABBGenerico)
	public
		procedure agregar(unaClave: comparable; unDato: Tobject); override;
	end;


implementation
	
//modulos de los objetos

	constructor precipitacion.create(unMilimetros:real; unaFecha:date; unCodigoUnico: integer);
	begin
		milimetros:= unMilimetros;
		fecha:= unaFecha;
		codigoUnico:= unCodigoUnico; 
	end;

	function precipitacion.getMilimetros:real;
	begin
		result:= milimetros;
	end;

	function precipitacion.toString(): ansistring;
	begin
		toString:= ' ' + FormatFloat('0.0', milimetros) + ' en ' + fecha.toString + ' (' + intToStr(codigoUnico) + ') ';
	end;


	constructor nodoacumulador.create(unaClave: comparable; unDato: Tobject);
	begin
		inherited create(unaClave, unDato);
		acumulador:= acumuladorManual.create();
		acumulador.acumular((unDato as precipitacion).getMilimetros);//get a acumular
	end;
	
	procedure nodoacumulador.agregar(unNodo: Nodo);
	var p:precipitacion;
	begin
		p:= unNodo.getDato as precipitacion;
		if unNodo.getClave().equals(self.getClave()) then
			acumulador.acumular(p.getMilimetros)
		else
			inherited agregar(unNodo);
	end;
	
	function nodoacumulador.toString(): ansistring;
	begin
		toString:= inherited toString()+ ' (' + FormatFloat('0.0', acumulador.getCantidad()) + ')';
	end;

	function nodoacumulador.devolverElemento(): TObject;
	begin
		devolverElemento:= acumulador;
	end;
	
	procedure ABBacumulador.agregar(unaClave: Comparable; unDato: TObject);
	var 
		n: Nodo;
	begin
		n:= Nodoacumulador.create(unaClave, unDato);
		self.agregarNodo(n);
	end;

end.
