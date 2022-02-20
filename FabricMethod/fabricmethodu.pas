unit FabricMethodU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  {*
    Интрефейс для арифметической операции
  }
  IOperation = interface
    function GetResult: String;
  end;

  {*
    Арифметическая операция для сложения
  }
  TPlusOperation = class(TInterfacedObject, IOperation)
  private
    FRez: Integer;
  public
    constructor Create(AParams: array of String{array of const});
    //IOperation
    function GetResult: String;
  end;

  {*
    Арифметическая операция для вычитания
  }
  TMinusOperation = class(TInterfacedObject, IOperation)
  private
    FRez: Integer;
  public
    constructor Create(AParams: array of String{array of const});
    //IOperation
    function GetResult: String;
  end;

  {*
    Базовый класс с абстрактным методом для реализации фабрики
  }
  TArithmetic = class
  protected
    function FabricArithmetic(AParams: array of String{array of const}): IOperation; virtual; abstract;
  public
    //Метод для выполнения арифметической операции
    function ExecOperation(AParams: array of String{array of const}): String;
  end;

  {*
    Класс с фабрикой операции сложения
  }
  TPlusArith = class(TArithmetic)
  protected
    function FabricArithmetic(AParams: array of String{array of const}): IOperation; override;
  end;

  {*
    Класс с фабрикой операции вычитания
  }
  TMinusArith = class(TArithmetic)
  protected
    function FabricArithmetic(AParams: array of String{array of const}): IOperation; override;
  end;

implementation

{TArifmetic}
function TArithmetic.ExecOperation(AParams: array of String{array of const}): String;
var
  Oper: IOperation;
begin
  Oper := FabricArithmetic(AParams);
  Result := Oper.GetResult;
end;

{TPlusArith}
function TPlusArith.FabricArithmetic(AParams: array of String{array of const}): IOperation;
begin
  Result := TPlusOperation.Create(AParams);
end;

{TMinusArith}
function TMinusArith.FabricArithmetic(AParams: array of String{array of const}): IOperation;
begin
  Result := TMinusOperation.Create(AParams);
end;

{TPlusOperation}
constructor TPlusOperation.Create(AParams: array of String{array of const});
var
  i: Integer;
begin
  FRez := 0;
  for i := Low(AParams) to High(AParams) do
  begin
    FRez := FRez + StrToInt(AParams[i]); //AParams[i].VInteger;
  end;
end;

function TPlusOperation.GetResult: String;
begin
  Result := IntToStr(FRez);
end;

{TMinusOperation}
constructor TMinusOperation.Create(AParams: array of String{array of const});
var
  i: Integer;
begin
  FRez := 0;
  for i := Low(AParams) to High(AParams) do
  begin
    if i = 0 then
      FRez := StrToInt(AParams[i])
    else
      FRez := FRez - StrToInt(AParams[i]); //AParams[i].VInteger;
  end;
end;

function TMinusOperation.GetResult: String;
begin
  Result := IntToStr(FRez);
end;
end.

