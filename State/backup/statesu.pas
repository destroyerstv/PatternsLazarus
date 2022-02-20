unit StatesU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TAbstractState }

  TAbstractState = class
  private
    FContext: TObject;
  public
    constructor Create(AContext: TObject);
    procedure PushForward; virtual; abstract;
    procedure PushStop; virtual; abstract;
    procedure PushBack; virtual; abstract;
    property Context: TObject read FContext;
  end;

  { TForwardState }

  TForwardState = class(TAbstractState)
  public
    procedure PushForward; override;
    procedure PushStop; override;
    procedure PushBack; override;
  end;

  { TStopState }

  TStopState = class(TAbstractState)
  public
    procedure PushForward; override;
    procedure PushStop; override;
    procedure PushBack; override;
  end;

  { TBackState }

  TBackState = class(TAbstractState)
  public
    procedure PushForward; override;
    procedure PushStop; override;
    procedure PushBack; override;
  end;

implementation
uses
  MainContext;

{ TBackState }

procedure TBackState.PushForward;
begin

end;

procedure TBackState.PushStop;
begin
 TMainForm(Context).DownSpeed;
 TMainForm(Context).ChangeState('Stop');
end;

procedure TBackState.PushBack;
begin

end;

{ TStopState }

procedure TStopState.PushForward;
begin
 TMainForm(Context).UpSpeed;
 TMainForm(Context).ChangeState('Forward');
 TMainForm(Context).WriteDirection(Self);
end;

procedure TStopState.PushStop;
begin

end;

procedure TStopState.PushBack;
begin
 TMainForm(Context).UpSpeed;
 TMainForm(Context).ChangeState('Back');
 TMainForm(Context).WriteDirection(Self);
end;

{ TForwardState }

procedure TForwardState.PushForward;
begin
 TMainForm(Context).UpSpeed;
 TMainForm(Context).WriteDirection(Self);
end;

procedure TForwardState.PushStop;
begin
 if TMainForm(Context).Speed > 1 then
 begin
   TMainForm(Context).Stopping;
   TMainForm(Context).ChangeState('Stop');
 end
 else
 begin
   TMainForm(Context).DownSpeed;
   TMainForm(Context).ChangeState('Stop');
 end;
end;

procedure TForwardState.PushBack;
begin
 if TMainForm(Context).Speed > 1 then
 begin
   TMainForm(Context).DownSpeed;
 end
 else if TMainForm(Context).Speed = 1 then
 begin
   TMainForm(Context).DownSpeed;
   TMainForm(Context).ChangeState('Stop');
 end;
end;

{ TAbstractState }

constructor TAbstractState.Create(AContext: TObject);
begin
  inherited Create;
  FContext := AContext;
end;

end.

