unit ControllersU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DevicesU;

type

  IController = interface
    function Power: string;
    function SetChannel(ACh: Integer): string;
	end;

  TAbstractControl = class(TInterfacedObject, IController)
  private
    FDevice: IDevice;
  public
    constructor Create(ADevice: IDevice); virtual;
    function Power: string; virtual;
    function SetChannel(ACh: Integer): string; virtual;

    property Device: IDevice read FDevice;
	end;

  THumanControl = class(TAbstractControl)
	end;

  TBotControl = class(THumanControl)
  private
    FBotName: string;
  public
    constructor Create(ADevice: IDevice; ABotName: string); reintroduce;
    function TestDevice: string;
	end;


implementation

{ THumanControl }
constructor TAbstractControl.Create(ADevice: IDevice);
begin
  inherited Create;
  FDevice := ADevice;
end;

function TAbstractControl.Power: string;
begin
  Result := 'Power is OFF' + #$0A;
  if FDevice.Enable then
    FDevice.Enable := False
  else
  begin
    FDevice.Enable := True;
    Result := FDevice.PrintSpecifications;
	end;
end;

function TAbstractControl.SetChannel(ACh: Integer): string;
begin
  Result := 'Power is OFF' + #$0A;
  if FDevice.Enable then
  begin
    FDevice.Channel := ACh;
    Result := 'Channel is ' + IntToStr(ACh) + #$0A;
	end;
end;

{ TBotControl }
constructor TBotControl.Create(ADevice: IDevice; ABotName: string);
begin
  inherited Create(ADevice);
  FBotName := ABotName;
end;

function TBotControl.TestDevice: string;
var
  i: Integer;
begin
  if not Device.Enable then
    Exit(FBotName +': Power is OFF' + #$0A);

  Result := Device.PrintSpecifications;

  for i := 1 to 10 do
  begin
    Device.Channel := i;
    if Device.Channel <> i then
       Exit(FBotName +': test chanels is Failed' + #$0A);
	end;

  Result := Result + FBotName +': test chanels is OK' + #$0A;

end;

end.

