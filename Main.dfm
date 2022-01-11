object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1089#1072#1081#1090#1086#1084
  ClientHeight = 492
  ClientWidth = 798
  Color = clBtnFace
  Constraints.MinHeight = 384
  Constraints.MinWidth = 512
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TdxRibbon
    Left = 0
    Top = 0
    Width = 798
    Height = 160
    ApplicationButton.Menu = MainRibbonMenu
    ApplicationButton.Text = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
    BarManager = BarManager
    Style = rs2010
    ColorSchemeName = 'Blue'
    MinimizeOnTabDblClick = False
    PopupMenuItems = []
    QuickAccessToolbar.Toolbar = dxBarManager1Bar1
    ShowMinimizeButton = False
    SupportNonClientDrawing = True
    Contexts = <>
    TabAreaToolbar.Toolbar = BarManagerBar1
    TabOrder = 0
    TabStop = False
    OnTabChanging = MainMenuTabChanging
    object TabNews: TdxRibbonTab
      Active = True
      Caption = #1053#1086#1074#1086#1089#1090#1080
      Groups = <
        item
          ToolbarName = 'tbNews'
        end>
      Index = 0
    end
    object TabEmployee: TdxRibbonTab
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
      Groups = <
        item
          ToolbarName = 'tbEmployee'
        end
        item
          Caption = #1060#1080#1083#1100#1090#1088
          ToolbarName = 'tbEmployeeFilter'
        end>
      Index = 1
    end
    object TabPositions: TdxRibbonTab
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
      Groups = <
        item
          ToolbarName = 'tbPostions'
        end
        item
          ToolbarName = 'tbOrder'
        end
        item
          Caption = #1044#1077#1088#1077#1074#1086
          ToolbarName = 'tbTree'
        end>
      Index = 2
    end
    object TabDocuments: TdxRibbonTab
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      Groups = <
        item
          ToolbarName = 'tbDocuments'
        end>
      Index = 3
    end
    object TabIncomingMessages: TdxRibbonTab
      Caption = #1042#1093#1086#1076#1103#1097#1080#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      Groups = <
        item
          ToolbarName = 'tbMessages'
        end
        item
          ToolbarName = 'tbMessageFilter'
        end>
      Index = 4
    end
  end
  object StatusBar: TdxRibbonStatusBar
    Left = 0
    Top = 469
    Width = 798
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 80
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Ribbon = MainMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object MainPageControl: TcxPageControl
    Left = 0
    Top = 160
    Width = 798
    Height = 309
    Align = alClient
    Color = 10485760
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    Properties.Options = [pcoGradient, pcoGradientClientArea, pcoNoArrows, pcoRedrawOnResize, pcoSort]
    OnPageChanging = MainPageControlPageChanging
    ExplicitTop = 127
    ExplicitHeight = 342
    ClientRectBottom = 305
    ClientRectLeft = 4
    ClientRectRight = 794
    ClientRectTop = 4
  end
  object BarManager: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Common'
      'News'
      'Employee'
      'Positions'
      'Documents'
      'Contacts'
      'QuickAccess')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True
      True
      True)
    ImageOptions.Images = ImageContainer.Images16
    ImageOptions.LargeImages = ImageContainer.Images32
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.NativeStyle = True
    MenusShowRecentItemsFirst = False
    PopupMenuLinks = <>
    ShowHint = False
    UseSystemFont = True
    Left = 534
    Top = 283
    PixelsPerInch = 96
    object dxBarManager1Bar1: TdxBar
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1076#1086#1089#1090#1091#1087
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 0
      FloatTop = 0
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbNews: TdxBar
      Caption = #1053#1086#1074#1086#1089#1090#1080
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 785
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnAddNews'
        end
        item
          Visible = True
          ItemName = 'bnEditNews'
        end
        item
          Visible = True
          ItemName = 'bnDeleteNews'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbEmployee: TdxBar
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 785
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnAddEmployee'
        end
        item
          Visible = True
          ItemName = 'bnEditEmployee'
        end
        item
          Visible = True
          ItemName = 'bnMoveEmployee'
        end
        item
          Visible = True
          ItemName = 'bnToggleEmpActivity'
        end
        item
          Visible = True
          ItemName = 'bnDeleteEmployee'
        end
        item
          Visible = True
          ItemName = 'bnImportEmployees'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbPostions: TdxBar
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 785
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnAddPosition'
        end
        item
          Visible = True
          ItemName = 'bnEditPosition'
        end
        item
          Visible = True
          ItemName = 'bnDeletePosition'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbDocuments: TdxBar
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 785
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnAddSiteDocument'
        end
        item
          Visible = True
          ItemName = 'bnEditSiteDocument'
        end
        item
          Visible = True
          ItemName = 'bnDeleteSiteDocument'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbOrder: TdxBar
      Caption = #1054#1095#1077#1088#1077#1076#1100
      CaptionButtons = <>
      DockedLeft = 218
      DockedTop = 0
      FloatLeft = 785
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnRaiseOrder'
        end
        item
          Visible = True
          ItemName = 'bnLowerOrder'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object BarManagerBar1: TdxBar
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 785
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnAbout'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbEmployeeFilter: TdxBar
      Caption = #1060#1083#1100#1090#1088
      CaptionButtons = <>
      DockedLeft = 425
      DockedTop = 0
      FloatLeft = 729
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'edEmployeeFilter'
        end
        item
          Visible = True
          ItemName = 'bnOnlyActive'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbMessages: TdxBar
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 729
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnDeleteMessage'
        end
        item
          Visible = True
          ItemName = 'bnMarkAsUnread'
        end
        item
          Visible = True
          ItemName = 'bnMarkAsReaded'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbMessageFilter: TdxBar
      Caption = #1060#1080#1083#1100#1090#1088' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
      CaptionButtons = <>
      DockedLeft = 260
      DockedTop = 0
      FloatLeft = 729
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cbMessageType'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbTree: TdxBar
      Caption = #1044#1077#1088#1077#1074#1086
      CaptionButtons = <>
      DockedLeft = 360
      DockedTop = 0
      FloatLeft = 723
      FloatTop = 2
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnCollapseAll'
        end
        item
          Visible = True
          ItemName = 'bnExpandAll'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bnRefreshPositions: TdxBarLargeButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      Visible = ivAlways
      ShortCut = 116
      OnClick = RefreshPage
      LargeImageIndex = 173
      ShowCaption = False
    end
    object bnAddEmployee: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 17
    end
    object bnRaiseOrder: TdxBarLargeButton
      Caption = #1055#1086#1076#1085#1103#1090#1100
      Category = 0
      Enabled = False
      Hint = #1055#1086#1076#1085#1103#1090#1100
      Visible = ivAlways
      LargeImageIndex = 7
    end
    object bnLowerOrder: TdxBarLargeButton
      Caption = #1055#1086#1085#1080#1079#1080#1090#1100
      Category = 0
      Enabled = False
      Hint = #1055#1086#1085#1080#1079#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 5
    end
    object bnClearWebCache: TdxBarLargeButton
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#1082#1101#1096' '#1042#1101#1073' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
      Category = 0
      Enabled = False
      Hint = #1057#1073#1088#1086#1089#1080#1090#1100' '#1082#1101#1096' '#1042#1101#1073' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
      Visible = ivAlways
      OnClick = bnClearWebCacheClick
      LargeImageIndex = 203
    end
    object bnExportToExcel: TdxBarLargeButton
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      Category = 0
      Enabled = False
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      Visible = ivAlways
      DropDownEnabled = False
      LargeImageIndex = 79
    end
    object bnAbout: TdxBarButton
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Category = 0
      Hint = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Visible = ivAlways
      ImageIndex = 2
      OnClick = bnAboutClick
    end
    object bnCommonSettings: TdxBarButton
      Caption = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Category = 0
      Hint = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Visible = ivAlways
      LargeImageIndex = 138
      OnClick = bnCommonSettingsClick
    end
    object bnPluginInfo: TdxBarButton
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Category = 0
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Visible = ivAlways
      LargeImageIndex = 133
      ShortCut = 16457
      OnClick = bnPluginInfoClick
    end
    object edEmployeeFilter: TdxBarEdit
      Caption = #1048#1084#1103
      Category = 0
      Hint = #1048#1084#1103
      Visible = ivAlways
      OnChange = edEmployeeFilterChange
      OnCurChange = edEmployeeFilterCurChange
      OnKeyDown = edEmployeeFilterKeyDown
      Width = 120
    end
    object bnDeleteMessage: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 10
    end
    object bnMarkAsUnread: TdxBarLargeButton
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' '#1085#1077' '#1087#1088#1086#1095#1090#1105#1085#1085#1086#1077
      Category = 0
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' '#1085#1077' '#1087#1088#1086#1095#1090#1105#1085#1085#1086#1077
      Visible = ivAlways
      LargeImageIndex = 4
    end
    object bnShowMessages: TdxBarButton
      Caption = #1042#1093#1086#1076#1103#1097#1080#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      Category = 0
      Hint = #1042#1093#1086#1076#1103#1097#1080#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      Visible = ivAlways
      LargeImageIndex = 20
      OnClick = bnShowMessagesClick
    end
    object bnMarkAsReaded: TdxBarLargeButton
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' '#1087#1088#1086#1095#1090#1105#1085#1085#1086#1077
      Category = 0
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' '#1087#1088#1086#1095#1090#1105#1085#1085#1086#1077
      Visible = ivAlways
      LargeImageIndex = 0
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cbMessageType: TdxBarImageCombo
      Caption = #1055#1088#1080#1096#1083#1080' '#1086#1090':'
      Category = 0
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1086#1086#1086#1073#1097#1077#1085#1080#1103', '#1087#1088#1080#1096#1077#1076#1096#1080#1077' '#1086#1090'...'
      Visible = ivAlways
      OnChange = cbMessageTypeChange
      Width = 140
      Text = #1042#1089#1077#1093
      Images = ImageContainer.Images16
      Items.Strings = (
        #1042#1089#1077#1093
        #1057#1080#1089#1090#1077#1084#1099
        #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081)
      ItemIndex = 0
      ImageIndexes = (
        208
        168
        25)
    end
    object bnCollapseAll: TdxBarLargeButton
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1105
      Category = 0
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1105
      Visible = ivAlways
      LargeImageIndex = 3
    end
    object bnExpandAll: TdxBarLargeButton
      Caption = #1056#1072#1089#1082#1088#1099#1090#1100' '#1074#1089#1105
      Category = 0
      Hint = #1056#1072#1089#1082#1088#1099#1090#1100' '#1074#1089#1105
      Visible = ivAlways
      LargeImageIndex = 5
    end
    object bnOnlyActive: TdxBarButton
      Align = iaClient
      Caption = #1058#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1099#1077
      Category = 0
      Hint = #1058#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1099#1077
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      ImageIndex = 11
      OnClick = bnOnlyActiveClick
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object bnAddWebPages: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 117
    end
    object bnDeleteWebPages: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 0
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 182
    end
    object bnEditWebPages: TdxBarLargeButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 0
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 1
    end
    object bnAddNews: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      Category = 1
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 1
      SyncImageIndex = False
      ImageIndex = -1
    end
    object bnEditNews: TdxBarLargeButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 1
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 1
    end
    object bnDeleteNews: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 1
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 13
    end
    object bnToggleEmpActivity: TdxBarLargeButton
      Caption = #1040#1082#1090#1080#1074#1077#1085
      Category = 2
      Enabled = False
      Hint = #1040#1082#1090#1080#1074#1077#1085
      Visible = ivAlways
      LargeImageIndex = 16
    end
    object bnEditEmployee: TdxBarLargeButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 2
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 14
    end
    object bnDeleteEmployee: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 2
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 15
    end
    object bnMoveEmployee: TdxBarLargeButton
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080'..'
      Category = 2
      Hint = #1055#1077#1088#1077#1074#1077#1089#1090#1080'..'
      Visible = ivAlways
      LargeImageIndex = 9
    end
    object bnImportEmployees: TdxBarLargeButton
      Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' Excel...'
      Category = 2
      Enabled = False
      Hint = #1048#1084#1087#1086#1088#1090' '#1080#1079' Excel'
      Visible = ivAlways
      LargeImageIndex = 8
    end
    object bnDeletePosition: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 3
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 13
    end
    object bnAddPosition: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      Category = 3
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 12
    end
    object bnEditPosition: TdxBarLargeButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 3
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 6
    end
    object bnAddSiteDocument: TdxBarLargeButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
      Category = 4
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 11
    end
    object bnEditSiteDocument: TdxBarLargeButton
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Category = 4
      Enabled = False
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 1
    end
    object bnDeleteSiteDocument: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 4
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 13
    end
  end
  object MainRibbonMenu: TdxBarApplicationMenu
    BarManager = BarManager
    Buttons = <>
    ExtraPane.Items = <>
    ExtraPane.Visible = False
    ItemLinks = <
      item
        Visible = True
        ItemName = 'bnCommonSettings'
      end
      item
        Visible = True
        ItemName = 'bnClearWebCache'
      end
      item
        Visible = False
        ItemName = 'bnShowMessages'
      end
      item
        Visible = False
        ItemName = 'bnPluginInfo'
      end
      item
        Visible = True
        ItemName = 'bnExportToExcel'
      end>
    UseOwnFont = False
    OnPopup = MainRibbonMenuPopup
    Left = 532
    Top = 336
    PixelsPerInch = 96
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer1Timer
    Left = 532
    Top = 384
  end
end
