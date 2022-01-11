unit StaticFrame.Employee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.Frame, Basic.GridFrame, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, dxtree, dxdbtree,
  Basic.TreeGridFrame, StaticDlg.Employee, Common.Images, SelectTreeDlg,
  cxImageComboBox, System.Actions, Vcl.ActnList, DAC.XDataSet,
  cxCheckBox, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TStaticFrameEmployee = class(TBasicGridFrame)
    colFullName: TcxGridDBColumn;
    colGender: TcxGridDBColumn;
    colPosition: TcxGridDBColumn;
    colEmail: TcxGridDBColumn;
    colRoomNumber: TcxGridDBColumn;
    colPhone: TcxGridDBColumn;
    colActive: TcxGridDBColumn;
    colStateEmployee: TcxGridDBColumn;
    colDepDescription: TcxGridDBColumn;
    colPhoto: TcxGridDBColumn;
    procedure MainViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);

  private
    FMoveEmployeeAction:TAction;
    FActivateEmployeeAction:TAction;
    FImportEmployeesAction:TAction;
    procedure InternalChangeEmployeeActivity;
    procedure MoveEmployeeExecute(Sender: TObject);
    procedure ActivateEmployeeExecute(Sender: TObject);
    procedure InternalMoveEmployee(DepID:Integer);
  public
   procedure SelectionChanged(RecordsSelected:Integer);override;
   Procedure RefreshDataSet; Override;
   Procedure MoveEmployee;
   constructor Create(AOwner:TComponent);Override;
  published
  end;

implementation

{$R *.dfm}

{ TStaticFrameEmployee }

procedure TStaticFrameEmployee.ActivateEmployeeExecute(Sender: TObject);
begin
 InternalChangeEmployeeActivity;
end;

constructor TStaticFrameEmployee.Create(AOwner: TComponent);
begin
  inherited;
  DataSet.ProviderName:='spui_EmployeeList';
  KeyField:='EmployeesID';
  DialogClass:= TEmployeeDlg;
  AddRecordAction.ImageIndex:=351;
  EditRecordAction.ImageIndex:=308;
  DeleteRecordAction.ImageIndex:=309;
  FMoveEmployeeAction:=CreateAction('MoveEmployee','Перевести..',108,False,MoveEmployeeExecute);
  FActivateEmployeeAction:=CreateAction('ActivateEmployee','Активен/не активен',321,False,ActivateEmployeeExecute);
  DeleteSQLText:='spui_DeleteEmployee';
end;

procedure TStaticFrameEmployee.InternalChangeEmployeeActivity;
var
 Tmp:TxDataSet;
begin
  Tmp:=TxDataSet.Create(nil);
  try
   Tmp.ProviderName:='spui_SetEmployeeActivity';
   Tmp.SetParameter('EmployeesID',KeyFieldValue);
   Tmp.SetParameter('Active',not DataSet.FieldByName('Active').AsBoolean);
   Tmp.Execute;
   RefreshDataSet;
  finally
   Tmp.Free;
  end;
end;

procedure TStaticFrameEmployee.InternalMoveEmployee(DepID: Integer);
var
 Tmp:TxDataSet;
begin
  Tmp:=TxDataSet.Create(nil);
  try
   Tmp.ProviderName:='spui_MoveEmployee';
   Tmp.SetParameter('EmployeesID',KeyFieldValue);
   Tmp.SetParameter('DepartmentPositionsID', DepID);
   Tmp.Execute;
   DoAfterDocumentExecute;
   RefreshDataSet;
  finally
   Tmp.Free;
  end;
end;

procedure TStaticFrameEmployee.MainViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if  AViewInfo.GridRecord.Values[Self.colActive.Index]=False then
   ACanvas.Font.Color:=clSilver;
//   ACanvas.Font.Style:=[fsStrikeOut];
end;

procedure TStaticFrameEmployee.MoveEmployee;
var
 Dlg:TSelectTreeDialog;
begin
 Dlg:=TSelectTreeDialog.Create(nil);
  try
   Dlg.DataSet.ProviderName:='spui_DepartmentPostionList';
   Dlg.KeyField:='DepartmentPositionsID';
   Dlg.EnabledField:='ItemType';
   Dlg.EnabledValue:=0;
   if Dlg.Execute then
    InternalMoveEmployee(Dlg.SelectedValue);
  finally
   Dlg.Free;
  end;
end;

procedure TStaticFrameEmployee.MoveEmployeeExecute(Sender: TObject);
begin
 MoveEmployee;
end;

procedure TStaticFrameEmployee.RefreshDataSet;
begin
  inherited;
end;

procedure TStaticFrameEmployee.SelectionChanged(RecordsSelected: Integer);
var
 AEnabled:Boolean;
begin
  inherited;
  AEnabled:=RecordsSelected>0;
  FMoveEmployeeAction.Enabled:=AEnabled;
  FActivateEmployeeAction.Enabled:=AEnabled;
  FImportEmployeesAction.Enabled:=DataSet.Active;
end;

end.
