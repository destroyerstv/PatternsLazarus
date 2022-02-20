unit BillBuilderU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ProductU, Builder_Intf;

type

  TBillBuilder = class(TInterfacedObject, IBuilder)
  private
    FProduct: TProduct;
    FTotal: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetTotal;

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

constructor TBillBuilder.Create;
begin
  inherited;
  FProduct := TProduct.Create;
  FTotal := 0;
end;

destructor TBillBuilder.Destroy;
begin
  FreeAndNil(FProduct);
  inherited;
end;

function TBillBuilder.GetProduct: string;
begin
  SetTotal;
  Result := FProduct.GetResult;
end;

//IBulder
procedure TBillBuilder.SetCheese;
begin
  FProduct.Add('Cheese - 10$');
  Inc(FTotal, 10);
end;

procedure TBillBuilder.SetSauce;
begin
  FProduct.Add('Sauce  - 10$');
  Inc(FTotal, 10);
end;

procedure TBillBuilder.SetSausage;
begin
  FProduct.Add('Sausage - 10$');
  Inc(FTotal, 10);
end;

procedure TBillBuilder.SetBasil;
begin
  FProduct.Add('Basil - 10$');
  Inc(FTotal, 10);
end;

procedure TBillBuilder.SetPineapple;
begin
  FProduct.Add('Pineapple - 10$');
  Inc(FTotal, 10);
end;

procedure TBillBuilder.SetMushrooms;
begin
  FProduct.Add('Mushrooms - 10$');
  Inc(FTotal, 10);
end;

procedure TBillBuilder.SetTomato;
begin
  FProduct.Add('Tomato - 10$');
  Inc(FTotal, 10);
end;

procedure TBillBuilder.SetPepper;
begin
  FProduct.Add('Pepper - 10$');
  Inc(FTotal, 10);
end;

procedure TBillBuilder.SetTotal;
begin
  FProduct.Add('SetTotal: ' + IntToStr(FTotal));
end;

end.

