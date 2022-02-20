unit Mediator_Intf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IMediator = interface
  ['{54A91F65-E209-4710-B43B-1C9772D32EDA}']
   procedure Notify(Sender: TObject; Msg: string);
  end;

implementation

end.

