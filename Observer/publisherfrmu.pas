unit PublisherFrmU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Subsribes_Itnf;

type

  { TPublisherFrm }

  TPublisherFrm = class(TForm)
    btnPublish: TButton;
    Edit1: TEdit;
    procedure btnPublishClick(Sender: TObject);
  private
    FPublisherMngr: IPublisherMngr;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Subscribe(AListener: IListener);
    procedure UnSubscribe(AListener: IListener);
    property PublisherMngr: IPublisherMngr read FPublisherMngr;
  end;

var
  PublisherFrm: TPublisherFrm;

implementation

uses
  PublisherMngrU;

{$R *.lfm}

{ TPublisherFrm }

procedure TPublisherFrm.btnPublishClick(Sender: TObject);
begin
  FPublisherMngr.Notifier(Edit1.Text);
end;

constructor TPublisherFrm.Create(AOwner: TComponent);
begin
  inherited;
  FPublisherMngr := TPublisherMngr.Create;
end;

procedure TPublisherFrm.Subscribe(AListener: IListener);
begin
  FPublisherMngr.Subscribe(AListener);
end;

procedure TPublisherFrm.UnSubscribe(AListener: IListener);
begin
  FPublisherMngr.UnSubscribe(AListener);
end;

end.

