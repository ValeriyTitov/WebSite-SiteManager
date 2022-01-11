unit StaticDlg.PluginInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StaticDlg.BasicModalDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMemo, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls;

type
  TPluginInfoDlg = class(TBasicModalDialog)
    cxMemo1: TcxMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
   procedure AddText(Name,Value:String);
  end;

implementation

{$R *.dfm}

procedure TPluginInfoDlg.AddText(Name, Value: String);
begin
 cxMemo1.Lines.Add(Name+' '+Value)
end;

procedure TPluginInfoDlg.FormCreate(Sender: TObject);
begin
  inherited;
  ReadOnly:=True;
end;

end.
