inherited PluginInfoDlg: TPluginInfoDlg
  Caption = #1057#1077#1082#1088#1077#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 262
  ClientWidth = 384
  OnCreate = FormCreate
  ExplicitWidth = 400
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottomButtons: TPanel
    Top = 221
    Width = 384
    ExplicitTop = 221
    ExplicitWidth = 384
    inherited bnOK: TcxButton
      Left = 206
      Top = 6
      ExplicitLeft = 206
      ExplicitTop = 6
    end
    inherited bnCancel: TcxButton
      Left = 295
      Top = 6
      ExplicitLeft = 295
      ExplicitTop = 6
    end
  end
  object cxMemo1: TcxMemo
    Left = 0
    Top = 0
    Align = alClient
    Properties.ReadOnly = True
    TabOrder = 1
    Height = 221
    Width = 384
  end
end
