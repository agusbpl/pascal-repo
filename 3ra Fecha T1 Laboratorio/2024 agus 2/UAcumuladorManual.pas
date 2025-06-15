unit UacumuladorManual;
{$mode objfpc}
interface
type

	acumuladorManual = class
		private
			cantidad: real;
		public
			constructor create();
			procedure incrementar();
			procedure resetear();
			function getCantidad(): real;
			procedure acumular(cantAumentar: real);
			function sosIgual(c: acumuladorManual): boolean;
	end;

implementation

	constructor acumuladorManual.create();
	begin
		cantidad:= 0.0;
	end;

	procedure acumuladorManual.acumular(cantAumentar: real);
	begin
		cantidad:= cantidad + cantAumentar;
	end;

	procedure acumuladorManual.incrementar();
	begin
		cantidad:= cantidad + 1.0;
	end;

	procedure acumuladorManual.resetear();
	begin
		cantidad:= 0.0;
	end;

	function acumuladorManual.getCantidad(): real;
	begin
		getCantidad:= cantidad;
	end;

	function acumuladorManual.sosIgual(c: acumuladorManual): boolean;
	begin
		if (self.getCantidad() = c.getCantidad()) 
		then sosIgual:= true
		else sosIgual:= false;
	end;
end.
