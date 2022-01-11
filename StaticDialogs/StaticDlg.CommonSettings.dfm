inherited CommonSettingsDlg: TCommonSettingsDlg
  BorderStyle = bsDialog
  Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 113
  ClientWidth = 325
  ExplicitWidth = 331
  ExplicitHeight = 141
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottomButtons: TPanel
    Top = 72
    Width = 325
    ExplicitTop = 72
    ExplicitWidth = 325
    inherited bnOK: TcxButton
      Left = 147
      Enabled = False
      ExplicitLeft = 147
    end
    inherited bnCancel: TcxButton
      Left = 236
      ExplicitLeft = 236
    end
  end
  object cxTextEdit1: TcxTextEdit
    Left = 118
    Top = 16
    Properties.OnChange = cxTextEdit1PropertiesChange
    TabOrder = 1
    Width = 183
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 17
    Caption = #1040#1076#1088#1077#1089' '#1074#1101#1073'-'#1089#1077#1088#1074#1077#1088#1072':'
  end
  object cxLabel2: TcxLabel
    Left = 118
    Top = 43
    Caption = #1053#1077' '#1074#1077#1088#1085#1099#1081' '#1072#1076#1088#1077#1089' '#1074#1101#1073'-'#1089#1077#1088#1074#1077#1088#1072
    Style.TextColor = clRed
    Visible = False
  end
end
