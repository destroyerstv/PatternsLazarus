unit Interfaces;

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
   procedure VisitComponentB(Component: TComponentA);
  end;

implementation

end.

