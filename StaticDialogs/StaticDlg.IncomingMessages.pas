unit StaticDlg.IncomingMessages;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StaticDlg.BasicModalDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxControls, dxRibbonSkins, dxRibbonCustomizationForm, cxClasses,
  dxRibbon, dxBar, StaticFrame.IncomingMessages, dxStatusBar, dxRibbonStatusBar;

type
  TFIncomingMessages = class(TBasicModalDialog)
    BarManager: TdxBarManager;
    tbMessages: TdxBar;
    tbCommon: TdxBar;
    bnRefresh: TdxBarLargeButton;
    bnMarkUnread: TdxBarLargeButton;
    bnDeleteMessage: TdxBarLargeButton;
    MainMenu: TdxRibbon;
    TabNews: TdxRibbonTab;
    Panel1: TPanel;
    StatusBar: TdxRibbonStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure bnRefreshClick(Sender: TObject);
  private
    FFrame: TStaticFrameIncomingMessages;
    function CreateMessagesFrame: TStaticFrameIncomingMessages;
    procedure UpdateStatusBar;
  public
    property Frame: TStaticFrameIncomingMessages read FFrame;
    procedure RefreshDataSet;
  end;


implementation

{$R *.dfm}

procedure TFIncomingMessages.bnRefreshClick(Sender: TObject);
begin
 RefreshDataSet;
end;

function TFIncomingMessages.CreateMessagesFrame: TStaticFrameIncomingMessages;
begin
 Result:=TStaticFrameIncomingMessages.Create(Self);
 Result.Parent:=Panel1;
 Result.Align:=alClient;
 bnMarkUnread.Action:=Result.ActionByName('MarkAsUnread');
 bnDeleteMessage.Action:=Result.DeleteRecordAction;
end;

procedure TFIncomingMessages.FormCreate(Sender: TObject);
begin
  inherited;
  FFrame:=CreateMessagesFrame;
  ReadOnly:=True;
end;


procedure TFIncomingMessages.RefreshDataSet;
begin
 Frame.RefreshDataSet;
 UpdateStatusBar;
end;

procedure TFIncomingMessages.UpdateStatusBar;
resourcestring
 S_ROWS_FMT='Строк: %d';
begin
 StatusBar.Panels[0].Text:=Format(S_ROWS_FMT,[Frame.DataSet.RecordCount]);
end;

end.
