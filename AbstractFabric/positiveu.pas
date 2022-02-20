unit PositiveU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ArithOperations_Intf;

type

  TPositivePlus = class(TInterfacedObject, IPlus)
  public
    function GetResult(AParams: array of string): string;
  end;

  TPositiveMinus = class(TInterfacedObject, IMinus)
  public
    function GetResult(AParams: array of string): string;
  end;

  TPositiveName = class(TInterfacedObject, IName)
  public
    function GetName: string;
	end;

implementation

{TPositivePlus}
function TPositivePlus.GetResult(AParams: array of string): string;
var
  i: integer;
  Rez: integer;
begin
  Rez := 0;
  for i := Low(AParams) to High(AParams) do
  begin
    if StrToInt(AParams[i]) < 0 then
      continue;

    Rez := Rez + StrToInt(AParams[i]);
	end;
  Result := IntToStr(Rez);
end;

{TPositiveMinus}
function TPositiveMinus.GetResult(AParams: array of string): string;
var
  i: integer;
  Rez: integer;
begin
  Rez := 0;
  for i := Low(AParams) to High(AParams) do
  begin
    if StrToInt(AParams[i]) < 0 then
      continue;

		if i = 0 then
			Rez := StrToInt(AParams[i])
    else
      Rez := Rez - StrToInt(AParams[i]);
  end;
  Result := IntToStr(Rez);
end;

{TPositiveName}
function TPositiveName.GetName: string;
begin
  Result := 'Positive';
end;

end.

