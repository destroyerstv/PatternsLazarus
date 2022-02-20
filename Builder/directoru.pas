unit DirectorU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Builder_Intf;

type

  TDirector = class
  private
    FBuilder: IBuilder;
    FFirstBuilder: IBuilder;
    FSecondBuilder: IBuilder;
  public
    constructor Create(ABuilder: IBuilder);
    destructor Destroy; override;
    procedure SecondBuilder(ABuilder: IBuilder);
    procedure SetFirstBuilder;
    procedure SetSecondBuilder;
    procedure Margarita;
    procedure Americano;
    procedure Corrida;
    procedure Vegeterian;
    procedure Quadro;
	end;

implementation

constructor TDirector.Create(ABuilder: IBuilder);
begin
  inherited Create;
  FBuilder := ABuilder;
  FFirstBuilder := nil;
  FSecondBuilder := nil;
end;

destructor TDirector.Destroy;
begin
  inherited;
end;

procedure TDirector.SecondBuilder(ABuilder: IBuilder);
begin
  FFirstBuilder := FBuilder;
  FSecondBuilder := ABuilder;
end;

procedure TDirector.SetFirstBuilder;
begin
  FBuilder := FFirstBuilder;
end;

procedure TDirector.SetSecondBuilder;
begin
  FBuilder := FSecondBuilder;
end;

procedure TDirector.Margarita;
begin
  FBuilder.SetBasil;
  FBuilder.SetSauce;
  FBuilder.SetCheese;
end;

procedure TDirector.Americano;
begin
  FBuilder.SetSausage;
  FBuilder.SetBasil;
  FBuilder.SetPineapple;
  FBuilder.SetCheese;
end;

procedure TDirector.Corrida;
begin
  FBuilder.SetSausage;
  FBuilder.SetSauce;
  FBuilder.SetCheese;
end;

procedure TDirector.Vegeterian;
begin
  FBuilder.SetMushrooms;
  FBuilder.SetPepper;
  FBuilder.SetBasil;
  FBuilder.SetTomato;
end;

procedure TDirector.Quadro;
begin
  FBuilder.SetCheese;
  FBuilder.SetCheese;
  FBuilder.SetCheese;
  FBuilder.SetCheese;
end;

end.

