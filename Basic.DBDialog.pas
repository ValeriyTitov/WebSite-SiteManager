unit Basic.DBDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Dac.XDataSet, Vcl.ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls,
  StaticDlg.BasicModalDialog, cxButtons,  Common.ResourceStrings,
  Common.ValueWriter,
  Common.Consts;

type
  TBasicDBDlg = class(TBasicModalDialog)
    DataSource: TDataSource;
    procedure bnOKClick(Sender: TObject);
  private
    FDataSet:TXDataSet;
    FTableName: String;
    FParams: TParams;
    FID: Integer;
    FKeyField: String;
    FOwnerDataSet: TDataSet;
    function GetKeyField: String;
  Protected
    procedure DoAfterOpen(DataSet:TDataSet);virtual;
    procedure DoAfterInsert(DataSet:TDataSet);virtual;
    Procedure DoApplyUpdates; virtual;
    Procedure InitAfterOpenControls(DataSet:TDataSet);virtual;
    procedure EnterInsertingState;virtual;
    procedure EnterEditingState; virtual;
    procedure EnableEditingMode;virtual;
    procedure UpdateReadOnlyState;override;
    procedure SaveSize;
    procedure RestoreSize;
  public
   Property OwnerDataSet:TDataSet read FOwnerDataSet write FOwnerDataSet;
   Property DataSet: TXDataSet read FDataSet;
   Property Params:TParams read FParams;
   Property TableName:String read FTableName write FTableName;
   Property KeyField:String read GetKeyField write FKeyField;
   Property ID:Integer read FID write FID;
   Function Execute:Boolean; virtual;
   Procedure Initialize; virtual;

   Constructor Create(AOwner:TComponent); Override;
   Destructor Destroy; Override;
  end;

  TBasicDBDlgClass = class of TBasicDBDlg;

const
 DEFAULT_DLG_OPEN_STATEMENT = 'SELECT * FROM %S WITH (NOLOCK) WHERE %S=%D';

implementation

{$R *.dfm}

procedure TBasicDBDlg.bnOKClick(Sender: TObject);
begin
 if (not ReadOnly) then
  begin
   Self.DoApplyUpdates;
   Self.SaveSize;
  end;
  Self.ModalResult:=mrOK;
end;

constructor TBasicDBDlg.Create(AOwner: TComponent);
begin
  inherited;
  FParams:=TParams.Create;
  FDataSet:=TXDataSet.Create(Self);
  FDataSet.AfterOpen:=DoAfterOpen;
  FDataSet.AfterInsert:=DoAfterInsert;
  DataSource.DataSet:=DataSet;
  FID:=0;
  FTableName:='';
end;

destructor TBasicDBDlg.Destroy;
begin
  FParams.Free;
  inherited;
end;


procedure TBasicDBDlg.DoAfterInsert(DataSet: TDataSet);
begin

end;

procedure TBasicDBDlg.DoAfterOpen(DataSet: TDataSet);
begin
 InitAfterOpenControls(DataSet);
end;

procedure TBasicDBDlg.DoApplyUpdates;
begin
 if not ReadOnly then
   DataSet.ApplyUpdates(-1);
end;

procedure TBasicDBDlg.EnterEditingState;
begin
 DataSet.Edit;
end;

procedure TBasicDBDlg.EnterInsertingState;
begin
 DataSet.Append;
end;

procedure TBasicDBDlg.EnableEditingMode;
begin
  if (ID=-1) then
   EnterInsertingState
    else
   EnterEditingState;
end;

function TBasicDBDlg.Execute: Boolean;
begin
 Initialize;
 Result:=Showmodal=mrOK;
end;

function TBasicDBDlg.GetKeyField: String;
begin
  Result := FKeyField;
  if Result='' then
   raise Exception.CreateFmt('KeyField for dialog %s not defined',[ClassName]);
end;

procedure TBasicDBDlg.InitAfterOpenControls(DataSet: TDataSet);
begin

end;

procedure TBasicDBDlg.Initialize;
begin
 RestoreSize;
 DataSet.ProviderName:=Format(DEFAULT_DLG_OPEN_STATEMENT,[TableName, KeyField, ID]);
 DataSet.Open;
 if not ReadOnly then
  EnableEditingMode;
end;

procedure TBasicDBDlg.RestoreSize;
begin
 Width:=TProjectRegistry.ReadIntDef(BaseRegistryKeyDialogs,ClassName+'Width', Width);
 Height:=TProjectRegistry.ReadIntDef(BaseRegistryKeyDialogs,ClassName+'Height', Height);
end;

procedure TBasicDBDlg.SaveSize;
begin
 TProjectRegistry.WriteInt(BaseRegistryKeyDialogs,ClassName+'Width', Width);
 TProjectRegistry.WriteInt(BaseRegistryKeyDialogs,ClassName+'Height', Height);
end;

procedure TBasicDBDlg.UpdateReadOnlyState;
begin
  inherited;
  DataSet.ReadOnly:=Self.ReadOnly;
end;

end.
