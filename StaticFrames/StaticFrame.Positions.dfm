inherited StaticFramePositions: TStaticFramePositions
  inherited TreeView: TcxDBTreeList
    Bands = <
      item
      end>
    DataController.ImageIndexField = 'ImageIndex'
    DataController.ParentField = 'OwnerID'
    object colID: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'DepartmentPositionsID'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object colOrderID: TcxDBTreeListColumn
      Visible = False
      DataBinding.FieldName = 'OrderID'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object colDescription: TcxDBTreeListColumn
      Caption.Text = #1053#1072#1079#1074#1072#1085#1080#1077
      DataBinding.FieldName = 'Description'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
end
