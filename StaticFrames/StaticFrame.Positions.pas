unit StaticFrame.Positions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.TreeGridFrame, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxStyles,
  cxTL, cxTLdxBarBuiltInMenu, Data.DB, cxInplaceContainer, cxTLData, cxDBTL,
  cxMaskEdit, StaticDlg.Positions, dxCore, System.Actions, DAC.XDataSet, Vcl.ActnList,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TStaticFramePositions = class(TBasicTreeGridFrame)
    colDescription: TcxDBTreeListColumn;
    colOrderID: TcxDBTreeListColumn;
    colID: TcxDBTreeListColumn;
  private
   FRaiseOrderAction:TAction;
   FLowerOrderAction:TAction;
   procedure RaiseItem;
   procedure LowerItem;
   Procedure LowerOrderExecute(Sender:TObject);
   Procedure RaiseOrderExecute(Sender:TObject);
   Procedure ChangeOrder(ID,OrderID:Integer);
   Procedure ChangeItemOrder(Item:TcxTreeListNode);
  protected
   Procedure SelectionChanged(RecordsSelected:Integer);override;
  public
    Constructor Create(AOwner:TComponent); override;
  end;

implementation

{$R *.dfm}

{ TStaticFramePositions }

procedure TStaticFramePositions.ChangeItemOrder(Item: TcxTreeListNode);
var
 OID1, OID2:Integer;
 ID:Integer;
begin
 If Assigned(Item) then
  begin
   ID:=Item.Values[0];
   if VarIsNull(Item.Values[1]) then
    OID1:=0
     else
    OID1:=Item.Values[1];

    OID2:=DataSet.FieldByName('OrderID').AsInteger;
   if OID1=OID2 then
    OID1:=OID2+1;
   ChangeOrder(ID,OID2);
   ChangeOrder(KeyFieldValue,OID1);
  end;
end;


procedure TStaticFramePositions.ChangeOrder(ID, OrderID: Integer);
var
 Tmp:TxDataSet;
begin
 Tmp:=TxDataSet.Create(nil);
  try
   if OrderID<0 then
      OrderID:=0;
   Tmp.ProviderName:='spui_ChangeDptPositionOrder';
   Tmp.SetParameter('DepartmentPositionsID',ID);
   Tmp.SetParameter('OrderID',OrderID);
   Tmp.Execute;
  finally
   Tmp.Free;
  end;
end;

constructor TStaticFramePositions.Create(AOwner: TComponent);
begin
  inherited;
  DataSet.ProviderName:='spui_DepartmentPostionList';
  DialogClass:=TPositionsDlg;
  KeyField:='DepartmentPositionsID';
  DeleteSQLText:='spui_DeleteDepartmentPosition';
  colOrderID.SortOrder:= soAscending;
  FRaiseOrderAction:=CreateAction('RaiseOrder','Поднять',43,False,RaiseOrderExecute);
  FLowerOrderAction:=CreateAction('LowerOrder','Понизить',24,False,LowerOrderExecute);
end;

procedure TStaticFramePositions.LowerItem;
begin
 ChangeItemOrder(TreeView.FocusedNode.getNextSibling);
 RefreshDataSet;
end;

procedure TStaticFramePositions.RaiseItem;
begin
 ChangeItemOrder(TreeView.FocusedNode.getPrevSibling);
 RefreshDataSet;
end;

procedure TStaticFramePositions.LowerOrderExecute(Sender: TObject);
begin
 LowerItem;
end;

procedure TStaticFramePositions.RaiseOrderExecute(Sender: TObject);
begin
 RaiseItem;
end;

procedure TStaticFramePositions.SelectionChanged(RecordsSelected: Integer);
var
 AEnabled:Boolean;
begin
  inherited;
  AEnabled:=RecordsSelected>0;
  FRaiseOrderAction.Enabled:=AEnabled and (TreeView.FocusedNode.GetPrevSibling<>nil);
  FLowerOrderAction.Enabled:=AEnabled and (TreeView.FocusedNode.GetNextSibling<>nil);
end;

end.
