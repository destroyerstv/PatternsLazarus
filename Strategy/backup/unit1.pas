unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ContextU;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnGet: TButton;
    btnClear: TButton;
    ListBox1: TListBox;
    Memo: TMemo;
    pnlBottom: TPanel;
    pnlClient: TPanel;
    pnlLeft: TPanel;
    rbPositive: TRadioButton;
    rbNegative: TRadioButton;
    rbEven: TRadioButton;
    rbOdd: TRadioButton;
    rgStrategies: TRadioGroup;
    Splitter1: TSplitter;
    procedure btnClearClick(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FContext: TContext;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FContext := TContext.Create(Self, ListBox1, Memo);
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  ListBox1.Clear;
end;

procedure TForm1.btnGetClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to rgStrategies.ControlCount - 1 do
  begin
    if not (rgStrategies.Controls[i] is TRadioButton)
       Continue;

    if TRadioButton(rgStrategies.Controls[i]).Checked then
      FContext.ExecuteStrategy(TRadioButton(rgStrategies.Controls[i]).Caption);
  end;
end;

end.

