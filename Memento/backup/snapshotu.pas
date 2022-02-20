unit SnapshotU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, EditorU;

type

  TSnapshot = class
  private
    FEditor: TEditorFrm;
    FMemoTxt: string;
    FEditTxt: string;
  public
    constructor Create(AEditor: TEditorFrm; AMemoTxt, AEditTxt: string);
    procedure Restore;
  end;

implementation

end.

