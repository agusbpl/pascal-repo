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
    function equalito(d: Date): boolean; // Cambié equals para evitar el conflicto
    function greaterThan(d: Date): boolean;
    function lessThan(d: Date): boolean;
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
  year := y;
  month := m;
  day := d;
end;

function Date.getDay(): integer;
begin
  getDay := day;
end;

function Date.getMonth(): integer;
begin
  getMonth := month;
end;

function Date.getYear(): integer;
begin
  getYear := year;
end;

function Date.toString(): ansistring;
begin
  toString := IntToStr(day) + '/' + IntToStr(month) + '/' + IntToStr(year);
end;

function Date.equalito(d: Date): boolean;
begin
  if (self.getYear() = d.getYear()) and
     (self.getMonth() = d.getMonth()) and
     (self.getDay() = d.getDay()) then
    equalito := true
  else
    equalito := false;
end;

function Date.greaterThan(d: Date): boolean;
begin
  greaterThan := (self.year > d.getYear()) or
                 ((self.year = d.getYear()) and (self.month > d.getMonth())) or
                 ((self.year = d.getYear()) and (self.month = d.getMonth()) and (self.day > d.getDay()));
end;

function Date.lessThan(d: Date): boolean;
begin
  lessThan := (self.year < d.getYear()) or
              ((self.year = d.getYear()) and (self.month < d.getMonth())) or
              ((self.year = d.getYear()) and (self.month = d.getMonth()) and (self.day < d.getDay()));
end;

constructor Time.create(h, m, s: integer);
begin
  hour := h;
  minutes := m;
  seconds := s;
end;

function Time.getHour(): integer;
begin
  getHour := hour;
end;

function Time.getMinutes(): integer;
begin
  getMinutes := minutes;
end;

function Time.getSeconds(): integer;
begin
  getSeconds := seconds;
end;

function Time.toString(): ansistring;
begin
  toString := IntToStr(hour) + ':' + IntToStr(minutes) + ':' + IntToStr(seconds);
end;

end.
