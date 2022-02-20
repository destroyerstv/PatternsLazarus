unit frmMainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnOK: TButton;
    edtVar1: TEdit;
    edtVar2: TEdit;
    rbPlus: TRadioButton;
    rbMinus: TRadioButton;
    edtRez: TEdit;
    var1: TLabel;
    var2: TLabel;
    result: TLabel;
    procedure btnOKClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  qwe: TObject;

implementation

uses
  FabricMethodU;

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnOKClick(Sender: TObject);
var
  Arithmetic: TArithmetic;
  Params: array of String;
  i: Integer;
  edtVar: TEdit;
begin
  Arithmetic := nil;

  if rbPlus.Checked then
  begin
    Arithmetic := TPlusArith.Create;
    //TObject.Create;
  end
  else if rbMinus.Checked then
  begin
    Arithmetic := TMinusArith.Create;
  end;

  if Assigned(Arithmetic) then
  begin
    SetLength(Params, 2);
    for i := Low(Params) to High(Params) do
    begin
      edtVar := (Self.FindChildControl('edtVar' + IntToStr(i + 1)) as TEdit);

      if Assigned(edtVar) then
        Params[i] := Trim(edtVar.Text);
      //Self.FindComponent()
    end;
    edtRez.Text := Arithmetic.ExecOperation(Params);
    FreeAndNil(Arithmetic);
  end;
end;



end.

