unit ComponentU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  TAbstractComponent = class
  public
    function Operation: string; virtual; abstract;
	end;

  TComponent = class(TAbstractComponent)
  public
    function Operation: string; override;
	end;

implementation

{ TComponent }
function TComponent.Operation: string;
begin
  Exit('Component');
end;

end.

