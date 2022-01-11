inherited FIncomingMessages: TFIncomingMessages
  Caption = #1042#1093#1086#1076#1103#1097#1080#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
  ClientHeight = 502
  ClientWidth = 673
  OnCreate = FormCreate
  ExplicitWidth = 689
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBottomButtons: TPanel
    Top = 438
    Width = 673
    Visible = False
    ExplicitTop = 438
    ExplicitWidth = 673
    inherited bnOK: TcxButton
      Left = 495
      ExplicitLeft = 495
    end
    inherited bnCancel: TcxButton
      Left = 584
      ExplicitLeft = 584
    end
  end
  object MainMenu: TdxRibbon
    Left = 0
    Top = 0
    Width = 673
    Height = 127
    ApplicationButton.Text = #1043#1083#1072#1074#1085#1086#1077' '#1084#1077#1085#1102
    BarManager = BarManager
    Style = rs2010
    ColorSchemeName = 'Blue'
    MinimizeOnTabDblClick = False
    PopupMenuItems = []
    ShowMinimizeButton = False
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 3
    TabStop = False
    object TabNews: TdxRibbonTab
      Active = True
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1103
      Groups = <
        item
          ToolbarName = 'tbCommon'
        end
        item
          ToolbarName = 'tbMessages'
        end>
      Index = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 127
    Width = 673
    Height = 311
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
  end
  object StatusBar: TdxRibbonStatusBar
    Left = 0
    Top = 479
    Width = 673
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 80
      end>
    Ribbon = MainMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
      'Actions')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
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
    Left = 630
    Top = 395
    DockControlHeights = (
      0
      0
      0
      0)
    object tbMessages: TdxBar
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      CaptionButtons = <>
      DockedLeft = 81
      DockedTop = 0
      FloatLeft = 785
      FloatTop = 8
      FloatClientWidth = 77
      FloatClientHeight = 210
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnDeleteMessage'
        end
        item
          Visible = True
          ItemName = 'bnMarkUnread'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbCommon: TdxBar
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = #1054#1073#1097#1077#1077
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 785
      FloatTop = 8
      FloatClientWidth = 58
      FloatClientHeight = 54
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bnRefresh'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bnRefresh: TdxBarLargeButton
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Category = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 173
      ShortCut = 116
      OnClick = bnRefreshClick
      ShowCaption = False
    end
    object bnMarkUnread: TdxBarLargeButton
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' '#1085#1077' '#1087#1088#1086#1095#1090#1105#1085#1085#1086#1077
      Category = 0
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' '#1085#1077' '#1087#1088#1086#1095#1090#1105#1085#1085#1086#1077
      Visible = ivAlways
      LargeImageIndex = 6
    end
    object bnDeleteMessage: TdxBarLargeButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 1
      Enabled = False
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      LargeImageIndex = 182
      ShortCut = 46
    end
  end
end
