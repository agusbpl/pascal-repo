unit UPrecipitacion;
{$mode objfpc}

interface
uses sysUtils,UDateTime;
type
//importante cambiar este objeto y cambiar el toString del objeto si es necesario
{---------------------------------Precipitacion---------------------------------}
	Precipitacion = class
		private
			milimetros:real;
			fechaRegistro:Date;
		public
			constructor create(
			unmilimetros:real;
			unafechaRegistro:Date);

			function getmilimetros:real;
			procedure setmilimetros(unmilimetros:real);
			function getfechaRegistro:Date;
			procedure setfechaRegistro(unaFecha:Date);
		
			function toString:ansistring; override;// representacion del objeto
			procedure imprimir();
	end;
{---------------------------------Precipitacion---------------------------------}


implementation


{---------------------------------Precipitacion---------------------------------}
	constructor Precipitacion.create(
			unmilimetros:real;
			unafechaRegistro:Date);
	begin
	milimetros:=unmilimetros;
	fechaRegistro:=unafechaRegistro;
	end;

	function Precipitacion.getmilimetros:real;
	begin
	result:= milimetros;
	end;
	procedure Precipitacion.setmilimetros(unmilimetros:real);
	begin
	milimetros:= unmilimetros;
	end;
	
	function Precipitacion.getfechaRegistro:Date;
	begin
	result:= fechaRegistro;
	end;
	procedure Precipitacion.setfechaRegistro(unaFecha:Date);
	begin
	fechaRegistro:= unaFecha;
	end;
	
	function Precipitacion.toString:ansistring;
	begin
	result:=	' '+fechaRegistro.toString
				+' $'+Format('%.2f', [milimetros]);
				
	end;
	procedure Precipitacion.imprimir();
	begin
	writeln(self.toString);
	end;
{---------------------------------Precipitacion---------------------------------}


end.
