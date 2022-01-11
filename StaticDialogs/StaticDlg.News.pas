unit StaticDlg.News;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.DBDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer,
  cxEdit, cxCheckBox, cxDBEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxTextEdit, cxMemo, cxRichEdit, cxDBRichEdit, Data.DB, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, StaticDlg.Image, dxSkinsCore, cxImageComboBox,
  Common.Images,
   Vcl.DBCtrls;

type
  TNewsDlg = class(TBasicDBDlg)
    Panel1: TPanel;
    deValidThru: TcxDBDateEdit;
    cbAlwaysValid: TcxDBCheckBox;
    Label1: TLabel;
    lbCaption: TLabel;
    edText: TcxDBTextEdit;
    edADate: TcxDBDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    cbRawHtml: TcxDBCheckBox;
    memData: TDBMemo;
    cbActive: TcxDBCheckBox;
    procedure cbAlwaysValidClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    FAlwaysValid: Boolean;
    procedure SetAlwaysValid(const Value: Boolean);
    procedure PostImage;
  protected
   procedure DoApplyUpdates; override;
   procedure DoAfterOpen(DataSet:TDataSet);override;
   procedure DoAfterInsert(DataSet:TDataSet); override;

  public
   FDlgInitialized:Boolean;
   FDlg:TImageDialog;
   property AlwaysValid:Boolean read FAlwaysValid write SetAlwaysValid;
   constructor Create(AOwner:TComponent); override;
  end;


implementation

{$R *.dfm}

procedure TNewsDlg.cbAlwaysValidClick(Sender: TObject);
begin
 AlwaysValid:=cbAlwaysValid.Checked;
end;

constructor TNewsDlg.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TNewsDlg.cxButton1Click(Sender: TObject);
begin
 if DataSet.FieldByName('ImagesID').IsNull then
  FDlg.ID:=-1
   else
  FDlg.ID:=DataSet.FieldByName('ImagesID').AsInteger;
  If FDlgInitialized=False then
   begin
    FDlg.Initialize;
    FDlgInitialized:=True;
   end;
  if FDlg.ShowModal=mrOK then;

  ModalResult:=mrNone;
end;

procedure TNewsDlg.DoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('AlwaysValid').AsBoolean:=True;
  DataSet.FieldByName('RawHtml').AsBoolean:=True;
  DataSet.FieldByName('Active').AsBoolean:=True;
  deValidThru.Enabled:=False;
end;

procedure TNewsDlg.DoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AlwaysValid:=(DataSet.FieldByName('AlwaysValid').IsNull=False)
           and  DataSet.FieldByName('AlwaysValid').AsBoolean;
end;

procedure TNewsDlg.DoApplyUpdates;
begin
  PostImage;
  inherited;
end;

procedure TNewsDlg.FormCreate(Sender: TObject);
begin
  inherited;
  TableName:='CorpNews';
  KeyField:='CorpNewsID';
  FAlwaysValid:=False;
  FDlg:=TImageDialog.Create(Self);
  FDlgInitialized:=False;
end;

procedure TNewsDlg.PostImage;
begin
if FDlg.DataSet.Active then
 begin
  FDlg.ApplyUpdates;
  DataSet.FieldByName('ImagesID').AsInteger:=FDlg.DataSet.FieldByName('ImagesID').AsInteger;
 end;
end;

procedure TNewsDlg.SetAlwaysValid(const Value: Boolean);
begin
 FAlwaysValid := Value;
 deValidThru.Enabled:=not Value;
 cbAlwaysValid.Checked:=Value;
end;

end.
