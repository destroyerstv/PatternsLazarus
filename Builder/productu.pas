unit ProductU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Fgl;


type

	TList = specialize TFPGList<string>;

	TProduct = class
	private
	  FList: TList;
	public
	  constructor Create;
	  destructor Destroy; override;
	  procedure Add(Ingredient: string);
	  function GetResult: string;
	end;

implementation

constructor TProduct.Create;
begin
  inherited;
  FList := TList.Create;
end;

destructor TProduct.Destroy;
begin
  FList.Clear;
  FreeAndNil(FList);
  inherited;
end;
procedure TProduct.Add(Ingredient: string);
begin
  FList.Add(Ingredient);
end;

function TProduct.GetResult: string;
var
  Str: string;
begin
  for Str in FList do
  begin
    Result := Result + Str + #$0A;
  end;
end;

end.

