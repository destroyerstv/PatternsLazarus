program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, MediatorU, Mediator_Intf
  { you can add units after this };

{$R *.res}
var
  Mediator: IMediator;
begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Mediator := TMediator.Create(Form1);
  Form1
  Application.Run;
end.

