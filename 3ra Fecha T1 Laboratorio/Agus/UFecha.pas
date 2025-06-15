unit UFecha;

{$mode objfpc}
interface
uses UABBGenerico,sysUtils,UDateTime;
type
Fecha = class(Comparable)
	private
		valor:Date;
	public
		constructor create(unValor:Date);
		function getValor(): Date; // getter
		function toString(): ansistring; override; // devuelve el valor como Date
		function equals(otroComparable: Comparable): boolean; override;
		function lessThan(otroComparable: Comparable): boolean; override;
		function greaterThan(otroComparable: Comparable): boolean; override;
		function lessThanOrEquals(otroComparable: Comparable): boolean; override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean; override;
	// Los cinco métodos de Comparable que Fecha está obligado
	// a implementar.
end;

Hora = class(Comparable)
	private
		valor:Time;
	public
		constructor create(unValor:Time);
		function getValor(): Time; // getter
		function toString(): ansistring; override; // devuelve el valor como Date
		function equals(otroComparable: Comparable): boolean; override;
		function lessThan(otroComparable: Comparable): boolean; override;
		function greaterThan(otroComparable: Comparable): boolean; override;
		function lessThanOrEquals(otroComparable: Comparable): boolean; override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean; override;
	// Los cinco métodos de Comparable que Fecha está obligado
	// a implementar.
end;


implementation

//-----------------------FECHA-----------------------
	constructor Fecha.create(unValor:Date);
	begin
	valor:= unValor;
	end;
	function Fecha.getValor(): Date; // getter
	begin
	result:= valor;
	end;
	function Fecha.toString(): ansistring; // devuelve el valor como ansistring
	begin
	result:= (valor).toString;
	end;
	function Fecha.equals(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ).getYear = (otroComparable as Fecha).getValor.getYear ) and
		   ( ( valor ).getMonth = (otroComparable as Fecha).getValor.getMonth ) and
		   ( ( valor ).getDay = (otroComparable as Fecha).getValor.getDay );
	end;
	function Fecha.lessThan(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ).getYear < (otroComparable as Fecha).getValor.getYear ) or
			
			 ( ( valor ).getYear = (otroComparable as Fecha).getValor.getYear ) and
			 ( ( valor ).getMonth < (otroComparable as Fecha).getValor.getMonth ) or

			 ( ( valor ).getYear = (otroComparable as Fecha).getValor.getYear ) and
			 ( ( valor ).getMonth = (otroComparable as Fecha).getValor.getMonth ) and
			 ( ( valor ).getDay < (otroComparable as Fecha).getValor.getDay );
	end;
	function Fecha.greaterThan(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ).getYear > (otroComparable as Fecha).getValor.getYear ) or
			
			 ( ( valor ).getYear = (otroComparable as Fecha).getValor.getYear ) and
			 ( ( valor ).getMonth > (otroComparable as Fecha).getValor.getMonth ) or

			 ( ( valor ).getYear = (otroComparable as Fecha).getValor.getYear ) and
			 ( ( valor ).getMonth = (otroComparable as Fecha).getValor.getMonth ) and
			 ( ( valor ).getDay > (otroComparable as Fecha).getValor.getDay );
	end;	
	function Fecha.lessThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.lessThan(otroComparable)) or (self.equals(otroComparable)) );
	end;	
	function Fecha.greaterThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.greaterThan(otroComparable)) or (self.equals(otroComparable)) );
	end;
	
	
//-----------------------HORA-----------------------	
	constructor Hora.create(unValor:Time);
	begin
	valor:= unValor;
	end;
	function Hora.getValor(): Time; // getter
	begin
	result:= valor;
	end;
	function Hora.toString(): ansistring; // devuelve el valor como ansistring
	begin
	result:= (valor).toString;
	end;
	function Hora.equals(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ).getHour = (otroComparable as Hora).getValor.getHour ) and
		   ( ( valor ).getMinutes = (otroComparable as Hora).getValor.getMinutes ) and
		   ( ( valor ).getSeconds = (otroComparable as Hora).getValor.getSeconds );
	end;
	function Hora.lessThan(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ).getHour < (otroComparable as Hora).getValor.getHour ) or
			
			 ( ( valor ).getHour = (otroComparable as Hora).getValor.getHour ) and
			 ( ( valor ).getMinutes < (otroComparable as Hora).getValor.getMinutes ) or

			 ( ( valor ).getHour = (otroComparable as Hora).getValor.getHour ) and
			 ( ( valor ).getMinutes = (otroComparable as Hora).getValor.getMinutes ) and
			 ( ( valor ).getSeconds < (otroComparable as Hora).getValor.getSeconds );
	end;
	function Hora.greaterThan(otroComparable: Comparable): boolean;
	begin
	result:= ( ( valor ).getHour > (otroComparable as Hora).getValor.getHour ) or
			
			 ( ( valor ).getHour = (otroComparable as Hora).getValor.getHour ) and
			 ( ( valor ).getMinutes > (otroComparable as Hora).getValor.getMinutes ) or

			 ( ( valor ).getHour = (otroComparable as Hora).getValor.getHour ) and
			 ( ( valor ).getMinutes = (otroComparable as Hora).getValor.getMinutes ) and
			 ( ( valor ).getSeconds > (otroComparable as Hora).getValor.getSeconds );
	end;	
	function Hora.lessThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.lessThan(otroComparable)) or (self.equals(otroComparable)) );
	end;	
	function Hora.greaterThanOrEquals(otroComparable: Comparable): boolean;
	begin
	result:= ( (self.greaterThan(otroComparable)) or (self.equals(otroComparable)) );
	end;
end.
