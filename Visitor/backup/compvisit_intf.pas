unit CompVisit_Intf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ComponentsU;

type

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

end.

