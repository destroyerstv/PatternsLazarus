program project1;

uses
 CommandsU, SenderreciverU, Commands_Intf, SysUtils;

var
  Sender: TSender;
  Reciver: TReciver;

  SimpleCmd, ComplexCmd: ICommand;

begin

  Sender := TSender.Create;
  Reciver := TReciver.Create;

  try
    SimpleCmd := TSimpleCommand.Create('Simple!!!');
    ComplexCmd := TComplexCommand.Create(Reciver, 'RecA', 'RecB');

    Sender.SetSimple(SimpleCmd);
    Sender.SetComplex(ComplexCmd);

    Sender.Start;

  finally
   FreeAndNil(Reciver);
   FreeAndNil(Sender);
  end;

  ReadLn;
end.

