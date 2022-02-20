unit SnapshotU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, EditorU;

type

  { TSnapshot }

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

{ TSnapshot }

constructor TSnapshot.Create(AEditor: TEditorFrm; AMemoTxt, AEditTxt: string);
begin
  inherited Create;
  FEditor := AEditor;
  FMemoTxt := AMemoTxt;
  FEditTxt := AEditTxt;
end;

procedure TSnapshot.Restore;
begin
 FEditor.Memo1.Text := FMemoTxt;
 FEditor.Edit1.Text := FEditTxt;
end;

end.
