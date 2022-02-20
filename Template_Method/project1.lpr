program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, CookingU, sysutils
  { you can add units after this };

procedure CookingProduct(AProduct: TAbstractCooking);
begin
  AProduct.CookingAlgorythm;
end;

var
  CabbagePie: TCabbagePie;
  Dumplings: TDumplings;
begin
  CabbagePie := TCabbagePie.Create;
  Dumplings := TDumplings.Create;

  CookingProduct(CabbagePie);
  CookingProduct(Dumplings);

  FreeAndNil(Dumplings);
  FreeAndNil(CabbagePie);
end.

