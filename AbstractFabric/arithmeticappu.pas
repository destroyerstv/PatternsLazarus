unit ArithmeticAppU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, AbstractArithmeticFactoryU, ArithOperations_Intf;

type

  TArithmeticApp = class
  private
    FPlus: IPlus;
    FMinus: IMinus;
    FName: IName;
  public
    constructor Create(Factory: TAbstractArithmeticFactory);
    function CalculatePlus(AParams: array of string): string;
    function CalculateMinus(AParams: array of string): string;
    function TypeName: string;
	end;



implementation

{TArithmeticApp}
constructor TArithmeticApp.Create(Factory: TAbstractArithmeticFactory);
begin
  inherited Create;
  FPlus := Factory.Plus;
  FMinus := Factory.Minus;
  FName := Factory.Name;
end;

function TArithmeticApp.CalculatePlus(AParams: array of string): string;
begin
  Result := FPlus.GetResult(AParams);
end;

function TArithmeticApp.CalculateMinus(AParams: array of string): string;
begin
  Result := FMinus.GetResult(AParams);
end;

function TArithmeticApp.TypeName: string;
begin
  Result := FName.GetName;
end;

end.

