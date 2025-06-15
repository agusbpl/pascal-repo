unit UViaje;
{$mode objfpc}

interface
uses sysUtils;
type
//importante cambiar este objeto y cambiar el toString del objeto si es necesario
{---------------------------------Viaje---------------------------------}
	Viaje = class
		private
			Kilometros:real;
			Monto:real;
		public
			constructor create(
			unKilometros:real;
			unMonto:real);

			function getKilometros:real;
			procedure setKilometros(unKilometros:real);
			function getMonto:real;
			procedure setMonto(unMonto:real);
		
			function toString:ansistring; override;// representacion del objeto
			procedure imprimir();
	end;
{---------------------------------Viaje---------------------------------}


implementation


{---------------------------------Viaje---------------------------------}
	constructor Viaje.create(
			unKilometros:real;
			unMonto:real);
	begin
	Kilometros:=unKilometros;
	Monto:=unMonto;
	end;

	function Viaje.getKilometros:real;
	begin
	result:= Kilometros;
	end;
	procedure Viaje.setKilometros(unKilometros:real);
	begin
	Kilometros:= unKilometros;
	end;
	
	function Viaje.getMonto:real;
	begin
	result:= Monto;
	end;
	procedure Viaje.setMonto(unMonto:real);
	begin
	Monto:= unMonto;
	end;
	
	function Viaje.toString:ansistring;
	begin
	result:=	//' '+Monto.toString
				' $:'+Format('%.2f', [Monto])
				+' km:'+Format('%.2f', [Kilometros]);
				
	end;
	procedure Viaje.imprimir();
	begin
	writeln(self.toString);
	end;
{---------------------------------Viaje---------------------------------}


end.
