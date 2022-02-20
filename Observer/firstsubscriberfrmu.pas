unit FirstSubscriberFrmU;

{$mode objfpc}{$H+}

interface

uses
  Subsribes_Itnf,
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TFirstSubscriberFrm }

  TFirstSubscriberFrm = class(TForm, IListener)
    btnSubscribe: TButton;
    btnUnSubscribe: TButton;
    Memo: TMemo;
    pnlBottom: TPanel;
    procedure btnSubscribeClick(Sender: TObject);
    procedure btnUnSubscribeClick(Sender: TObject);
  private
    FPublisherMngr: IPublisherMngr;
  public
    constructor Create(AOwner: TComponent; APublisherMngr: IPublisherMngr);
    procedure Update(AMsg: string);
  end;

var
  FirstSubscriberFrm: TFirstSubscriberFrm;

implementation

{$R *.lfm}


{ TFirstSubscriberFrm }

procedure TFirstSubscriberFrm.btnSubscribeClick(Sender: TObject);
begin
  FPublisherMngr.Subscribe(Self);
end;

procedure TFirstSubscriberFrm.btnUnSubscribeClick(Sender: TObject);
begin
  FPublisherMngr.UnSubscribe(Self);
end;

constructor TFirstSubscriberFrm.Create(AOwner: TComponent; APublisherMngr: IPublisherMngr);
begin
  inherited Create(AOwner);
  FPublisherMngr := APublisherMngr;
end;

procedure TFirstSubscriberFrm.Update(AMsg: string);
begin
  Memo.Append(AMsg);
end;

end.

