unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, RealAndProxyU;

type

	{ TForm1 }

  TForm1 = class(TForm)
		btnReal: TButton;
		btnProxy: TButton;
		Memo1: TMemo;
		procedure btnProxyClick(Sender: TObject);
  procedure btnRealClick(Sender: TObject);
	procedure FormCreate(Sender: TObject);
  private
    FRealEngine: TRealEngine;
    FProxyEngine: TProxyEngine;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnRealClick(Sender: TObject);
var
  Engine: IEngine;
begin
  FRealEngine := TRealEngine.Create(Memo1);

  Engine := FRealEngine;
  Engine.StartEngine;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.btnProxyClick(Sender: TObject);
var
  Engine: IEngine;
begin
  FRealEngine := TRealEngine.Create(Memo1);
  FProxyEngine := TProxyEngine.Create(Memo1, FRealEngine);

  Engine := FProxyEngine;
  Engine.StartEngine;
end;



end.

