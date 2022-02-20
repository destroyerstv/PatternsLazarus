program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, ArithOperations_Intf, PositiveU, NegativeU, MixedU,
	AbstractArithmeticFactoryU, ArithmeticAppU, SysUtils
  { you can add units after this };

{$R *.res}

begin
  if FileExists('heaptrace.trc') then
    DeleteFile('heaptrace.trc');
  SetHeapTraceOutput('heaptrace.trc');
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
	Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

