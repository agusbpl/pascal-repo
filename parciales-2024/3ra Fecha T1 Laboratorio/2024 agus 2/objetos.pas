//ventas ejercicio 1
venta = class
   private
        IDVendedora:integer;
        codigoProducto:string;
        precioUnitario:real;
        cantidadUnidadesVendidas:integer; 
        fechaVenta:date;
   public
       constructor create(
        unIDVendedora:integer;
        uncodigoProducto:string;
        unprecioUnitario:real;
        unacantidadUnidadesVendidas:integer; 
        unafechaVenta:date);

       function getIDVendedora():integer;
       function getcodigoProducto():string;
       function getprecioUnitario():real;
       function getcantidadUnidadesVendidas():integer;
       function getfechaVenta():date;

       function toString():ansistring; override;       
end;

//alquileres de autos ejercicio 2
alquiler = class
    private
        fecha:date;
        patente, marca, modelo :string;
        cantidadDias:integer;
        precioDia:real;

    public        
        constructor create(unaFecha:date; unaPatente, unaMarca, unModelo :string;unaCantidadDias:integer;unPrecioDia:real);
        
        function getfecha:date;
        function getpatente:string;
        function getmarca:string;
        function getmodelo:string;
        function getPrecio():real;
        function getCantidad():integer;
        
        // procedure setPrecio(unPrecioNuevo:real);
        // procedure setCantidad(unaCantidadNueva:integer);

        function toString():ansistring; override;       
	end;


//encomiendas ejercicio 3
    encomienda = class
   private
       tipo:integer;//1:“despachadas” y 2:“recepcionadas”
       Provincia,Localidad: string;//punto de retiro
       remitente: string;
       peso: real;
       destino :string;
       fecha:date;       
   public
       constructor create(unTipo:integer; unaProvincia,unaLocalidad: string;
       unRemitente: string;unPeso: real;unDestino :string;unaFecha:date);
       function getProvincia():string;
       function getLocalidad():string;
       function getRemitente():string;
       function getPeso():real;
       function getDestino():string;
       function getFecha():date;
       function getTipo():integer;
       
       function toString():ansistring; override;       
end;


//producto ejercicio 4
    producto = class
    private
        codigoRubro, codigoUnidad: integer;
        precio:real;
        stock:integer;
    public        
        constructor create(unCodigoRubro, unCodigoUnidad: integer;unPrecio:real;unStock:integer);

        function getCodigoRubro():integer;
        function getCodigoUnidad():integer;
        function getPrecio():real;
        function getCantidad():integer;
        
        procedure setPrecio(unPrecioNuevo:real);
        procedure setCantidad(unaCantidadNueva:integer);


        function toString():ansistring; override;       
	end;

//numeroDeTelefonoYLlamada ejercicio 5
numeroTelefono = class(comparable)
    private
        codigoPais,codigoArea,numeroUsuario: entero; //+54 221 182970 for example  
       
    public
        constructor create(unCodigoPais,unCodigoArea,unNumeroUsuario: integer);

        function getCodigoPais():entero;
        function getCodigoArea():entero;
        function getNumeroUsuario():entero;

        function toString():ansistring;override;
    	
        function equals(otroComparable: Comparable): boolean;override;
		function lessThan(otroComparable: Comparable): boolean;override;
		function greaterThan(otroComparable: Comparable): boolean;override;
		function lessThanOrEquals(otroComparable: Comparable): boolean;override;
		function greaterThanOrEquals(otroComparable: Comparable): boolean;override;
	end;

    llamada = class
    private
        elUsuario:numeroTelefono;
        aQuien:numeroTelefono;
        duracion:integer;//en minutos
        fecha:date;       
    public
        
        constructor create(unUsuario:numeroTelefono;unAQuien:numeroTelefono;unaDuracion:integer;unaFecha:date);

        function getUsuario():numeroTelefono;
        function getAQuien():numeroTelefono;
        function getDuracion():integer;
        function getFecha():date;
        function getMesDeLaLlamada():integer;
        function getDiaDeLaLlamada():integer;

        function toString():ansistring; override;       
	end;