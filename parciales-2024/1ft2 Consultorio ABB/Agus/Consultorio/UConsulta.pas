unit UConsulta;
{$mode objfpc}

interface
uses sysUtils,UDateTime;
type
//importante cambiar este objeto y cambiar el toString del objeto si es necesario
{---------------------------------Consulta---------------------------------}
	Consulta = class
		private
			laFecha:Date;
			Monto:real;
//			stock:integer;

		public
			constructor create(unaFecha:Date;	unMonto:real);//; unstock:integer);

			function getFecha:Date;
			
			function getMonto:real;
			procedure setMonto(unMonto:real);
{	
			function getStock:integer;
			procedure setStock(unStock:integer);
}
			function toString:ansistring; override;// representacion del objeto
			procedure imprimir();
	end;
{---------------------------------Consulta---------------------------------}


implementation


{---------------------------------Consulta---------------------------------}
	constructor Consulta.create(unaFecha:Date;	unMonto:real);//; unstock:integer);
	begin
	laFecha:= unaFecha;
	Monto:= unMonto;
	end;
	
	function Consulta.getFecha: Date;
	begin
	result:= laFecha;
	end;
	function Consulta.getMonto: real;
	begin
	result:= Monto;
	end;
	procedure Consulta.setMonto(unMonto:real);
	begin
	Monto:= unMonto;
	end;

{
	function Consulta.getStock: integer;
	begin
	result:= stock;
	end;
	procedure Consulta.setStock(unStock:integer);
	begin
	stock:= unStock;
	end;
}
	function Consulta.toString:ansistring;
	begin
	result:=	'('+laFecha.toString+')'
				//+' '+intToStr(stock)
				+' $'+Format('%.2f', [Monto])
				+LineEnding;
	end;
	procedure Consulta.imprimir();
	begin
	writeln(self.toString);
	end;
{---------------------------------Consulta---------------------------------}




end.
