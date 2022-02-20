unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

	{ TFrmChecker }

  TFrmChecker = class(TForm)
		Button1: TButton;
		Edit1: TEdit;
		Label1: TLabel;
		procedure Button1Click(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FrmChecker: TFrmChecker;

implementation

uses
  CoRClassesU;

{$R *.lfm}

{ TFrmChecker }

procedure TFrmChecker.FormCreate(Sender: TObject);
begin
 Label1.Caption := String.Empty;
 Edit1.Caption := String.Empty;
end;

procedure TFrmChecker.Button1Click(Sender: TObject);
var
  SymHandler, NumHandler: IHandler;
  Rez: IHandler;
begin
  SymHandler := TSymbolHandler.Create;
  NumHandler := TNumberHandler.Create;

  SymHandler.SetNext(NumHandler);

  Rez := SymHandler.Execute(Edit1.Text);

  if Assigned(Rez) then
  begin
    Rez.GetResult(Label1);
    Exit;
	end;

  Label1.Caption := 'Err';
end;

end.

