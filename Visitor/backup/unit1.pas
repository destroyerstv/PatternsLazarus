unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, compvisitU,
  VisitorsU;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnStart: TButton;
    Memo1: TMemo;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FArrayComponent: array of IComponents;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  AComp: IComponents;
  BComp: IComponents;
begin
  AComp := TComponentA.Create;
  BComp := TComponentB.Create;
  SetLength(FArrayComponent, 2);

  FArrayComponent[0] := AComp;
  FArrayComponent[1] := BComp;
end;

procedure TForm1.btnStartClick(Sender: TObject);
var
  i: Integer;
  Visitor: IVisitor;
begin
  Visitor := TVisitor.Create(Memo1);

  for i := 0 to Length(FArrayComponent) -1 do
  begin
    FArrayComponent[i].Accept(Visitor);
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  SetLength(FArrayComponent, 0);
end;

end.

