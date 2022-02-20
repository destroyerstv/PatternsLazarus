unit NegativeU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ArithOperations_Intf;

type

  TNegativePlus = class(TInterfacedObject, IPlus)
  public
    function GetResult(AParams: array of string): string;
  end;

  TNegativeMinus = class(TInterfacedObject, IMinus)
  public
    function GetResult(AParams: array of string): string;
  end;

  TNegativeName = class(TInterfacedObject, IName)
  public
    function GetName: string;
	end;

implementation

{TNegativePlus}
function TNegativePlus.GetResult(AParams: array of string): string;
var
  i: integer;
  Rez: integer;
begin
  Rez := 0;
  for i := Low(AParams) to High(AParams) do
  begin
    if StrToInt(AParams[i]) > 0 then
      continue;

    Rez := Rez + StrToInt(AParams[i]);
	end;

  Result := IntToStr(Rez);
end;

{TNegativeMinus}
function TNegativeMinus.GetResult(AParams: array of string): string;
var
  i: integer;
  Rez: integer;
begin
  Rez := 0;
  for i := Low(AParams) to High(AParams) do
  begin
    if StrToInt(AParams[i]) > 0 then
      continue;

    if i = 0 then
			Rez := StrToInt(AParams[i])
    else
      Rez := Rez - StrToInt(AParams[i]);
  end;

  Result := IntToStr(Rez);
end;


{TNegativeName}
function TNegativeName.GetName: string;
begin
  Result := 'Negative';
end;

end.

