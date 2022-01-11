inherited BasicGridFrame: TBasicGridFrame
  object MainGrid: TcxGrid [0]
    Left = 0
    Top = 0
    Width = 511
    Height = 358
    Align = alClient
    TabOrder = 0
    object MainView: TcxGridDBTableView
      OnDblClick = MainViewDblClick
      OnKeyDown = MainViewKeyDown
      Navigator.Buttons.CustomButtons = <>
      FindPanel.InfoText = 'InfoText'
      OnCustomDrawCell = MainViewCustomDrawCell
      OnSelectionChanged = MainViewSelectionChanged
      DataController.DataSource = DataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Images = ImageContainer.Images16
      OptionsBehavior.CellHints = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsSelection.InvertSelect = False
      OptionsView.NoDataToDisplayInfoText = '<'#1054#1090#1089#1091#1090#1089#1090#1074#1091#1102#1090' '#1076#1072#1085#1085#1099#1077'>'
      OptionsView.ColumnAutoWidth = True
    end
    object MainLevel: TcxGridLevel
      GridView = MainView
    end
  end
  inherited DataSource: TDataSource
    OnDataChange = DataSourceDataChange
  end
end
