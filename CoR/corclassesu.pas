unit CoRClassesU;

{$mode objfpc}{$H+}

interface

uses
  Classes, Controls, SysUtils;

type

  IHandler = interface
    procedure GetResult(AControl: TControl);
    function CheckReq(AReq: string): Boolean;
    function SetNext (ANextHandler: IHandler): IHandler;
    function Execute(AReq: string): IHandler;
	end;

  TAbstractHandler = class(TInterfacedObject, IHandler)
  private
    FNext: IHandler;
    function CheckReq(AReq: string): Boolean; virtual; abstract;
  public
    function SetNext (ANextHandler: IHandler): IHandler;
    procedure GetResult(AControl: TControl); virtual; abstract;
    function Execute(AReq: string): IHandler;
	end;

  TSymbolHandler = class(TAbstractHandler)
  private
    function CheckReq(AReq: string): Boolean; override;
  public
    procedure GetResult(AControl: TControl); override;
	end;

  TNumberHandler = class(TAbstractHandler)
  private
    function CheckReq(AReq: string): Boolean; override;
  public
    procedure GetResult(AControl: TControl); override;
	end;


implementation

{ TAbstractHandler }
function TAbstractHandler.SetNext (ANextHandler: IHandler): IHandler;
begin
  FNext := ANextHandler;
  Result := FNext;
end;

function TAbstractHandler.Execute(AReq: string): IHandler;
begin
 	Result := nil;

  if CheckReq(AReq) then
  begin
    Exit(Self);
	end
  else
  begin
	  if Assigned(FNext) then
	    Result := FNext.Execute(AReq);
	end;
end;

{ TSymbolHandler }
function TSymbolHandler.CheckReq(AReq: string): Boolean;
var
  Num: Integer;
begin
  if (Length(AReq) = 1) and (not Integer.TryParse(AReq, Num)) then
     Exit(True);

  Result := False;
end;

procedure TSymbolHandler.GetResult(AControl: TControl);
begin
 AControl.Caption := 'This is Symbol';
end;

{ TNumberHandler }
function TNumberHandler.CheckReq(AReq: string): Boolean;
var
  Num: Integer;
begin
  if Integer.TryParse(AReq, Num) then
     Exit(True);

  Result := False;
end;

procedure TNumberHandler.GetResult(AControl: TControl);
begin
  AControl.Caption := 'This is Number';
end;

end.

