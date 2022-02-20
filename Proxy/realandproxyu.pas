unit RealAndProxyU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls;

type

  IEngine = interface
    procedure StartEngine;
	end;

  TRealEngine = class(TInterfacedObject, IEngine)
  private
    FMemo: TMemo;
  public
    constructor Create(AMemo: TMemo);
    procedure StartEngine;
	end;

  TProxyEngine = class(TInterfacedObject, IEngine)
  private
    FEngine: TRealEngine;
    FMemo: TMemo;
  public
    constructor Create(AMemo: TMemo; ARealEngine: TRealEngine);
    procedure StartEngine;
	end;



implementation

{ TRealEngine }

constructor TRealEngine.Create(AMemo: TMemo);
begin
  FMemo := AMemo;
end;

procedure TRealEngine.StartEngine;
begin
 FMemo.Text := 'Engine Starting...';
end;

{ TProxyEngine }

constructor TProxyEngine.Create(AMemo: TMemo; ARealEngine: TRealEngine);
begin
  FMemo := AMemo;
  FEngine := ARealEngine;
end;

procedure TProxyEngine.StartEngine;
begin
 FEngine.StartEngine;
 FMemo.Text := FMemo.Text + 'Proxy Engine Starting...';
end;

end.

