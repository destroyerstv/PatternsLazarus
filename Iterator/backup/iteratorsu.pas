unit IteratorsU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Iterator_Intf;

type

  TAbstractIterator = class(TInterfacedObject, IIterator)
  protected
   FList: TStrings;
   FIndex: Integer;
   procedure Reset;
   function GetCurrent: string;
  public
   constructor Create(AList: TStrings);
   function GetNext: Boolean; virtual; abstract;
  end;

  TCarIterator = class(TAbstractIterator)
  public
   function GetNext: Boolean; override;
  end;

  THumanIterator = class(TAbstractIterator)
  public
   function GetNext: Boolean; override;
  end;

  TAllIterator = class(TAbstractIterator)
  public
   function GetNext: Boolean; override;
  end;

implementation

{TAbstractIterator}
constructor TAbstractIterator.Create(AList: TStrings);
begin
 inherited Create;
 FList := AList;
 FIndex := 0;
end;

procedure TAbstractIterator.Reset;
begin
 FIndex := 0;
end;

function TAbstractIterator.GetCurrent: string;
begin
 Result := FList[FIndex].Split([': '])[1];
 inc(FIndex);
end;

{TCarIterator}
function TCarIterator.GetNext: Boolean;
var
  LastIndex: Integer;
  i: Integer;
begin
 Result := False;
 LastIndex := FList.Count - 1;

 if FIndex >= LastIndex then
  Exit(False);

 for i := FIndex to LastIndex do
 begin
   if pos('car: ', FList[i]) > 0 then
   begin
    FIndex := i;
    Exit(True);
   end;
 end;
 FIndex := LastIndex;
end;

{THumanIterator}
function THumanIterator.GetNext: Boolean;
var
  LastIndex: Integer;
  i: Integer;
begin
 Result := False;
 LastIndex := FList.Count - 1;

 if FIndex >= LastIndex then
  Exit(False);

 for i := FIndex to LastIndex do
 begin
   if pos('human: ', FList[i]) > 0 then
   begin
    FIndex := i;
    Exit(True);
   end;
 end;
 FIndex := LastIndex;
end;

{TAllIterator}
function TAllIterator.GetNext: Boolean;
var
  LastIndex: Integer;
  i: Integer;
begin
 Result := False;
 LastIndex := FList.Count - 1;

 if FIndex >= LastIndex then
  Exit(False);

 for i := FIndex to LastIndex do
 begin
   if (pos('car: ', FList[i]) > 0) or
      (pos('human: ', FList[i]) > 0) then
   begin
    FIndex := i;
    Exit(True);
   end;
 end;
 FIndex := LastIndex;
end;

end.

