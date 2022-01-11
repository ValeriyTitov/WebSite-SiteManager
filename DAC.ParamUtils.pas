unit DAC.ParamUtils;

interface
 Uses DB, SysUtils, System.Classes, FireDAC.Stan.Param;
type

 TParamUtils = class
   public
    class procedure CloneExistingParamValues(Source:TParams;Dest:TFDParams);
    class procedure SetParamEx(Params:TParams; const AParamName:String; AValue:Variant);
    class function NormalizeParamName(ParamName:String):String;
    class function NormalizeParamNameEcho(ParamName:String):String;
   end;

implementation

{ TParamUtils }

class procedure TParamUtils.CloneExistingParamValues(Source: TParams; Dest: TFDParams);
var
 X:Integer;
 P:TParam;
begin
 for x:=0 to Dest.Count-1 do
  begin
   P:=Source.FindParam(NormalizeParamName(Dest[x].Name));
   if Assigned(P) then
    Dest[x].Value:=P.Value;
  end;

end;

class function TParamUtils.NormalizeParamName(ParamName: String): String;
begin
 Result:=ParamName;
 if Length(ParamName)>=2 then
  begin
   if ParamName[1]='@' then
    Result:=Copy(ParamName,2,MaxInt);
  end;
end;

class function TParamUtils.NormalizeParamNameEcho(ParamName: String): String;
begin
 Result:=ParamName;
 if Length(ParamName)>=2 then
  begin
   if ParamName[1]<>'@' then
    Result:='@'+ParamName;
  end;

end;

class procedure TParamUtils.SetParamEx(Params: TParams; const AParamName: String; AValue: Variant);
var
 FName:String;
 P:TParam;
begin
 FName:=NormalizeParamName(AParamName);
 P:=Params.FindParam(FName);

 If not Assigned(P) then
  Params.CreateParam(ftUnknown,FName,PtInput).Value:=AValue
   else
  P.Value:=AValue;
end;
end.
