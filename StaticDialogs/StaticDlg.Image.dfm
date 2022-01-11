inherited ImageDialog: TImageDialog
  Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
  Constraints.MinHeight = 240
  Constraints.MinWidth = 320
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TcxDBImage [1]
    Left = 0
    Top = 0
    Align = alClient
    DataBinding.DataField = 'Data'
    DataBinding.DataSource = DataSource
    Properties.GraphicClassName = 'TdxSmartImage'
    TabOrder = 1
    Height = 243
    Width = 410
  end
end
