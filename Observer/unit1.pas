unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    FirstSubcriber: TGroupBox;
    FirstSubcriberGrp: TGroupBox;
    pnlPubl: TPanel;
    pnlSecond: TPanel;
    pnlFirst: TPanel;
    PublisherGrp: TGroupBox;
    SecondSubcriber: TGroupBox;
    SecondSubcriberGrp: TGroupBox;
    spltLeft: TSplitter;
    spltRight: TSplitter;
    procedure FormCreate(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

uses
  FirstSubscriberFrmU, PublisherFrmU;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  Publisher: TPublisherFrm;
  First: TFirstSubscriberFrm;
  Second: TFirstSubscriberFrm;
begin
  Publisher := TPublisherFrm.Create(Self);
  Publisher.Parent := pnlPubl;
  Publisher.Show;

  First := TFirstSubscriberFrm.Create(Self, Publisher.PublisherMngr);
  First.Parent := pnlFirst;
  First.Show;

  Second := TFirstSubscriberFrm.Create(Self, Publisher.PublisherMngr);
  Second.Parent := pnlSecond;
  Second.Show;
end;

end.

