unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComponentU, DecoratorU, ClientCodeU;

type

	{ TForm1 }

  TForm1 = class(TForm)
		btnOK: TButton;
		Memo1: TMemo;
		Panel1: TPanel;
		procedure btnOKClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnOKClick(Sender: TObject);
var
  Client: TClientCode;
  OrigComp: TComponent;
  DecorA: TDecoratorA;
  DecorB: TDecoratorB;
begin

  OrigComp := TComponent.Create;
  DecorA := TDecoratorA.Create(OrigComp);
  DecorB := TDecoratorB.Create(DecorA);

  Client := TClientCode.Create(OrigComp, Memo1);
  Client.ClientCode;
  Client.ChangeComponent(DecorB);
  Client.ClientCode;
  FreeAndNil(Client);
  FreeAndNil(DecorB);
  FreeAndNil(DecorA);
  FreeAndNil(OrigComp);
end;

end.

