unit MainContext;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, StatesU;

type

  { TMainForm }

  TMainForm = class(TForm)
    btnForward: TButton;
    btnStop: TButton;
    btnBack: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnBackClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSpeed: UInt8;
    FState: TAbstractState;
  public
    procedure Stopping;
    procedure UpSpeed;
    procedure DownSpeed;
    procedure WriteDirection(Sender: TObject);
    procedure ChangeState(const AStateName: string);
    property Speed: UInt8 read FSpeed;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.btnForwardClick(Sender: TObject);
begin
  FState.PushForward;
end;

procedure TMainForm.btnBackClick(Sender: TObject);
begin
  FState.PushBack;
end;

procedure TMainForm.btnStopClick(Sender: TObject);
begin
  FState.PushStop;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  FState := nil;
  FSpeed := 0;
  Label1.Caption := EmptyStr;
  FState := TStopState.Create(Self);
  Label2.Caption := EmptyStr;
end;

procedure TMainForm.Stopping;
begin
 Label1.Caption := 'Stopping';
 Application.ProcessMessages;
 FSpeed := 0;
 Sleep(3000);
 Label1.Caption := 'Speed: ' + IntToStr(FSpeed);
end;

procedure TMainForm.UpSpeed;
begin
 inc(FSpeed);
 Label1.Caption := 'Speed: ' + IntToStr(FSpeed);
end;

procedure TMainForm.DownSpeed;
begin
 dec(FSpeed);
 Label1.Caption := 'Speed: ' + IntToStr(FSpeed);
end;

procedure TMainForm.WriteDirection(Sender: TObject);
begin
  if Sender is TForwardState then
    Label2.Caption := 'Forward'

  else if Sender is TStopState then
    Label2.Caption := 'Stop'

  else if Sender is TBackState then
    Label2.Caption := 'Back';
end;

procedure TMainForm.ChangeState(const AStateName: string);
begin
  if Assigned(FState) then
    FreeAndNil(FState);

  if AStateName = 'Forward' then
     FState := TForwardState.Create(Self)

  else if AStateName = 'Stop' then
     FState := TStopState.Create(Self)

  else if AStateName = 'Back' then
     FState := TBackState.Create(Self);

end;

end.

