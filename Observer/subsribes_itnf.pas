unit Subsribes_Itnf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IListener = interface
  ['{287BCA06-7BB8-4E41-BC3A-2625A80CCC69}']
    procedure Update(AMsg: string);
  end;

  IPublisherMngr = interface
  ['{B7BB8026-4C54-4E26-A7BA-5316D74AFA13}']
    procedure Subscribe(AListener: IListener);
    procedure UnSubscribe(AListener: IListener);
    procedure Notifier(AMsg: string);
  end;

implementation

end.

