unit Ufecha;
{$mode objfpc}

interface
uses UABBgenerico, UDateTime;
type
  fechas = class(comparable)
  private
    valor: Date; // Cambiado a Date
  public
    constructor create(unValor: Date); // Constructor
    function getValor(): Date; // Getter
    function toString(): ansistring; override; // Devuelve la fecha como string
    function equals(otroComparable: Comparable): boolean; override;
    function lessThan(otroComparable: Comparable): boolean; override;
    function greaterThan(otroComparable: Comparable): boolean; override;
    
    

		function lessThanOrEquals(otroComparable: Comparable): boolean;override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean;override;
  end;

implementation

constructor fechas.create(unValor: Date);
begin
  valor := unValor;
end;

function fechas.getValor(): Date;
begin
  getValor := valor;
end;

function fechas.toString(): ansistring;
begin
  toString := valor.toString(); // Convierte la fecha en string
end;

function fechas.equals(otroComparable: Comparable ): boolean;
begin
  equals := valor.equalito((otroComparable as fechas).getValor());
end;

function fechas.lessThan(otroComparable: Comparable ): boolean;
begin
  lessThan := valor.lessThan((otroComparable as fechas).getValor());
end;

function fechas.greaterThan(otroComparable: Comparable): boolean;
begin
  greaterThan := valor.greaterThan((otroComparable as fechas).getValor());
end;
function fechas.lessThanOrEquals(otroComparable: Comparable): boolean;
begin
  Result := valor.lessThan((otroComparable as fechas).getValor()) or valor.equalito((otroComparable as fechas).getValor());
end;

function fechas.greaterThanOrEquals(otroComparable: Comparable): boolean;
begin
  Result := valor.greaterThan((otroComparable as fechas).getValor()) or valor.equalito((otroComparable as fechas).getValor());
end;

end.

end.
