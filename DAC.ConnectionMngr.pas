unit DAC.ConnectionMngr;

interface
 Uses  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, StaticDlg.Login;

type
  TConnectionManager = class
  private
   FMainConnection:TFDConnection;
  public
   procedure SetConnection(Command:TFDCommand; const DBName:String);
   procedure CheckConnectionString(CS:String);
   procedure DoCheckConnectionString(Sender:TObject);
   constructor Create;
   Destructor Destroy; Override;
   Property MainConnection:TFDConnection read FMainConnection;
   function ExecuteLoginDialog:Boolean;
  end;

Function ConnectionManager:TConnectionManager;

const
 DefaultConnectionString ='Server=Server;Database=WebSite;User_Name=sa;Password=sa;DriverID=MSSQL';


implementation
var
  FConnectionManager:TConnectionManager;


Function ConnectionManager:TConnectionManager;
begin
  Result:=FConnectionManager;
end;

{ TConnectionManager }


procedure TConnectionManager.CheckConnectionString(CS: String);
var
 Tmp:TFDConnection;
begin
 Tmp:=TFDConnection.Create(nil);
 try
  Tmp.ConnectionString:=CS;
  Tmp.LoginPrompt:=False;
  Tmp.Connected:=True;
 finally
   Tmp.Free;
 end;
end;

constructor TConnectionManager.Create;
begin
 FMainConnection:=TFDConnection.Create(nil);
 FMainConnection.ConnectionString:=DefaultConnectionString;
 FMainConnection.LoginPrompt:=False;
end;


destructor TConnectionManager.Destroy;
begin
  FMainConnection.Free;
  inherited;
end;

procedure TConnectionManager.DoCheckConnectionString(Sender: TObject);
var
 Dlg:TPipeLoginDialog;
begin
  Dlg:=Sender as TPipeLoginDialog;
  CheckConnectionString(Dlg.ConnectionString);
end;

function TConnectionManager.ExecuteLoginDialog: Boolean;
var
 Dlg:TPipeLoginDialog;
begin
 Dlg:=TPipeLoginDialog.Create(nil);
 try
  Dlg.OnExecute:=Self.DoCheckConnectionString;
  Result:=Dlg.Execute;
   if Result then
    MainConnection.ConnectionString:=Dlg.ConnectionString;
 finally
  Dlg.Free;
 end;
end;

procedure TConnectionManager.SetConnection(Command: TFDCommand; const DBName: String);
begin
 Command.Connection:=FMainConnection;
end;


initialization
  FConnectionManager:=TConnectionManager.Create;
finalization
  FConnectionManager.Free;
end.
