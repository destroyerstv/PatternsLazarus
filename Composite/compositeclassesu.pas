unit CompositeClassesU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Fgl;

type

  TElement = class;

  TList = specialize TFPGList<TElement>;

  TElement = class
  strict private
    FName: string;
  protected
    procedure SetName(AName: string); virtual;
    function GetName: string; virtual;
    function GetCount: Integer; virtual; abstract;
    function GetComposite: Boolean; virtual; abstract;
  public
		procedure AddElement(AElement: TElement); virtual; abstract;
		procedure RemElement(AElement: TElement); virtual; abstract;
    function PrintAllElements: string; virtual; abstract;
    property Name: string read GetName write SetName;
    property Count: Integer read GetCount;
    property IsComposite: Boolean read GetComposite;
	end;

  TBox = class(TElement)
  strict private
    FList: TList;
	protected
	  procedure SetName(AName: string); override;
	  function GetCount: Integer; override;
	  function GetComposite: Boolean; override;
	public
    constructor Create;
    destructor Destroy; override;
		procedure AddElement(AElement: TElement); override;
		procedure RemElement(AElement: TElement); override;
    function PrintAllElements: string; override;
  end;

  TProduct = class(TElement)
  protected
    function GetCount: Integer;  override;
    function GetComposite: Boolean;  override;
  public
		procedure AddElement(AElement: TElement); override;
		procedure RemElement(AElement: TElement); override;
    function PrintAllElements: string; override;
  end;

implementation

{ TElement }

procedure TElement.SetName(AName: string);
begin
  FName := AName;
end;

function TElement.GetName: string;
begin
  Result := FName;
end;

{ TBox }

constructor TBox.Create;
begin
  inherited;
  FList := TList.Create;
end;

destructor TBox.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

procedure TBox.AddElement(AElement: TElement);
begin
  FList.Add(AElement);
end;

procedure TBox.RemElement(AElement: TElement);
begin
  FList.Remove(AElement);
end;

procedure TBox.SetName(AName: string);
begin
  inherited SetName('Box_' + AName);
end;

function TBox.GetCount: Integer;
var
  Element: TElement;
  AllCount: Integer;
begin
  AllCount := FList.Count;
  for Element in FList do
  begin
    if Element.IsComposite then
      AllCount := AllCount + Element.GetCount;
  end;

  Result := AllCount;
end;

function TBox.GetComposite: Boolean;
begin
  Result := True;
end;

function TBox.PrintAllElements: string;
var
  Element: TElement;
  BoxElems: string;
  ProductName: string;
begin
  Result := '';
  BoxElems := '';
  ProductName := '';
  for Element in FList do
  begin

    if Element.IsComposite then
    begin
      ProductName := Element.Name + ' ';
      BoxElems := '[' + Element.PrintAllElements + ']';
      if FList.Last <> Element then
        BoxElems := BoxElems + ', ';
		end
		else
    begin
      ProductName := Element.Name;
      if FList.Last <> Element then
        ProductName := ProductName + ', ';
		end;

    Result := Result + ProductName + BoxElems;
	end;
end;

{ TProduct }

procedure TProduct.AddElement(AElement: TElement);
begin
  Raise Exception.Create('Product can''t Add element: ' + AElement.Name);
end;

procedure TProduct.RemElement(AElement: TElement);
begin
  Raise Exception.Create('Product can''t Remove element: ' + AElement.Name);
end;

function TProduct.GetCount: Integer;
begin
  Result := 0;
  Raise Exception.Create('Product can''t return Count');
end;

function TProduct.GetComposite: Boolean;
begin
  Result := False;
end;

function TProduct.PrintAllElements: string;
begin
  Result := '';
end;

end.

