unit Thread.CacheReset;

interface

uses
  System.Classes, IdHttp;

type
  TCacheReseter = class(TThread)
  private
   FHttp:String;
  protected
    procedure Execute; override;
  public
   constructor Create(Http:String);
   class procedure ResetWebCache(URL:String);
  end;

implementation

{ CacheReseter }

constructor TCacheReseter.Create(Http: String);
begin
 Inherited Create(True);
 FreeOnTerminate:=True;
 FHttp:=Http;
end;

procedure TCacheReseter.Execute;
var
 Tmp:TIDHttp;
begin
Tmp:=TIDHttp.Create(nil);
 try
   try
    Tmp.Get(FHttp);
   except
   end;
 finally
  Tmp.Free;
 end;

end;

class procedure TCacheReseter.ResetWebCache(URL:String);
var
 Thread:TCacheReseter;
begin
 Thread:=TCacheReseter.Create(Url);
 Thread.Start;
end;

end.
