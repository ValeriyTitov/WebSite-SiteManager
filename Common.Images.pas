unit Common.Images;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList;

type
  TImageContainer = class(TForm)
    Images32: TImageList;
    Images16: TImageList;
  public
   class function FileExtToImageIndex(Ext: String): Integer;
  end;

var
  ImageContainer: TImageContainer;

implementation

{$R *.dfm}

{ TImageContainer }

class function TImageContainer.FileExtToImageIndex(Ext: String): Integer;
begin
 Result:=132;
 if Ext='' then
    exit;

 Ext:=AnsiLowerCase(Ext);
 if Ext[1]<>'.' then
  Ext:='.'+Ext;

 if Ext='.rar' then
  Result:=236
  else
 if Ext='.zip' then
  Result:=236
  else
 if Ext='.7z' then
  Result:=236
  else
 if Ext='.xml' then
  Result:=235
  else
 if Ext='.mp3' then
  Result:=232
  else
 if Ext='.ogg' then
  Result:=232
  else
 if Ext='.avi' then
  Result:=234
  else
 if Ext='.mpg' then
  Result:=234
  else
 if Ext='.mkv' then
  Result:=73
  else
 if Ext='.flv' then
  Result:=73
  else
 if Ext='.mp4' then
  Result:=73
  else
 if Ext='.pdf' then
  Result:=224
  else
 if Ext='.doc' then
  Result:=220
  else
 if Ext='.docx' then
  Result:=220
  else
 if Ext='.xls' then
  Result:=222
  else
 if Ext='.xlsx' then
  Result:=222
  else
 if Ext='.vis' then
  Result:=228
  else
 if Ext='.ppf' then
  Result:=226
  else
 if Ext='.skp' then
  Result:=231
end;

end.
