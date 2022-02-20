unit CookingU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TAbstractCooking }

  TAbstractCooking = class
  protected
    procedure BasisDish; virtual;
    procedure AddIngredients; virtual; abstract;
    procedure SetTemperature; virtual;
    procedure SetHook; virtual;
    procedure StartCooking; virtual; abstract;
  public
    procedure CookingAlgorythm;
  end;

implementation

{ TAbstractCooking }

procedure TAbstractCooking.BasisDish;
begin
  WriteLn('dough');
end;

procedure TAbstractCooking.SetTemperature;
begin
  WriteLn('temperature 200 degrees')
end;

procedure TAbstractCooking.SetHook;
begin

end;

procedure TAbstractCooking.CookingAlgorythm;
begin
  BasisDish;
  AddIngredients;
  SetTemperature;
  SetHook;
  StartCooking;
end;

end.

