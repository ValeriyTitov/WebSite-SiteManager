unit StaticDlg.Image;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.DBDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, cxImage, Data.DB, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxDBEdit;

type
  TImageDialog = class(TBasicDBDlg)
    Image: TcxDBImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
   procedure ApplyUpdates;
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TImageDialog.ApplyUpdates;
begin
  DoApplyUpdates;
end;

procedure TImageDialog.FormCreate(Sender: TObject);
begin
  inherited;
  TableName:='Images';
  KeyField:='ImagesID';
end;

end.
