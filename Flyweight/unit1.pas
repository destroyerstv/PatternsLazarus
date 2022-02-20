unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

	{ TForm1 }

  TForm1 = class(TForm)
		Button1: TButton;
		Memo1: TMemo;
		Panel1: TPanel;
		procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses
  CarU, FlyweightU;

{$R *.lfm}

{ TForm1 }

procedure AddToPoliceDB(AMemo: TMemo; AFlyweightFactory: TFlyweightFactory; ACar: TCar; out IsNew: Boolean);
var
  Flyweight: TFlyweight;
  Car: TCar;
begin
  Car := TCar.Create;
  Car.Company := ACar.Company;
  Car.Model := ACar.Model;
  Car.Color := ACar.Color;

  Flyweight := AFlyweightFactory.Get(ACar, IsNew);
  AMemo.Text := AMemo.Text + Flyweight.Operation(ACar);

  if not IsNew then
    FreeAndNil(Car);

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Car: TCar;
  IsNew: Boolean;
  //Flyweight: TFlyweight;
  FlyweightFactory: TFlyweightFactory;
  i: Integer;
begin
  FlyweightFactory := TFlyweightFactory.Create;
  for i := 1 to 5 do
  begin
    Car := TCar.Create;
    Car.Owner := 'Owner' + IntToStr(i);
    Car.Number := 'N' + IntToStr(i);
    Car.Company := 'Company' + IntToStr(i);
    Car.Model := 'Model' + IntToStr(i);
    Car.Color := 'Color' + IntToStr(i);
    FlyweightFactory.Get(Car, IsNew);
    if not IsNew then
      FreeAndNil(Car);
	end;

  for i := 4 to 6 do
  begin
	  Car := TCar.Create;
	  Car.Owner := 'Owner' + IntToStr(i);
	  Car.Number := 'N' + IntToStr(i);
	  Car.Company := 'Company' + IntToStr(i);
	  Car.Model := 'Model' + IntToStr(i);
	  Car.Color := 'Color' + IntToStr(i);

	  AddToPoliceDB(Memo1, FlyweightFactory, Car, IsNew);
	  if not IsNew then
	    FreeAndNil(Car);
  end;

  Memo1.Text := Memo1.Text + FlyweightFactory.GetList;
end;

end.

