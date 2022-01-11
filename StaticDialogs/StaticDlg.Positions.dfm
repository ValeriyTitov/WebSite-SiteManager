inherited PositionsDlg: TPositionsDlg
  Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
  ClientHeight = 202
  ClientWidth = 444
  Constraints.MinHeight = 240
  Constraints.MinWidth = 460
  OnCreate = FormCreate
  ExplicitWidth = 460
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottomButtons: TPanel
    Top = 161
    Width = 444
    TabOrder = 5
    ExplicitTop = 161
    ExplicitWidth = 444
    inherited bnOK: TcxButton
      Left = 274
      ExplicitLeft = 274
    end
    inherited bnCancel: TcxButton
      Left = 355
      ExplicitLeft = 355
    end
  end
  object edPostionName: TcxDBTextEdit [1]
    Left = 120
    Top = 38
    DataBinding.DataField = 'Description'
    DataBinding.DataSource = DataSource
    TabOrder = 1
    Width = 297
  end
  object edOrderID: TcxDBTextEdit [2]
    Left = 120
    Top = 73
    Hint = 
      #1055#1086#1079#1074#1086#1083#1103#1077#1090' '#1079#1072#1076#1072#1090#1100' '#1086#1095#1077#1088#1077#1076#1100' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1076#1086#1083#1078#1085#1086#1089#1090#1080' '#1074' '#1089#1090#1088#1091#1082#1090#1091#1088#1085#1086#1084' '#1087#1086#1076 +
      #1088#1072#1079#1076#1077#1083#1077#1085#1080#1080
    DataBinding.DataField = 'OrderID'
    DataBinding.DataSource = DataSource
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Width = 81
  end
  object cxLabel1: TcxLabel [3]
    Left = 8
    Top = 42
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '
  end
  object cxLabel2: TcxLabel [4]
    Left = 8
    Top = 77
    Caption = #1054#1095#1077#1088#1077#1076#1100
  end
  object cbImageIndex: TcxDBImageComboBox [5]
    Left = 120
    Top = 100
    DataBinding.DataField = 'ImageIndex'
    DataBinding.DataSource = DataSource
    Properties.DropDownRows = 20
    Properties.Images = ImageContainer.Images16
    Properties.Items = <>
    TabOrder = 4
    Width = 81
  end
  object cbDepatmentList: TcxDBImageComboBox [6]
    Left = 120
    Top = 8
    DataBinding.DataField = 'OwnerID'
    DataBinding.DataSource = DataSource
    Properties.Images = ImageContainer.Images16
    Properties.Items = <>
    TabOrder = 0
    Width = 297
  end
  object cxLabel3: TcxLabel [7]
    Left = 8
    Top = 12
    Caption = #1042' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
  end
  object cxLabel4: TcxLabel [8]
    Left = 8
    Top = 104
    Caption = #1050#1072#1088#1090#1080#1085#1082#1072
  end
  object rgItemType: TcxDBRadioGroup [9]
    Left = 232
    Top = 65
    Caption = #1058#1080#1087
    DataBinding.DataField = 'ItemType'
    DataBinding.DataSource = DataSource
    Properties.Items = <
      item
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        Value = '0'
      end
      item
        Caption = #1054#1090#1076#1077#1083'/'#1091#1087#1088#1072#1074#1083#1077#1085#1080#1077
        Value = '1'
      end>
    Properties.OnChange = rgItemTypePropertiesChange
    Properties.OnEditValueChanged = cxDBRadioGroup1PropertiesEditValueChanged
    TabOrder = 3
    Height = 56
    Width = 185
  end
  object cbIsBoss: TcxDBCheckBox [10]
    Left = 8
    Top = 134
    Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    DataBinding.DataField = 'IsBoss'
    DataBinding.DataSource = DataSource
    TabOrder = 10
  end
end
