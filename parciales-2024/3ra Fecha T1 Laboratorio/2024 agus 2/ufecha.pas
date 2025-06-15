unit Ufecha;
{$mode objfpc}

interface
uses UABBgenerico, UDateTime;
type
  fecha = class(comparable)
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

constructor fecha.create(unValor: Date);
begin
  valor := unValor;
end;

function fecha.getValor(): Date;
begin
  getValor := valor;
end;

function fecha.toString(): ansistring;
begin
  toString := valor.toString(); // Convierte la fecha en string
end;

function fecha.equals(otroComparable: Comparable ): boolean;
begin
  equals := valor.equals((otroComparable as fecha).getValor());
end;

function fecha.lessThan(otroComparable: Comparable ): boolean;
begin
  lessThan := valor.lessThan((otroComparable as fecha).getValor());
end;

function fecha.greaterThan(otroComparable: Comparable): boolean;
begin
  greaterThan := valor.greaterThan((otroComparable as fecha).getValor());
end;
function fecha.lessThanOrEquals(otroComparable: Comparable): boolean;
begin
  Result := valor.lessThan((otroComparable as fecha).getValor()) or valor.equals((otroComparable as fecha).getValor());
end;

function fecha.greaterThanOrEquals(otroComparable: Comparable): boolean;
begin
  Result := valor.greaterThan((otroComparable as fecha).getValor()) or valor.equals((otroComparable as fecha).getValor());
end;

end.

