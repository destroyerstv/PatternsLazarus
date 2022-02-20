unit EditorU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TEditorFrm }

  TEditorFrm = class(TForm)
    btnShapshot: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure btnShapshotClick(Sender: TObject);
  private
    FListBox: TListBox;
    procedure SetContainer(AListBox: TListBox);
  public
    property Container: TListBox write SetContainer;
  end;

var
  EditorFrm: TEditorFrm;

implementation

uses
  SnapshotU;

{$R *.lfm}

{ TEditorFrm }

procedure TEditorFrm.btnShapshotClick(Sender: TObject);
var
  Snapshot: TShapshot;
begin
  if Assigned(FListBox) then
  begin
   Snapshot := TShapshot.Create(Self, Memo1.Text, Edit1.Text);
   FListBox.AddItem(IntToStr(FListBox.Count + 1), Snapshot);
  end;
end;

procedure TEditorFrm.SetContainer(AListBox: TListBox);
begin
  FListBox := AListBox;
end;

end.

