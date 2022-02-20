unit Commands_Intf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  ICommand = Interface
   procedure Execute;
  end;

implementation

end.

