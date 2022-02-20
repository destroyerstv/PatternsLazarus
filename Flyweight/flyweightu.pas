unit FlyweightU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, CarU;

type

  TFlyweight = class
  private
    FSharedState: TCar;
    function Car2Str(ACar: TCar): string;
  public
    constructor Create( ASharedState: TCar);
    function Operation (AUniqueState: TCar): string;
    function GetKey: string;
    function PrintCar: string;
	end;

  TFlyweightFactory = class
  private
    FListFlyweight: array of TFlyweight;
    procedure AddCars(ACar: TCar);
    function CheckFlyweight(AKey: string; out AFlyweight: TFlyweight): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function Get(ACar: TCar; out IsNew: Boolean): TFlyweight;
    function GetList: string;
	end;

implementation

{ TFlyweight }

constructor TFlyweight.Create( ASharedState: TCar);
begin
  FSharedState := ASharedState;
end;

function TFlyweight.Operation (AUniqueState: TCar): string;
var
  Shared: string;
  Unique: string;
begin
  Shared := Car2Str(FSharedState);
  Unique := Car2Str(AUniqueState);

  Result := Format('Flyweight: Displaying shared: %s and unique: %s state.', [Shared, Unique]);
end;

function TFlyweight.Car2Str(ACar: TCar): string;
const
  NEW_LINE = #$0A;
begin
  Result := 'Owner: ' + ACar.Owner + NEW_LINE;
  Result := Result + 'Number: ' + ACar.Number + NEW_LINE;
  Result := Result + 'Company: ' + ACar.Company + NEW_LINE;
  Result := Result + 'Model: ' + ACar.Model + NEW_LINE;
  Result := Result + 'Color: ' + ACar.Color + NEW_LINE;
end;

function TFlyweight.GetKey: string;
var
  Str: string;
begin

  Str := String.Empty;

  if (FSharedState.Owner <> String.Empty) and (FSharedState.Number <> String.Empty) then
    Str := String.Join('_', [FSharedState.Model, FSharedState.Color, FSharedState.Company, FSharedState.Number, FSharedState.Owner])
  else
    Str := String.Join('_', [FSharedState.Model, FSharedState.Color, FSharedState.Company]);

  Result := Str;
end;

function TFlyweight.PrintCar: string;
begin
  Result := Car2Str(FSharedState);
end;

{ TFlyweightFactory }
constructor TFlyweightFactory.Create;
begin
  inherited;
  SetLength(FListFlyweight, 0);
end;

destructor TFlyweightFactory.Destroy;
var
  i: Integer;
begin
  for i := 0 to Length(FListFlyweight) - 1 do
    FreeAndNil(FListFlyweight[i]);
  SetLength(FListFlyweight, 0);
  inherited;
end;

procedure TFlyweightFactory.AddCars(ACar: TCar);
var
 Flyweight: TFlyweight;
begin
  SetLength(FListFlyweight, Length(FListFlyweight) + 1);
  Flyweight := TFlyweight.Create(ACar);
  FListFlyweight[Length(FListFlyweight) - 1] := Flyweight;
end;

function TFlyweightFactory.CheckFlyweight(AKey: string; out AFlyweight: TFlyweight): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Length(FListFlyweight) - 1 do
  begin
    if FListFlyweight[i].GetKey = AKey then
    begin
      AFlyweight := FListFlyweight[i];
      Exit(True);
		end;
	end;
end;

function TFlyweightFactory.Get(ACar: TCar; out IsNew: Boolean): TFlyweight;
var
  Flyweight: TFlyweight;
begin
  if CheckFlyweight(ACar.GetKey, Flyweight) then
  begin
	  IsNew := False;
    Result := Flyweight
	end
	else
  begin
    IsNew := True;
    Result := TFlyweight.Create(ACar);
    AddCars(ACar);
	end;
end;

function TFlyweightFactory.GetList: string;
var
  i: Integer;
begin
  Result := String.Empty;
  for i := 0 to Length(FListFlyweight) - 1 do
  begin
    Result := Result + FListFlyweight[i].PrintCar;
	end;
end;

end.

