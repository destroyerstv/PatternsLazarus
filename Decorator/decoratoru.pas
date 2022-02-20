unit DecoratorU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ComponentU;

type

  TDecorator = class(TComponent)
  private
    FComponent: TComponent;
  public
    constructor Create(Component: TComponent);
    function Operation: string; override;
	end;

  TDecoratorA = class(TDecorator)
  public
    function Operation: string; override;
	end;

  TDecoratorB = class(TDecorator)
  public
    function Operation: string; override;
	end;


implementation

{ TDecorator }

constructor TDecorator.Create(Component: TComponent);
begin
  inherited Create;
  FComponent := Component;
end;

function TDecorator.Operation: string;
begin
  Result := FComponent.Operation;
end;

{ TDecoratorA }

function TDecoratorA.Operation: string;
begin
  Result := 'TDecoratorA( ' + Inherited + ') ';
end;

{ TDecoratorB }

function TDecoratorB.Operation: string;
begin
  Result := 'TDecoratorB( ' + Inherited + ') ';
end;

end.

