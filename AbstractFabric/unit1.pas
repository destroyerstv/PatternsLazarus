unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  AbstractArithmeticFactoryU;

type

	{ TFrmMain }

  TFrmMain = class(TForm)
		btnAdd: TButton;
		btnRemove: TButton;
		btnOK: TButton;
		btnClear: TButton;
		edtSetNum: TEdit;
		edtSum: TEdit;
		edtDiff: TEdit;
		Label1: TLabel;
		Label2: TLabel;
		Label3: TLabel;
		Label4: TLabel;
		ListBox1: TListBox;
		bottomPnl: TPanel;
		leftPnl: TPanel;
		clientPnl: TPanel;
		editPnl: TPanel;
		Splitter1: TSplitter;
		procedure btnAddClick(Sender: TObject);
		procedure btnClearClick(Sender: TObject);
  procedure btnOKClick(Sender: TObject);
	procedure btnRemoveClick(Sender: TObject);
		procedure FormCreate(Sender: TObject);
  private
    FParams: array of string;
    function GetFactory: TAbstractArithmeticFactory;

  public

  end;

var
  FrmMain: TFrmMain;

implementation

uses
  ArithmeticAppU;

{$R *.lfm}

{ TFrmMain }

function TFrmMain.GetFactory: TAbstractArithmeticFactory;
var
  i: Integer;
  positive, negative: Boolean;
  factory: TAbstractArithmeticFactory;
begin
  positive := False;
  negative := False;

  SetLength(FParams, ListBox1.Items.Count);

  for i := ListBox1.Items.Count - 1 downto 0 do
  begin
    if StrToInt(ListBox1.Items[i]) > 0 then
       positive := true
    else if StrToInt(ListBox1.Items[i]) < 0 then
       negative := true;

    FParams[i] := ListBox1.Items[i];
	end;

  if positive and negative then
  begin
    factory := TMixedArithmeticFactory.Create;
	end
  else if positive then
  begin
    factory := TPositiveArithmeticFactory.Create;
	end
  else if negative then
  begin
    factory := TNegativeArithmeticFactory.Create;
	end
  else
    factory := nil;

  Result := factory;
end;

procedure TFrmMain.btnOKClick(Sender: TObject);
var
  factory: TAbstractArithmeticFactory;
  ArithmeticApp: TArithmeticApp;
begin
  factory := GetFactory;

  if not Assigned(factory) then
    Exit;

  ArithmeticApp := TArithmeticApp.Create(factory);
  edtSum.Text := ArithmeticApp.CalculatePlus(FParams);
  edtDiff.Text := ArithmeticApp.CalculateMinus(FParams);
  label4.Caption := ArithmeticApp.TypeName;

  FreeAndNil(ArithmeticApp);
  FreeAndNil(factory);
end;

procedure TFrmMain.btnRemoveClick(Sender: TObject);
begin
  ListBox1.Items.Delete(ListBox1.Items.Count - 1);
end;

procedure TFrmMain.btnAddClick(Sender: TObject);
var
  value: Integer;
begin
  if Trim(edtSetNum.Text) = '' then
    Exit;

  if not Integer.TryParse(edtSetNum.Text, value) then
    Exit;

  ListBox1.Items.Add(edtSetNum.Text);
  edtSetNum.Text := '';
end;

procedure TFrmMain.btnClearClick(Sender: TObject);
begin
  ListBox1.Clear;
  edtSetNum.Text := '';
  edtSum.Text := '';
  edtDiff.Text := '';
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Label4.Caption := '';
end;

end.

