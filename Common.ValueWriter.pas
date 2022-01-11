unit Common.ValueWriter;

interface
 Uses IniFiles, SysUtils, Registry, Windows, Classes, Common.Consts;



type
TProjectRegistry = class
 public
  class function ReadIntDef(Path,Key:String; Default:Integer):Integer;
  class Function WriteInt(Path,Key:String;Value:Integer):Boolean;
  class function ReadStringDef(Path,Key:String; Default:String):String;
  class function WriteString(Path,Key,Value:String):Boolean;
  class function ReadBool(Path,Key:String; Default:Boolean):Boolean;
  class function WriteBool(Path,Key:String;Value:Boolean):Boolean;
  class procedure GetKeyNames(Path:string; List:TStrings);
  class procedure DeleteKeys(Path:string);
end;


Function IniReadStr(Section,Value,DefaultValue:String):String;
Function IniReadInt(Section,Value:String; DefaultValue:Integer):Integer;

implementation

var
IniFileName:String = DefaultIniFile;


Function IniReadStr(Section,Value,DefaultValue:String):String;
begin
with TIniFile.Create(IniFileName) do
   try
    Result := ReadString(Section,Value, DefaultValue);
   finally
  Free;
end;
end;


Function IniReadInt(Section,Value:String; DefaultValue:Integer):Integer;
begin
with TIniFile.Create(IniFileName) do
   try
     try
      Result := StrToInt(ReadString(Section,Value, IntToStr(DefaultValue)));
       Except on E:Exception do Result:=DefaultValue;
     end;
   finally
  Free;
end;
end;


class function TProjectRegistry.ReadIntDef(Path,Key:String; Default:Integer):Integer;
var
  Registry: TRegistry;
begin
  Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  if  Registry.OpenKey(Path,False) then
  begin
   try
    If Registry.ValueExists(Key) then
     Result :=Registry.ReadInteger(Key)
      else
     Result:=Default;
    except
     Result:=Default;
    end;
   end
   else Result:=Default;
  Finally
   Registry.Free;
  end;
end;


class function TProjectRegistry.WriteInt(Path,Key:String;Value:Integer):Boolean;
var
  Reg: TRegistry;
begin
  Result:=False;
  Reg := TRegistry.Create;
   try
    try
     Reg.RootKey := HKEY_CURRENT_USER;
     if Reg.OpenKey(Path, True) then
      begin
       Reg.WriteInteger(Key,Value);
       Reg.CloseKey;
       Result:=True;
      end;
    Except
     Result:=False;
    end;
  finally
    Reg.Free;
  end;
end;


class function TProjectRegistry.ReadStringDef(Path,Key:String; Default:String):String;
var
  Registry: TRegistry;
begin
  Registry:=TRegistry.Create;
 try
  Registry.RootKey:=HKEY_CURRENT_USER;
  if Registry.OpenKey(Path,False) then
  begin
   try
    If Registry.ValueExists(Key) then
     Result :=Registry.ReadString(Key)
      else
     Result:=Default;
    except
     Result:=Default;
    end;
   end
   else
    Result:=Default;
  Finally
   Registry.Free;
  end;
end;



class function TProjectRegistry.WriteString(Path,Key,Value:String):Boolean;
var
  Reg: TRegistry;
begin
  Result:=False;
  Reg := TRegistry.Create;
   try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(Path, True) then
    begin
       Reg.WriteString(Key,Value);
       Reg.CloseKey;
       Result:=True;
    end;
  finally
    Reg.Free;
 end;
end;





class function TProjectRegistry.ReadBool(Path,Key:String; Default:Boolean):Boolean;
var
  Registry: TRegistry;
begin
  Registry:=TRegistry.Create;
try
  Registry.RootKey:=HKEY_CURRENT_USER;
  if  Registry.OpenKey(Path,False) then
  begin
   try
    If Registry.ValueExists(Key) then
     Result :=Registry.ReadBool(Key)
      else Result:=Default;
    except
     result:=Default;
    end;
   end
   else Result:=Default;
 Finally
  Registry.Free;
 end;
end;



class function TProjectRegistry.WriteBool(Path,Key:String; Value:Boolean):Boolean;
var
  Reg: TRegistry;
begin
  Result:=False;
  Reg := TRegistry.Create;
   try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(Path, True) then
    begin
     Reg.WriteBool(Key,Value);
     Reg.CloseKey;
     Result:=True;
    end;
  finally
   Reg.Free;
 end;
end;


class procedure TProjectRegistry.DeleteKeys(Path: string);
var
  r: TRegistry;
begin
  r:=TRegistry.Create;
  try
    r.DeleteKey(Path);
  finally
    r.Free;
  end;
end;
class procedure TProjectRegistry.GetKeyNames(Path:string; List:TStrings);
var
  r: TRegistry;
begin
  r:=TRegistry.Create;
  try
    if r.OpenKey(Path, False) then
     begin
      r.GetKeyNames(List);
      r.CloseKey;
     end;
  finally
    r.Free;
  end;
end;

Initialization
 IniFileName:= ExtractFilePath(Paramstr(0))+DefaultIniFile;

end.
