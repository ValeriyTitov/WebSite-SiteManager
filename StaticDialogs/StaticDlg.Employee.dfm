inherited EmployeeDlg: TEmployeeDlg
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1077
  ClientHeight = 521
  ClientWidth = 548
  Constraints.MinHeight = 540
  Constraints.MinWidth = 540
  OnCreate = FormCreate
  ExplicitWidth = 564
  ExplicitHeight = 559
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottomButtons: TPanel
    Top = 480
    Width = 548
    ExplicitTop = 480
    ExplicitWidth = 548
    inherited bnOK: TcxButton
      Left = 378
      ExplicitLeft = 378
    end
    inherited bnCancel: TcxButton
      Left = 459
      ExplicitLeft = 459
    end
  end
  object pgMain: TcxPageControl [1]
    Left = 0
    Top = 0
    Width = 548
    Height = 480
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = Tab0
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 476
    ClientRectLeft = 4
    ClientRectRight = 544
    ClientRectTop = 24
    object Tab0: TcxTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1086#1077
      ImageIndex = 0
      DesignSize = (
        540
        452)
      object lbOpenUrl: TLabel
        Left = 187
        Top = 420
        Width = 46
        Height = 13
        Cursor = crHandPoint
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
      end
      object edFullName: TcxDBTextEdit
        Left = 120
        Top = 8
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'FullName'
        DataBinding.DataSource = DataSource
        TabOrder = 0
        Width = 400
      end
      object edMobilePhone: TcxDBTextEdit
        Left = 120
        Top = 115
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'MobilePhone'
        DataBinding.DataSource = DataSource
        TabOrder = 1
        Width = 400
      end
      object deBirthDate: TcxDBDateEdit
        Left = 120
        Top = 169
        DataBinding.DataField = 'BirthDate'
        DataBinding.DataSource = DataSource
        TabOrder = 2
        Width = 113
      end
      object edPhone: TcxDBTextEdit
        Left = 120
        Top = 88
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'Phone'
        DataBinding.DataSource = DataSource
        TabOrder = 3
        Width = 400
      end
      object edRoomNumber: TcxDBTextEdit
        Left = 120
        Top = 196
        DataBinding.DataField = 'RoomNumber'
        DataBinding.DataSource = DataSource
        TabOrder = 4
        Width = 113
      end
      object edEmail: TcxDBTextEdit
        Left = 120
        Top = 61
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'EMail'
        DataBinding.DataSource = DataSource
        TabOrder = 5
        Width = 400
      end
      object cxLabel1: TcxLabel
        Left = 8
        Top = 12
        Caption = #1048#1084#1103
      end
      object cxLabel2: TcxLabel
        Left = 8
        Top = 173
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1078#1076#1077#1085#1080#1103
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 200
        Caption = #1053#1086#1084#1077#1088' '#1082#1086#1084#1085#1072#1090#1099
      end
      object cxLabel4: TcxLabel
        Left = 8
        Top = 65
        Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072
      end
      object cxLabel5: TcxLabel
        Left = 8
        Top = 92
        Caption = #1058#1077#1083#1077#1092#1086#1085
      end
      object cxLabel6: TcxLabel
        Left = 8
        Top = 119
        Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083'.'
      end
      object cxLabel8: TcxLabel
        Left = 8
        Top = 39
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      end
      object edEP: TcxDBButtonEdit
        Left = 120
        Top = 35
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'DepartmentPositionsID'
        DataBinding.DataSource = DataSource
        Properties.Alignment.Horz = taLeftJustify
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = cxDBButtonEdit1PropertiesButtonClick
        Properties.OnEditValueChanged = edEPPropertiesEditValueChanged
        TabOrder = 13
        Width = 400
      end
      object rbGender: TcxDBRadioGroup
        Left = 10
        Top = 277
        Caption = #1055#1086#1083
        DataBinding.DataField = 'Gender'
        DataBinding.DataSource = DataSource
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = #1052#1091#1078
            Value = '0'
          end
          item
            Caption = #1046#1077#1085
            Value = '1'
          end>
        TabOrder = 14
        Height = 48
        Width = 223
      end
      object imPhoto: TcxDBImage
        Left = 256
        Top = 142
        Anchors = [akTop, akRight, akBottom]
        DataBinding.DataField = 'Data'
        DataBinding.DataSource = ImageDataSource
        Properties.GraphicClassName = 'TdxSmartImage'
        TabOrder = 15
        Height = 310
        Width = 264
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 8
        Top = 223
        Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1076#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1085#1072' '#1075#1083#1072#1074#1085#1086#1081' '#1089#1090#1088#1072#1085#1080#1094#1077' '#1089#1072#1081#1090#1072
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
        DataBinding.DataField = 'ShowBirthday'
        DataBinding.DataSource = DataSource
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 8
        Top = 250
        Hint = #1057#1086#1090#1088#1091#1076#1085#1080#1082' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1088#1072#1073#1086#1090#1085#1080#1082#1086#1084' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Caption = #1064#1090#1072#1090#1085#1099#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.DataField = 'StateEmployee'
        DataBinding.DataSource = DataSource
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
      end
      object cxLabel7: TcxLabel
        Left = 8
        Top = 146
        Caption = #1053#1086#1084#1077#1088' ICQ'
      end
      object edMessengerNumber: TcxDBTextEdit
        Left = 120
        Top = 142
        DataBinding.DataField = 'MessengerNumber'
        DataBinding.DataSource = DataSource
        TabOrder = 19
        Width = 113
      end
      object memUrl: TcxMemo
        Left = 10
        Top = 354
        Hint = 
          'Html-'#1089#1089#1099#1083#1082#1072' '#1085#1072' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072', '#1076#1083#1103' '#1074#1089#1090#1072#1074#1082#1080' '#1074' '#1085#1086#1074#1086#1089#1090#1100' '#1085#1072' '#1075#1083#1072#1074#1085#1086#1081' '#1089#1090#1088#1072 +
          #1085#1080#1094#1077' ('#1077#1089#1083#1080' '#1074' '#1085#1086#1074#1086#1089#1090#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072' '#1086#1073#1088#1072#1073#1086#1090#1082#1072' html)'
        ParentShowHint = False
        Properties.ReadOnly = True
        Properties.WantReturns = False
        ShowHint = True
        Style.Color = 15395562
        TabOrder = 20
        Visible = False
        Height = 60
        Width = 223
      end
      object lbUrl: TcxLabel
        Left = 10
        Top = 331
        Caption = #1057#1089#1099#1083#1082#1072' '#1076#1083#1103' '#1074#1089#1090#1072#1074#1082#1080' '#1085#1072' '#1089#1072#1081#1090':'
        Visible = False
      end
    end
    object Tab1: TcxTabSheet
      Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1080#1077
      ImageIndex = 1
      TabVisible = False
      object gridMissing: TcxGrid
        Left = 0
        Top = 0
        Width = 540
        Height = 452
        Align = alClient
        TabOrder = 0
        object gridMissingDBTableView1: TcxGridDBTableView
          PopupMenu = PopupMenu1
          Navigator.Buttons.CustomButtons = <>
          OnCustomDrawCell = gridMissingDBTableView1CustomDrawCell
          DataController.DataSource = dsMissings
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Images = ImageContainer.Images16
          OptionsCustomize.ColumnFiltering = False
          OptionsView.NoDataToDisplayInfoText = ' '
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object colMissingStartDate: TcxGridDBColumn
            Caption = #1053#1072#1095#1072#1083#1086
            DataBinding.FieldName = 'StartDate'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.DateButtons = []
            Properties.SaveTime = False
            Properties.ShowTime = False
            Width = 104
          end
          object colMissingEndDate: TcxGridDBColumn
            Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
            DataBinding.FieldName = 'EndDate'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.DateButtons = []
            Properties.SaveTime = False
            Properties.ShowTime = False
            Width = 123
          end
          object colMissingReason: TcxGridDBColumn
            Caption = #1055#1088#1080#1095#1080#1085#1072
            DataBinding.FieldName = 'Reason'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              #1054#1090#1087#1091#1089#1082
              #1050#1086#1084#1072#1085#1076#1080#1088#1086#1074#1082#1072
              #1041#1086#1083#1100#1085#1080#1095#1085#1099#1081)
            Width = 311
          end
        end
        object gridMissingLevel1: TcxGridLevel
          GridView = gridMissingDBTableView1
        end
      end
    end
  end
  inherited DataSource: TDataSource
    Left = 240
    Top = 472
  end
  object ImageDataSource: TDataSource
    Left = 160
    Top = 472
  end
  object dsMissings: TDataSource
    Left = 308
    Top = 472
  end
  object PopupMenu1: TPopupMenu
    Images = ImageContainer.Images16
    OnPopup = PopupMenu1Popup
    Left = 364
    Top = 264
    object miAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 44
      OnClick = miAddClick
    end
    object miDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      ImageIndex = 48
      OnClick = miDeleteClick
    end
  end
end
