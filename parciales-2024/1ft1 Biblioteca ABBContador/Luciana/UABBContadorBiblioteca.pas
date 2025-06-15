unit UABBContadorBiblioteca;
{$mode objfpc}

interface

uses sysutils, UABBGenerico;
type

     Libro = class
         private
             ISBN:string;
             titulo:string;
             autor:string;
             anio:integer;
             cantidadCopias:integer;
         public
             constructor create(unISBN:string;unTitulo:string;unAutor:string;unAnio:integer);
             function getISBN():string;
             function getTitulo ():string;
             function getAutor():string;
             function getAnio():integer;
             function toString():ansistring;override;
             function getCantidad():integer;
             procedure aumentarCantidad(cantidad:integer);
         end;

     NodoContador = class (Nodo)  //hereda.
          private
                copiasDisponibles:integer;
           public
                constructor create(unaClave:Comparable;unDato:TObject);
                procedure agregar (unNodo:Nodo) ; override;
                function toString (): ansistring; override;
                function getCantidad():integer;
                procedure procesar (quehacer:procedimiento);override;
          end;
          
     ABBContador = class (ABBGenerico)
         public
             procedure agregar (unaClave:Comparable;unDato:TObject); override;
         end;
          
implementation
//------------------------------LIBRO----------------------------------------
             constructor Libro.create(unISBN:string;unTitulo:string;unAutor:string;unAnio:integer);
             begin 
             ISBN:=unISBN;
             titulo:=unTitulo;
             autor:=unAutor;
             anio:=unAnio;
             cantidadCopias:=1;
             end;
             
             function Libro.getISBN():string;
             begin
             getISBN:=ISBN;
             end;
             
             function Libro.getTitulo ():string;
             begin
             getTitulo:=titulo;
             end;
             
             function Libro.getAutor():string;
             begin
             getAutor:=autor;
             end;
             
             function Libro.getAnio():integer;
             begin
             getAnio:=anio;
             end;
             
             function Libro.toString():ansistring;
             begin
             toString:= 'ISBN: ' + ISBN + '|' + 'Titulo: ' + titulo + '|' + 'Autor: ' + autor + '|' + 'Anio publicacion: ' + intToStr (anio) + LineEnding + LineEnding;
             end;
            
            function Libro.getCantidad():integer;
            begin
            getCantidad:=cantidadCopias;
            end;
            
            procedure Libro.aumentarCantidad(cantidad:integer);
            begin
            cantidadCopias:=cantidadCopias + cantidad;
            end;
   //----------------------------------------NODO---------------------------------------------------         
           constructor NodoContador.create(unaClave:Comparable;unDato:TObject);
           begin
           inherited create(unaClave,unDato); //invoco al constructor de la superclase.
           copiasDisponibles:= 1;  //inicializo el constructo en 1 porque el propio nodo ya es la primer ocurrencia.
           end;
           
           procedure 	NodoContador.agregar(unNodo:Nodo);
           begin
           if unNodo.getClave().equals(self.getClave()) then
           begin
                   copiasDisponibles:=copiasDisponibles+1 ;//si la clave ya existe, incremento el contador de ocurrencias.
                   ((self.getDato) as Libro).aumentarCantidad (1);
             end
             else
                     inherited agregar(unNodo);
              end;
              
              function 	NodoContador.toString():ansistring;
              begin
              toString:= inherited toString()+ 'Unidades Disponibles: '+ IntToStr(copiasDisponibles) +LineEnding;
              end;
              
              procedure NodoContador.procesar(quehacer:Procedimiento);
              begin
              if  (copiasDisponibles < 5 ) and (inherited getDato() <> nil) then
                                  quehacer(inherited getClave());

                end;
     
              function NodoContador.getCantidad():integer;
              begin
              getCantidad:=copiasDisponibles;
              end;
  //----------------------------------------------------------------ABB--------------------------------------------------------------------------
              procedure ABBContador.agregar (unaClave:Comparable;unDato:TObject);
              var
              n:Nodo;
              begin
              n:=NodoContador.create(unaClave,unDato);
              self.agregarNodo(n);  //no se usa inherit porque quiro que me quede un nodo contador.
              end;
     
              end.
              
              
              
