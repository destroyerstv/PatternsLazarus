unit MainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

	{ TForm1 }

  TForm1 = class(TForm)
		btnOK: TButton;
		chSwitch: TCheckBox;
		Device: TRadioGroup;
		Controller: TRadioGroup;
		Memo1: TMemo;
		PnlBottom: TPanel;
		rbTV: TRadioButton;
		rbRadio: TRadioButton;
		rbHuman: TRadioButton;
		rbBot: TRadioButton;
		Splitter1: TSplitter;
		procedure btnOKClick(Sender: TObject);
		procedure chSwitchChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses
  DevicesU, ControllersU;

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnOKClick(Sender: TObject);
var
  Dev: IDevice;
  Control: TAbstractControl;
  Txt: string;
begin

  if rbTV.Checked then
    Dev := TTv.Create
  else if rbRadio.Checked then
    Dev := TRadio.Create;

  if chSwitch.Checked then
    Dev.Enable := True
  else
    Dev.Enable := False;

  if rbHuman.Checked then
  begin
    Control := THumanControl.Create(Dev);
    Txt := THumanControl(Control).Power;
    Txt := Txt + THumanControl(Control).SetChannel(12);
	end
	else if rbBot.Checked then
  begin
    Control := TBotControl.Create(Dev, 'Bot');
    Txt := Txt + TBotControl(Control).TestDevice;
	end;

  Memo1.Text := Txt;
end;

procedure TForm1.chSwitchChange(Sender: TObject);
begin
  if chSwitch.Checked then
    chSwitch.Caption := 'ON'
  else
    chSwitch.Caption := 'OFF';
end;

end.

