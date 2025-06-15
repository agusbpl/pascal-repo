unit UABBConsulta;
{$mode objfpc}

interface

uses sysutils, UABBGenerico,Genericlinkedlist,UDateTime;
type
      
     ListaDeObjetos = specialize linkedlist <TObject>;
     
     Consulta = class
         private
             valorConsulta:real;
             fechaConsulta:Date;
          public
              constructor create(unValordeConsulta:real;unaFechaConsulta:Date);
              function getvalorConsulta():real;
              function getFecha():Date;
              function ToString():ansistring; override;
          end;
     
     NodoConsulta = class (Nodo)  //hereda.
          private
                elementos: ListaDeObjetos;
           public
                constructor create(unaClave:Comparable;unDato:TObject);
                procedure agregar (unNodo:Nodo) ; override;
                function toString (): ansistring; override;
                function devolverElemento():TObject; override;
                
          end;
          
     ABBConsulta = class (ABBGenerico)
         public
             procedure agregar (unaClave:Comparable;unDato:TObject); override;
         end;
          
implementation

             constructor Consulta.create(unValordeConsulta:real;unaFechaConsulta:Date);
             begin
             valorConsulta:=unValordeConsulta;
             fechaConsulta:=unaFechaConsulta;
             end;
             
             function Consulta.getvalorConsulta():real;
             begin
             getvalorConsulta:=valorConsulta;
             end;
             
             function Consulta.getFecha():Date;
             begin
             getFecha:=fechaConsulta;
             end;
             
             function Consulta.ToString():ansistring;
             begin
             ToString:= 'Fecha de la Consulta: ' + fechaConsulta.tostring + '|' + 'Valor Abonado: ' + '$' + Format('%.2f' , [valorConsulta])+ LineEnding + LineEnding;
             end;
             
              constructor NodoConsulta.create(unaClave:Comparable;unDato:TObject);
              begin
              inherited create (unaClave,unDato);
              elementos:=ListaDeObjetos.create();
              elementos.add(unDato);
              end;
              
              procedure NodoConsulta.agregar(unNodo:Nodo);
              begin
              if unNodo.getClave().equals(self.getClave()) then
                    elementos.add(unNodo.getDato())  // si la clave ya existe, se almacena el nuevo objeto asociado.
              else
                   inherited agregar(unNodo);
                end;
                
              function 	NodoConsulta.toString():ansistring;
              var
              s:ansistring;
              montoTotal:real;
              begin
              montoTotal:=0;
              s:= 'DNI  ' +  self.getClave().toString() + ' : ' + LineEnding;
              elementos.reset();
              while not elementos.eol() do
              begin
                   s:=s + (elementos.current as Consulta).toString() ;
                   montoTotal:=montoTotal + consulta(elementos.current).getvalorConsulta();
                   elementos.next();
                end;
                toString:=s + 'Monto Total Acumulado: ' + '$' +  Format ('%.2f' , [montoTotal])+ LineEnding + LineEnding;
                end;
              
               procedure ABBConsulta.agregar(unaClave:Comparable;unDato:TObject);
               var
               n:Nodo;
               begin
               n:=NodoConsulta.create(unaClave,unDato);
               self.agregarNodo(n);
               end;
               
               function NodoConsulta.devolverElemento(): TObject;
	           begin
	            result:= elementos;
	           end;

               
               end.
                

