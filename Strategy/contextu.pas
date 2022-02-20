unit ContextU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls, StrategyU;

type

  { TContext }

  TContext = class(TComponent)
  private
    FListBox: TListBox;
    FMemo: TMemo;
    FStrategy: IStrategy;
    procedure SetStrategy(AStrategy: IStrategy);
  public
    constructor Create(AOwner: TComponent; AListBox: TListBox; AMemo: TMemo); overload;
    procedure ExecuteStrategy(ANameStrategy: string);
  end;

implementation

{ TContext }

constructor TContext.Create(AOwner: TComponent; AListBox: TListBox; AMemo: TMemo);
begin
  inherited Create(AOwner);
  FListBox := AListBox;
  FMemo := AMemo;
end;

procedure TContext.SetStrategy(AStrategy: IStrategy);
begin
  FStrategy := AStrategy;
end;

procedure TContext.ExecuteStrategy(ANameStrategy: string);
var
  i: Integer;
  DynArrInt: TDynArrInt;
begin

  if ANameStrategy = 'Positive' then
     SetStrategy(TPositiveStrategy.Create)

  else if ANameStrategy = 'Negative' then
     SetStrategy(TNegativeStrategy.Create)

  else if ANameStrategy = 'Even' then
     SetStrategy(TEvenStrategy.Create)

  else if ANameStrategy = 'Odd' then
     SetStrategy(TOddStrategy.Create)

  else
    Exit;

  FListBox.Clear;

  DynArrInt := FStrategy.Execute(FMemo.Lines);
  for i := 0 to Length(DynArrInt) - 1 do
    FListBox.Items.Add(IntToStr(DynArrInt[i]));
end;

end.

