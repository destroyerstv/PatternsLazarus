unit DevicesU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IDevice = interface
    procedure SetEnable(AEnable: Boolean);
    procedure SetChannel(ACh: Integer);
    function GetEnable: Boolean;
    function GetChannel: Integer;
    function PrintSpecifications: string;
    property Enable: Boolean read GetEnable write SetEnable;
    property Channel: Integer read GetChannel write SetChannel;
	end;

  TTv = class(TInterfacedObject, IDevice)
  private
    FName: string;
    FEnable: Boolean;
    FCh: Integer;
  protected
    procedure SetEnable(AEnable: Boolean);
    procedure SetChannel(ACh: Integer);
    function GetEnable: Boolean;
    function GetChannel: Integer;
    function PrintSpecifications: string;
  public
    constructor Create;
	end;

  TRadio = class(TInterfacedObject, IDevice)
  private
    FName: string;
    FEnable: Boolean;
    FCh: Integer;
  protected
    procedure SetEnable(AEnable: Boolean);
    procedure SetChannel(ACh: Integer);
    function GetEnable: Boolean;
    function GetChannel: Integer;
    function PrintSpecifications: string;
  public
    constructor Create;
	end;

implementation

{ TTv }

constructor TTv.Create;
begin
  inherited;
  FName := 'TV';
  FEnable := False;
  FCh := 0;
end;

procedure TTv.SetEnable(AEnable: Boolean);
begin
  FEnable := AEnable;
end;

procedure TTv.SetChannel(ACh: Integer);
begin
  FCh := ACh;
end;

function TTv.GetEnable: Boolean;
begin
  Result := FEnable;
end;

function TTv.GetChannel: Integer;
begin
  Result := FCh;
end;

function TTv.PrintSpecifications: string;
begin
  Result := 'Name: ' + FName + #$0A
          + 'Channel: ' + IntToStr(FCh) + #$0A;
end;

{ TRadio }

constructor TRadio.Create;
begin
  inherited;
  FName := 'Radio';
  FEnable := False;
  FCh := 0;
end;

procedure TRadio.SetEnable(AEnable: Boolean);
begin
  FEnable := AEnable;
end;

procedure TRadio.SetChannel(ACh: Integer);
begin
  FCh := ACh;
end;

function TRadio.GetEnable: Boolean;
begin
  Result := FEnable;
end;

function TRadio.GetChannel: Integer;
begin
  Result := FCh;
end;

function TRadio.PrintSpecifications: string;
begin
  Result := 'Name: ' + FName + #$0A
          + 'Channel: ' + IntToStr(FCh) + #$0A;
end;

end.

