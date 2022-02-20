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

  { TCabbagePie }

  TCabbagePie = class(TAbstractCooking)
  protected
    procedure AddIngredients; override;
    procedure StartCooking; override;
  end;

  { TDumplings }

  TDumplings = class(TAbstractCooking)
  protected
    procedure AddIngredients; override;
    procedure SetHook; override;
    procedure StartCooking; override;
  end;

implementation

{ TDumplings }

procedure TDumplings.AddIngredients;
begin
  WriteLn('add meat ball');
end;

procedure TDumplings.SetHook;
begin
  WriteLn('add water');
end;

procedure TDumplings.StartCooking;
begin
  WriteLn('time 10  minutes. Ready');
end;

{ TCabbagePie }

procedure TCabbagePie.AddIngredients;
begin
  WriteLn('add cabbage');
end;

procedure TCabbagePie.StartCooking;
begin
  WriteLn('time 30 minutes. Ready');
end;

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

