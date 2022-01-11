unit StaticDlg.ProjectSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxControls, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTextEdit, cxImage, cxCheckBox,
  Vcl.Buttons, Common.Consts, Common.ResourceStrings, Common.PipeList,
  System.ImageList, Vcl.ImgList;
type
  TProjectSettingsDlg = class(TForm)
    btnPanel: TPanel;
    pnButtons: TPanel;
    bnOK: TcxButton;
    bnCancel: TcxButton;
    Tree: TcxTreeList;
    colPipeName: TcxTreeListColumn;
    colCS: TcxTreeListColumn;
    colAskPassword: TcxTreeListColumn;
    bnAdd: TcxButton;
    bnDelete: TcxButton;
    ImageList1: TImageList;
    procedure bnAddClick(Sender: TObject);
    procedure bnDeleteClick(Sender: TObject);
    procedure TreeSelectionChanged(Sender: TObject);
  private
   procedure AddItem(const Alias, CS:string; AskPassword:boolean);
   procedure DeleteItem;
  public
   procedure LoadItems;
   procedure SaveItems;
   class function Execute:Boolean;
  end;

implementation

{$R *.dfm}

{ TProjectSettingsDlg }

const
 S_INCOMPLETE_CONNECTION_STRING ='Server=<Server>;Database=<DataBase>;User_Name=<sa>;Password=<sa>;DriverID=MSSQL;';
// OSAuthent = Yes
// Pooled = True

resourcestring
 S_NEWCONNECTION = 'Новое соединение';


procedure TProjectSettingsDlg.AddItem(const Alias, CS: string; AskPassword: boolean);
var
  N: TcxTreeListNode;
begin
 N := Tree.Add;
  if N <> nil then
  begin
    N.Values[0] := Alias;
    N.Values[1] := CS;
    N.Values[2] := AskPassword;
    N.ImageIndex:=3;
    N.MakeVisible;
  end;
end;

class function TProjectSettingsDlg.Execute: Boolean;
var
 Dlg:TProjectSettingsDlg;
begin
 Dlg:=TProjectSettingsDlg.Create(nil);
 try
  TPipeList.DefaultPipe.Pipes.Clear;
  Dlg.LoadItems;
  Result:=Dlg.ShowModal=mrOK;
  if Result then
   Dlg.SaveItems; 
 finally
  Dlg.Free;
 end;

end;

procedure TProjectSettingsDlg.LoadItems;
var
 X:Integer;
begin
TPipeList.DefaultPipe.LoadPipes;
 for X:=0 to TPipeList.DefaultPipe.Pipes.Count-1 do
  AddItem(TPipeList.DefaultPipe.Pipes[x].PipeName,
          TPipeList.DefaultPipe.Pipes[x].ConnectionString,
          TPipeList.DefaultPipe.Pipes[x].AskPassword);
end;

procedure TProjectSettingsDlg.SaveItems;
var
 x:Integer;
begin
TPipeList.DefaultPipe.Pipes.Clear;
 for x:=0 to Tree.Count-1 do
   TPipeList.DefaultPipe.AddPipe(VarToStr(Tree.Items[x].Values[0]),
                                 VarToStr(Tree.Items[x].Values[1]),
                                 Tree.Items[x].Values[2]);
TPipeList.DefaultPipe.SavePipes;
end;

procedure TProjectSettingsDlg.TreeSelectionChanged(Sender: TObject);
begin
 bnDelete.Enabled:=Tree.SelectionCount>0;
end;

procedure TProjectSettingsDlg.bnAddClick(Sender: TObject);
begin
  AddItem(S_NEWCONNECTION, S_INCOMPLETE_CONNECTION_STRING, True);
end;

procedure TProjectSettingsDlg.bnDeleteClick(Sender: TObject);
begin
 DeleteItem;
end;

procedure TProjectSettingsDlg.DeleteItem;
begin
if MessageBox(Handle, PChar(S_COMMMON_DELETE_RECORD_CONFIRMATION), PChar(S_COMMON_WARNING), MB_ICONQUESTION or MB_OKCANCEL) <> IDCANCEL then
    Tree.DeleteSelection;
end;

end.
