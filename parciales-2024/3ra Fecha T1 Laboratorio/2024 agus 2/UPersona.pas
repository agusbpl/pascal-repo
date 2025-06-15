unit Upersona;
{$mode objfpc}

interface
uses sysutils;
type
    persona = class
    private
        nombre,apellido:string;
        dni:integer;
    public        
        constructor create(unNombre, unApellido: string ; unDni:integer);
        function getNombre:string;
        function getApellido:string;
        function getDni:integer;
        function toString():ansistring; override;       
	end;

implementation
constructor persona.create(unNombre, unApellido: string ; unDni:integer);
begin
    nombre:=unNombre;
    apellido:=unApellido;
    dni:=unDni;
end;
function persona.getNombre:string;
begin 
    result:= nombre;
end;
function persona.getApellido:string;
begin 
    result:= apellido;
end;
function persona.getDni:integer;
begin 
    result:= dni;
end;
function persona.toString():ansistring; 
begin 
    result:= nombre+' '+apellido+' '+ intToStr(dni);
end;

end.
