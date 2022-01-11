unit Basic.Frame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Generics.Collections, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls,  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter,  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DAC.XDataSet, DAC.ParamUtils,
  Basic.DBDialog, ActnList, System.Actions;

type
  TBasicFrame = class(TFrame)
    DataSource: TDataSource;
  private
    FDataSet:TXDataSet;
    FKeyField: String;
    FDialogClass: TBasicDBDlgClass;
    FActions: TObjectList<TAction>;
    FEditRecordAction:TAction;
    FAddRecordAction:TAction;
    FDeleteRecordAction:TAction;
    FDeleteSQLText: String;
    FAfterDocumentExecute: TNotifyEvent;
    FBeforeDocumentExecute: TNotifyEvent;
    FFilterField:string;
    FFilterValue:string;
    FUseLike:Boolean;
    FFilterHadError:Boolean;
    FAutoRefreshed:Boolean;
    FOnSelectionChanged: TNotifyEvent;
    FSelectedRecordCount: Integer;

    function GetKeyField: String;
    function InternalExecuteDialog(ID:Integer):Boolean;
    procedure CheckDialog;
    procedure CheckKeyField;
    procedure CreateDefaultActions;
    procedure InternalFilterRecord(DataSet:TDataSet; var Accept:Boolean);
    procedure FilterRecord(DataSet:TDataSet; var Accept:Boolean);
    procedure InternalDeleteRecord(Ids:String);
  protected
    Procedure ProcessDefaultHotKey(var Key: Word;  Shift: TShiftState); virtual;
    Procedure AddRecordExecute(Sender:TObject);
    Procedure EditRecordExecute(Sender:TObject);
    Procedure DeleteRecordExecute(Sender:TObject);
    procedure SetKeyField(const Value: String);virtual;
    procedure SelectionChanged(RecordsSelected:Integer); virtual;
    procedure DoBeforeDocumentExecute(Dlg:TBasicDBDlg);virtual;
    procedure DoAfterDocumentExecute;
    function CreateAction(const AName:String; const ACaption:String; const AImageIndex:Integer; const AEnabled:Boolean; DefaultAction:TNotifyEvent):TAction;
    procedure DoOnSelectionChanged;
  public
    procedure FilterDataSet(FieldName,FilterValue:String;UseLike:Boolean);
    Procedure AddRecord; virtual;
    Procedure EditRecord; virtual;
    Procedure DeleteRecord; virtual;
    procedure InfoToList(List:TStrings); virtual;
    procedure AutoRefresh;
    property DataSet: TxDataSet read FDataSet;
    property KeyField:String read GetKeyField write SetKeyField;
    property DialogClass :TBasicDBDlgClass read FDialogClass write FDialogClass;
    property SelectedRecordCount:Integer read FSelectedRecordCount;
    function KeyFieldValue:Integer;
    function GetSelectedIDs:String;virtual;
    function ActionByName(AName:String):TAction;
    procedure RefreshDataSet; virtual;
    constructor Create(AOwner:TComponent); Override;
    destructor Destroy; Override;
  published
    property EditRecordAction:TAction read FEditRecordAction ;
    property AddRecordAction:TAction read FAddRecordAction;
    property DeleteRecordAction:TAction read FDeleteRecordAction;
    property DeleteSQLText:String read FDeleteSQLText write FDeleteSQLText;
    property AfterDocumentExecute:TNotifyEvent read FAfterDocumentExecute write FAfterDocumentExecute;
    property BeforeDocumentExecute:TNotifyEvent read FBeforeDocumentExecute write FBeforeDocumentExecute;
    property OnSelectionChanged:TNotifyEvent read FOnSelectionChanged write FOnSelectionChanged;
  end;


const
 ACTION_NAME_ADD_RECORD='AddRecord';
 ACTION_NAME_EDIT_RECORD='EditRecord';
 ACTION_NAME_DELETE_RECORD='DeleteRecord';


implementation

{$R *.dfm}

{ TBasicFrame }

function TBasicFrame.ActionByName(AName: String): TAction;
var
 X:Integer;
begin
AName:=AnsiLowerCase(AName);
Result:=nil;
for x:=0 to FActions.Count-1 do
 if (AnsiLowerCase(FActions[x].Name)=AName) then
  begin
   Result:=FActions[x];
   exit;
  end;
if not Assigned(Result) then
 raise Exception.CreateFmt('Unable to find action %s', [AName]);
end;

procedure TBasicFrame.AddRecord;
begin
 InternalExecuteDialog(-1);
end;

procedure TBasicFrame.AddRecordExecute(Sender: TObject);
begin
 AddRecord;
end;

procedure TBasicFrame.AutoRefresh;
begin
 if FAutoRefreshed=False then
  begin
    FAutoRefreshed:=True;
    Self.RefreshDataSet;
  end;
end;

procedure TBasicFrame.CheckDialog;
begin
 if Not Assigned(DialogClass) then
  raise Exception.Create('Dialog is not assigned for this module');
end;

procedure TBasicFrame.CheckKeyField;
begin
 if FKeyField='' then
  raise Exception.Create('Key field is not defined!');
end;

constructor TBasicFrame.Create(AOwner: TComponent);
begin
  inherited;
  FDataSet:=TXDataSet.Create(Self);
  FDataSet.OnFilterRecord:=FilterRecord;
  DataSource.DataSet:=FDataSet;
  FActions:=TObjectList<TAction>.Create;
  CreateDefaultActions;
  DeleteSQLText:='';
  FAutoRefreshed:=False;
end;

Function TBasicFrame.CreateAction(const AName:String; const ACaption: String;  const AImageIndex: Integer; const AEnabled: Boolean;  DefaultAction: TNotifyEvent):TAction;
begin
 Result:=TAction.Create(Self);
 Result.Name:=AName;
 Result.Caption:=ACaption;
 Result.ImageIndex:=AImageIndex;
 Result.Enabled:=AEnabled;
 Result.OnExecute:=DefaultAction;
 FActions.Add(Result)
end;

procedure TBasicFrame.CreateDefaultActions;
begin
  FAddRecordAction:= CreateAction(ACTION_NAME_ADD_RECORD,'Добавить...',152,False,AddRecordExecute);
  FEditRecordAction:= CreateAction(ACTION_NAME_EDIT_RECORD,'Изменить...',41,False,EditRecordExecute);
  FDeleteRecordAction:= CreateAction(ACTION_NAME_DELETE_RECORD,'Удалить',182,False,DeleteRecordExecute);
end;

procedure TBasicFrame.DeleteRecord;
begin
 if MessageBox(Handle,'Вы уверены, что хотите удалить запись(и) ?','Подтверждение удаления',MB_YESNO+MB_ICONASTERISK)=ID_YES then
  InternalDeleteRecord(GetSelectedIDs);
//  MB_OK
end;

procedure TBasicFrame.DeleteRecordExecute(Sender: TObject);
begin
  DeleteRecord;
end;

destructor TBasicFrame.Destroy;
begin
  FActions.Free;
  inherited;
end;


procedure TBasicFrame.DoAfterDocumentExecute;
begin
 if Assigned(AfterDocumentExecute) then
  AfterDocumentExecute(Self);
 RefreshDataSet;
end;

procedure TBasicFrame.DoBeforeDocumentExecute(Dlg:TBasicDBDlg);
begin

end;

procedure TBasicFrame.DoOnSelectionChanged;
begin
 if Assigned(OnSelectionChanged) then
  OnSelectionChanged(Self);
end;

procedure TBasicFrame.EditRecord;
begin
 InternalExecuteDialog(DataSet.FieldByName(KeyField).AsInteger);
end;

procedure TBasicFrame.EditRecordExecute(Sender: TObject);
begin
 EditRecord;
end;

procedure TBasicFrame.FilterDataSet(FieldName, FilterValue: String;  UseLike: Boolean);
begin
  DataSet.Filtered:=False;
  FFilterField:=FieldName;
  FFilterValue:=AnsiLowerCase(FilterValue);
  FUseLike:=UseLike;
  FFilterHadError:=False;
  DataSet.Filtered:=(FieldName<>'') and (FilterValue<>'');
end;


procedure TBasicFrame.InternalFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
 S:String;
begin
 S:=AnsiLowerCase(DataSet.FieldByName(FFilterField).AsString);
 if FUseLike then
  Accept:=Pos(FFilterValue,S)>=1
   else
  Accept:=S=FFilterValue;
end;

procedure TBasicFrame.FilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
if FFilterHadError=false then
 try
  InternalFilterRecord(DataSet,Accept);
 except
   FFilterHadError:=True;
   raise;
 end;
end;

function TBasicFrame.GetKeyField: String;
begin
 CheckKeyField;
 Result:=FKeyField;
end;

function TBasicFrame.GetSelectedIDs: String;
begin
 Result:=KeyFieldValue.ToString;
end;

procedure TBasicFrame.InfoToList(List: TStrings);
begin
  List.Add('Название модуля: '+Name);
  List.Add('Основная процедура: '+Self.DataSet.ProviderName);
  List.Add('Процедура удаления: '+Self.DeleteSQLText);
  List.Add('Редактор: '+DialogClass.ClassName);
end;

procedure TBasicFrame.InternalDeleteRecord(Ids: String);
var
 Tmp:TXDataSet;
begin
 Tmp:=TXDataSet.Create(nil);
  try
   Tmp.ProviderName:=DeleteSQLText;
   Tmp.SetParameter('@IDs',IDs);
   Tmp.Execute;
   RefreshDataSet;
  finally
    Tmp.Free;
  end;
end;

function TBasicFrame.InternalExecuteDialog(ID: Integer): Boolean;
var
 Dlg:TBasicDBDlg;
begin
  CheckDialog;
  Dlg:=DialogClass.Create(nil);
  try
    Dlg.ID:=ID;
    Dlg.OwnerDataSet:=FDataSet;
    DoBeforeDocumentExecute(Dlg);
    Result:=Dlg.Execute;
    if Result then
      DoAfterDocumentExecute;
  finally
    Dlg.Free;
  end;
end;


function TBasicFrame.KeyFieldValue: Integer;
begin
 Result:=DataSet.FieldByName(KeyField).AsInteger;
end;

procedure TBasicFrame.ProcessDefaultHotKey(var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_RETURN:EditRecordAction.Execute;
  VK_DELETE:DeleteRecordAction.Execute;
  VK_INSERT:AddRecordAction.Execute;
 end;
end;

procedure TBasicFrame.RefreshDataSet;
var
 ID:Integer;
begin
 Screen.Cursor:=crHourGlass;
 try
  ID:=-1;
  if DataSet.Active then
  ID:=KeyFieldValue;
  FDataSet.Close;
  FDataSet.OpenOrExecute;
  DataSet.Locate(KeyField,ID,[]);
 finally
  Screen.Cursor:=crDefault;
 end;
end;



procedure TBasicFrame.SelectionChanged(RecordsSelected: Integer);
var
 AEnabled:Boolean;
begin
 FSelectedRecordCount:=RecordsSelected;
 AEnabled:=RecordsSelected>0;
 EditRecordAction.Enabled:=AEnabled;
 DeleteRecordAction.Enabled:=AEnabled and (DeleteSQLText<>'');
 DoOnSelectionChanged;
end;


procedure TBasicFrame.SetKeyField(const Value: String);
begin
  FKeyField := Value;
  FDataSet.KeyField:=Value;
end;



end.
