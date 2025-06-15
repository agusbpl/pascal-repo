unit UMyTools;
{$mode objfpc}

interface
uses URandomGenerator, UDateTime;

type

	province = record
		name : string;
		towns : array[1..5] of string;
	end;

	Tool = class
		private
			
		public
			constructor create();

			function addNamesLabelsToRg() : RandomGenerator;
			function addProvincesLabelsToRg() : RandomGenerator;
			function addTownsLabelsToRg(aProvince : string = 'Buenos Aires') : RandomGenerator;
			function generateRandomTown(aProvince : string = 'Buenos Aires') : string;
			function generateRandomDate(minYear : integer = 2024; maxYear : integer = 2024) : Date;
			function inputInteger(textForUser : string = 'Ingrese un entero: ') : integer;
			function inputReal(textForUser : string = 'Ingrese un real: ') : real;
			function inputString(textForUser : string = 'Ingrese un string: ') : string;

			procedure printTitle(title : string);
			procedure printBetweenPipes(text : string = '-'; emptySpace : integer = 11);
			
	end;

implementation

	constructor Tool.create();
	begin
		// nothing jajs
	end;
	
	function Tool.addNamesLabelsToRg() : RandomGenerator;
	var
		vNombres : array of string = ('Ana', 'Juan', 'Pedro', 'Luis', 'Marta', 'Sofia', 'Carlos',
					 'Laura', 'Jose', 'Elena', 'Miguel', 'Lucia', 'Andres', 'Mariana', 'Raul', 'Ramiro',
					 'Aristipo', 'Crisanto', 'Lucio', 'Basilio', 'Tiberio', 'Hipolito', 'Leocadio', 'Amadeo',
					 'Belisario', 'Nicasio', 'Eutimio', 'Hermenegildo', 'Ludovico', 'Procopio', 'Gustavo', 
					 'Severino', 'Bruno', 'Isidoro', 'Fulgencio', 'Casimiro', 'Fausto', 'Gaspar', 'Honorio',
					 'Olegario', 'Romulo', 'Teofilo', 'Claudio', 'Octavio', 'Edgardo', 'Marcelo', 'Rigoberto',
					 'Arnaldo', 'Baldomero', 'Jacobo', 'Eligio', 'Prudencio', 'Ruperto', 'Toribio', 'Aureliano'
					); // 'ZZZ': treshold value
		i : integer;
		rg : RandomGenerator;
	begin
		rg:= RandomGenerator.create();
		for i:= 0 to length(vNombres) - 1 do begin
			rg.addLabel(vNombres[i]);
		end;
		addNamesLabelsToRg:= rg;
	end;

	function Tool.addProvincesLabelsToRg() : RandomGenerator;
	var
		vProvinces: array of string = (
						'Buenos Aires', 'Cordoba', 'Santa Fe', 'Mendoza', 'Tucuman',
						'Entre Rios', 'Salta', 'Misiones', 'Chaco', 'Corrientes',
						'Santiago del Estero', 'San Juan', 'Jujuy', 'Rio Negro', 'Neuquen',
						'Formosa', 'Chubut', 'San Luis', 'Catamarca', 'La Rioja'
						);
		rg : RandomGenerator;
		i : integer;
	begin
		rg:= RandomGenerator.create();
		for i:= 0 to length(vProvinces) - 1 do begin
			rg.addLabel(vProvinces[i]);
		end;
		addProvincesLabelsToRg:= rg;
	end;

	function Tool.addTownsLabelsToRg(aProvince : string) : RandomGenerator; // it works properly only with provinces in provinces array (previous method)
	var
		
		provinces: array[1..20] of province = (
			(name: 'Buenos Aires'; towns: ('La Plata', 'Mar del Plata', 'Bahia Blanca', 'Tandil', 'Quilmes')),
			(name: 'Cordoba'; towns: ('Cordoba', 'Villa Maria', 'Rio Cuarto', 'Carlos Paz', 'Alta Gracia')),
			(name: 'Santa Fe'; towns: ('Rosario', 'Santa Fe', 'Rafaela', 'Venado Tuerto', 'Reconquista')),
			(name: 'Mendoza'; towns: ('Mendoza', 'San Rafael', 'Godoy Cruz', 'Lujan de Cuyo', 'Maipu')),
			(name: 'Tucuman'; towns: ('San Miguel de Tucuman', 'Yerba Buena', 'Tafi Viejo', 'Concepcion', 'Monteros')),
			(name: 'Entre Rios'; towns: ('Parana', 'Concordia', 'Gualeguaychu', 'Victoria', 'Nogoya')),
			(name: 'Salta'; towns: ('Salta', 'Oran', 'Tartagal', 'Cafayate', 'Metan')),
			(name: 'Misiones'; towns: ('Posadas', 'Obera', 'Eldorado', 'Puerto Iguazu', 'Apostoles')),
			(name: 'Chaco'; towns: ('Resistencia', 'Saenz Pena', 'Villa Angela', 'Charata', 'Castelli')),
			(name: 'Corrientes'; towns: ('Corrientes', 'Goya', 'Mercedes', 'Paso de los Libres', 'Bella Vista')),
			(name: 'Santiago del Estero'; towns: ('Santiago del Estero', 'La Banda', 'Termas de Rio Hondo', 'Frias', 'Quimili')),
			(name: 'San Juan'; towns: ('San Juan', 'Rawson', 'Chimbas', 'Rivadavia', 'Pocito')),
			(name: 'Jujuy'; towns: ('San Salvador de Jujuy', 'Palpala', 'Libertador', 'Humahuaca', 'Tilcara')),
			(name: 'Rio Negro'; towns: ('Viedma', 'Bariloche', 'Cipolletti', 'General Roca', 'Villa Regina')),
			(name: 'Neuquen'; towns: ('Neuquen', 'Cutral Co', 'Plottier', 'Zapala', 'Centenario')),
			(name: 'Formosa'; towns: ('Formosa', 'Clorinda', 'Pirane', 'El Colorado', 'Laguna Blanca')),
			(name: 'Chubut'; towns: ('Rawson', 'Trelew', 'Comodoro Rivadavia', 'Esquel', 'Puerto Madryn')),
			(name: 'San Luis'; towns: ('San Luis', 'Villa Mercedes', 'Merlo', 'La Punta', 'Justo Daract')),
			(name: 'Catamarca'; towns: ('San Fernando del Valle', 'Andalgala', 'Belen', 'Tinogasta', 'Santa Maria')),
			(name: 'La Rioja'; towns: ('La Rioja', 'Chilecito', 'Aimogasta', 'Chamical', 'Villa Union'))
		);

		rg : RandomGenerator;
		i, j : integer;
	begin
		rg:= RandomGenerator.create();
		i:= 1;
		while (LowerCase(provinces[i].name) <> LowerCase(aProvince)) do
			i:= i + 1;
		if (LowerCase(provinces[i].name) = LowerCase(aProvince)) then
			for j:= 1 to 5 do
				rg.addLabel(provinces[i].towns[j])
		else
			rg.addLabel('unknown');
	
		addTownsLabelsToRg:= rg;
	end;

	function Tool.generateRandomTown(aProvince : string = 'Buenos Aires') : string;
	var
		rg : RandomGenerator;
	begin
		rg:= RandomGenerator.create();
		rg:= self.addTownsLabelsToRg(aProvince);
		generateRandomTown:= rg.getLabel();
	end;

	function Tool.generateRandomDate(minYear : integer; maxYear : integer) : Date;
	var
		minDate, maxDate : Date;
		rg : RandomGenerator;
	begin
		rg:= RandomGenerator.create();
		minDate:= Date.create(1, 1, minYear);
		maxDate:= Date.create(31, 12, maxYear);
		generateRandomDate:= rg.getDate(minDate, maxDate);
	end;

	procedure Tool.printTitle(title : string);
	var
		i : integer;
	begin
		write('+');
		for i:= 1 to length(title) do begin
			write('-');
		end;
		writeln('+');
		write('|'); write(title); writeln('|');
		write('+');
		for i:= 1 to length(title) do begin
			write('-');
		end;
		writeln('+');
	end;

	function Tool.inputInteger(textForUser : string) : integer;
	var
		value : integer;
	begin
		write(textForUser);
		readln(value);
		inputInteger:= value;	
	end;

	function Tool.inputReal(textForUser : string) : real;
	var
		value : real;
	begin
		write(textForUser);
		readln(value);
		inputReal:= value;	
	end;

	function Tool.inputString(textForUser : string) : string;
	var
		value : string;
	begin
		write(textForUser);
		readln(value);
		inputString:= value;	
	end;

	procedure Tool.printBetweenPipes(text : string; emptySpace : integer);
	var
		i : integer;
		filler, point : string;
	begin
		if (length(text) >= emptySpace) then 
			emptySpace:= 1;

		if (text = '-') then begin
			filler:= '-';
			point:= '+';
		end
		else begin
			filler:= ' ';
			point:= '|';
		end;

        write(point);
		write(text);

		for i:= 1 to emptySpace - length(text) do begin
			write(filler);
		end;

		writeln(point);
	end;


end.