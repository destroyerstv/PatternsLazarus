unit PublisherMngrU;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, Subsribes_Itnf;

type

  { TPublisherMngr }

  TPublisherMngr = class(TInterfacedObject, IPublisher)
    FListListeners: TInterfaceList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Subscribe(AListener: IListener);
    procedure UnSubscribe(AListener: IListener);
    procedure Notifier(AMsg: string);
  end;

implementation


{ TPublisherMngr }

constructor TPublisherMngr.Create;
begin
  FListListeners := TInterfaceList.Create;
end;

destructor TPublisherMngr.Destroy;
begin
  FListListeners.Clear;
  FreeAndNil(FListListeners);
  inherited;
end;

procedure TPublisherMngr.Subscribe(AListener: IListener);
begin
  FListListeners.Add(AListener);
end;

procedure TPublisherMngr.UnSubscribe(AListener: IListener);
begin
  FListListeners.Remove(AListener);
end;

procedure TPublisherMngr.Notifier(AMsg: string);
var
  Intf: IUnknown;
  Listener: IListener;
begin
  for Intf in FListListeners do
  begin
    if Supports(Intf, IListener, Listener) then
      Listener.Update(AMsg);
  end;
end;

end.

