unit StaticDlg.Documents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Basic.DBDialog, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Data.DB, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxDBEdit, cxLabel, DAC.xDataSet, cxMaskEdit, cxButtonEdit,SelectTreeDlg,
  cxGroupBox, cxRadioGroup, Common.Images, cxMemo, cxCheckBox, Common.ResourceStrings,
  WinAPI.ShellApi, Common.ApplicationSettings;

type
  TDocumentsDlg = class(TBasicDBDlg)
    cxLabel1: TcxLabel;
    edDescription: TcxDBTextEdit;
    edSearchTags: TcxDBTextEdit;
    lbTags: TcxLabel;
    bnBrowseFile: TcxButton;
    edFileName: TcxDBTextEdit;
    lbFileName: TcxLabel;
    Dlg: TOpenDialog;
    edEP: TcxDBButtonEdit;
    lbGroup: TcxLabel;
    rgItemType: TcxDBRadioGroup;
    lbOpenUrl: TLabel;
    memUrl: TcxMemo;
    lbUrl: TcxLabel;
    cbShowInDocuments: TcxDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bnBrowseFileClick(Sender: TObject);
    procedure edEPPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edEPPropertiesEditValueChanged(Sender: TObject);
    procedure rgItemTypePropertiesEditValueChanged(Sender: TObject);
    procedure lbOpenUrlClick(Sender: TObject);
    procedure lbOpenUrlMouseEnter(Sender: TObject);
    procedure lbOpenUrlMouseLeave(Sender: TObject);
  private
    FOpenUrl:String;
    FOwnerID:Variant;
    procedure FindDocumentOwner(DataSet:TDataSet);
    procedure SetControlsState(AEnabled:Boolean);
    procedure LoadFileToField(AFileName:String);
    Procedure LoadFile;
    Procedure SetFileGroup;
    function FindGroupName(ID: Integer): String;
    function ImgTagRequired(const FileName:string):Boolean;
    Procedure ItemTypeChanged(Sender:TField);
    procedure DisableTypeChange;
    procedure EnableLink(Value:Boolean);
    Procedure DisableOpenUrl;
    procedure CreateHttpLinks;
  public
    procedure DoAfterInsert(DataSet:TDataSet);override;
    procedure DoAfterOpen(DataSet:TDataSet);override;
  end;


implementation

{$R *.dfm}

procedure TDocumentsDlg.bnBrowseFileClick(Sender: TObject);
begin
 LoadFile;
end;

procedure TDocumentsDlg.CreateHttpLinks;
const
 ALink = '/home/GetSiteDocument?ID=';
 ATag = '<a href="%s">%s</a>';
 AImg = '<img src="%s" class="img-responsive" width="%s" height="%s">';

 ABootStrapImg =
 '<div class="container-fluid">'+#13+
 ' <div class="row">'+#13+
 '   <img style="float:left; margin-right:10px;" src="%s" width="%s" height="%s"/>'+#13+
 '   <p>%s</p>'+#13+
 ' </div>'+#13+
 '</div>';

var
 Link:String;
 CompleteText:string;
begin
 Link:=ALink+DataSet.FieldByName('SiteDocumentsID').AsString;
 FOpenUrl:=ApplicationSettings.WebServerAddress+Link;
 if ApplicationSettings.WebServerValid then
  lbOpenUrl.Hint:=FOpenUrl;

 CompleteText:=Format(ATag,[Link,DataSet.FieldByName('Description').AsString]);
 if ImgTagRequired(DataSet.FieldByName('FileName').AsString) then
  begin
   Self.memUrl.Properties.ScrollBars:=ssVertical;
   CompleteText:=CompleteText+#13+#13+'Ссылка на картинку:'#13+Format(AImg,[Link,'100%','100%']);;
   CompleteText:=CompleteText+#13+#13+'Ссылка на картинку c текстом:'#13+Format(ABootStrapImg,[Link,'512px','384px', DataSet.FieldByName('Description').AsString]);;
  end;

 memUrl.Lines.Text:=CompleteText;
 EnableLink(not DataSet.FieldByName('IsGroup').AsBoolean);
 if not ApplicationSettings.WebServerValid then
   DisableOpenUrl;
end;

procedure TDocumentsDlg.DisableOpenUrl;
begin
 lbOpenUrl.Caption:='<Сервер не задан>';
 lbOpenUrl.Hint:='Адрес Вэб-сервера не задан в настройках программы.';
 lbOpenUrl.Left:=Width-lbOpenUrl.Width-30;
 lbOpenUrl.Enabled:=False;
end;

procedure TDocumentsDlg.DisableTypeChange;
begin
 SetControlsState(not DataSet.FieldByName('IsGroup').Value);
 rgItemType.Enabled:=False;
end;

procedure TDocumentsDlg.DoAfterInsert(DataSet: TDataSet);
begin
 inherited;
 DataSet.FieldByName('ShowInDocuments').AsBoolean:=True;
 EnableLink(False);
 if Assigned(OwnerDataSet) then
  begin
   DataSet.FieldByName('IsGroup').AsBoolean:=(OwnerDataSet.RecordCount<=0);
   rgItemType.Enabled:=OwnerDataSet.RecordCount>0;
   if (OwnerDataSet.Active) then
     FindDocumentOwner(DataSet);
  end;
end;

procedure TDocumentsDlg.DoAfterOpen(DataSet: TDataSet);
begin
 Inherited;
 DataSet.Fields.FieldByName('IsGroup').OnChange:=ItemTypeChanged;
 CreateHttpLinks;
 if ID>0 then
  DisableTypeChange;
end;

procedure TDocumentsDlg.edEPPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
 SetFileGroup;
end;

procedure TDocumentsDlg.edEPPropertiesEditValueChanged(Sender: TObject);
begin
 edEP.Text:=FindGroupName(DataSet.FieldByName('OwnerID').AsInteger)
end;

procedure TDocumentsDlg.EnableLink(Value: Boolean);
begin
 memUrl.Visible:=Value;
 lbUrl.Visible:=Value;
 lbOpenUrl.Visible:=Value;
end;

procedure TDocumentsDlg.FindDocumentOwner(DataSet:TDataSet);
begin
 if (OwnerDataSet.FieldByName('IsGroup').AsBoolean) then
  FOwnerID:=OwnerDataSet.FieldByName('SiteDocumentsID').AsInteger
   else
  FOwnerID:=OwnerDataSet.FieldByName('OwnerID').AsInteger;

  DataSet.FieldByName('OwnerID').AsInteger:=FOwnerID;
end;

function TDocumentsDlg.FindGroupName(ID: Integer): String;
var
 Tmp:TxDataSet;
begin
 Tmp:=TxDataSet.Create(nil);
  try
   Tmp.ProviderName:='spui_SiteDocumentsGroups';
   Tmp.Open;
   if Tmp.Locate('SiteDocumentsID',ID,[]) then
    Result:=Tmp.FieldByName('Description').AsString
     else
    Result:='<Не известно>'
  finally
   Tmp.Free;
  end;
end;



procedure TDocumentsDlg.FormCreate(Sender: TObject);
begin
  inherited;
  TableName:='SiteDocuments';
  KeyField:='SiteDocumentsID';
end;

function TDocumentsDlg.ImgTagRequired(const FileName: string): Boolean;
begin
 Result:=FileName.EndsWith('.jpg',True)  or
         FileName.EndsWith('.jpeg',True) or
         FileName.EndsWith('.png',True)  or
         FileName.EndsWith('.gif',True);
end;

procedure TDocumentsDlg.ItemTypeChanged(Sender: TField);
begin
 if Sender.Value=0 then
  begin
   DataSet.FieldByName('ImageIndex').AsInteger:=84;
   DataSet.FieldByName('OwnerID').AsInteger:=FOwnerID;
  end
   else
  begin
   DataSet.FieldByName('ImageIndex').AsInteger:=80;
   DataSet.FieldByName('OwnerID').Clear;
  end;

 SetControlsState(not Sender.AsBoolean);
end;

procedure TDocumentsDlg.lbOpenUrlClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PWideChar(FOpenUrl),nil, nil, SW_SHOWNORMAL);
end;

procedure TDocumentsDlg.lbOpenUrlMouseEnter(Sender: TObject);
begin
 lbOpenUrl.Font.Style:=[fsUnderline];
end;

procedure TDocumentsDlg.lbOpenUrlMouseLeave(Sender: TObject);
begin
 lbOpenUrl.Font.Style:=[];
end;

procedure TDocumentsDlg.LoadFile;
begin
 if Dlg.Execute then
  LoadFileToField(Dlg.FileName);
end;

procedure TDocumentsDlg.LoadFileToField(AFileName: String);
begin
 (DataSet.FieldByName('Data') as TBlobField).Clear;
 (DataSet.FieldByName('Data') as TBlobField).LoadFromFile(AFileName);
 DataSet.FieldByName('FileName').AsString:=ExtractFileName(AFileName);
 DataSet.FieldByName('Tags').AsString:=ExtractFileName(AFileName);
 DataSet.FieldByName('Description').AsString:=ExtractFileName(AFileName);
 DataSet.FieldByName('ImageIndex').AsInteger:=TImageContainer.FileExtToImageIndex(ExtractFileExt(AFileName));
end;

procedure TDocumentsDlg.rgItemTypePropertiesEditValueChanged(Sender: TObject);
begin
if DataSet.State in [dsInsert] then
  DataSet.Fields.FieldByName('IsGroup').Value:=rgItemType.Properties.Items[rgItemType.ItemIndex].Value
end;

procedure TDocumentsDlg.SetControlsState(AEnabled: Boolean);
begin
 Self.edSearchTags.Visible:=AEnabled;
 Self.edFileName.Visible:=AEnabled;
 Self.bnBrowseFile.Visible:=AEnabled;
 Self.lbTags.Visible:=AEnabled;
 Self.lbFileName.Visible:=AEnabled;
 Self.edEP.Visible:=AEnabled;
 Self.lbGroup.Visible:=AEnabled;
end;

procedure TDocumentsDlg.SetFileGroup;
var
 Dlg:TSelectTreeDialog;
begin
 Dlg:=TSelectTreeDialog.Create(nil);
  try
   Dlg.DataSet.ProviderName:='spui_SiteDocumentsGroups';
   Dlg.KeyField:='SiteDocumentsID';
   Dlg.EnabledField:='IsGroup';
   Dlg.EnabledValue:=True;
   Dlg.LocateID:=DataSet.FieldByName('OwnerID').AsInteger;
   Dlg.DescriptionField:='Description';
   if Dlg.Execute then
     DataSet.FieldByName('OwnerID').AsInteger:=Dlg.SelectedValue;
  finally
   Dlg.Free;
  end;
end;


end.
