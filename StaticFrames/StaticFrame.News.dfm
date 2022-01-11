inherited StaticFrameNews: TStaticFrameNews
  inherited MainGrid: TcxGrid
    inherited MainView: TcxGridDBTableView
      OptionsView.GroupByBox = False
      object colADate: TcxGridDBColumn
        Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072
        DataBinding.FieldName = 'ADate'
        Width = 84
      end
      object colNewsText: TcxGridDBColumn
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
        DataBinding.FieldName = 'Caption'
        Width = 320
      end
      object colAlwaysValid: TcxGridDBColumn
        Caption = #1042#1089#1077#1075#1076#1072' '#1074' '#1085#1086#1074#1086#1089#1090#1103#1093
        DataBinding.FieldName = 'AlwaysValid'
        Width = 105
      end
      object colActive: TcxGridDBColumn
        DataBinding.FieldName = 'Active'
        Visible = False
      end
    end
  end
end
