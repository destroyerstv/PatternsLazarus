unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  TSingleTone = class
  strict private
    FName: string;
    class var FInstance: TSingleTone;
    constructor Create(AName: string);
  public
    class procedure NilInstance;
    class function GetInstance(AName: string): TSingleTone;
    function GetName: string;
    property Name: string read GetName;
	end;

	{ TForm1 }

  TForm1 = class(TForm)
		Button1: TButton;
		Memo1: TMemo;
		procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  Inst: TSingleTone;
begin
  Inst := TSingleTone.GetInstance('First');
  Inst := TSingleTone.GetInstance('Second');
  Memo1.Text := Inst.Name + #$0A;
  TSingleTone.NilInstance;

  Inst := TSingleTone.GetInstance('Second');
  Inst := TSingleTone.GetInstance('First');
  Memo1.Text := Memo1.Text + Inst.Name + #$0A;
  TSingleTone.NilInstance;
end;

{TSingleTone}

constructor TSingleTone.Create(AName: string);
begin
  inherited Create;
  FName := AName;
end;

class procedure TSingleTone.NilInstance;
begin
 FreeAndNil(FInstance);
end;

class function TSingleTone.GetInstance(AName: string): TSingleTone;
begin
  if FInstance = nil then
    FInstance := TSingleTone.Create(AName);

  Result := FInstance;
end;

function TSingleTone.GetName: string;
begin
  Result := FName;
end;

end.

