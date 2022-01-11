unit StaticFrame.Contacts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.GridFrame, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Basic.Frame;

type
  TStaticFrameContacts = class(TBasicGridFrame)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StaticFrameContacts: TStaticFrameContacts;

implementation

{$R *.dfm}

end.
