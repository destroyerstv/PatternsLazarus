unit Iterator_Intf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IIterator = interface

  IHumanCarCollections = interface
   function CreateCarIterator: IIterator;
   function CreateHumanIterator: IIterator;
   function CreateAllIterator: IIterator;
  end;

  IIterator = interface
   function GetNext: Boolean;
   function GetCurrent: string;
   property Current: string read GetCurrent;
  end;

implementation

end.

