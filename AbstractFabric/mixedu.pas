unit MixedU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ArithOperations_Intf;

type

  TMixedPlus = class(TInterfacedObject, IPlus)
  public
    function GetResult(AParams: array of string): string;
  end;

  TMixedMinus = class(TInterfacedObject, IMinus)
  public
    function GetResult(AParams: array of string): string;
  end;

  TMixedName = class(TInterfacedObject, IName)
  public
    function GetName: string;
	end;

implementation

{TMixedPlus}
function TMixedPlus.GetResult(AParams: array of string): string;
var
  i: integer;
  Rez: integer;
begin
  Rez := 0;
  for i := Low(AParams) to High(AParams) do
    Rez := Rez + StrToInt(AParams[i]);

  Result := IntToStr(Rez);
end;

{TMixedMinus}
function TMixedMinus.GetResult(AParams: array of string): string;
var
  i: integer;
  Rez: integer;
begin
  Rez := 0;
  for i := Low(AParams) to High(AParams) do
  begin
    if i = 0 then
			Rez := StrToInt(AParams[i])
    else
      Rez := Rez - StrToInt(AParams[i]);
  end;

  Result := IntToStr(Rez);
end;

{TMixedName}
function TMixedName.GetName: string;
begin
  Result := 'Mixed';
end;

end.

