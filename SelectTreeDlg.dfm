object SelectTreeDialog: TSelectTreeDialog
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088
  ClientHeight = 332
  ClientWidth = 337
  Color = clWhite
  Constraints.MinHeight = 320
  Constraints.MinWidth = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 291
    Width = 337
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      337
      41)
    object bnOK: TcxButton
      Left = 173
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object bnCancel: TcxButton
      Left = 254
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object TreeView: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 337
    Height = 291
    Align = alClient
    Bands = <
      item
      end>
    DataController.DataSource = DataSource
    Images = ImageContainer.Images16
    Navigator.Buttons.CustomButtons = <>
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.Buttons = False
    OptionsView.ColumnAutoWidth = True
    RootValue = -1
    TabOrder = 1
    OnCustomDrawDataCell = TreeViewCustomDrawDataCell
    OnDblClick = TreeViewDblClick
    OnSelectionChanged = TreeViewSelectionChanged
    object colDescription: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1080#1084#1080#1085#1086#1074#1072#1085#1080#1077
      Options.Customizing = False
      Options.Editing = False
      Options.ShowEditButtons = eisbNever
      Width = 100
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object DataSource: TDataSource
    Left = 288
    Top = 16
  end
end
