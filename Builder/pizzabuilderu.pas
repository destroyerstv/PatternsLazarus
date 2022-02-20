unit PizzaBuilderU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ProductU, Builder_Intf;

type

  TPizzaBuilder = class(TInterfacedObject, IBuilder)
  private
    FProduct: TProduct;
  public
    constructor Create;
    destructor Destroy; override;

    //IBulder
    procedure SetCheese;
    procedure SetSauce;
    procedure SetSausage;
    procedure SetBasil;
    procedure SetPineapple;
    procedure SetMushrooms;
    procedure SetTomato;
    procedure SetPepper;
    function GetProduct: string;

	end;

implementation

constructor TPizzaBuilder.Create;
begin
  inherited;
  FProduct := TProduct.Create;
end;

destructor TPizzaBuilder.Destroy;
begin
  FreeAndNil(FProduct);
  inherited;
end;

function TPizzaBuilder.GetProduct: string;
begin
  Result := FProduct.GetResult;
end;

//IBulder
procedure TPizzaBuilder.SetCheese;
begin
  FProduct.Add('Cheese');
end;

procedure TPizzaBuilder.SetSauce;
begin
  FProduct.Add('Sauce');
end;

procedure TPizzaBuilder.SetSausage;
begin
  FProduct.Add('Sausage');
end;

procedure TPizzaBuilder.SetBasil;
begin
  FProduct.Add('Basil');
end;

procedure TPizzaBuilder.SetPineapple;
begin
  FProduct.Add('Pineapple');
end;

procedure TPizzaBuilder.SetMushrooms;
begin
  FProduct.Add('Mushrooms');
end;

procedure TPizzaBuilder.SetTomato;
begin
  FProduct.Add('Tomato');
end;

procedure TPizzaBuilder.SetPepper;
begin
  FProduct.Add('Pepper');
end;



end.

