unit StaticFrame.Documents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.Frame, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,Basic.TreeGridFrame, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, cxTLData, cxDBTL, StaticDlg.Documents, cxMaskEdit;

type
  TStaticFrameDocuments = class(TBasicTreeGridFrame)
    TreeViewcxDBTreeListColumn1: TcxDBTreeListColumn;
  private
    { Private declarations }
  public
   Constructor Create(AOwner:TComponent); override;
    { Public declarations }
  end;


implementation

{$R *.dfm}

{ TStaticFrameDocuments }

constructor TStaticFrameDocuments.Create(AOwner: TComponent);
begin
  inherited;
  DataSet.ProviderName:='spui_SiteDocumentsList';
  DialogClass:=TDocumentsDlg;
  KeyField:='SiteDocumentsID';
  DeleteSQLText:='spui_DeleteSiteDocument';
end;

end.
