unit Builder_Intf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  IBuilder = interface
  // ctrl + shift + g
  ['{D9BE0962-1E1D-4B00-9482-BA77104CC68E}']
    procedure SetCheese;
    procedure SetSauce;
    procedure SetSausage;
    procedure SetBasil;
    procedure SetPineapple;
    procedure SetMushrooms;
    procedure SetTomato;
    procedure SetPepper;
    function GetProduct: string;
	end;

implementation

end.

