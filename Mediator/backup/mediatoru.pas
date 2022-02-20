unit MediatorU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Mediator_Intf, Unit1;

type

  TMediator = class(TInterfacedObject, IMediator)
  private
    FFrm: TForm1;
  public
    constructor Create(AFrm: TForm1);
    procedure Notify(Sender: TObject; Msg: string);
  end;

implementation

uses
  StdCtrls;

{TMediator}
constructor TMediator.Create(AFrm: TForm1);
begin
 inherited Create;
 FFrm := AFrm;
end;

procedure TMediator.Notify(Sender: TObject; Msg: string);
begin
 if not(Sender is TButton) then
  Exit;

 if TButton(Sender).Name = 'btnEvent1' then
 begin
  FFrm.lbEvents.Items.Add('Event1: ' + Msg);
 end
 else if TButton(Sender).Name = 'btnEvent2' then
 begin
  FFrm.lbEvents.Items.Add('Event2 complete' + Msg);
 end
 else if TButton(Sender).Name = 'btnEvent3' then
 begin
  FFrm.lbEvents.Items.Clear;
 end;
end;

end.

