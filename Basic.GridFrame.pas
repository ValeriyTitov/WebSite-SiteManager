unit Basic.GridFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.Frame, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Common.Images, System.Actions, Vcl.ActnList,cxGridDBDataDefinitions,
  dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TBasicGridFrame = class(TBasicFrame)
    MainGrid: TcxGrid;
    MainView: TcxGridDBTableView;
    MainLevel: TcxGridLevel;
    procedure MainViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure MainViewDblClick(Sender: TObject);
    procedure MainViewSelectionChanged(Sender: TcxCustomGridTableView);
    procedure MainViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FSelectedIDs:TStringList;
    procedure UpdateSelectedRow;

    procedure AddRowID(DataSet:TDataSet);
  protected
    procedure SetKeyField(const Value:String);Override;
    procedure ForEachSelectedRowDo(OnSelectedRow: TDataSetNotifyEvent);
  public
    function GetSelectedIDs:String;override;
    procedure RefreshDataSet;override;
    Constructor Create(AOwner:TComponent); override;
    Destructor Destroy; override;
    procedure InfoToList(List:TStrings); override;
  end;

implementation

{$R *.dfm}

procedure TBasicGridFrame.AddRowID(DataSet:TDataSet);
begin
 FSelectedIDs.Add(KeyFieldValue.ToString+',');
end;

constructor TBasicGridFrame.Create(AOwner: TComponent);
begin
  inherited;
  AddRecordAction.Enabled:=True;
  FSelectedIDs:=TStringList.Create;
  FSelectedIDs.LineBreak:='';
end;

procedure TBasicGridFrame.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  UpdateSelectedRow;
end;

destructor TBasicGridFrame.Destroy;
begin
  FSelectedIDs.Free;
  inherited;
end;

procedure TBasicGridFrame.ForEachSelectedRowDo(OnSelectedRow: TDataSetNotifyEvent);
var
 i: integer;
 Ctr: TcxGridDBDataController;
 RecID : Integer;
 RecIdx : Integer;
begin
 If not Assigned(OnSelectedRow) then exit;
 Ctr:=Self.MainView.DataController;
 Ctr.DataSet.DisableControls;
  try
   for i:=0 to ctr.GetSelectedCount-1 do
   begin
    RecIdx := Ctr.Controller.SelectedRecords[i].RecordIndex;
    RecID:= Ctr.GetRecordId(RecIdx);
    if (Ctr.DataSet.Locate(Ctr.KeyFieldNames,RecID,[loCaseInsensitive]))  then
     OnSelectedRow(Ctr.DataSet);
   end;
  finally
   Ctr.DataSet.EnableControls;
  end;
end;

function TBasicGridFrame.GetSelectedIDs: String;
begin
  FSelectedIDs.Clear;
  ForEachSelectedRowDo(AddRowID);
//  Result:=Self.KeyFieldValue.ToString;
  Result:=FSelectedIDs.Text;
//    Result:=SL.Text;
end;



procedure TBasicGridFrame.InfoToList(List:TStrings);
var
 x:Integer;
begin
  inherited;
  List.Add('');
  List.Add('Колонки:');
  for x:=0 to MainView.ColumnCount-1 do
    List.Add(MainView.Columns[x].Caption+' : '+MainView.Columns[x].DataBinding.FieldName);
end;

procedure TBasicGridFrame.MainViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
 if AViewInfo.GridRecord.Selected then
    ACanvas.Brush.Color:=$E5E5E5;
 if AViewInfo.Focused and AViewInfo.GridRecord.Focused then
   ACanvas.Brush.Color:=clSilver;

 ACanvas.Font.Color:=clBlack;
end;

procedure TBasicGridFrame.MainViewDblClick(Sender: TObject);
begin
if MainView.Controller.SelectedRecordCount>=1 then
  EditRecord;
end;

procedure TBasicGridFrame.MainViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 ProcessDefaultHotKey(Key,Shift);
end;

procedure TBasicGridFrame.MainViewSelectionChanged(Sender: TcxCustomGridTableView);
begin
 SelectionChanged(MainView.Controller.SelectedRowCount);
end;


procedure TBasicGridFrame.RefreshDataSet;
begin
 MainView.BeginUpdate(lsimImmediate);
 try
  inherited;
 finally
   MainView.EndUpdate;
 end;
UpdateSelectedRow;
end;

procedure TBasicGridFrame.SetKeyField(const Value: String);
begin
  inherited;
  MainView.DataController.KeyFieldNames:=Value;
end;

procedure TBasicGridFrame.UpdateSelectedRow;
begin
 MainView.Controller.ClearSelection;
  if Assigned(MainView.Controller.FocusedRow) then
     MainView.Controller.FocusedRow.Selected:=True;
end;

end.
