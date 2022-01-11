unit StaticDlg.Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxLabel,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, ExtCtrls, Menus,
  cxImageComboBox, dxGDIPlusClasses,
  StaticDlg.ProjectSettings, cxCheckBox, Common.PipeList, System.ImageList,
  Vcl.ImgList, DAC.CSB, Winapi.ShellAPI;

type
  TPipeLoginDialog = class(TForm)
    Image1: TImage;
    MainLogo: TImage;
    imSettings: TImage;
    bnOK: TcxButton;
    bnCancel: TcxButton;
    edPassword: TcxTextEdit;
    edUserName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    lbSettings: TcxLabel;
    lbVersion: TcxLabel;
    cbSaveUserName: TcxCheckBox;
    cbPipe: TcxImageComboBox;
    ImageList1: TImageList;
    lbMailToTitov: TcxLabel;
    lbTitov: TcxLabel;
    lbTitle1: TcxLabel;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure lbSettingsClick(Sender: TObject);
    procedure lbSettingsMouseEnter(Sender: TObject);
    procedure lbSettingsMouseLeave(Sender: TObject);
    procedure cbPipePropertiesChange(Sender: TObject);
    procedure bnOKClick(Sender: TObject);
    procedure lbMailToTitovClick(Sender: TObject);
  private
    FOnExecute: TNotifyEvent;
    function AddPipeItem(const Description, cs:string;AskPassword:Boolean; const ImageIndex: Integer):Integer;
    procedure CenterControl(Control:TWinControl);
    procedure SetPassword(const Value: string);
    procedure SetSaveUserName(const Value: Boolean);
    procedure SetUserName(const Value: String);
    function GetPassword: string;
    function GetSaveUserName: Boolean;
    function GetUserName: String;
    function GetLastPipe: string;
    procedure SetLastPipe(const Value: string);
    procedure SetAskPasswordState(Const Value:Boolean);
    function GetConnectionString: string;
    function GenerateConnectionString:String;
    procedure DoOnExecute;

    property UserName:String read GetUserName write SetUserName;
    property SaveUserName:Boolean read GetSaveUserName write SetSaveUserName;
    property Password:string read GetPassword write SetPassword;
    property LastPipe:string read GetLastPipe write SetLastPipe;
    procedure FindLastPipe(PipeName:String);
    procedure LoadDropDownPipes;
    procedure UpdateDropDownChange;
  public
   procedure Load;
   procedure Save;
   property ConnectionString:string read GetConnectionString;
   function Execute:Boolean;
   function ProgramVersion:string;
  published
   property OnExecute:TNotifyEvent read FOnExecute write FOnExecute;
  end;

implementation

{$R *.dfm}

const
S_LB_CAPTION ='2017, Версия %s';


procedure TPipeLoginDialog.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
 if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TPipeLoginDialog.lbSettingsClick(Sender: TObject);
begin
 If TProjectSettingsDlg.Execute then
   LoadDropDownPipes;
end;

procedure TPipeLoginDialog.lbSettingsMouseEnter(Sender: TObject);
begin
 lbSettings.Style.TextColor:=clBlack;
end;

procedure TPipeLoginDialog.lbSettingsMouseLeave(Sender: TObject);
begin
 lbSettings.Style.TextColor:=clTeal;
end;

procedure TPipeLoginDialog.Load;
begin
 TPipeList.DefaultPipe.LoadPipes;
 SaveUserName:=TPipeList.DefaultPipe.SaveUserName;
 if SaveUserName then
  UserName:=TPipeList.DefaultPipe.LastUserName;
 LoadDropDownPipes;

end;

procedure TPipeLoginDialog.LoadDropDownPipes;
var
 X:Integer;
begin
 cbPipe.Properties.Items.Clear;
 for x:=0 to TPipeList.DefaultPipe.Pipes.Count-1 do
 AddPipeItem(TPipeList.DefaultPipe.Pipes[x].PipeName,
             TPipeList.DefaultPipe.Pipes[x].ConnectionString,
             TPipeList.DefaultPipe.Pipes[x].AskPassword,
             1);

 FindLastPipe(TPipeList.DefaultPipe.LastPipe);
 UpdateDropDownChange;
end;

function TPipeLoginDialog.ProgramVersion: string;
begin
 Result:='1.0';
end;

procedure TPipeLoginDialog.Save;
begin
 TPipeList.DefaultPipe.LastPipe:=Self.GetLastPipe;
 TPipeList.DefaultPipe.SaveUserName:=Self.SaveUserName;
 if SaveUserName then
  TPipeList.DefaultPipe.LastUserName:=Self.UserName
   else
   TPipeList.DefaultPipe.LastUserName:='';
 TPipeList.DefaultPipe.SaveCommon;
end;

procedure TPipeLoginDialog.SetAskPasswordState(const Value: Boolean);
begin
 Self.edPassword.Enabled:=Value;
 Self.edUserName.Enabled:=Value;
 Self.cbSaveUserName.Enabled:=Value;
end;

procedure TPipeLoginDialog.SetLastPipe(const Value: string);
begin
 //FindLastPipe(Value);
end;


procedure TPipeLoginDialog.SetPassword(const Value: string);
begin
 edPassword.Text:=Value;
end;

procedure TPipeLoginDialog.SetSaveUserName(const Value: Boolean);
begin
  self.cbSaveUserName.Checked:=Value;
end;

procedure TPipeLoginDialog.SetUserName(const Value: String);
begin
 edUserName.Text:=Value;
end;

procedure TPipeLoginDialog.UpdateDropDownChange;
begin
 if cbPipe.ItemIndex>=0 then
  begin
   SetAskPasswordState(Boolean(cbPipe.Properties.Items[cbPipe.ItemIndex].Tag));
   bnOK.Enabled:=cbPipe.ItemIndex>=0;
  end;
end;

function TPipeLoginDialog.AddPipeItem(const Description, cs: string; AskPassword: Boolean; const ImageIndex: Integer):Integer;
var
  Item: TcxImageComboBoxItem;
begin
 Item:=cbPipe.Properties.Items.Add;
 Item.Description:=Description;
 Item.Value:=CS;
 Item.Tag:=Integer(AskPassword);
 Item.ImageIndex:=ImageIndex;
 Result:=Item.Index;
end;

procedure TPipeLoginDialog.bnOKClick(Sender: TObject);
begin
 DoOnExecute;
 ModalResult:=mrOK;
end;

procedure TPipeLoginDialog.cbPipePropertiesChange(Sender: TObject);
begin
 UpdateDropDownChange;;
end;

procedure TPipeLoginDialog.CenterControl(Control: TWinControl);
begin
 Control.Left:=(Width div 2) - (Control.Width div 2);
end;

procedure TPipeLoginDialog.lbMailToTitovClick(Sender: TObject);
const
 MailTo='mailto:Titov.vb@mail.ru?subject=Программа%20управления%20сайтом,%20версия%20<ver>&body=Уважаемый%20Валерий%20Борисович,';
begin
// ShellExecute(Handle,'MailTo','Titov.vb@mail.ru','','',0);
ShellExecute(Handle, 'open', PWideChar(StringReplace(MailTo,'<ver>',ProgramVersion,[])),nil, nil, SW_SHOWNORMAL);
end;

procedure TPipeLoginDialog.DoOnExecute;
begin
 if Assigned(OnExecute) then
  OnExecute(Self);
end;

function TPipeLoginDialog.Execute: Boolean;
begin
 Load;
 Result:=ShowModal=mrOK;
 if (Result) then
   Save;
end;

procedure TPipeLoginDialog.FindLastPipe(PipeName: String);
var
 X:Integer;
 Item: TcxImageComboBoxItem;
begin
 if PipeName='' then Exit;

 for x:=0 to cbPipe.Properties.Items.Count-1 do
  begin
    Item:=cbPipe.Properties.Items[x];
    if Item.Description=PipeName then
     begin
      cbPipe.ItemIndex:=X;
      exit;
     end;
  end;
 cbPipe.ItemIndex:=AddPipeItem(PipeName,'',False,3);
end;

procedure TPipeLoginDialog.FormShow(Sender: TObject);
begin
 lbVersion.Caption:=Format(S_LB_CAPTION,[ProgramVersion]);
 CenterControl(lbVersion);
 CenterControl(lbMailToTitov);
 CenterControl(lbTitov);
 CenterControl(lbTitle1);
// lbVersion.Left:=(Self.Width div 2) - (lbVersion.Width div 2);
end;

function TPipeLoginDialog.GenerateConnectionString: String;
var
 Tmp:TCSB;
begin
 Tmp:=TCSB.Create;
 try
  Tmp.ParseConnectionString(TPipeList.DefaultPipe.PipeByName(LastPipe).ConnectionString);
  Tmp.Password:=Password;
  Tmp.UserName:=UserName;
  Result:=Tmp.GenerateNewConnectionString;
 finally
   Tmp.Free;
 end;
end;

function TPipeLoginDialog.GetConnectionString: string;
begin
 if TPipeList.DefaultPipe.PipeByName(LastPipe).AskPassword then
  Result:=GenerateConnectionString
   else
  Result:=TPipeList.DefaultPipe.PipeByName(LastPipe).ConnectionString;
//  MessageBoxW(Handle,PWideChar(Result),'',0);
end;

function TPipeLoginDialog.GetLastPipe: string;
begin
 Result:='';
 if cbPipe.ItemIndex<cbPipe.Properties.Items.Count then
  Result:=cbPipe.Properties.Items[cbPipe.ItemIndex].Description;
end;

function TPipeLoginDialog.GetPassword: string;
begin
 Result:=edPassword.Text;
end;

function TPipeLoginDialog.GetSaveUserName: Boolean;
begin
 Result:=cbSaveUserName.Checked;
end;

function TPipeLoginDialog.GetUserName: String;
begin
 Result:=edUserName.Text;
end;

end.
