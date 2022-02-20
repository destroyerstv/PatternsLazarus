unit compvisitU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls;

type

  IVisitor = interface;
  TComponentA = class;
  TComponentB = class;


  IComponents = interface
   procedure Accept(Visitor: IVisitor);
  end;

  IVisitor = interface
   procedure VisitComponentA(Component: TComponentA);
   procedure VisitComponentB(Component: TComponentB);
  end;

  { TComponentA }

  TComponentA = class(TInterfacedObject, IComponents)
  public
    procedure Accept(Visitor: IVisitor);
    function GetNameComponent: string;
  end;

  { TComponentB }

  TComponentB = class(TInterfacedObject, IComponents)
  public
    procedure Accept(Visitor: IVisitor);
    function GetNameComponent: string;
  end;

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

{ TComponentB }

procedure TComponentB.Accept(Visitor: IVisitor);
begin
  Visitor.VisitComponentB(Self);
end;

function TComponentB.GetNameComponent: string;
begin
  Result := Self.ClassName;
end;

{ TComponentA }

procedure TComponentA.Accept(Visitor: IVisitor);
begin
  Visitor.VisitComponentA(Self);
end;

function TComponentA.GetNameComponent: string;
begin
  Result := Self.ClassName;
end;

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

