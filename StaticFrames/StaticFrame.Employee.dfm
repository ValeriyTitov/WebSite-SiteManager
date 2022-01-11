inherited StaticFrameEmployee: TStaticFrameEmployee
  inherited MainGrid: TcxGrid
    inherited MainView: TcxGridDBTableView
      OptionsView.GroupByBox = False
      object colGender: TcxGridDBColumn
        Caption = '-'
        DataBinding.FieldName = 'Gender'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = ImageContainer.Images16
        Properties.Items = <
          item
            ImageIndex = 8
          end
          item
            ImageIndex = 25
            Value = False
          end
          item
            ImageIndex = 72
            Value = True
          end>
        MinWidth = 27
        Options.Editing = False
        Options.Filtering = False
        Options.AutoWidthSizable = False
        Options.HorzSizing = False
        Width = 27
      end
      object colPhoto: TcxGridDBColumn
        Caption = #1060#1086#1090#1086
        DataBinding.FieldName = 'HasPhoto'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ReadOnly = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        BestFitMaxWidth = 30
        MinWidth = 32
        Options.Editing = False
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object colFullName: TcxGridDBColumn
        Caption = #1048#1084#1103
        DataBinding.FieldName = 'FullName'
        Options.Editing = False
        Options.Filtering = False
        Width = 92
      end
      object colDepDescription: TcxGridDBColumn
        Caption = #1054#1090#1076#1077#1083
        DataBinding.FieldName = 'DepDescription'
        Options.Editing = False
        Options.Filtering = False
        Width = 113
      end
      object colPosition: TcxGridDBColumn
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'Description'
        Options.Editing = False
        Options.Filtering = False
        Width = 97
      end
      object colEmail: TcxGridDBColumn
        DataBinding.FieldName = 'EMail'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Width = 31
      end
      object colPhone: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'Phone'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Width = 47
      end
      object colActive: TcxGridDBColumn
        DataBinding.FieldName = 'Active'
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Width = 43
      end
      object colRoomNumber: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        DataBinding.FieldName = 'BirthDate'
        Options.Editing = False
        Options.Filtering = False
        Width = 44
      end
      object colStateEmployee: TcxGridDBColumn
        Caption = #1064#1090#1072#1090#1085#1099#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
        DataBinding.FieldName = 'StateEmployee'
        Options.Editing = False
        Options.Filtering = False
        Width = 26
      end
    end
  end
end
