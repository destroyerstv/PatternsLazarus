unit ClientCodeU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls, ComponentU;

type

  TClientCode = class
  private
    FComponent: TComponent;
    FMemo: TMemo;
  public
    constructor Create(AComponent: TComponent; AMemo: TMemo);
    procedure ChangeComponent(AComponent: TComponent);
    procedure ClientCode;
	end;

implementation

{ TClientCode }

constructor TClientCode.Create(AComponent: TComponent; AMemo: TMemo);
begin
  inherited Create;
  FComponent := AComponent;
  FMemo := AMemo;
end;

procedure TClientCode.ChangeComponent(AComponent: TComponent);
begin
  FComponent := AComponent;
end;

procedure TClientCode.ClientCode;
begin
  FMemo.Text := FMemo.Text + #$0A + 'ClientCode:' + FComponent.Operation;
end;

end.

