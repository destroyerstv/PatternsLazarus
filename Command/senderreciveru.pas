unit SenderreciverU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Commands_Intf;

type

  TReciver = class
  public
   procedure WriteA(const AStr: string);
   procedure WriteB(const AStr: string);
  end;

  TSender = class
  private
   FSimple: ICommand;
   FComplex: ICommand;
  public
   procedure SetSimple(ACmd: ICommand);
   procedure SetComplex(ACmd: ICommand);
   procedure Start;
  end;

implementation

{TReciver}
procedure TReciver.WriteA(const AStr: string);
begin
 WriteLn('Recv A - ', AStr);
end;

procedure TReciver.WriteB(const AStr: string);
begin
 WriteLn('Recv B - ', AStr);
end;

{TSender}
procedure TSender.SetSimple(ACmd: ICommand);
begin
 FSimple := ACmd;
end;

procedure TSender.SetComplex(ACmd: ICommand);
begin
 FComplex := ACmd;
end;

procedure TSender.Start;
begin
 if Assigned(FSimple) then
  FSimple.Execute;

 if Assigned(FComplex) then
  FComplex.Execute;

end;

end.

