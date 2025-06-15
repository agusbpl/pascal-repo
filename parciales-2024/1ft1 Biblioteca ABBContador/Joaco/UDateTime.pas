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
			function equalss (d:Date): boolean;
			function greaterThan (d:Date): boolean;
			function lessThan (d:Date): boolean;
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
	
	function Date.equalss (d:Date): boolean;
	begin
		if (self.getYear() = d.getYear()) then
		begin
			if (self.getMonth() = d.getMonth()) then
				if(self.getDay() = d.getDay()) then
					equalss:= true
		end
		else
			equalss:= false;
	end;
	
	function Date.greaterThan (d:Date): boolean;
	begin
		if (self.getYear() = d.getYear()) then
		begin
			if (self.getMonth() = d.getMonth()) then
			begin
				if (self.getDay() > d.getDay()) then
					greaterThan:= true
				else
					greaterThan:= false;
			end
			else
			begin
				if (self.getMonth() > d.getMonth()) then
					greaterThan:= true
				else
					greaterThan:= false;
			end;
		end
		else
		begin
			if (self.getYear() > d.getYear()) then
				greaterThan:= true
			else
				greaterThan:= false;
		end;
	end;
	
	function Date.lessThan (d: Date): boolean;
	begin
		if (self.equalss(d) = false) and (self.greaterThan(d)) then
			lessThan:= true
		else
			lessThan:= false;
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