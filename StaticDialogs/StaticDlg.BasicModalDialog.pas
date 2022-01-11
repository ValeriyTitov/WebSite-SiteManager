unit StaticDlg.BasicModalDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Common.ResourceStrings,
  cxGraphics, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLookAndFeels, cxLookAndFeelPainters;

type
  TBasicModalDialog = class(TForm)
    pnBottomButtons: TPanel;
    bnOK: TcxButton;
    bnCancel: TcxButton;
  private
    FReadOnly: Boolean;
  protected
    procedure SetReadOnly(const Value: Boolean);
    procedure SetReadOnlyState;dynamic;
    procedure SetEditingState;dynamic;
    procedure UpdateReadOnlyState;dynamic;
  public
   Property ReadOnly: Boolean read FReadOnly write SetReadOnly;
  end;


implementation

{$R *.dfm}

{ TBasicModalDialog }

procedure TBasicModalDialog.SetEditingState;
begin
 bnOK.Visible:=True;
 bnCancel.Caption:=S_COMMON_CANCEL;
end;

procedure TBasicModalDialog.SetReadOnlyState;
begin
 bnOK.Visible:=False;
 bnCancel.Caption:=S_COMMON_CLOSE;
end;


procedure TBasicModalDialog.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;
  UpdateReadOnlyState;
end;


procedure TBasicModalDialog.UpdateReadOnlyState;
begin
if FReadOnly then
  SetReadOnlyState
   else
  SetEditingState;
end;

end.
