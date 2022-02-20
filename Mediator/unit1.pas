unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Mediator_Intf;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnEvent1: TButton;
    btnEvent2: TButton;
    btnEvent3: TButton;
    lbEvents: TListBox;
    pnlBottom: TPanel;
    procedure btnEventClick(Sender: TObject);
  private
    FMediator: IMediator;
  public
    procedure SetMediator(AMediator: IMediator);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.btnEventClick(Sender: TObject);
begin
 FMediator.Notify(Sender, 'Click');
end;

{ TForm1 }
procedure TForm1.SetMediator(AMediator: IMediator);
begin
  FMediator := AMediator;
end;

end.

