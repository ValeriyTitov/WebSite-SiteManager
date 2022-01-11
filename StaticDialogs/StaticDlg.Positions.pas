unit StaticDlg.Positions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.DBDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, cxLabel, cxTextEdit, cxDBEdit, Data.DB, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, Common.Images, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxGroupBox, cxRadioGroup, ControlFiller,  DAC.XDataSet,
  cxCheckBox;

type
  TPositionsDlg = class(TBasicDBDlg)
    edPostionName: TcxDBTextEdit;
    edOrderID: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cbImageIndex: TcxDBImageComboBox;
    cbDepatmentList: TcxDBImageComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    rgItemType: TcxDBRadioGroup;
    cbIsBoss: TcxDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cxDBRadioGroup1PropertiesEditValueChanged(Sender: TObject);
    procedure rgItemTypePropertiesChange(Sender: TObject);
    private
     function FindMaxOrderId:Integer;
     Procedure FillImages;
     Procedure FillOwnersDropDown;
    protected
     Procedure ItemTypeChanged(Sender:TField);
     Procedure DoAfterInsert(DataSet:TDataSet);override;
     Procedure DoAfterOpen(DataSet:TDataSet);override;
    public
     Procedure Initialize;Override;
  end;

implementation

{$R *.dfm}

procedure TPositionsDlg.cxDBRadioGroup1PropertiesEditValueChanged(Sender: TObject);
begin
 if DataSet.State in [dsInsert] then
  DataSet.Fields.FieldByName('ItemType').Value:=rgItemType.Properties.Items[rgItemType.ItemIndex].Value;
end;

procedure TPositionsDlg.DoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ItemType').AsInteger:=0;
  DataSet.FieldByName('OrderId').AsInteger:=FindMaxOrderId;

  if Assigned(OwnerDataSet) and OwnerDataSet.Active then
   begin
    if OwnerDataSet.FieldByName('ItemType').AsInteger=1 then //folder
       DataSet.FieldByName('OwnerID').AsInteger:=OwnerDataSet.FieldByName('DepartmentPositionsID').AsInteger
        else
       DataSet.FieldByName('OwnerID').AsInteger:=OwnerDataSet.FieldByName('OwnerID').AsInteger
   end;
end;

procedure TPositionsDlg.DoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.Fields.FieldByName('ItemType').OnChange:=ItemTypeChanged;
end;


procedure TPositionsDlg.FillImages;
var
 X:Integer;
 P:TcxImageComboBoxItem;
begin
 if Assigned(cbImageIndex.Properties.Images) then
  for x:=0 to cbImageIndex.Properties.Images.Count-1 do
   begin
    P:=cbImageIndex.Properties.Items.Add;
    P.ImageIndex:=X;
    P.Description:=X.ToString;
    P.Value:=X.ToString;
   end;
end;

procedure TPositionsDlg.FillOwnersDropDown;
begin
 TControlFiller.AddDropDownItem(cbDepatmentList,101,'<Корень>', NULL);
 TControlFiller.FillDropDown(cbDepatmentList,'spui_DepartmentList','');
end;

function TPositionsDlg.FindMaxOrderId: Integer;
var
 Tmp:TxDataSet;
begin
 Tmp:=TxDataSet.Create(nil);
 try
  Tmp.ProviderName:='spui_FindMaxOrderId';
  Tmp.Open;
  Result:=Tmp.FieldByName('MaxOrderId').AsInteger;
 finally
  Tmp.Free;
 end;
end;

procedure TPositionsDlg.FormCreate(Sender: TObject);
begin
  inherited;
  TableName:='DepartmentPositions';
  KeyField:='DepartmentPositionsID';
end;


procedure TPositionsDlg.Initialize;
begin
  inherited;
  FillOwnersDropDown;
  FillImages;
end;

procedure TPositionsDlg.ItemTypeChanged(Sender: TField);
begin
 if (Sender.Value=0) then
  begin
   DataSet.FieldByName('Description').AsString:='Специалист';
   DataSet.FieldByName('ImageIndex').AsInteger:=142;
   Self.cbIsBoss.Visible:=True;
  end
   else
  begin
   DataSet.FieldByName('Description').AsString:='Новый отдел';
   DataSet.FieldByName('ImageIndex').AsInteger:=80;
   Self.cbIsBoss.Visible:=False;
  end;
end;

procedure TPositionsDlg.rgItemTypePropertiesChange(Sender: TObject);
begin
  inherited;
  cbIsBoss.Visible:=Self.rgItemType.EditingValue=0;
end;

end.
