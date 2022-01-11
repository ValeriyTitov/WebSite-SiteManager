unit DAC.XDataSet;

interface
Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  FireDAC.Stan.Intf,DB, Dac.ConnectionMngr, DAC.ParamUtils,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef;


type
 TCachePolicy = (cpAuto, cpForceOn, cpForceOff);

 TXDataSet=class(TFDMemTable)
  strict private
    FParams: TParams;
    FKeyField: String;
    FDBName: String;
    FCommand:TFDCommand;
    FAdapter: TFDTableAdapter;
    FParamsInitialized:Boolean;
    procedure SetProvider(const Value: String);
    function GetProviderName: String;
    procedure SetDBName(const Value: String);
    function GetConnection: TFDCustomConnection;
    procedure SetConnection(const Value: TFDCustomConnection);
    function InternalGetKeyField:String;
   private
    FUpdateError:string;
    function GetKeyField: String;
    procedure ExecuteUpdateError(ASender: TDataSet; AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction);
   protected
    Procedure OpenCursor(InfoQuery:Boolean); Override;
    Procedure InitializeParams;
    function DoApplyUpdates(ATable: TFDDatSTable; AMaxErrors: Integer): Integer; override;
   public
    constructor Create(AOwner:TComponent); Override;
    destructor Destroy; Override;
    procedure SetParameter(ParamName:String; Value:OLEVariant);
    procedure Execute(ATimes: Integer = 0; AOffset: Integer = 0);override;
    property ProviderName:String read GetProviderName write SetProvider;
    property DBName:String read FDBName write SetDBName;
    property Params:TParams read FParams;
    property KeyField:String read GetKeyField write FKeyField;
    Property Connection:TFDCustomConnection read GetConnection write SetConnection;
 end;
implementation

function ProviderIsStoredProc(ProviderName:String):Boolean;
begin
  Result:=Pos(' ',ProviderName)<=0;
end;

{ TXDataSet }

constructor TXDataSet.Create(AOwner: TComponent);
begin
  inherited;
  FParams:=TParams.Create;
  FCommand:=TFDCommand.Create(Self);
  FCommand.Prepared:=False;
//  FCommand.FetchOptions.Items:=[fiBlobs, fiDetails];
  FAdapter:=TFDTableAdapter.Create(Self);
  FAdapter.SelectCommand:=FCommand;
  Adapter:=FAdapter;
  DBName:='';
  FParamsInitialized:=False;
  CachedUpdates:=True;
  Self.OnUpdateError:= ExecuteUpdateError;
end;


destructor TXDataSet.Destroy;
begin
  FParams.Free;
  inherited;
end;


function TXDataSet.DoApplyUpdates(ATable: TFDDatSTable;  AMaxErrors: Integer): Integer;
begin
 Self.FUpdateError:='';
 Result:=inherited DoApplyUpdates(ATable,AMaxErrors);
 if Self.FUpdateError.IsEmpty=False then
  raise Exception.Create(FUpdateError);
end;

procedure TXDataSet.Execute(ATimes: Integer = 0; AOffset: Integer = 0);
begin
 if Not FParamsInitialized  then
  InitializeParams;
  TParamUtils.CloneExistingParamValues(Params,FCommand.Params);
  inherited;
end;

procedure TXDataSet.ExecuteUpdateError(ASender: TDataSet;
  AException: EFDException; ARow: TFDDatSRow; ARequest: TFDUpdateRequest;
  var AAction: TFDErrorAction);
begin
 FUpdateError:=AException.Message;
end;

procedure TXDataSet.SetConnection(const Value: TFDCustomConnection);
begin
 FCommand.Connection:=Value;
end;

procedure TXDataSet.SetDBName(const Value: String);
begin
 ConnectionManager.SetConnection(FCommand,Value);
 FDBName := Value;
end;

procedure TXDataSet.SetParameter(ParamName: String; Value: OLEVariant);
begin
 TParamUtils.SetParamEx(Params,ParamName,Value);
end;


function TXDataSet.GetConnection: TFDCustomConnection;
begin
 Result:=FCommand.Connection;
end;


function TXDataSet.GetKeyField: String;
begin
 if FKeyField='' then
  Result:=InternalGetKeyField
   else
  Result := FKeyField;
end;

function TXDataSet.GetProviderName: String;
begin
 Result:=FCommand.CommandText.Text;
end;


procedure TXDataSet.InitializeParams;
begin
if FCommand.CommandKind=skStoredProc then
   FCommand.FillParams(FCommand.Params);
 FParamsInitialized:=True;
end;

function TXDataSet.InternalGetKeyField: String;
var
 X:integer;
begin
Result:='';
if Active then
 for x:=0 to FieldCount-1 do
  if Pos('ID',Fields[x].FieldName)>=1 then
   begin
     Result:=Fields[x].FieldName;
     FKeyField:=Result;
     Exit;
   end;


end;

procedure TXDataSet.OpenCursor(InfoQuery: Boolean);
begin
 if Not FParamsInitialized  then
  InitializeParams;
  TParamUtils.CloneExistingParamValues(Params,FCommand.Params);
  inherited;
end;

procedure TXDataSet.SetProvider(const Value: String);
begin
 FParamsInitialized:=False;
 if ProviderIsStoredProc(Value) then
  FCommand.CommandKind:=skStoredProc
   else
  FCommand.CommandKind:=skSelect;
  FCommand.CommandText.Text:=Value;
end;

end.
