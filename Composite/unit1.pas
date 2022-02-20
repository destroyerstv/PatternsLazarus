unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

	{ TForm1 }

  TForm1 = class(TForm)
		Button1: TButton;
		Memo1: TMemo;
		procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses
  CompositeClassesU;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  Box, PenBox, EmptyBox: TElement;
  Product: TElement;
  AllCount: Integer;
begin
  Product := TProduct.Create;
  Product.Name := 'Pen';

  PenBox := TBox.Create;
  PenBox.Name := 'Pen';

  EmptyBox := TBox.Create;
  EmptyBox.Name := 'Empty';

  Box := TBox.Create;
  Box.Name := 'MainBox';

  PenBox.AddElement(Product);
  //PenBox.AddElement(EmptyBox);

  Box.AddElement(PenBox);
  Box.AddElement(EmptyBox);

  Memo1.Clear;
  Memo1.Lines.Add(Box.Count.ToString);
  Memo1.Lines.Add(Box.PrintAllElements);


  FreeAndNil(Box);
  FreeAndNil(EmptyBox);
  FreeAndNil(PenBox);
  FreeAndNil(Product);

end;

end.

