unit Main;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, System.Generics.Collections,
  dxSkinsdxBarPainter, dxStatusBar, dxRibbonStatusBar,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, Basic.DbDialog, Vcl.StdCtrls,
  dxBarBuiltInMenu,dxBarApplicationMenu, cxPC,  cxDropDownEdit, cxBarEditItem,
  cxImageComboBox, dxBarExtItems, dxSkinsCore, dxSkinscxPCPainter,
  Winapi.ShellAPI, Data.DB,

  Basic.Frame,
  StaticFrame.News,
  StaticFrame.Employee,
  StaticFrame.Positions,
  StaticFrame.Documents,
  StaticFrame.IncomingMessages,
  StaticDlg.Employee,
  StaticDlg.News,
  StaticDlg.Documents,
  StaticDlg.CommonSettings,
  StaticDlg.Positions,
  StaticDlg.PluginInfo,
  StaticDlg.IncomingMessages,
  Common.Images,
  Common.ApplicationSettings,
  DAC.XDataSet,
  SelectTreeDlg,
  Thread.CacheReset,
  Common.ValueWriter,
  Common.Consts;


type
  TMainForm = class(TdxRibbonForm)
    BarManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    MainMenu: TdxRibbon;
    TabEmployee: TdxRibbonTab;
    StatusBar: TdxRibbonStatusBar;
    TabPositions: TdxRibbonTab;
    TabDocuments: TdxRibbonTab;
    TabNews: TdxRibbonTab;
    bnRefreshPositions: TdxBarLargeButton;
    tbNews: TdxBar;
    bnAddNews: TdxBarLargeButton;
    bnEditNews: TdxBarLargeButton;
    bnDeleteNews: TdxBarLargeButton;
    tbEmployee: TdxBar;
    tbPostions: TdxBar;
    tbDocuments: TdxBar;
    bnToggleEmpActivity: TdxBarLargeButton;
    bnEditEmployee: TdxBarLargeButton;
    bnDeleteEmployee: TdxBarLargeButton;
    bnMoveEmployee: TdxBarLargeButton;
    bnImportEmployees: TdxBarLargeButton;
    MainPageControl: TcxPageControl;
    bnAddPosition: TdxBarLargeButton;
    bnEditPosition: TdxBarLargeButton;
    bnDeletePosition: TdxBarLargeButton;
    bnAddSiteDocument: TdxBarLargeButton;
    bnEditSiteDocument: TdxBarLargeButton;
    bnDeleteSiteDocument: TdxBarLargeButton;
    bnAddEmployee: TdxBarLargeButton;
    tbOrder: TdxBar;
    bnRaiseOrder: TdxBarLargeButton;
    bnLowerOrder: TdxBarLargeButton;
    MainRibbonMenu: TdxBarApplicationMenu;
    bnClearWebCache: TdxBarLargeButton;
    bnExportToExcel: TdxBarLargeButton;
    BarManagerBar1: TdxBar;
    bnAbout: TdxBarButton;
    bnCommonSettings: TdxBarButton;
    bnPluginInfo: TdxBarButton;
    tbEmployeeFilter: TdxBar;
    edEmployeeFilter: TdxBarEdit;
    Timer1: TTimer;
    TabIncomingMessages: TdxRibbonTab;
    tbMessages: TdxBar;
    bnDeleteMessage: TdxBarLargeButton;
    bnMarkAsUnread: TdxBarLargeButton;
    bnShowMessages: TdxBarButton;
    bnMarkAsReaded: TdxBarLargeButton;
    tbMessageFilter: TdxBar;
    cbMessageType: TdxBarImageCombo;
    tbTree: TdxBar;
    bnCollapseAll: TdxBarLargeButton;
    bnExpandAll: TdxBarLargeButton;
    bnOnlyActive: TdxBarButton;
    dxBarButton1: TdxBarButton;
    bnAddWebPages: TdxBarLargeButton;
    bnDeleteWebPages: TdxBarLargeButton;
    bnEditWebPages: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure MainMenuTabChanging(Sender: TdxCustomRibbon; ANewTab: TdxRibbonTab; var Allow: Boolean);
    procedure RefreshPage(Sender:TObject);
    procedure bnClearWebCacheClick(Sender: TObject);
    procedure bnAboutClick(Sender: TObject);
    procedure bnCommonSettingsClick(Sender: TObject);
    procedure MainRibbonMenuPopup(Sender: TObject);
    procedure bnPluginInfoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edEmployeeFilterCurChange(Sender: TObject);
    procedure edEmployeeFilterChange(Sender: TObject);
    procedure edEmployeeFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bnShowMessagesClick(Sender: TObject);
    procedure cbMessageTypeChange(Sender: TObject);
    procedure MainPageControlPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure bnOnlyActiveClick(Sender: TObject);
  private
    FFrameList : TObjectList<TBasicFrame>;
    FLastTick:Int64;
    procedure InitFrames;
    procedure RaiseActiveFrameNotAssigned;
    procedure MainMenuTabChanged(Sender: TdxCustomRibbon);
    procedure ExecuteCommonSettingsDlg;
    procedure DocumentChanged(Sender:TObject);
    procedure OnSelectionChanged(Sender:TObject);
    procedure ShowPluginInfo;
    function CreateNews:TStaticFrameNews;
    function CreateEmployees:TStaticFrameEmployee;
    function CreatePostions:TStaticFramePositions;
    function CreateDocuments:TStaticFrameDocuments;
    function CreateMessages:TStaticFrameIncomingMessages;
    procedure FilterEmployees;
    procedure LoadRegistry;
    procedure SaveRegistry;
    procedure BeforeEmployeeOpen(DataSet:TDataSet);
  public
    Function ActiveFrame:TBasicFrame;
    procedure UpdateStatusBar;
    Constructor Create(AOwner:TComponent);Override;
    Destructor Destroy; Override;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
resourcestring
 S_ROWS_SELECTED_FMT='Выделено: %d';



procedure TMainForm.RefreshPage(Sender: TObject);
begin
 ActiveFrame.RefreshDataSet;
 UpdateStatusBar;
end;

procedure TMainForm.ShowPluginInfo;
var
 Dlg: TPluginInfoDlg;
begin
 Dlg:=TPluginInfoDlg.Create(nil);
 try
  ActiveFrame.InfoToList(Dlg.cxMemo1.Lines);
  Dlg.ShowModal;
 finally
   Dlg.Free;
 end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
 if GetTickCount>FLastTick+750 then
  begin
   edEmployeeFilter.Text:=edEmployeeFilter.CurText;
   FilterEmployees;
   Timer1.Enabled:=False;
  end;
end;

procedure TMainForm.UpdateStatusBar;
resourcestring
 S_ROWS_FMT='Строк: %d';
begin
 StatusBar.Panels[0].Text:=Format(S_ROWS_FMT,[ActiveFrame.DataSet.RecordCount]);
 StatusBar.Panels[1].Text:='';
end;

function TMainForm.ActiveFrame: TBasicFrame;
begin
 Result:=nil;
 if (MainMenu.ActiveTab.Index<=FFrameList.Count) and Assigned(FFrameList[MainMenu.ActiveTab.Index]) then
   Result:=FFrameList[MainMenu.ActiveTab.Index]
    else
   RaiseActiveFrameNotAssigned;
end;


procedure TMainForm.bnClearWebCacheClick(Sender: TObject);
begin
// TCacheReseter.ResetWebCache(ApplicationSettings.WebServerAddress+'home/ResetCache');
 ShellExecute(Handle, 'open', PWideChar(ApplicationSettings.WebServerAddress+'home/ResetCache'),nil, nil, SW_SHOWNORMAL);
end;

procedure TMainForm.bnCommonSettingsClick(Sender: TObject);
begin
 ExecuteCommonSettingsDlg;
end;

procedure TMainForm.bnOnlyActiveClick(Sender: TObject);
begin
 bnRefreshPositions.Click;
end;

procedure TMainForm.bnPluginInfoClick(Sender: TObject);
begin
 ShowPluginInfo;
end;

procedure TMainForm.bnShowMessagesClick(Sender: TObject);
var
 Dlg:TFIncomingMessages;
begin Dlg:=TFIncomingMessages.Create(nil);
  try
    Dlg.RefreshDataSet;
    Dlg.ShowModal;
  finally
    Dlg.Free;
  end;
end;

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
  FFrameList:=TObjectList<TBasicFrame>.Create;
  FFrameList.Add(CreateNews);
  FFrameList.Add(CreateEmployees);
  FFrameList.Add(CreatePostions);
  FFrameList.Add(CreateDocuments);
  FFrameList.Add(CreateMessages);
  InitFrames;
  MainMenu.OnTabChanged:=MainMenuTabChanged;
  Application.HintHidePause:=10000;
  Self.LoadRegistry;
end;



function TMainForm.CreateDocuments: TStaticFrameDocuments;
begin
  Result:=TStaticFrameDocuments.Create(Self);
  bnAddSiteDocument.Action:=Result.AddRecordAction;
  bnEditSiteDocument.Action:=Result.EditRecordAction;
  bnDeleteSiteDocument.Action:=Result.DeleteRecordAction;
  Result.AfterDocumentExecute:=Self.DocumentChanged;
end;

function TMainForm.CreateEmployees: TStaticFrameEmployee;
begin
  Result:=TStaticFrameEmployee.Create(Self);
  bnAddEmployee.Action:=Result.AddRecordAction;
  bnEditEmployee.Action:=Result.EditRecordAction;
  bnDeleteEmployee.Action:=Result.DeleteRecordAction;
  bnMoveEmployee.Action:=Result.ActionByName('MoveEmployee');
  bnToggleEmpActivity.Action:=Result.ActionByName('ActivateEmployee');
  bnImportEmployees.Action:=Result.ActionByName('ExcelImport');
  Result.AfterDocumentExecute:=Self.DocumentChanged;
  Result.OnSelectionChanged:=Self.OnSelectionChanged;
  Result.DataSet.BeforeOpen:=BeforeEmployeeOpen;
end;


function TMainForm.CreateMessages: TStaticFrameIncomingMessages;
begin
 Result:=TStaticFrameIncomingMessages.Create(Self);
 Result.OnSelectionChanged:=Self.OnSelectionChanged;

 bnMarkAsUnread.Action:=Result.ActionByName('MarkAsUnreaded');
 bnMarkAsReaded.Action:=Result.ActionByName('MarkAsReaded');
 bnDeleteMessage.Action:=Result.DeleteRecordAction;
end;

function TMainForm.CreateNews: TStaticFrameNews;
begin
  Result:=TStaticFrameNews.Create(Self);
  bnAddNews.Action:=Result.AddRecordAction;
  bnEditNews.Action:=Result.EditRecordAction;
  bnDeleteNews.Action:=Result.DeleteRecordAction;
  Result.AfterDocumentExecute:=Self.DocumentChanged;
  Result.OnSelectionChanged:=Self.OnSelectionChanged;
end;

function TMainForm.CreatePostions: TStaticFramePositions;
begin
  Result:=TStaticFramePositions.Create(Self);
  bnAddPosition.Action:=Result.AddRecordAction;
  bnEditPosition.Action:=Result.EditRecordAction;
  bnDeletePosition.Action:=Result.DeleteRecordAction;
  bnRaiseOrder.Action:=Result.ActionByName('RaiseOrder');
  bnLowerOrder.Action:=Result.ActionByName('LowerOrder');
  bnCollapseAll.Action:=Result.ActionByName('CollapseAll');
  bnExpandAll.Action:=Result.ActionByName('ExpandAll');

  Result.AfterDocumentExecute:=Self.DocumentChanged;
end;

destructor TMainForm.Destroy;
begin
  Self.SaveRegistry;
  FFrameList.Free;
  inherited;
end;

procedure TMainForm.DocumentChanged(Sender:TObject);
begin
 if ApplicationSettings.WebServerValid then
   TCacheReseter.ResetWebCache(ApplicationSettings.WebServerAddress+'home/ResetCache');
end;

procedure TMainForm.cbMessageTypeChange(Sender: TObject);
begin
 case cbMessageType.ItemIndex of
  1: ActiveFrame.FilterDataSet('SystemMessage','True',False);
  2: ActiveFrame.FilterDataSet('SystemMessage','False',False);
   else
    ActiveFrame.FilterDataSet('SystemMessage','',False);
 end;
end;

procedure TMainForm.edEmployeeFilterChange(Sender: TObject);
begin
 Timer1.Enabled:=False;
 FilterEmployees;
end;

procedure TMainForm.edEmployeeFilterCurChange(Sender: TObject);
begin
FLastTick:=GetTickCount;
 Timer1.Enabled:=True;
end;

procedure TMainForm.edEmployeeFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_DOWN then
   ActiveControl:=(FFrameList[1] as TStaticFrameEmployee);
end;

procedure TMainForm.ExecuteCommonSettingsDlg;
var
 Dlg:TCommonSettingsDlg;
begin
 Dlg:=TCommonSettingsDlg.Create(nil);
 try
   Dlg.Address:=ApplicationSettings.WebServerAddress;
   if Dlg.ShowModal=mrOK then
    ApplicationSettings.WebServerAddress:=Dlg.Address;
 finally
   Dlg.Free;
 end;
end;

procedure TMainForm.BeforeEmployeeOpen(DataSet: TDataSet);
begin
 (DataSet as TxDataSet).SetParameter('OnlyActive',bnOnlyActive.Down);
end;

procedure TMainForm.bnAboutClick(Sender: TObject);
begin
 MessageBox(Handle,'Программа управления вэб сайтом, и она всё ещё находится в стадии разработки.','О программе',MB_OK+MB_ICONINFORMATION);
end;

procedure TMainForm.FilterEmployees;
begin
 FFrameList[1].FilterDataSet('Fullname',edEmployeeFilter.CurText,True);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DisableAero := False;
  MainMenu.ActiveTab:=TabNews;
end;

procedure TMainForm.InitFrames;
var
 X:Integer;
 Tab:TcxTabSheet;
begin
 for X:=0 to FFrameList.Count-1 do
  begin
   Tab:=TcxTabSheet.Create(Self);
   Tab.PageControl:=MainPageControl;
   FFrameList[x].Align:=alClient;
   FFrameList[x].Parent:=Tab;
  end;
end;


procedure TMainForm.SaveRegistry;
begin
 TProjectRegistry.WriteBool(BaseRegistryKeyProjects,'Maximized', WindowState=wsMaximized);
 TProjectRegistry.WriteInt(BaseRegistryKeyProjects,'Width', Width);
 TProjectRegistry.WriteInt(BaseRegistryKeyProjects,'Height', Height);
 TProjectRegistry.WriteBool(BaseRegistryKeyProjects,'OnlyActive', bnOnlyActive.Down);
end;

procedure TMainForm.LoadRegistry;
begin
 if TProjectRegistry.ReadBool(BaseRegistryKeyProjects,'Maximized', False)=True then
  WindowState:=wsMaximized;
 Width:=TProjectRegistry.ReadIntDef(BaseRegistryKeyProjects,'Width', Width);
 Height:=TProjectRegistry.ReadIntDef(BaseRegistryKeyProjects,'Height', Height);
 bnOnlyActive.Down:=TProjectRegistry.ReadBool(BaseRegistryKeyProjects,'OnlyActive',True)
end;

procedure TMainForm.MainMenuTabChanged(Sender: TdxCustomRibbon);
begin
 //RefreshActiveFrameDataSet;
 UpdateStatusBar;
end;

procedure TMainForm.MainMenuTabChanging(Sender: TdxCustomRibbon; ANewTab: TdxRibbonTab; var Allow: Boolean);
begin
 if ANewTab.Index<MainPageControl.TabCount then
  MainPageControl.ActivePageIndex:=ANewTab.Index;
end;


procedure TMainForm.MainPageControlPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
 if (NewPage.PageIndex<=FFrameList.Count) then
   FFrameList[NewPage.PageIndex].AutoRefresh;
end;

procedure TMainForm.MainRibbonMenuPopup(Sender: TObject);
begin
 bnClearWebCache.Enabled:=ApplicationSettings.WebServerValid;
end;

procedure TMainForm.OnSelectionChanged(Sender: TObject);
var
 AFrame:TBasicFrame;
begin
 AFrame:=Sender as TBasicFrame;
 Self.StatusBar.Panels[1].Text:=Format(S_ROWS_SELECTED_FMT, [AFrame.SelectedRecordCount]);
end;

procedure TMainForm.RaiseActiveFrameNotAssigned;
begin
 raise Exception.Create('Unable to get Active Frame');
end;


end.
