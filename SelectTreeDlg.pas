unit SelectTreeDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Common.Images, DAC.XDataSet, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.ComCtrls, dxtree,
  dxdbtree, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Data.DB, cxControls,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxTLData, cxDBTL, cxMaskEdit,
  Common.ValueWriter,
  Common.Consts,

  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TSelectTreeDialog = class(TForm)
    Panel1: TPanel;
    bnOK: TcxButton;
    bnCancel: TcxButton;
    DataSource: TDataSource;
    TreeView: TcxDBTreeList;
    colDescription: TcxDBTreeListColumn;
    procedure TreeViewDblClick(Sender: TObject);
    procedure TreeViewSelectionChanged(Sender: TObject);
    procedure TreeViewCustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
  private
    FEnabledField: String;
    FDataSet: TxDataSet;
    FEnabledValue: variant;
    FSelectedValue: Variant;
    FSelectedDescription: string;
    FLocateID: Variant;
    procedure TryEnabledOKButton;
    procedure ValidCheck;
    procedure SetKeyField(const Value: String);
    procedure SetOwnerField(const Value: String);
    function GetKeyField: String;
    function GetOwnerField: String;
    function GetImageIndexField: string;
    procedure SetImageIndexField(const Value: string);
    function GetDescriptionField: string;
    procedure SetDescriptionField(const Value: string);
    procedure SetEnabledField(const Value: string);
  protected
    procedure SaveSize;
    procedure RestoreSize;
  public
    property DataSet:TxDataSet read FDataSet;
    property EnabledField:string read FEnabledField write SetEnabledField;
    property EnabledValue:variant read FEnabledValue write FEnabledValue;
    property KeyField:string read GetKeyField write SetKeyField;
    property OwnerField:string read GetOwnerField write SetOwnerField;
    property ImageIndexField:string read GetImageIndexField write SetImageIndexField;
    property DescriptionField:string read GetDescriptionField write SetDescriptionField;
    property SelectedValue:Variant read FSelectedValue;
    property SelectedDescription:string read FSelectedDescription;
    property LocateID: Variant read FLocateID write FLocateID;
    constructor Create(AOwner:TComponent); override;
    function Execute:Boolean;
  end;

implementation

{$R *.dfm}

{ TSelectTreeDialog }

constructor TSelectTreeDialog.Create(AOwner: TComponent);
begin
  inherited;
  LocateID:=NULL;
  FSelectedDescription:='';
  FSelectedValue:=NULL;
  FDataSet:=TXDataSet.Create(Self);
  DataSource.DataSet:=FDataSet;
  ImageIndexField:='ImageIndex';
  OwnerField:='OwnerID';
  DescriptionField:='Description';
  EnabledValue:=1;
end;

function TSelectTreeDialog.Execute: Boolean;
begin
 ValidCheck;
 FDataSet.Open;
 if not VarIsNull(LocateID) then
  FDataSet.Locate(KeyField,LocateID,[]);

 TreeView.FullExpand;
 RestoreSize;
 Result:=ShowModal=mrOK;
 if Result then
  begin
   Self.SaveSize;
   FSelectedValue:=DataSet.FieldByName(KeyField).Value;
   FSelectedDescription:=DataSet.FieldByName(DescriptionField).AsString;
  end;
end;

function TSelectTreeDialog.GetDescriptionField: string;
begin
 Result:=colDescription.DataBinding.FieldName;
end;

function TSelectTreeDialog.GetImageIndexField: string;
begin
 Result:=TreeView.DataController.ImageIndexField;
end;

function TSelectTreeDialog.GetKeyField: String;
begin
 Result:=TreeView.DataController.KeyField;
end;

function TSelectTreeDialog.GetOwnerField: String;
begin
 Result:=TreeView.DataController.ParentField;
end;

procedure TSelectTreeDialog.RestoreSize;
begin
 Width:=TProjectRegistry.ReadIntDef(BaseRegistryKeyDialogs,ClassName+'Width', Width);
 Height:=TProjectRegistry.ReadIntDef(BaseRegistryKeyDialogs,ClassName+'Height', Height);
end;

procedure TSelectTreeDialog.SaveSize;
begin
 TProjectRegistry.WriteInt(BaseRegistryKeyDialogs,ClassName+'Width', Width);
 TProjectRegistry.WriteInt(BaseRegistryKeyDialogs,ClassName+'Height', Height);
end;

procedure TSelectTreeDialog.SetDescriptionField(const Value: string);
begin
 colDescription.DataBinding.FieldName:=Value;
end;

procedure TSelectTreeDialog.SetEnabledField(const Value: string);
begin
  FEnabledField := Value;
  bnOK.Enabled:=Value='';
end;

procedure TSelectTreeDialog.SetImageIndexField(const Value: string);
begin
 TreeView.DataController.ImageIndexField:=Value;
end;

procedure TSelectTreeDialog.SetKeyField(const Value: String);
begin
  TreeView.DataController.KeyField:=Value;
  DataSet.KeyField:=Value;
end;


procedure TSelectTreeDialog.SetOwnerField(const Value: String);
begin
 TreeView.DataController.ParentField:=Value;
end;

procedure TSelectTreeDialog.TreeViewCustomDrawDataCell(
  Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.Focused then
  ACanvas.Brush.Color:=clSilver;
end;

procedure TSelectTreeDialog.TreeViewDblClick(Sender: TObject);
begin
 if bnOK.Enabled then
  bnOk.Click;
end;

procedure TSelectTreeDialog.TreeViewSelectionChanged(Sender: TObject);
begin
 TryEnabledOKButton;
end;

procedure TSelectTreeDialog.TryEnabledOKButton;
var
 F:TField;
begin
 F:=DataSet.FindField(EnabledField);
 if Assigned(F) then
  bnOK.Enabled:=F.Value=EnabledValue;
end;

procedure TSelectTreeDialog.ValidCheck;
begin
 if (KeyField='') then
  raise Exception.Create('KeyField is not defined in Tree View');
end;

end.
