unit StaticFrame.IncomingMessages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.GridFrame, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StaticDlg.ViewMessage, Vcl.ActnList, DAC.XDataSet;

type
  TStaticFrameIncomingMessages = class(TBasicGridFrame)
    colDate: TcxGridDBColumn;
    colUserName: TcxGridDBColumn;
    colMessage: TcxGridDBColumn;
    colPhone: TcxGridDBColumn;
    colEmail: TcxGridDBColumn;
    colSystemMessage: TcxGridDBColumn;
    colReaded: TcxGridDBColumn;
    colIPAddress: TcxGridDBColumn;
    procedure MainViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
     FUnreadAction:TAction;
     FReadAction:TAction;
     procedure MarkAsUnread(Sender:TObject);
     procedure MarkAsReaded(Sender:TObject);
     procedure MarkSelected(Readed:Boolean);
  protected
     procedure SelectionChanged(RecordsSelected:Integer); override;
  public
     Constructor Create(AOwner:TComponent); override;
     procedure EditRecord; override;
  end;


implementation

{$R *.dfm}

{ TStaticFrameIncomingMessages }

constructor TStaticFrameIncomingMessages.Create(AOwner: TComponent);
begin
  inherited;
  DataSet.ProviderName:='spui_WebMessagesList';
  DeleteSQLText:='spui_DeleteWebMessage';
  KeyField:='IncomingWebMessagesID';
  DialogClass:= TViewMessageDlg;
  FUnreadAction:=CreateAction('MarkAsUnreaded','Пометить как не прочтённое',209,False,MarkAsUnread);
  FReadAction:=CreateAction('MarkAsReaded','Пометить как прочтённое',213,False,MarkAsReaded);
end;

procedure TStaticFrameIncomingMessages.EditRecord;
begin
  inherited;
  RefreshDataSet;
end;

procedure TStaticFrameIncomingMessages.MainViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 inherited;
  if  AViewInfo.GridRecord.Values[colReaded.Index]=False then
   ACanvas.Font.Style:=[fsBold];
  if   (AViewInfo.GridRecord.Values[colSystemMessage.Index]=True) then
   ACanvas.Font.Color:=$00AA6F0F;
end;

procedure TStaticFrameIncomingMessages.MarkAsReaded(Sender: TObject);
begin
  MarkSelected(True);
  RefreshDataSet;
end;

procedure TStaticFrameIncomingMessages.MarkAsUnread(Sender: TObject);
begin
  MarkSelected(False);
  RefreshDataSet;
end;

procedure TStaticFrameIncomingMessages.MarkSelected(Readed:Boolean);
var
 Tmp:TxDataSet;
begin
 Tmp:=TxDataSet.Create(nil);
  try
    Tmp.ProviderName:='spui_ChangeMessageReadState';
    Tmp.SetParameter('IDs',GetSelectedIDs);
    Tmp.SetParameter('Readed',Readed);
    Tmp.Execute;
  finally
    Tmp.Free;
  end;
end;


procedure TStaticFrameIncomingMessages.SelectionChanged(RecordsSelected: Integer);
var
 AEnabled:Boolean;
begin
  inherited;
  AEnabled:=RecordsSelected>0;
  FUnreadAction.Enabled:=AEnabled;
  FReadAction.Enabled:=AEnabled;
end;


end.
