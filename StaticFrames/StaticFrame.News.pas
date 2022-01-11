unit StaticFrame.News;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.GridFrame, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, Basic.Frame, StaticDlg.News,
  dxDateRanges, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TStaticFrameNews = class(TBasicGridFrame)
    colNewsText: TcxGridDBColumn;
    colADate: TcxGridDBColumn;
    colAlwaysValid: TcxGridDBColumn;
    colActive: TcxGridDBColumn;
    procedure MainViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
   constructor Create(AOwner:TComponent); override;
  end;

implementation

{$R *.dfm}

{ TStaticFrameNews }

constructor TStaticFrameNews.Create(AOwner: TComponent);
begin
  inherited;
  AddRecordAction.ImageIndex:=117;
  DataSet.ProviderName:='spui_CorpNewsList';
  KeyField:='CorpNewsID';
  DialogClass:= TNewsDlg;
  Self.DeleteSQLText:='spui_DeleteCorpNews';
end;

procedure TStaticFrameNews.MainViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if  AViewInfo.GridRecord.Values[colActive.Index]=False then
   ACanvas.Font.Color:=clSilver;

end;

end.
