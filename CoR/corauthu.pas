unit CoRAuthU;

{$mode objfpc}{$H+}

interface

uses
  Classes, Controls, SysUtils, Fgl;

type

    TDictionary = specialize TFPGMap<string, string>;

    TBaseAuth = class
    private
      FNext: TBaseAuth;
    protected
      function CheckNext(ALogin, APass: string): Boolean;
    public
      function SetNext(ANext: TBaseAuth): TBaseAuth;
      function Check(ALogin, APass: string): Boolean; virtual; abstract;
		end;

    TAuthChecker = class(TBaseAuth)
    private
      FAuthDB: TDictionary;
    public
      constructor Create(AAuthDB: TDictionary);
      function Check(ALogin, APass: string): Boolean; override;
		end;

    TRoleChecker = class(TBaseAuth)
    private
      FRoleDB: TDictionary;
      FControl: TControl;
    public
      constructor Create(ARoleDB: TDictionary; AControl: TControl);
      function Check(ALogin, APass: string): Boolean; override;
		end;

implementation

{ TBaseAuth }
// Запуск проверки в следующем объекте цепочки
function TBaseAuth.CheckNext(ALogin, APass: string): Boolean;
begin
  if (FNext = nil) then
    Exit(True);
  Result := FNext.Check(ALogin, APass);
end;

// Метод для формирования цепочки
function TBaseAuth.SetNext(ANext: TBaseAuth): TBaseAuth;
begin
  FNext := ANext;
  Result := FNext;
end;

{ TAuthChecker }
constructor TAuthChecker.Create(AAuthDB: TDictionary);
begin
  inherited Create;
  FAuthDB := AAuthDB;
end;

function TAuthChecker.Check(ALogin, APass: string): Boolean;
var
  Pass: string;
begin
  if not FAuthDB.TryGetData(ALogin, Pass) then
    Exit(False);

  if Pass <> APass then
    Exit(False);

  Result := CheckNext(ALogin, APass);
end;

{ TRoleChecker }
constructor TRoleChecker.Create(ARoleDB: TDictionary; AControl: TControl);
begin
  inherited Create;
  FRoleDB := ARoleDB;
  FControl := AControl;
end;

function TRoleChecker.Check(ALogin, APass: string): Boolean;
var
  Role: String;
begin
  if not FRoleDB.TryGetData(ALogin, Role) then
  begin
    Exit(False);
	end;

  FControl.Caption := 'Role: ' + Role;
  Result := CheckNext(ALogin, APass);
end;

end.

