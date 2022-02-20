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
 Result := TCarIterator.Create(FList);
end;

function TCarHumanCollections.CreateHumanIterator: IIterator;
begin
 Result := THumanIterator.Create(FList);
end;

function TCarHumanCollections.CreateAllIterator: IIterator;
begin
 Result := TAllIterator.Create(FList);
end;

end.

