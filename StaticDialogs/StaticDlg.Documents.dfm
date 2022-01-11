inherited DocumentsDlg: TDocumentsDlg
  Hint = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072', '#1082#1086#1090#1086#1088#1086#1077' '#1073#1091#1076#1077#1090' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100#1089#1103' '
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 312
  ClientWidth = 449
  Constraints.MinHeight = 350
  Constraints.MinWidth = 390
  OnCreate = FormCreate
  ExplicitWidth = 465
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  object lbOpenUrl: TLabel [0]
    Left = 395
    Top = 252
    Width = 46
    Height = 13
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1088#1099#1090#1100
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
    OnClick = lbOpenUrlClick
    OnMouseEnter = lbOpenUrlMouseEnter
    OnMouseLeave = lbOpenUrlMouseLeave
    ExplicitLeft = 320
  end
  inherited pnBottomButtons: TPanel
    Top = 271
    Width = 449
    TabOrder = 7
    ExplicitTop = 271
    ExplicitWidth = 449
    DesignSize = (
      449
      41)
    inherited bnOK: TcxButton
      Left = 279
      ExplicitLeft = 279
    end
    inherited bnCancel: TcxButton
      Left = 360
      ExplicitLeft = 360
    end
  end
  object cxLabel1: TcxLabel [2]
    Left = 8
    Top = 95
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  object edDescription: TcxDBTextEdit [3]
    Left = 82
    Top = 91
    Hint = #1053#1072#1079#1074#1072#1085#1080#1077', '#1082#1086#1090#1086#1088#1086#1077' '#1073#1091#1076#1077#1090' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100#1089#1103' '#1074' '#1088#1072#1079#1076#1077#1083#1077' "'#1044#1086#1082#1091#1084#1077#1085#1090#1099'"'
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'Description'
    DataBinding.DataSource = DataSource
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Width = 359
  end
  object edSearchTags: TcxDBTextEdit [4]
    Left = 81
    Top = 145
    Hint = #1059#1082#1072#1079#1099#1074#1072#1077#1090' '#1089#1083#1086#1074#1072', '#1082#1086#1090#1086#1088#1099#1077' '#1073#1091#1076#1091#1090' '#1091#1095#1080#1090#1099#1074#1072#1090#1100#1089#1103' '#1087#1088#1080' '#1087#1086#1080#1089#1082#1077
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'Tags'
    DataBinding.DataSource = DataSource
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Width = 359
  end
  object lbTags: TcxLabel [5]
    Left = 8
    Top = 149
    Caption = #1044#1083#1103' '#1087#1086#1080#1089#1082#1072
  end
  object bnBrowseFile: TcxButton [6]
    Left = 366
    Top = 58
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1073#1079#1086#1088'...'
    TabOrder = 2
    OnClick = bnBrowseFileClick
  end
  object edFileName: TcxDBTextEdit [7]
    Left = 81
    Top = 60
    Hint = #1048#1084#1103' '#1092#1072#1081#1083#1072' '#1087#1088#1080' '#1079#1072#1075#1088#1091#1079#1082#1077' '#1089' '#1089#1072#1081#1090#1072
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'FileName'
    DataBinding.DataSource = DataSource
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Width = 273
  end
  object lbFileName: TcxLabel [8]
    Left = 8
    Top = 64
    Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
  end
  object edEP: TcxDBButtonEdit [9]
    Left = 82
    Top = 118
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'OwnerID'
    DataBinding.DataSource = DataSource
    Properties.Alignment.Horz = taLeftJustify
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = edEPPropertiesButtonClick
    Properties.OnEditValueChanged = edEPPropertiesEditValueChanged
    TabOrder = 4
    Width = 359
  end
  object lbGroup: TcxLabel [10]
    Left = 9
    Top = 122
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object rgItemType: TcxDBRadioGroup [11]
    Left = 8
    Top = 8
    Caption = #1058#1080#1087
    DataBinding.DataField = 'IsGroup'
    DataBinding.DataSource = DataSource
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = #1043#1088#1091#1087#1087#1072
        Value = True
      end
      item
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        Value = False
      end>
    Properties.OnEditValueChanged = rgItemTypePropertiesEditValueChanged
    TabOrder = 0
    Height = 41
    Width = 185
  end
  object memUrl: TcxMemo [12]
    Left = 9
    Top = 192
    Hint = 
      'Html-'#1089#1089#1099#1083#1082#1072' '#1085#1072' '#1076#1086#1082#1091#1084#1077#1085#1090', '#1076#1083#1103' '#1074#1089#1090#1072#1074#1082#1080' '#1074' '#1085#1086#1074#1086#1089#1090#1100' '#1085#1072' '#1075#1083#1072#1074#1085#1086#1081' '#1089#1090#1088#1072#1085#1080 +
      #1094#1077' ('#1077#1089#1083#1080' '#1074' '#1085#1086#1074#1086#1089#1090#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072' '#1086#1073#1088#1072#1073#1086#1090#1082#1072' html)'
    Anchors = [akLeft, akTop, akRight, akBottom]
    ParentShowHint = False
    Properties.ReadOnly = True
    Properties.WantReturns = False
    ShowHint = True
    Style.Color = 15395562
    TabOrder = 6
    Visible = False
    Height = 54
    Width = 432
  end
  object lbUrl: TcxLabel [13]
    Left = 8
    Top = 174
    Caption = #1057#1089#1099#1083#1082#1072' '#1076#1083#1103' '#1074#1089#1090#1072#1074#1082#1080' '#1085#1072' '#1089#1072#1081#1090':'
    Visible = False
  end
  object cbShowInDocuments: TcxDBCheckBox [14]
    Left = 204
    Top = 20
    Hint = 
      #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1076#1072#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1089#1072#1081#1090#1077' '#1074' '#1088#1072#1079#1076#1077#1083#1077' "'#1044#1086#1082#1091#1084#1077#1085#1090#1099'". '#1057#1082#1088#1099#1090 +
      #1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1074#1089#1105' '#1088#1072#1074#1085#1086' '#1084#1086#1078#1085#1086' '#1079#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1086' '#1087#1088#1103#1084#1086#1081' '#1089#1089#1099#1083#1082#1077
    Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093
    DataBinding.DataField = 'ShowInDocuments'
    DataBinding.DataSource = DataSource
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  inherited DataSource: TDataSource
    Left = 320
    Top = 96
  end
  object Dlg: TOpenDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'(*.*)|*.*'
    Left = 272
    Top = 96
  end
end
