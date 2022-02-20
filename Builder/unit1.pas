unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
	CheckLst;

type

	{ TfrmPizza }

  TfrmPizza = class(TForm)
		btnOK: TButton;
		btnClear: TButton;
		chklstIngredients: TCheckListBox;
		gbIngredients: TGroupBox;
		Memo1: TMemo;
		pnlBottom: TPanel;
		rbMargarita: TRadioButton;
		rbAmericano: TRadioButton;
		rbCorrida: TRadioButton;
		rbVegeterian: TRadioButton;
		rbQuadro: TRadioButton;
		rgPizzaList: TRadioGroup;
		procedure btnOKClick(Sender: TObject);
  private

  public

  end;

var
  frmPizza: TfrmPizza;

implementation

uses
  DirectorU, PizzaBuilderU, BillBuilderU, Builder_Intf;

{$R *.lfm}

{ TfrmPizza }

procedure TfrmPizza.btnOKClick(Sender: TObject);
var
  Director: TDirector;
  BuilderPizza: IBuilder;
  BuilderBill: IBuilder;
begin

  BuilderPizza := TPizzaBuilder.Create;
  BuilderBill := TBillBuilder.Create;
  Director := TDirector.Create(BuilderPizza);
  Director.SecondBuilder(BuilderBill);

  if rbMargarita.Checked then
  begin
     Director.SetFirstBuilder;
     Director.Margarita;
     Director.SetSecondBuilder;
     Director.Margarita
	end
	else if rbAmericano.Checked then
  begin
     Director.SetFirstBuilder;
     Director.Americano;
     Director.SetSecondBuilder;
     Director.Americano;
	end
	else if rbCorrida.Checked then
  begin
     Director.SetFirstBuilder;
     Director.Corrida;
     Director.SetSecondBuilder;
     Director.Corrida;
	end
	else if rbVegeterian.Checked then
  begin
     Director.SetFirstBuilder;
     Director.Vegeterian;
     Director.SetSecondBuilder;
     Director.Vegeterian;
	end
	else if rbQuadro.Checked then
  begin
     Director.SetFirstBuilder;
     Director.Quadro;
     Director.SetSecondBuilder;
     Director.Quadro;
	end;

  Memo1.Text := BuilderPizza.GetProduct;
  Memo1.Text := Memo1.Text + BuilderBill.GetProduct;

  FreeAndNil(Director);
end;

end.

