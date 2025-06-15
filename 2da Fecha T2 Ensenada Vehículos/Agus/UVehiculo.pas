unit UVehiculo;
{$mode objfpc}

interface
uses sysUtils, UDateTime;
type
//importante cambiar este objeto y cambiar el toString del objeto si es necesario


{---------------------------------Propietario---------------------------------}
	Propietario = class
		private
			nombre:string;
			apellido:string;
			dni:integer;
			fechaAdquisicion:Date;
		public
			constructor create(
			unnombre:string;
			unapellido:string;
			undni:integer;
			unafechaAdquisicion:Date);

			function getNombre:string;
			function getApellido:string;
			function getDni:integer;		
			function getFecha:Date;

			function toString:ansistring; override;// representacion del objeto
			procedure imprimir();
	end;
{---------------------------------Propietario---------------------------------}


{---------------------------------Vehiculo---------------------------------}
	Vehiculo = class
		private
			patente:string;
			dueno:Propietario;
			Color:string;
			marca:string;
			Modelo:string;

		public
			constructor create(
			unaPatente:string;
			undueno:Propietario;
			unColor:string;
			unaMarca:string;
			unModelo:string
			);
				
			function getColor: string;
			procedure setColor(unColor:string);
			
			function getdueno:Propietario;
			//procedure setDueno(undueno:Propietario);
			
			function getpatente:string;
			//procedure setSuperficie(unaSuperficie:integer);

			function getMarca:string;
			function getModelo:string;

			function toString:ansistring; override;// representacion del objeto
			procedure imprimir();
	end;
{---------------------------------Vehiculo---------------------------------}


implementation

{---------------------------------Propietario---------------------------------}
	constructor Propietario.create(
			unnombre:string;
			unapellido:string;
			undni:integer;
			unafechaAdquisicion:Date);
	begin
	nombre:= unnombre;
	apellido:= unapellido;
	dni:= undni;
	fechaAdquisicion:= unafechaAdquisicion;
	end;
	function Propietario.getNombre:string;
	begin
	result:= nombre;
	end;
	function Propietario.getApellido:string;
	begin
	result:= apellido;
	end;
	function Propietario.getDni:integer;		
	begin
	result:= dni;
	end;
	function Propietario.getFecha:Date;
	begin
	result:= fechaAdquisicion;
	end;
	function Propietario.toString:ansistring; // representacion del objeto
	begin
	result:=	//'('+suId.toString+')'
				' ['+(nombre)
				+' '+(apellido)
				+' dni('+intToStr(dni)
				+')('+fechaAdquisicion.toString+')'
				//+' $'+Format('%.2f', [valorFiscal])
				+']'+LineEnding;
	end;
	procedure Propietario.imprimir();
	begin
	writeln(self.toString);
	end;
{---------------------------------Propietario---------------------------------}



{---------------------------------Vehiculo---------------------------------}
	constructor Vehiculo.create(
			unaPatente:string;
			undueno:Propietario;
			unColor:string;
			unaMarca:string;
			unModelo:string
			);
	begin
	patente:=unaPatente;
	Dueno:=unDueno;
	Color:=unColor;
	marca:=unaMarca;
	Modelo:=unModelo;
	end;
	

	function Vehiculo.getColor: string;
	begin
	result:= Color;
	end;
	procedure Vehiculo.setColor(unColor:string);
	begin
	Color:= unColor;
	end;
	
	function Vehiculo.getDueno: Propietario;
	begin
	result:= Dueno;
	end;
{
	procedure Vehiculo.setDueno(undueno:Propietario);
	begin
	Dueno:= unDueno;
	end;
}

	function Vehiculo.getPatente:string;
	begin
	result:= Patente;
	end;

	function Vehiculo.getMarca:string;
	begin
	result:= marca;
	end;
	function Vehiculo.getModelo:string;
	begin
	result:= Modelo;
	end;
	
	
	function Vehiculo.toString:ansistring;
	begin
	result:=	'('+patente+')'
				+'('+Dueno.toString+')'
				//' Dueno('+intToStr()
				+') '+(Modelo)
				//+' superficie('+intToStr(superficie)
				+') Color('+Color
				+') '+(marca)
				//+' $'+Format('%.2f', [valorFiscal])
				+LineEnding;
	end;
	procedure Vehiculo.imprimir();
	begin
	writeln(self.toString);
	end;
{---------------------------------Vehiculo---------------------------------}


end.
