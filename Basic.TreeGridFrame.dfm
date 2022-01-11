inherited BasicTreeGridFrame: TBasicTreeGridFrame
  object TreeView: TcxDBTreeList [0]
    Left = 0
    Top = 0
    Width = 511
    Height = 358
    Align = alClient
    Bands = <>
    DataController.DataSource = DataSource
    Images = ImageContainer.Images16
    Navigator.Buttons.CustomButtons = <>
    OptionsData.Editing = False
    OptionsData.CaseInsensitive = True
    OptionsData.Deleting = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.TreeLineStyle = tllsSolid
    RootValue = -1
    TabOrder = 0
    OnCustomDrawDataCell = TreeViewCustomDrawDataCell
    OnDblClick = TreeViewDblClick
    OnFocusedNodeChanged = TreeViewFocusedNodeChanged
    OnKeyDown = TreeViewKeyDown
  end
end
