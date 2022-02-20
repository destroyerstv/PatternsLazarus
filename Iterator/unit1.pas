unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnCars: TButton;
    btnDrivers: TButton;
    btnAll: TButton;
    lbSource: TListBox;
    lbDest: TListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure btnClick(Sender: TObject);
  private
    procedure CollectionPrinter(Sender: TObject);
  public

  end;


var
  Form1: TForm1;

implementation

uses
  CarHumanCollectionsU, Iterator_Intf;

{$R *.lfm}

{ TForm1 }

procedure TForm1.CollectionPrinter(Sender: TObject);
var
  CarHuman: IHumanCarCollections;
  Iterator: IIterator;
begin

  CarHuman := TCarHumanCollections.Create(lbSource.Items);

  if not(Sender is TButton) then
    Exit;

  if TButton(Sender).Name = 'btnCars' then
  begin
   Iterator := CarHuman.CreateCarIterator;
  end
  else if TButton(Sender).Name = 'btnDrivers' then
  begin
   Iterator := CarHuman.CreateHumanIterator;
  end
  else if TButton(Sender).Name = 'btnAll' then
  begin
   Iterator := CarHuman.CreateAllIterator;
  end
  else
  begin
    Exit;
  end;

  lbDest.Clear;

  while Iterator.GetNext do
   lbDest.Items.Add(Iterator.Current);
end;

procedure TForm1.btnClick(Sender: TObject);
begin
  CollectionPrinter(Sender);
end;

end.

