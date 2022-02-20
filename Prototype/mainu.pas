unit MainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  IClone = interface
  ['{BA7EBF22-4550-4AA9-8E79-509DFDC70C15}']
    function Clone: TObject;
  end;

  TSecret = class;

  TBox = class(TInterfacedObject, IClone)
  private
    FSecret: TSecret;
    FNameBox: string;
  public
    constructor Create(const ANameBox: string); overload;
    destructor Destroy; override;
    procedure PutSecret(ASecret: TSecret);
    procedure RenameSecret(ANameSecret: string);
    function ShowBox: string;
    function LiteClone: TObject;
    function Clone: TObject;
	end;

  TSecret = class(TInterfacedObject, IClone)
  private
    FNameSecret: string;
  public
    constructor Create(ANameSecret: string);
    procedure Rename(ANameSecret: string);
    function Clone: TObject;
    property NameSecret: string read FNameSecret;
	end;

	{ TFrmMain }

  TFrmMain = class(TForm)
		Button1: TButton;
		Memo1: TMemo;
		procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.lfm}

{ TFrmMain }

procedure TFrmMain.Button1Click(Sender: TObject);
var
  OriginalBox: TBox;
  CloneBox: TBox;
  LiteCloneBox: TBox;
  Secret: TSecret;
begin
 OriginalBox := TBox.Create('Original');
 Secret := TSecret.Create('OriginalSecret');
 OriginalBox.PutSecret(Secret);

 CloneBox := TBox(OriginalBox.Clone);
 CloneBox.RenameSecret('CloneSecret');

 LiteCloneBox := TBox(OriginalBox.LiteClone);
 LiteCloneBox.RenameSecret('LiteSecret');

 Memo1.Text := OriginalBox.ShowBox + #$0A;
 Memo1.Text := Memo1.Text + CloneBox.ShowBox + #$0A;
 Memo1.Text := Memo1.Text + LiteCloneBox.ShowBox + #$0A;

end;

{ TBox }
constructor TBox.Create(const ANameBox: string);
begin
  inherited Create;
  FNameBox := ANameBox;
  FSecret := nil;
end;

destructor TBox.Destroy;
begin
  if Assigned(FSecret) then
    FSecret := nil;
end;

procedure TBox.PutSecret(ASecret: TSecret);
begin
  FSecret := ASecret;
end;

procedure TBox.RenameSecret(ANameSecret: string);
begin
  FSecret.Rename(ANameSecret);
end;

function TBox.ShowBox: string;
begin
  Result :=  Format('Box - %s; Secret - %s', [FNameBox, FSecret.NameSecret]);
end;

function TBox.Clone: TObject;
begin
  Result := TBox.Create(FNameBox);
  TBox(Result).PutSecret(TSecret(FSecret.Clone));
end;

function TBox.LiteClone: TObject;
begin
 Result := TBox.Create(FNameBox);
 TBox(Result).PutSecret(FSecret);
end;

{ TSecret }

constructor TSecret.Create(ANameSecret: string);
begin
 inherited Create;
 FNameSecret := ANameSecret;
end;

procedure TSecret.Rename(ANameSecret: string);
begin
 FNameSecret := ANameSecret;
end;

function TSecret.Clone: TObject;
begin
 Result := TSecret.Create(FNameSecret);
end;

end.

