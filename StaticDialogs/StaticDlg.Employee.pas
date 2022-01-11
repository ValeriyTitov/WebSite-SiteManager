unit StaticDlg.Employee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.DBDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Data.DB, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxImageComboBox, cxLabel, ControlFiller,  SelectTreeDlg,
  cxButtonEdit, DAC.XDataSet, cxImage, cxCheckBox, Vcl.Buttons, cxMemo,
  Common.ApplicationSettings, WinApi.ShellApi, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxPC, DateUtils,
  Common.Images;
type
  TEmployeeDlg = class(TBasicDBDlg)
    ImageDataSource: TDataSource;
    pgMain: TcxPageControl;
    Tab0: TcxTabSheet;
    Tab1: TcxTabSheet;
    lbOpenUrl: TLabel;
    edFullName: TcxDBTextEdit;
    edMobilePhone: TcxDBTextEdit;
    deBirthDate: TcxDBDateEdit;
    edPhone: TcxDBTextEdit;
    edRoomNumber: TcxDBTextEdit;
    edEmail: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel8: TcxLabel;
    edEP: TcxDBButtonEdit;
    rbGender: TcxDBRadioGroup;
    imPhoto: TcxDBImage;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxLabel7: TcxLabel;
    edMessengerNumber: TcxDBTextEdit;
    memUrl: TcxMemo;
    lbUrl: TcxLabel;
    gridMissingDBTableView1: TcxGridDBTableView;
    gridMissingLevel1: TcxGridLevel;
    gridMissing: TcxGrid;
    colMissingStartDate: TcxGridDBColumn;
    colMissingEndDate: TcxGridDBColumn;
    colMissingReason: TcxGridDBColumn;
    dsMissings: TDataSource;
    PopupMenu1: TPopupMenu;
    miAdd: TMenuItem;
    miDelete: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edEPPropertiesEditValueChanged(Sender: TObject);
    procedure lbOpenUrlClick(Sender: TObject);
    procedure lbOpenUrlMouseEnter(Sender: TObject);
    procedure lbOpenUrlMouseLeave(Sender: TObject);
    procedure miAddClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure gridMissingDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
   FMissingsDS:TxDataSet;
   FPhotoDS:TxDataSet;
   FOpenUrl:String;
   procedure MoveEmployee;
   Function FindPostionName(ID:Integer):String;
  protected
   procedure DoAfterInsert(DataSet:TDataSet); override;
   procedure DoAfterMissingInsert(DataSet:TDataSet);
   procedure DoAfterOpen(DataSet:TDataSet); override;
   procedure DoApplyUpdates;override;
   procedure CreateHttpLinks;
   procedure DisableOpenUrl;
   procedure EnableLink(Value: Boolean);


  public
   Procedure Initialize; override;
  end;

implementation

{$R *.dfm}

procedure TEmployeeDlg.CreateHttpLinks;
const
 ALink = '/home/Employee?ID=';
 ATag = '<a href="%s">%s</a>';
var
 Link:String;
begin
 Link:=ALink+DataSet.FieldByName('EmployeesID').AsString;
 FOpenUrl:=ApplicationSettings.WebServerAddress+Link;
 memUrl.Lines.Text:=Format(ATag,[Link,DataSet.FieldByName('FullName').AsString]);
 if not ApplicationSettings.WebServerValid then
   DisableOpenUrl
    else
   lbOpenUrl.Hint:=FOpenUrl;
end;

procedure TEmployeeDlg.cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 MoveEmployee;
end;

procedure TEmployeeDlg.DisableOpenUrl;
begin
 lbOpenUrl.Caption:='<Сервер не задан>';
 lbOpenUrl.Hint:='Адрес Вэб-сервера не задан в настройках программы.';
 lbOpenUrl.Left:=140;
 lbOpenUrl.Enabled:=False;
end;

procedure TEmployeeDlg.DoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Active').AsBoolean:=True;
  DataSet.FieldByName('StateEmployee').AsBoolean:=True;
  DataSet.FieldByName('ShowBirthday').AsBoolean:=True;
  //bnRandomData.Visible:=True;
  EnableLink(False);
  Tab1.Enabled:=False;
end;

procedure TEmployeeDlg.DoAfterMissingInsert(DataSet: TDataSet);
begin
 DataSet.FieldByName('StartDate').AsDateTime:=Today;
 DataSet.FieldByName('EndDate').AsDateTime:=Today+1;
 DataSet.FieldByName('Reason').AsString:='Отпуск';
 DataSet.FieldByName('EmployeesId').AsInteger:=Self.DataSet.FieldByName('EmployeesId').AsInteger;
end;

procedure TEmployeeDlg.DoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CreateHttpLinks;
  EnableLink(True);
end;

procedure TEmployeeDlg.DoApplyUpdates;
begin
 if (FPhotoDS.State in [dsInsert, dsEdit]) then
  begin
   FPhotoDS.FieldByName('Description').AsString:=DataSet.FieldByName('FullName').AsString;
   FPhotoDS.ApplyUpdates(-1);
   DataSet.FieldByName('ImagesID').AsInteger:=FPhotoDS.FieldByName('ImagesID').AsInteger;
  end;

  if (FMissingsDS.State in [dsInsert, dsEdit]) then
  begin
   FMissingsDS.Post;
   FMissingsDS.ApplyUpdates(-1);
  end;

  inherited;
end;

procedure TEmployeeDlg.edEPPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  edEP.Text:=FindPostionName(edEP.DataBinding.Field.AsInteger);
end;

procedure TEmployeeDlg.EnableLink(Value: Boolean);
begin
 memUrl.Visible:=Value;
 lbUrl.Visible:=Value;
 lbOpenUrl.Visible:=Value;
end;

function TEmployeeDlg.FindPostionName(ID: Integer): String;
var
 Tmp:TxDataSet;
begin
 Tmp:=TxDataSet.Create(nil);
  try
   Tmp.ProviderName:='spui_DepartmentPostionList';
   Tmp.Open;
   if Tmp.Locate('DepartmentPositionsID',ID,[]) then
    Result:=Tmp.FieldByName('Description').AsString
     else
    Result:='<Не известно>'
  finally
   Tmp.Free;
  end;
end;

procedure TEmployeeDlg.FormCreate(Sender: TObject);
begin
  inherited;
  FPhotoDS:=TxDataSet.Create(Self);
  ImageDataSource.DataSet:=FPhotoDs;
  TableName:='Employees';
  KeyField:='EmployeesID';

  FMissingsDS:=TxDataSet.Create(Self);
  FMissingsDS.AfterInsert:=DoAfterMissingInsert;
  dsMissings.DataSet:=FMissingsDs;

end;

procedure TEmployeeDlg.gridMissingDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.GridRecord.Selected then
    ACanvas.Brush.Color:=$E5E5E5;
 if AViewInfo.Focused and AViewInfo.GridRecord.Focused then
   ACanvas.Brush.Color:=clSilver;

 ACanvas.Font.Color:=clBlack;
end;

procedure TEmployeeDlg.Initialize;
begin
  inherited;
  FPhotoDS.ProviderName:=Format(DEFAULT_DLG_OPEN_STATEMENT,['Images','ImagesID', DataSet.FieldByName('ImagesID').AsInteger]);
  FPhotoDS.Open;
  if not ReadOnly then
   begin
    if FPhotoDS.IsEmpty then
     FPhotoDs.Append
      else
     FPhotoDS.Edit;
   end;

  FMissingsDS.ProviderName:=Format(DEFAULT_DLG_OPEN_STATEMENT,['EmployeesMssings','EmployeesId', DataSet.FieldByName('EmployeesId').AsInteger]);
  FMissingsDS.Open;
end;

procedure TEmployeeDlg.lbOpenUrlClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PWideChar(FOpenUrl),nil, nil, SW_SHOWNORMAL);
end;

procedure TEmployeeDlg.lbOpenUrlMouseEnter(Sender: TObject);
begin
 lbOpenUrl.Font.Style:=[fsUnderline];
end;

procedure TEmployeeDlg.lbOpenUrlMouseLeave(Sender: TObject);
begin
 lbOpenUrl.Font.Style:=[];
end;

procedure TEmployeeDlg.miAddClick(Sender: TObject);
begin
 FMissingsDS.Append;
end;

procedure TEmployeeDlg.miDeleteClick(Sender: TObject);
begin
 Self.FMissingsDS.Delete;
end;

procedure TEmployeeDlg.MoveEmployee;
var
 Dlg:TSelectTreeDialog;
begin
 Dlg:=TSelectTreeDialog.Create(nil);
  try
   Dlg.DataSet.ProviderName:='spui_DepartmentPostionList';
   Dlg.KeyField:='DepartmentPositionsID';
   Dlg.EnabledField:='ItemType';
   Dlg.EnabledValue:=0;
   Dlg.LocateID:=DataSet.FieldByName('DepartmentPositionsID').AsInteger;
   if Dlg.Execute then
    begin
     DataSet.FieldByName('DepartmentPositionsID').AsInteger:=Dlg.SelectedValue;
     edEP.Text:=Dlg.SelectedDescription;
    end;
  finally
   Dlg.Free;
  end;
end;

procedure TEmployeeDlg.PopupMenu1Popup(Sender: TObject);
begin
 Self.miDelete.Enabled:=Self.gridMissingDBTableView1.Controller.SelectedRowCount>0;
end;

end.
