unit Common.PipeList;

interface
 uses System.Generics.Collections, Windows, SysUtils, Common.Consts,
      Classes, Common.ValueWriter;

 type
  TPipe = class
   public
    PipeName:string;
    ConnectionString:string;
    AskPassword:boolean;
  end;

  TPipeList = class
  private
    FPipes: TObjectList<TPipe>;
    FLastPipe: string;
    FSaveUserName: Boolean;
    FLastUserName: string;
    procedure RaiseNoPipe(PipeName:String);
  public
    property SaveUserName:Boolean read FSaveUserName write FSaveUserName;
    property LastPipe:string read FLastPipe write FLastPipe;
    property LastUserName:string read FLastUserName write FLastUserName;
    property Pipes : TObjectList<TPipe> read FPipes;
    function PipeByName(PipeName:String):TPipe;
    procedure AddPipe(const PipeName, cs:String; const AskPassword:Boolean);
    procedure SavePipes;
    procedure LoadPipes;
    procedure SaveCommon;
    procedure LoadCommon;

    constructor Create;
    destructor Destroy; override;
    class function DefaultPipe:TPipeList;
   end;


implementation

const
 RegKeyConnectionString = 'ConnectionString';
 RegKeyAskPassword = 'AskPassword';
 RegKeyLastPipe = 'LastPipe';
 RegKeySaveUserName = 'SaveUserName';
 RegKeyLastUserName = 'LastUserName';


var
 DefPipe:TPipeList;
{ TPipeList }

procedure TPipeList.AddPipe(const PipeName, cs: String; const AskPassword: Boolean);
var
 P:TPipe;
begin
 P:=TPipe.Create;
 P.PipeName:=PipeName;
 P.ConnectionString:=cs;
 P.AskPassword:=AskPassword;
 Pipes.Add(P);
end;

constructor TPipeList.Create;
begin
FPipes:=TObjectList<TPipe>.Create;
end;

class function TPipeList.DefaultPipe: TPipeList;
begin
 Result:=DefPipe;
end;

destructor TPipeList.Destroy;
begin
  FPipes.Free;
  inherited;
end;


procedure TPipeList.LoadCommon;
begin
 SaveUserName:=TProjectRegistry.ReadIntDef(BaseRegistryKeyProjects,RegKeySaveUserName,0)<>0;
 LastPipe:=TProjectRegistry.ReadStringDef(BaseRegistryKeyProjects,RegKeyLastPipe,'');
 LastUserName:=TProjectRegistry.ReadStringDef(BaseRegistryKeyProjects,RegKeyLastUserName,'');
end;

procedure TPipeList.LoadPipes;
var
 SL:TStringList;
 X:Integer;
begin
 SL:=TStringList.Create;
  try
   Pipes.Clear;
   TProjectRegistry.GetKeyNames(BaseRegistryKeyProjects, SL);
    for x:=0 to SL.Count-1 do
      AddPipe(SL[x],
         TProjectRegistry.ReadStringDef(BaseRegistryKeyProjects+SL[x],RegKeyConnectionString,''),
         TProjectRegistry.ReadIntDef(BaseRegistryKeyProjects+SL[x],RegKeyAskPassword,1)<>0);
  finally
   SL.Free;
  end;
 LoadCommon;
end;


function TPipeList.PipeByName(PipeName: String): TPipe;
var
 X:Integer;
begin
 for x:=0 to Pipes.Count-1 do
  begin
   Result:=Pipes[x];
   if Result.PipeName=PipeName then
    exit;
  end;
 Result:=nil;
 RaiseNoPipe(PipeName);
end;

procedure TPipeList.RaiseNoPipe(PipeName:String);
resourcestring
 S_INVALID_PIPE_FMT = 'Invalid pipe name: %s';
begin
 raise Exception.CreateFmt(S_INVALID_PIPE_FMT,[PipeName]);
end;

procedure TPipeList.SaveCommon;
begin
 TProjectRegistry.WriteInt(BaseRegistryKeyProjects,RegKeySaveUserName,Integer(SaveUserName));
 TProjectRegistry.WriteString(BaseRegistryKeyProjects,RegKeyLastPipe,LastPipe);
 TProjectRegistry.WriteString(BaseRegistryKeyProjects,RegKeyLastUserName,LastUserName);
end;

procedure TPipeList.SavePipes;
var
 x:Integer;
 Path:string;
begin
TProjectRegistry.DeleteKeys(BaseRegistryKeyProjects);
 for x:=0 to Pipes.Count-1 do
  begin
   Path:=BaseRegistryKeyProjects+Pipes[x].PipeName;
   TProjectRegistry.WriteString(Path,RegKeyConnectionString, Pipes[x].ConnectionString);
   TProjectRegistry.WriteInt(Path,RegKeyAskPassword, Integer(Pipes[x].AskPassword));
  end;
SaveCommon;
end;


Initialization
 DefPipe:=TPipeList.Create;
finalization
 DefPipe.Free;
end.
