unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  IPrintPersonalData = interface
    procedure PrintData(Memo: TMemo);
  end;

  TAddress = class
  private
    FTown: string;
    FStreet: string;
    FHouse: string;
  public
    constructor Create(ATown: string; AStreet: string; AHouse: string);
    property Town: string read FTown;
    property Street: string read FStreet;
    property House: string read FHouse;
	end;

  TOriginalPersonal = class
  private
    FName: string;
    FAge: Integer;
    FAddress: TAddress;
  public
    constructor Create(AName: string; AnAge: Integer; AnAddress: TAddress);
    property Name: string read FName;
    property Age: Integer read FAge;
    property Address: TAddress read FAddress;
	end;

  TAdapter = class(TInterfacedObject, IPrintPersonalData)
  private
    FOriginalPersonal: TOriginalPersonal;
  public
    constructor Create(AOriginalPersonal: TOriginalPersonal);
    procedure PrintData(Memo: TMemo);
	end;

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

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  PersData: IPrintPersonalData;
  Address: TAddress;
  OriginalPersonal: TOriginalPersonal;
begin
  Address := TAddress.Create('Stavropol', 'Pushkina', '1/A');
  OriginalPersonal := TOriginalPersonal.Create('Ivanov Ivan Ivanovich', 20, Address);
  PersData := TAdapter.Create(OriginalPersonal);
  PersData.PrintData(Memo1);

  FreeAndNil(OriginalPersonal);
  FreeAndNil(Address);
end;

{ TAddress }
constructor TAddress.Create(ATown: string; AStreet: string; AHouse: string);
begin
  inherited Create;
  FTown := ATown;
  FStreet := AStreet;
  FHouse := AHouse;
end;

{ TOriginalPersonal }
constructor TOriginalPersonal.Create(AName: string; AnAge: Integer; AnAddress: TAddress);
begin
  inherited Create;
  FName := AName;
  FAge := AnAge;
  FAddress := AnAddress;
end;

{ TAdapter }

constructor TAdapter.Create(AOriginalPersonal: TOriginalPersonal);
begin
  FOriginalPersonal := AOriginalPersonal;
end;

procedure TAdapter.PrintData(Memo: TMemo);
var
  Addr: string;
begin
  Memo.Lines.Clear;
  Memo.Lines.Add(FOriginalPersonal.FName);
  Memo.Lines.Add(IntToStr(FOriginalPersonal.Age));

  Addr := FOriginalPersonal.Address.Town + ', '
          +  FOriginalPersonal.Address.Street
          + ', ' + FOriginalPersonal.Address.House;
  Memo.Lines.Add(Addr);
end;

end.

