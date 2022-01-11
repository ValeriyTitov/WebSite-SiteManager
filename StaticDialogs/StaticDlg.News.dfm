inherited NewsDlg: TNewsDlg
  Caption = #1053#1086#1074#1086#1089#1090#1080
  ClientHeight = 538
  ClientWidth = 615
  Constraints.MinHeight = 400
  Constraints.MinWidth = 620
  OnCreate = FormCreate
  ExplicitWidth = 631
  ExplicitHeight = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottomButtons: TPanel
    Top = 497
    Width = 615
    ExplicitTop = 497
    ExplicitWidth = 615
    inherited bnOK: TcxButton
      Left = 445
      ExplicitLeft = 445
    end
    inherited bnCancel: TcxButton
      Left = 526
      ExplicitLeft = 526
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 615
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 94
      Width = 82
      Height = 13
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1086':'
    end
    object lbCaption: TLabel
      Left = 8
      Top = 40
      Width = 57
      Height = 13
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082':'
    end
    object Label3: TLabel
      Left = 8
      Top = 67
      Width = 74
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1086#1074#1086#1089#1090#1080':'
    end
    object Label4: TLabel
      Left = 8
      Top = 118
      Width = 77
      Height = 13
      Caption = #1058#1077#1082#1089#1090' '#1085#1086#1074#1086#1089#1090#1080':'
    end
    object deValidThru: TcxDBDateEdit
      Left = 106
      Top = 91
      DataBinding.DataField = 'ValidThru'
      DataBinding.DataSource = DataSource
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 113
    end
    object cbAlwaysValid: TcxDBCheckBox
      Left = 225
      Top = 91
      Hint = #1042#1089#1077#1075#1076#1072' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1086#1074#1086#1089#1090#1100' '#1085#1072' '#1075#1083#1072#1074#1085#1086#1081' '#1089#1090#1088#1072#1085#1094#1077
      Caption = #1042#1089#1077#1075#1076#1072' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100
      DataBinding.DataField = 'AlwaysValid'
      DataBinding.DataSource = DataSource
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = cbAlwaysValidClick
    end
    object edText: TcxDBTextEdit
      Left = 103
      Top = 37
      DataBinding.DataField = 'Caption'
      DataBinding.DataSource = DataSource
      TabOrder = 2
      Width = 353
    end
    object edADate: TcxDBDateEdit
      Left = 106
      Top = 64
      DataBinding.DataField = 'ADate'
      DataBinding.DataSource = DataSource
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 113
    end
    object cbActive: TcxDBCheckBox
      Left = 8
      Top = 10
      Hint = #1042#1089#1077#1075#1076#1072' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1086#1074#1086#1089#1090#1100' '#1085#1072' '#1075#1083#1072#1074#1085#1086#1081' '#1089#1090#1088#1072#1085#1094#1077
      Caption = #1040#1082#1090#1080#1074#1085#1072
      DataBinding.DataField = 'Active'
      DataBinding.DataSource = DataSource
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = cbAlwaysValidClick
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 472
    Width = 615
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 2
    object cbRawHtml: TcxDBCheckBox
      Left = 11
      Top = 3
      Hint = 
        #1054#1073#1088#1072#1073#1072#1090#1099#1074#1072#1090#1100' '#1090#1101#1075#1080' html, '#1085#1072#1087#1088#1080#1084#1077#1088' <a href=....>. '#1053#1077#1087#1088#1072#1074#1080#1083#1100#1085#1086#1077' '#1080#1089#1087 +
        #1086#1083#1100#1079#1086#1074#1072#1085#1080#1077', '#1084#1086#1078#1077#1090' '#1085#1072#1088#1091#1096#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1089#1072#1081#1090#1072
      Caption = #1054#1073#1088#1072#1073#1072#1090#1099#1074#1072#1090#1100' html'
      DataBinding.DataField = 'RawHtml'
      DataBinding.DataSource = DataSource
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = cbAlwaysValidClick
    end
  end
  object memData: TDBMemo [3]
    Left = 0
    Top = 137
    Width = 615
    Height = 335
    Align = alClient
    DataField = 'Text'
    DataSource = DataSource
    TabOrder = 3
    ExplicitLeft = 224
    ExplicitTop = 248
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
end
