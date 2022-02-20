unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  EditorU,
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TMainFrm }

  TMainFrm = class(TForm)
    ListBox1: TListBox;
    pnlBottom: TPanel;
    pnlRight: TPanel;
    pnlLeft: TPanel;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    FEditorFrm: TEditorFrm;
  public

  end;

var
  MainFrm: TMainFrm;

implementation

uses
  SnapshotU;

{$R *.lfm}

{ TMainFrm }

procedure TMainFrm.FormCreate(Sender: TObject);
begin
  FEditorFrm := TEditorFrm.Create(Self);
  FEditorFrm.Parent := pnlLeft;
  FEditorFrm.Show;
end;

procedure TMainFrm.ListBox1DblClick(Sender: TObject);
var
  Snapshot: TSnapshot;
  Obj: TObject;
begin
  Obj := ListBox1.Items.Objects[ListBox1.ItemIndex];
  if (Obj is TSnapshot) then
  begin
    Snapshot := TSnapshot(Obj);
    Snapshot.Restore;
    ListBox1.Items.Delete(ListBox1.ItemIndex);
    FreeAndNil(Snapshot);
  end;
end;

end.

