unit CarHumanCollectionsU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Iterator_Intf;

type

  TCarHumanCollections = class(TInterfacedObject, IHumanCarCollections)
  private
   FList: TStrings;
  public
   constructor Create(AList: TStrings);
   function CreateCarIterator: IIterator;
   function CreateHumanIterator: IIterator;
   function CreateAllIterator: IIterator;
  end;

implementation

uses
  IteratorsU;

{TCarHumanCollections}
constructor TCarHumanCollections.Create(AList: TStrings);
begin
 inherited Create;
 FList := AList;
end;

function TCarHumanCollections.CreateCarIterator: IIterator;
begin
 Result :=
end;

function TCarHumanCollections.CreateHumanIterator: IIterator;
begin

end;

function TCarHumanCollections.CreateAllIterator: IIterator;
begin

end;

end.

