unit Basic.TreeGridFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.Frame, Vcl.ComCtrls,
  Data.DB, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxTLData, cxDBTL, Common.Images,Vcl.ActnList,System.Generics.Collections,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TBasicTreeGridFrame = class(TBasicFrame)
    TreeView: TcxDBTreeList;
    procedure TreeViewCustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure TreeViewDblClick(Sender: TObject);
    procedure TreeViewFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure TreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
   FCollapseAll:TAction;
   FExpandAll:TAction;
   procedure CollapseAllActionExecute(Sender:TObject);
   procedure ExpandAllActionExecute(Sender:TObject);
   procedure FindExpandedNodes(const Node: TcxTreeListNode; List:TList<Variant>);
   procedure ExpandNodes(List:TList<Variant>);
  protected
   procedure SetKeyField(const Value: String);override;
  public
   procedure RefreshDataSet; override;
   constructor Create(AOwner:TComponent); override;
  end;

implementation

{$R *.dfm}

{ TBasicTreeGridFrame }

procedure TBasicTreeGridFrame.CollapseAllActionExecute(Sender: TObject);
begin
 Self.TreeView.FullCollapse;
end;

procedure TBasicTreeGridFrame.ExpandAllActionExecute(Sender: TObject);
begin
 Self.TreeView.FullExpand;
end;

procedure TBasicTreeGridFrame.ExpandNodes(List: TList<Variant>);
var
 x:Integer;
 ANode: TcxTreeListNode;
begin
  for x:=0 to List.Count-1 do
   begin
    ANode:=Self.TreeView.FindNodeByKeyValue(List[x]);
    if Assigned(ANode) and (ANode.Expanded=False) then
     ANode.Expand(False);
   end;

end;

procedure TBasicTreeGridFrame.FindExpandedNodes(const Node: TcxTreeListNode;  List: TList<Variant>);
var
 x: Integer;
begin
 if Assigned(Node) then
  for x:=0 to Node.Count-1 do
   if Node.Items[x].Expanded then
    begin
     List.Add(Node.Items[x].Values[0]);
     FindExpandedNodes(Node.Items[x], List);
    end;
end;

constructor TBasicTreeGridFrame.Create(AOwner: TComponent);
begin
  inherited;
  AddRecordAction.Enabled:=True;
  FCollapseAll:=CreateAction('CollapseAll','Свернуть всё',3,True,CollapseAllActionExecute);
  FExpandAll:=CreateAction('ExpandAll','Раскрыть всё',5,True,ExpandAllActionExecute);
end;



procedure TBasicTreeGridFrame.RefreshDataSet;
var
 List:TList<Variant>;
 Node:TcxDBTreeListNode;
begin
 List:=TList<Variant>.Create;
 try
  TreeView.BeginUpdate;
  FindExpandedNodes(Self.TreeView.Root, List);
  inherited;
  Node:=TreeView.FindNodeByKeyValue(KeyFieldValue);
  if Assigned(Node) then
   begin
    Self.TreeView.TopVisibleNode:=Node;
    Node.Focused:=True;
    Node.Selected:=True;
   end;
  ExpandNodes(List);
  TreeView.EndUpdate;
 finally
  List.Free;
 end;
end;



procedure TBasicTreeGridFrame.SetKeyField(const Value: String);
begin
  inherited;
  TreeView.DataController.KeyField:=Value;
end;

procedure TBasicTreeGridFrame.TreeViewCustomDrawDataCell(
  Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.Focused then
   ACanvas.Brush.Color:=($CFCFCF);
end;

procedure TBasicTreeGridFrame.TreeViewDblClick(Sender: TObject);
begin
if Assigned(TreeView.FocusedNode) then
  EditRecordAction.Execute;
end;

procedure TBasicTreeGridFrame.TreeViewFocusedNodeChanged(
  Sender: TcxCustomTreeList; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
 SelectionChanged(TreeView.SelectionCount);
end;

procedure TBasicTreeGridFrame.TreeViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 ProcessDefaultHotKey(Key,Shift);
end;

end.
