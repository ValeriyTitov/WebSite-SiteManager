inherited BasicDBDlg: TBasicDBDlg
  Caption = 'Basic Database Dialog'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottomButtons: TPanel
    inherited bnOK: TcxButton
      ModalResult = 0
      OnClick = bnOKClick
    end
  end
  object DataSource: TDataSource
    Left = 8
    Top = 249
  end
end
