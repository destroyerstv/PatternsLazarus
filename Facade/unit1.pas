unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

	{ TForm1 }

  TForm1 = class(TForm)
		Button1: TButton;
		Edit1: TEdit;
		Panel1: TPanel;
		procedure Button1Click(Sender: TObject);
  private

  public

  end;

  TFacade = class
  public
    function GeneratePass(AChar, ANum: Integer): string;
	end;

var
  Form1: TForm1;

implementation

uses
  InternalClasses;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  GenPass: TFacade;
begin
  GenPass := TFacade.Create();
  Edit1.Text := GenPass.GeneratePass(5, 5);
  FreeAndNil(GenPass);
end;

{ TFacade }

function TFacade.GeneratePass(AChar, ANum: Integer): string;
var
  GenCh: TGenerateChars;
  GenNum: TGenerateNums;
  Mixed: TMixed;
  Str1, Str2: string;
begin
  GenCh := TGenerateChars.Create;
  GenNum := TGenerateNums.Create;
  Mixed := TMixed.Create;

  Str1 := GenCh.GetChars(AChar);
  Str2 := GenNum.GetNums(ANum);

  Result := Mixed.Mix(Str1, Str2);

  FreeAndNil(GenCh);
  FreeAndNil(GenNum);
  FreeAndNil(Mixed);
end;

end.

