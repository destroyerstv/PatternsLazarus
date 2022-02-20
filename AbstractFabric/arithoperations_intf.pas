unit ArithOperations_Intf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IName = interface
    ['{893E7F5A-23AF-46F2-ACAE-4DFAAA2BF329}']
    function GetName: string;
  end;

  IPlus = interface
    //Сгенерировать GUID: Ctrl+Shift+G
    ['{3DF5EF4C-DC46-4397-BC96-2C08D7C3768D}']
    function GetResult(AParams: array of string): string;
  end;

  IMinus = interface
    ['{8EF975DE-0B73-4AF6-A1B6-F7E6451C485E}']
    function GetResult(AParams: array of string): string;
  end;


implementation

end.

