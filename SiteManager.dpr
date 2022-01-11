program SiteManager;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Common.Images in 'Common.Images.pas' {ImageContainer},
  DAC.XDataSet in 'DAC.XDataSet.Pas',
  DAC.CSB in 'DAC.CSB.pas',
  DAC.ConnectionMngr in 'DAC.ConnectionMngr.pas',
  StaticDlg.BasicModalDialog in 'StaticDialogs\StaticDlg.BasicModalDialog.pas' {BasicModalDialog},
  Basic.DBDialog in 'Basic.DBDialog.pas' {BasicDBDialog: TFrame},
  Basic.Frame in 'Basic.Frame.pas' {BasicFrame: TFrame},
  Basic.GridFrame in 'Basic.GridFrame.pas' {BasicGridFrame: TFrame},
  Basic.TreeGridFrame in 'Basic.TreeGridFrame.pas' {BasicTreeGridFrame: TFrame},
  StaticFrame.News in 'StaticFrames\StaticFrame.News.pas' {StaticFrameNews: TFrame},
  StaticFrame.Employee in 'StaticFrames\StaticFrame.Employee.pas' {StaticFrameEmployee: TFrame},
  StaticFrame.Departments in 'StaticFrames\StaticFrame.Departments.pas' {StaticFrameDepartments: TFrame},
  StaticFrame.Documents in 'StaticFrames\StaticFrame.Documents.pas' {StaticFrameDocuments: TFrame},
  StaticFrame.Contacts in 'StaticFrames\StaticFrame.Contacts.pas' {StaticFrameContacts: TFrame},
  StaticFrame.Positions in 'StaticFrames\StaticFrame.Positions.pas' {StaticFramePositions: TFrame},
  StaticDlg.Employee in 'StaticDialogs\StaticDlg.Employee.pas' {EmployeeDlg},
  StaticDlg.Positions in 'StaticDialogs\StaticDlg.Positions.pas' {PositionsDlg},
  StaticDlg.News in 'StaticDialogs\StaticDlg.News.pas' {NewsDlg},
  StaticDlg.Documents in 'StaticDialogs\StaticDlg.Documents.pas' {DocumentsDlg},
  StaticDlg.Image in 'StaticDialogs\StaticDlg.Image.pas' {ImageDialog},
  StaticDlg.CommonSettings in 'StaticDialogs\StaticDlg.CommonSettings.pas' {ImageDialog},
  StaticDlg.ProjectSettings in 'LoginDialog\StaticDlg.ProjectSettings.pas',
  StaticDlg.Login in 'LoginDialog\StaticDlg.Login.pas' {PipeLoginDialog},
  ControlFiller in 'ControlFiller.pas',
  Common.PipeList in 'Common.PipeList.pas',
  StaticDlg.PluginInfo in 'StaticDialogs\StaticDlg.PluginInfo.pas' {PluginInfoDlg},
  Common.ApplicationSettings in 'Common.ApplicationSettings.pas',
  StaticDlg.IncomingMessages in 'StaticDialogs\StaticDlg.IncomingMessages.pas' {FIncomingMessages},
  StaticFrame.IncomingMessages in 'StaticFrames\StaticFrame.IncomingMessages.pas' {StaticFrameIncomingMessages: TFrame},
  StaticDlg.ViewMessage in 'StaticDialogs\StaticDlg.ViewMessage.pas' {ViewMessageDlg},
  Thread.CacheReset in 'Thread.CacheReset.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutDown:=True;
  if not ConnectionManager.ExecuteLoginDialog then
   Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TImageContainer, ImageContainer);
  Application.Run;
end.
