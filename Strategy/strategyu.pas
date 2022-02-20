unit StrategyU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  TDynArrInt = array of Integer;

  IStrategy = interface
    function Execute(AStrings: TStrings): TDynArrInt;
  end;

  { TAbstractStrategy }

  TAbstractStrategy = class(TInterfacedObject, IStrategy)
  public
    function Execute(AStrings: TStrings): TDynArrInt; virtual; abstract;
  end;

  { TPositiveStrategy }

  TPositiveStrategy = class(TAbstractStrategy)
  public
    function Execute(AStrings: TStrings): TDynArrInt; override;
  end;

  { TNegativeStrategy }

  TNegativeStrategy = class(TAbstractStrategy)
  public
    function Execute(AStrings: TStrings): TDynArrInt; override;
  end;

  { TEvenStrategy }

  TEvenStrategy = class(TAbstractStrategy)
  public
    function Execute(AStrings: TStrings): TDynArrInt; override;
  end;

  { TOddStrategy }

  TOddStrategy = class(TAbstractStrategy)
  public
    function Execute(AStrings: TStrings): TDynArrInt; override;
  end;

implementation

{ TEvenStrategy }
function TEvenStrategy.Execute(AStrings: TStrings): TDynArrInt;
var
  StrNum: string;
  Num: integer;
begin
  Result := TDynArrInt.Create(1);
  SetLength(Result, 0);
  for StrNum in AStrings do
  begin
    if not integer.TryParse(StrNum, Num) then
      Continue;

    if (Num mod 2) = 0 then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Num;
    end;
  end;
end;

{ TOddStrategy }
function TOddStrategy.Execute(AStrings: TStrings): TDynArrInt;
var
  StrNum: string;
  Num: integer;
begin
  Result := TDynArrInt.Create(1);
  SetLength(Result, 0);
  for StrNum in AStrings do
  begin
    if not integer.TryParse(StrNum, Num) then
      Continue;

    if (Num mod 2) <> 0 then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Num;
    end;
  end;
end;

{ TNegativeStrategy }
function TNegativeStrategy.Execute(AStrings: TStrings): TDynArrInt;
var
  StrNum: string;
  Num: integer;
begin
  Result := TDynArrInt.Create(1);
  SetLength(Result, 0);
  for StrNum in AStrings do
  begin
    if not integer.TryParse(StrNum, Num) then
      Continue;

    if Num < 0 then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Num;
    end;
  end;
end;

{ TPositiveStrategy }
function TPositiveStrategy.Execute(AStrings: TStrings): TDynArrInt;
var
  StrNum: string;
  Num: integer;
begin
  Result := TDynArrInt.Create(1);
  SetLength(Result, 0);
  for StrNum in AStrings do
  begin
    if not integer.TryParse(StrNum, Num) then
      Continue;

    if Num > 0 then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := Num;
    end;
  end;
end;

end.

