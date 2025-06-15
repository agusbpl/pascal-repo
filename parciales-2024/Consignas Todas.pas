program ConsignasTodas;

{Fecha 1 Tema 1: Una biblioteca desea mantener actualizada la cantidad de copias de su catálogo de libros.
De cada libro se conoce ISBN (código de identificación único del libro), título, autor y año de publicación.
1) Haga un módulo que simule 30 ingresos de libros (de los 10 pasados por código). Los libros (generados al azar) no tiene orden alguno.
Almacene los libros en un ABB ordenado por ISBN. Además, para un mismo ISBN se debe almacenar la cantidad de copias disponibles.
2) Haga un módulo que reciba el ABB e imprima la información de todos los libros entre dos ISBN recibidos como parámetro,
incluyendo la cantidad de copias disponibles.
3) Haga un módulo que reciba el ABB y un ISBN e informe si existe o no el libro con tal ISBN.
4) Haga un módulo que reciba el ABB y aumente en 10 unidades las copias disponibles de todos los libros que tienen menos de 5 copias.
5) Escriba un programa que invoque a los cuatro módulos implementados y compruebe el correcto funcionamiento del mismo.

Fecha 1 Tema 2: Un consultorio odontológico desea mantener el historial de consultas de sus pacientes. Del paciente solo se conoce su DNI.
De cada consulta se almacena la fecha y el valor abonado.
1)Haga un modulo que simule 40 atenciones. Los pacientes y sus consultas (generados al azar) no tiene orden alguno.
Almacene los pacientes en un ABB ordenado por DNI. Además, para un mismo paciente se deben almacenar todas sus consultas.
2)Haga un módulo que reciba el ABB e imprima para cada paciente su DNI y el monto total abonado entre todas sus consultas, ordenados por DNI.
3)Haga un módulo que reciba el ABB y un DNI e informe si existe o no el paciente con tal DNI.
4)Haga un módulo que reciba el ABB e imprima los montos abonados de todas las consultas realizadas en verano (del 21/12 al 21/03).
Además, solo se deben imprimir las consultas de los pacientes cuyos DNI sean mayores a un DNI pasado por parámetro.
5)Escriba el programa e invoque a los cuatro módulos implementados y compruebe el correcto funcionamiento del mismo.

Fecha 2 Tema 1: La municipalidad de la ciudad de Ensenada desea mantener información actualizada de todos los terrenos de un barrio.
Los terrenos se identifican por un número de manzana y dentro de cada manzana por el número de parcela.
De cada terreno, además, se desea conocer el nombre del propietario actual, el valor fiscal del terreno,
su superficie en metros cuadrados y el tipo de inmueble (privado, negocio, club o baldío).
1) Haga un módulo que simule 40 ingresos de terrenos. Los terrenos (generados al azar) no tienen orden alguno.
Almacene los terrenos en dos ABB distintos. En el primero (ABB1) los terrenos deben quedar ordenados por manzana-inmueble.
En el segundo (ABB2) los mismos terrenos deben quedar ordenados por superficie.
2) Haga un módulo que reciba el ABB1 e imprima la información de todos los terrenosentre dos superficies determinadas.
3) Haga un módulo que reciba el ABB2 e imprima la información de todos los terrenos cuya identificación esté entre
dos números de parcela (sin importar el número de manzana) determinados.
4) Haga un módulo que reciba el ABB2 y aumente en un 10% la valuación fiscal de los terrenos cuya superficie es menor a 150.
5) Escriba un programa que invoque a los cuatro módulos implementados y compruebe el correcto funcionamiento del mismo.

Fecha 2 Tema 2: La municipalidad de la ciudad de Ensenada desea mantener información actualizada de todos los vehículos municipalizados.
Los vehículos se identifican por su patente. De cada vehículo se desea conocer la marca, modelo, color de pintura y su propietario.
Del propietario se desea conocer nombre, apellido, dni y fecha de adquisición del vehículo.
1) Haga un módulo que simule 50 ingresos de vehículos con sus dueños. Los vehículos y sus dueños (generados al azar) no tienen orden alguno.
Almacene los vehículos en dos ABB distintos. En el primero (ABB1) los vehículos deben quedar ordenados por marca.
En el segundo (ABB2) los mismos vehículos deben quedar ordenados por fecha de adquisición.
2) Haga un módulo que reciba el ABB1 e imprima la información de todos los vehículos y sus propietarios para una marca en particular recibida como parámetro.
3) Haga un módulo que reciba el ABB2 e imprima la información de todos los vehículos y sus propietarios cuya
fecha de adquisición sea mayor a una recibida por parámetro. 
4) Haga un módulo que reciba el ABB1 y cambie a color verde los vehículos cuyo propietario se llame Marcos.
5) Escriba un programa que invoque a los cuatro módulos implementados y compruebe el correcto funcionamiento del mismo.

Fecha 3 Tema 1: El laboratorio de análisis climático desea mantener actualizados los registros de precipitación de sus estaciones de monitoreo.
De cada estación de monitoreo (identificadas por un código único) se desea almacenar:
total acumulado de milímetros de precipitación y la fecha del último registro.
1) Haga un módulo que simule 45 ingresos de datos de precipitaciones (código único de estación, fecha y milímetros de precipitación en esa fecha).
Los datos de las precipitaciones (generadas al azar) no tienen orden alguno.
Almacene el acumulado de las precipitaciones y la fecha del último dato registrado en un ABB ordenado por código único de estación.
2) Haga un módulo que reciba el ABB e imprima la información (código único, total acum de precipitación y última fecha del registro)
de todas las estaciones entre dos códigos únicos recibidos como parámetro.
3) Haga un módulo que reciba el ABB e imprima la información (código único, total acumulado de precipitación y última fecha del registro)
de todas las estaciones cuya fecha de último registro se dio en mayo.
4) Haga un módulo que reciba el ABB y resetee en cero el acumulado de precipitación y fecha del último registro 1-ene-1900 a una
determinada estación (el código único se recibe por parámetro el cual podría no existir dentro del ABB).
5) Escriba un programa que invoque a los cuatro módulos implementados y compruebe el correcto funcionamiento del mismo.

Fecha 3 Tema 2: Una empresa de remises desea mantener actualizados los kilómetros realizados por todos los viajes de sus vehículos.
De cada viaje se conoce los kilómetros realizados, el monto del viaje y la fecha en la cual se realizó.
1) Haga un módulo que simule 38 ingresos de viajes. Los viajes (generados al azar) no tienen orden alguno.
Almacene el acumulado de los kilómetros realizados por todos los viajes y el monto total acumulado entre todos los viajes y
la cantidad de viajes en un ABB ordenado por fecha de viaje.
2) Haga un módulo que reciba el ABB e imprima la información (fecha, total acumulado de kilómetros, monto total acumulado y cantidad de viajes)
para las fechas superior a una recibida por parámetro.
3) Haga un módulo que reciba el ABB e imprima el promedio de kilómetros por viaje para una fecha recibida por parámetro (que podría no existir dentro del ABB).
4) Haga un módulo que reciba el ABB e imprima las fechas cuyo monto promedio es mayor a 15000.
5) Escriba un programa que invoque a los cuatro módulos implementados y compruebe el correcto funcionamiento del mismo.
}

begin
end.
