unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

	{ TMainForm }

  TMainForm = class(TForm)
		Button1: TButton;
		edtLogin: TEdit;
		edtPass: TEdit;
		Label1: TLabel;
		procedure Button1Click(Sender: TObject);
    procedure edtEnter(Sender: TObject);
		procedure edtExit(Sender: TObject);
		procedure edtPassKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
			);
		procedure FormCreate(Sender: TObject);
  private
    function LogIn(ALogin, APass: string): Boolean;
  public

  end;

var
  MainForm: TMainForm;

implementation

uses
  CoRAuthU, Unit2;

{$R *.lfm}

{ TMainForm }
procedure TMainForm.FormCreate(Sender: TObject);
begin
  Label1.Caption := '';
end;

function TMainForm.LogIn(ALogin, APass: string): Boolean;
var
  AuthDB, RoleDB: TDictionary;
  AuthChecker, RoleChecker: TBaseAuth;
begin
  AuthDB := TDictionary.Create;
  RoleDB := TDictionary.Create;

  AuthDB.Add('Admin', 'Admin123');
  AuthDB.Add('User', 'User123');

  RoleDB.Add('Admin', 'AdminRole');
  RoleDB.Add('User', 'UserRole');

  AuthChecker := TAuthChecker.Create(AuthDB);
  RoleChecker := TRoleChecker.Create(RoleDB, Label1);
  AuthChecker.SetNext(RoleChecker);

  Result := AuthChecker.Check(ALogin, APass);

  FreeAndNil(RoleChecker);
  FreeAndNil(AuthChecker);
end;

procedure TMainForm.edtEnter(Sender: TObject);
var
  Txt: string;
begin
  Txt := TEdit(Sender).Text;
  if (Txt = 'Login') or
     (Txt = 'Pass') then
  begin
    TEdit(Sender).Text := '';
	end;
end;

procedure TMainForm.edtExit(Sender: TObject);
var
  Txt: string;
  NameCmp: string;
begin
  NameCmp := TEdit(Sender).Name;
  Txt := TEdit(Sender).Text;
  if (Txt = '') then
  begin
    Delete(NameCmp, 1, 3);
    TEdit(Sender).Text := NameCmp;
	end;
end;

procedure TMainForm.edtPassKeyDown(Sender: TObject; var Key: Word;
	Shift: TShiftState);
begin
  if Length(edtPass.Text) > 1 then
    edtPass.PasswordChar := '*'
  else
    edtPass.PasswordChar := #0;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
   FrmChecker: TFrmChecker;
begin
  Label1.Caption := '';
  if not LogIn(edtLogin.Text, edtPass.Text) then
  begin
    Label1.Caption := 'LogIn Error';
    Exit;
	end;

  FrmChecker := TFrmChecker.Create(Self);
  FrmChecker.ShowModal;
  FreeAndNil(FrmChecker);
end;

end.

