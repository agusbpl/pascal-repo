unit UTerreno;
{$mode objfpc}

interface
uses sysUtils;
type
//importante cambiar este objeto y cambiar el toString del objeto si es necesario
{---------------------------------Terreno---------------------------------}
	Terreno = class
		private
			manzana:integer;
			parcela:integer;
			superficie:integer;
			valorFiscal:real;
			propietario:string;
			tipoInmueble:string;

		public
			constructor create(
			unamanzana:integer;
			unaparcela:integer;
			unasuperficie:integer;
			unvalorFiscal:real;
			unpropietario:string;
			untipoInmueble:string);
			
			function getValorFiscal:real;
			procedure setValorFiscal(unValorFiscal:real);
			
			function getParcela:integer;
			procedure setParcela(unaParcela:integer);
			
			function getManzana:integer;
			procedure setManzana(unaManzana:integer);
			
			function getSuperficie:integer;
			procedure setSuperficie(unaSuperficie:integer);

			function getPropietario:string;
			function getTipoInmueble:string;

			function toString:ansistring; override;// representacion del objeto
			procedure imprimir();
	end;
{---------------------------------Terreno---------------------------------}


implementation


{---------------------------------Terreno---------------------------------}
	constructor Terreno.create(
			unamanzana:integer;
			unaparcela:integer;
			unasuperficie:integer;
			unvalorFiscal:real;
			unpropietario:string;
			untipoInmueble:string);
	begin
	manzana:=unamanzana;
	parcela:=unaparcela;
	superficie:=unasuperficie;
	valorFiscal:=unvalorFiscal;
	propietario:=unpropietario;
	tipoInmueble:=untipoInmueble;
	end;
	
	function Terreno.getValorFiscal: real;
	begin
	result:= valorFiscal;
	end;
	procedure Terreno.setValorFiscal(unValorFiscal:real);
	begin
	valorFiscal:= unValorFiscal;
	end;

	function Terreno.getParcela: integer;
	begin
	result:= parcela;
	end;
	procedure Terreno.setParcela(unaParcela:integer);
	begin
	parcela:= unaParcela;
	end;
	
	function Terreno.getManzana: integer;
	begin
	result:= Manzana;
	end;
	procedure Terreno.setManzana(unaManzana:integer);
	begin
	Manzana:= unaManzana;
	end;
	
	function Terreno.getSuperficie: integer;
	begin
	result:= Superficie;
	end;
	procedure Terreno.setSuperficie(unaSuperficie:integer);
	begin
	parcela:= unaSuperficie;
	end;
	
	function Terreno.getPropietario:string;
	begin
	result:= Propietario;
	end;
	function Terreno.getTipoInmueble:string;
	begin
	result:= tipoInmueble;
	end;
	
	
	function Terreno.toString:ansistring;
	begin
	result:=	//'('+suId.toString+')'
				' manzana('+intToStr(manzana)
				+') '+(tipoInmueble)
				+' superficie('+intToStr(superficie)
				+') parcela('+intToStr(parcela)
				+') '+(propietario)
				+' $'+Format('%.2f', [valorFiscal])
				+LineEnding;
	end;
	procedure Terreno.imprimir();
	begin
	writeln(self.toString);
	end;
{---------------------------------Terreno---------------------------------}


end.
