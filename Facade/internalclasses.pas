unit InternalClasses;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;

type

  TGenerateChars = class
  public
    function GetChars(ACount: Integer): string;
	end;

  TGenerateNums = class
  public
    function GetNums(ACount: Integer): string;
	end;

  TMixed = class
  public
    function Mix(AStr1, AStr2: string): string;
	end;

implementation

{ TGenerateChars }
function TGenerateChars.GetChars(ACount: Integer): string;
var
  i: Integer;
  Ch: Byte;
begin
  Result := '';

  Randomize;
  for i := 0 to ACount - 1 do
  begin
    //Randomize;
    //RandSeed := milliSecs;
    Ch := RandomRange($41, $5a);
    Result := Result + Chr(Ch);
	end;
end;


{ TGenerateNums }
function TGenerateNums.GetNums(ACount: Integer): string;
var
  i: Integer;
  Ch: Byte;
begin
  Result := '';

  Randomize;
  for i := 0 to ACount - 1 do
  begin
    //Randomize;
    //RandSeed := milliSecs;
    Ch := RandomRange(0, 9);
    Result := Result + IntToStr(Ch);
	end;
end;

{ TMixed }
function TMixed.Mix(AStr1, AStr2: string): string;
var
  i: Integer;
  Str: string;

  procedure Swap(n, m: integer);
	var
	  tmp: Char;
	begin
	  tmp := Str[n];
	  Str[n] := Str[m];
	  Str[m] := tmp;
	end;
begin
  Str := AStr1 + AStr2;
  for i := High(Str) downto 1 do
    Swap(i, RandomRange(1, i));

  Result := Str;
end;

end.

