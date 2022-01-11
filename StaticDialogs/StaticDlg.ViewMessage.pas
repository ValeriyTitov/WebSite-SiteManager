unit StaticDlg.ViewMessage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.DBDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Data.DB, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit, cxMemo, DAC.XDataSet;

type
  TViewMessageDlg = class(TBasicDBDlg)
    memMessage: TcxDBMemo;
    Panel1: TPanel;
    edUserName: TcxDBTextEdit;
    edEmail: TcxDBTextEdit;
    edPhone: TcxDBTextEdit;
    edIpAddress: TcxDBTextEdit;
    edDate: TcxDBDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
  private
  public
   procedure MarkMessage;
   procedure DoAfterOpen(DataSet:TDataSet);override;
  end;

implementation

{$R *.dfm}

procedure TViewMessageDlg.DoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('Readed').AsBoolean=False then
   MarkMessage;
end;

procedure TViewMessageDlg.FormCreate(Sender: TObject);
begin
  inherited;
  TableName:='IncomingWebMessages';
  KeyField:='IncomingWebMessagesID';
  ReadOnly:=True;
end;

procedure TViewMessageDlg.MarkMessage;
var
 Tmp:TxDataSet;
begin
 Tmp:=TxDataSet.Create(nil);
  try
    Tmp.ProviderName:='spui_ChangeMessageReadState';
    Tmp.SetParameter('IDs',ID);
    Tmp.SetParameter('Readed',1);
    Tmp.Execute;
  finally
    Tmp.Free;
  end;
end;

end.
