unit UABBContador;
{$mode objfpc}

interface

uses sysutils, UABBGenerico;
type

     NodoContador = class (Nodo)  //hereda.
          private
                contador:integer;
           public
                constructor create(unaClave:Comparable;unDato:TObject);
                procedure agregar (unNodo:Nodo) ; override;
                function toString (): ansistring; override;
          end;
          
     ABBContador = class (ABBGenerico)
         public
             procedure agregar (unaClave:Comparable;unDato:TObject); override;
         end;
          
implementation

           constructor NodoContador.create(unaClave:Comparable;unDato:TObject);
           begin
           inherited create(unaClave,unDato); //invoco al constructor de la superclase.
           contador:= 1;  //inicializo el constructo en 1 porque el propio nodo ya es la primer ocurrencia.
           end;
           
           procedure 	NodoContador.agregar(unNodo:Nodo);
           begin
           if unNodo.getClave().equals(self.getClave()) then
                   contador:=contador+1 //si la clave ya existe, incremento el contador de ocurrencias.
             else
                     inherited agregar(unNodo);
              end;
              
              function 	NodoContador.toString():ansistring;
              begin
              toString:= inherited toString()+ ' (' + IntToStr(contador) + ')';
              end;
              
              procedure ABBContador.agregar (unaClave:Comparable;unDato:TObject);
              var
              n:Nodo;
              begin
              n:=NodoContador.create(unaClave,unDato);
              self.agregarNodo(n);  //no se usa inherit porque quiro que me quede un nodo contador.
              end;
              
              end.
              
              
              
           
