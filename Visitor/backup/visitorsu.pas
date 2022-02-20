unit VisitorsU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Interfaces, StdCtrls;

type

  { TVisitor }

  TVisitor = class(TInterfacedObject, IVisitor)
  private
    FMemo: TMemo;
  public
    constructor Create(AMemo: TMemo);
    procedure VisitComponentA(Component: TComponentA);
    procedure VisitComponentB(Component: TComponentB);
  end;

implementation

{ TVisitor }

constructor TVisitor.Create(AMemo: TMemo);
begin
  inherited;
  FMemo := AMemo;
end;

procedure TVisitor.VisitComponentA(Component: TComponentA);
begin
  FMemo.Text := FMemo.Text + #10#13 + '<format>' + Component.GetNameComponent + '</format>';
end;

procedure TVisitor.VisitComponentB(Component: TComponentB);
begin
  FMemo.Text := FMemo.Text + #10#13 + '<format>' + Component.GetNameComponent + '</format>';
end;

end.

