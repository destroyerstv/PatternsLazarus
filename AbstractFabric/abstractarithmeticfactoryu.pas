unit AbstractArithmeticFactoryU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ArithOperations_Intf;

type
  TAbstractArithmeticFactory = class
  public
    function Plus: IPlus; virtual; abstract;
    function Minus: IMinus; virtual; abstract;
    function Name: IName; virtual; abstract;
	end;

  TPositiveArithmeticFactory = class(TAbstractArithmeticFactory)
  public
    function Plus: IPlus; override;
    function Minus: IMinus; override;
    function Name: IName; override;
	end;

  TNegativeArithmeticFactory = class(TAbstractArithmeticFactory)
  public
    function Plus: IPlus; override;
    function Minus: IMinus; override;
    function Name: IName; override;
	end;

  TMixedArithmeticFactory = class(TAbstractArithmeticFactory)
  public
    function Plus: IPlus; override;
    function Minus: IMinus; override;
    function Name: IName; override;
	end;


implementation
uses
  PositiveU, NegativeU, MixedU;

{TPositiveArithmeticFactory}
function TPositiveArithmeticFactory.Plus: IPlus;
begin
  Result := TPositivePlus.Create;
end;

function TPositiveArithmeticFactory.Minus: IMinus;
begin
  Result := TPositiveMinus.Create;
end;

function TPositiveArithmeticFactory.Name: IName;
begin
  Result := TPositiveName.Create;
end;

{TNegativeArithmeticFactory}
function TNegativeArithmeticFactory.Plus: IPlus;
begin
  Result := TNegativePlus.Create;
end;

function TNegativeArithmeticFactory.Minus: IMinus;
begin
  Result := TNegativeMinus.Create;
end;

function TNegativeArithmeticFactory.Name: IName;
begin
  Result := TNegativeName.Create;
end;

{TMixedArithmeticFactory}
function TMixedArithmeticFactory.Plus: IPlus;
begin
  Result := TMixedPlus.Create;
end;

function TMixedArithmeticFactory.Minus: IMinus;
begin
  Result := TMixedMinus.Create;
end;

function TMixedArithmeticFactory.Name: IName;
begin
  Result := TMixedName.Create;
end;

end.

