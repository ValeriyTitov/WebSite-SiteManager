unit Common.ApplicationSettings;

interface
 uses SysUtils,Common.ValueWriter, Common.Consts;

 type
  TApplicationSettings = class
   private
    FWebServerAddress:string;
    function GetWebServerAddress: string;
    procedure SetWebServerAddress(const Value: string);
   public
    property WebServerAddress:string read GetWebServerAddress write SetWebServerAddress;
    function WebServerValid:Boolean;
    class function HttpPathValid(const Path:string):Boolean;
  end;



var
 ApplicationSettings:TApplicationSettings;
implementation

{ TApplicationSettings }



function TApplicationSettings.GetWebServerAddress: string;
begin
  if FWebServerAddress='' then
    FWebServerAddress:=TProjectRegistry.ReadStringDef(BaseRegistryKey+'WebServer','Address','');
  Result:=FWebServerAddress;
end;

class function TApplicationSettings.HttpPathValid(const Path: string): Boolean;
var
 s:string;
begin
 Result:=Length(Path)>7;
 if Result then
  begin
    s:=AnsiLowerCase(copy(Path,1,7));
    Result:=(s='http://') or (s='https:/');
  end;
end;

procedure TApplicationSettings.SetWebServerAddress(const Value: string);
var
 S:string;
 L:Integer;
begin
 L:=Length(Value);
 S:=Value;
 if (L>7) and (Value[L]<>'/') then
  S:=Value+'/';

 FWebServerAddress:=S;
 TProjectRegistry.WriteString(BaseRegistryKey+'WebServer','Address',S);
end;

function TApplicationSettings.WebServerValid: Boolean;
begin
 Result:=Self.HttpPathValid(WebServerAddress)
end;

initialization
  ApplicationSettings:=TApplicationSettings.Create;
finalization
  ApplicationSettings.Free;
end.
