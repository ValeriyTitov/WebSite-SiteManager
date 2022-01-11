inherited ViewMessageDlg: TViewMessageDlg
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
  ClientHeight = 362
  ClientWidth = 389
  Constraints.MinHeight = 400
  Constraints.MinWidth = 400
  OnCreate = FormCreate
  ExplicitWidth = 405
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottomButtons: TPanel
    Top = 321
    Width = 389
    ExplicitTop = 321
    ExplicitWidth = 389
    inherited bnOK: TcxButton
      Left = 219
      ExplicitLeft = 219
    end
    inherited bnCancel: TcxButton
      Left = 300
      ExplicitLeft = 300
    end
  end
  object memMessage: TcxDBMemo [1]
    Left = 0
    Top = 169
    Align = alClient
    DataBinding.DataField = 'Message'
    DataBinding.DataSource = DataSource
    TabOrder = 1
    Height = 152
    Width = 389
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 389
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      389
      169)
    object Label1: TLabel
      Left = 56
      Top = 11
      Width = 37
      Height = 13
      Caption = #1055#1088#1080#1085#1103#1090
    end
    object Label2: TLabel
      Left = 16
      Top = 38
      Width = 88
      Height = 13
      Caption = #1048#1084#1103' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
    end
    object Label3: TLabel
      Left = 5
      Top = 65
      Width = 100
      Height = 13
      Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072
    end
    object Label4: TLabel
      Left = 5
      Top = 150
      Width = 92
      Height = 13
      Caption = #1058#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103':'
    end
    object Label5: TLabel
      Left = 60
      Top = 92
      Width = 44
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085
    end
    object Label6: TLabel
      Left = 33
      Top = 119
      Width = 79
      Height = 13
      Caption = 'IP '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
    end
    object edUserName: TcxDBTextEdit
      Left = 118
      Top = 35
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'UserName'
      DataBinding.DataSource = DataSource
      TabOrder = 1
      Width = 233
    end
    object edEmail: TcxDBTextEdit
      Left = 118
      Top = 62
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'ContactEmail'
      DataBinding.DataSource = DataSource
      TabOrder = 2
      Width = 233
    end
    object edPhone: TcxDBTextEdit
      Left = 118
      Top = 89
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'ContactPhone'
      DataBinding.DataSource = DataSource
      TabOrder = 3
      Width = 233
    end
    object edIpAddress: TcxDBTextEdit
      Left = 118
      Top = 116
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'SubmiterIPAdress'
      DataBinding.DataSource = DataSource
      TabOrder = 4
      Width = 233
    end
    object edDate: TcxDBDateEdit
      Left = 118
      Top = 8
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'ADate'
      DataBinding.DataSource = DataSource
      TabOrder = 0
      Width = 233
    end
  end
end
