unit CommandsU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SenderreciverU, Commands_Intf;

type

  TSimpleCommand = class(TInterfacedObject, ICommand)
  private
    FPayload: string;
  public
    constructor Create(const APayload: string);
    procedure Execute;
  end;

  TComplexCommand = class(TInterfacedObject, ICommand)
  private
    FReciver: TReciver;
    FStrA, FStrB: string;
  public
    constructor Create(const AReciver: TReciver; const AStrA, AStrB: string);
    procedure Execute;
  end;

implementation

{TSimpleCommand}
constructor TSimpleCommand.Create(const APayload: string);
begin
 FPayload := APayload;
end;

procedure TSimpleCommand.Execute;
begin
 WriteLn('FPayload - ', FPayload);
end;

{TComplexCommand}
constructor TComplexCommand.Create(const AReciver: TReciver; const AStrA, AStrB: string);
begin
 FReciver := AReciver;
 FStrA := AStrA;
 FStrB := AStrB;
end;

procedure TComplexCommand.Execute;
begin
 FReciver.WriteA(FStrA);
 FReciver.WriteB(FStrB);
end;

end.

