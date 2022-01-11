unit StaticDlg.CommonSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StaticDlg.BasicModalDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, cxLabel, cxTextEdit, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  Common.ApplicationSettings;

type
  TCommonSettingsDlg = class(TBasicModalDialog)
    cxTextEdit1: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
  private
    procedure SetAddress(const Value: string);
    function GetAddress: string;
  public
   property Address:string read GetAddress write SetAddress;
  end;


implementation

{$R *.dfm}
const
 DefaultWebAddress = 'http://127.0.0.1/';

{ TCommonSettingsDlg }

procedure TCommonSettingsDlg.cxTextEdit1PropertiesChange(Sender: TObject);
begin
 cxLabel2.Visible:=not ApplicationSettings.HttpPathValid(cxTextEdit1.Text);
 self.bnOK.Enabled:=not cxLabel2.Visible;
end;

function TCommonSettingsDlg.GetAddress: string;
begin
 Result:=Self.cxTextEdit1.Text;
end;

procedure TCommonSettingsDlg.SetAddress(const Value: string);
begin
 if Value='' then
 cxTextEdit1.Text:= DefaultWebAddress
  else
 cxTextEdit1.Text:=Value;
end;

end.
