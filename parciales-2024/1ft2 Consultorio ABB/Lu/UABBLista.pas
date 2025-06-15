unit UABBLista;
{$mode objfpc}

interface

uses sysutils, UABBGenerico,Genericlinkedlist;
type
      
     ListaDeObjetos = specialize linkedlist <TObject>;
     NodoLista = class (Nodo)  //hereda.
          private
                elementos: ListaDeObjetos;
           public
                constructor create(unaClave:Comparable;unDato:TObject);
                procedure agregar (unNodo:Nodo) ; override;
                function toString (): ansistring; override;
                function devolverElemento():TObject; override;
          end;
          
     ABBLista = class (ABBGenerico)
         public
             procedure agregar (unaClave:Comparable;unDato:TObject); override;
         end;
          
implementation

              constructor NodoLista.create(unaClave:Comparable;unDato:TObject);
              begin
              inherited create (unaClave,unDato);
              elementos:=ListaDeObjetos.create();
              elementos.add(unDato);
              end;
              
              procedure NodoLista.agregar(unNodo:Nodo);
              begin
              if unNodo.getClave().equals(self.getClave()) then
                    elementos.add(unNodo.getDato())  // si la clave ya existe, se almacena el nuevo objeto asociado.
              else
                   inherited agregar(unNodo);
                end;
                
                function 	NodoLista.toString():ansistring;
              var
              s:ansistring;
              begin
              s:=self.getClave().toString() + ' ('; elementos.reset();
              while not elementos.eol() do
              begin
                   s:=s + elementos.current.toString() + ',';
                   elementos.next();
                end;
                toString:=s + ')';
                end;
              
               procedure ABBLista.agregar(unaClave:Comparable;unDato:TObject);
               var
               n:Nodo;
               begin
               n:=NodoLista.create(unaClave,unDato);
               self.agregarNodo(n);
               end;
               
               function NodoLista.devolverElemento(): TObject;
	begin
	result:= elementos;
	end;

               
               end.
                
