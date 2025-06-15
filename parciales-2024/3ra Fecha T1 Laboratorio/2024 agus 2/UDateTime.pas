unit UDateTime;
{$mode objfpc}

interface

type

	Date = class
		private
			year, month, day: integer;
			
		public
			constructor create(d, m, y: integer);
			
			function getDay(): integer;
			function getMonth(): integer;
			function getYear(): integer;			
			function toString(): ansistring; override;
			function equalsto(d : Date): boolean;
			function greaterThan(d : Date): boolean;
			function lessThan(d : Date): boolean;
	end;
	
	Time = class
		private
			hour, minutes, seconds: integer;
			
		public
			constructor create(h, m, s: integer);
			
			function getHour(): integer;
			function getMinutes(): integer;
			function getSeconds(): integer;
			function toString(): ansistring; override;
	end;	
	
implementation
uses SysUtils;

    constructor Date.create(d, m, y: integer);
    begin
    year:= y; month:= m; day:= d;
    end;
    
	function Date.getDay(): integer;
	begin
	getDay:= day;
	end;
	
	function Date.getMonth(): integer;
	begin
	getMonth:= month;
	end;
	
	function Date.getYear(): integer;
	begin
	getYear:= year;
	end;
	
	function Date.toString(): ansistring;	
	begin
	toString:= IntToStr(day) + '/' + IntToStr(month) + '/' + IntToStr(year);
	end;
	
	function Date.equalsto(d : Date) : boolean;
	begin
		if (self.toString() = d.toString()) then
			equalsto:= true
		else
			equalsto:= false;
	end;

	function Date.greaterThan(d : Date) : boolean;
	var
		x : boolean;
	begin
		x:= false;
		if (self.getYear() > d.getYear()) then
			x:= true
		else if (self.getYear() = d.getYear()) 
		    then if (self.getMonth() > d.getMonth())
			    then x:= true
			    else if (self.getMonth() = d.getMonth())
			        then if (self.getDay() > d.getDay()) 
			            then x:= true;
		greaterThan:= x;
	end;

	function Date.lessThan(d : Date) : boolean;
	var
		x : boolean;
	begin
		x:= false;
		if (self.getYear() < d.getYear()) then
			x:= true
		else if (self.getYear() = d.getYear()) 
			then if (self.getMonth() < d.getMonth())
				then x:= true
				else if (self.getMonth() = d.getMonth())
					then if (self.getDay() < d.getDay()) 
						then x:= true;
		lessThan:= x;
	end;
	
	constructor Time.create(h, m, s: integer);
    begin
    hour:= h; minutes:= m; seconds:= s;
    end;
    
	function Time.getHour(): integer;
	begin
	getHour:= hour;
	end;
	
	function Time.getMinutes(): integer;
	begin
	getMinutes:= minutes;
	end;
	
	function Time.getSeconds(): integer;
	begin
	getSeconds:= seconds;
	end;	
	
	function Time.toString(): ansistring;	
	begin
	toString:= IntToStr(hour) + ':' + IntToStr(minutes) + ':' + IntToStr(seconds);
	end;
end.
