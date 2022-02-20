unit CarU;

{$mode objfpc}{$H+}

{$MODESWITCH ADVANCEDRECORDS}

interface

uses
  Classes, SysUtils;

type

  TCar = class
  private
    FOwner: string;
    FNumber: string;
    FCompany: string;
    FModel: string;
    FColor: string;

    function GetOwner: string;
    function GetNumber: string;
    function GetCompany: string;
    function GetModel: string;
    function GetColor: string;

    procedure SetOwner(AOwner: string);
    procedure SetNumber(ANumber: string);
    procedure SetCompany(ACompany: string);
    procedure SetModel(AModel: string);
    procedure SetColor(AColor: string);
  public
    constructor Create;
    function GetKey: string;
    property Owner: string read GetOwner write SetOwner;
    property Number: string read GetNumber write SetNumber;
    property Company: string read GetCompany write SetCompany;
    property Model: string read GetModel write SetModel;
    property Color: string read GetColor write SetColor;
	end;

implementation

{ TCar }

constructor TCar.Create();
begin
  FOwner := String.Empty;
  FNumber := String.Empty;
  FCompany := String.Empty;
  FModel := String.Empty;
  FColor := String.Empty;
end;

function TCar.GetKey: string;
var
  Str: string;
begin
  Str := String.Empty;

  if (FOwner <> String.Empty) and (FNumber <> String.Empty) then
    Str := String.Join('_', [FModel, FColor, FCompany, FNumber, FOwner])
  else
    Str := String.Join('_', [FModel, FColor, FCompany]);
  Result := Str;
end;

function TCar.GetOwner: string;
begin
  Result := FOwner;
end;

function TCar.GetNumber: string;
begin
  Result := FNumber;
end;

function TCar.GetCompany: string;
begin
  Result := FCompany;
end;

function TCar.GetModel: string;
begin
  Result := FModel;
end;

function TCar.GetColor: string;
begin
  Result := FColor;
end;

procedure TCar.SetOwner(AOwner: string);
begin
  FOwner := AOwner;
end;

procedure TCar.SetNumber(ANumber: string);
begin
  FNumber := ANumber;
end;

procedure TCar.SetCompany(ACompany: string);
begin
  FCompany := ACompany;
end;

procedure TCar.SetModel(AModel: string);
begin
  FModel := AModel;
end;

procedure TCar.SetColor(AColor: string);
begin
  FColor := AColor;
end;

end.

