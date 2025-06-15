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
			function equalss(d:Date):boolean; //devuelve true si son iguales.
			function greaterThan(d:Date):boolean;//devuelve true si la fecha self es posterior a la d.
			function lessThan(d:Date):boolean;  //devuelve true si la fecha 'self'es anterior a la fecha d
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
	
	//devuelve true sib ambas fechas son iguales.
	function Date.equalss(d:Date):boolean;
	begin
	if ( self.getday() = d.getday() )and 
	    ( self.getmonth() = d.getmonth()) and
	     (self.getyear() =d.getyear())
	     then
	             equalss:= true
     else
              equalss:= false;
      end;
	
	//devuelve true si la fecha 'self' es posterior a la fecha 'd'.
	// 05.01.2002 es posterior (mayor) a 05.01.2001.
	function Date.greaterThan (d:Date):boolean;
	begin
	if (self.getYear() > d.getYear() ) and (self.getmonth() > d.getmonth()) and (self.getDay() > d.getDay()) then 
	              greaterThan:= true
	  else
	               greaterThan:= false;
	end;
	
	//devuelve true  si la fecha 'self' es anterior a la fecha 'd'.
	function Date.lessThan (d:Date):boolean;
	begin
	if (self.getYear() < d.getYear() ) and (self.getmonth() < d.getmonth()) and (self.getDay() < d.getDay()) then 
	              lessThan:= true
	  else
	               lessThan:= false;
	end;
end.
