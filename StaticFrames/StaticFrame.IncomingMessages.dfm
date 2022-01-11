inherited StaticFrameIncomingMessages: TStaticFrameIncomingMessages
  DoubleBuffered = True
  ParentDoubleBuffered = False
  inherited MainGrid: TcxGrid
    inherited MainView: TcxGridDBTableView
      OptionsView.GroupByBox = False
      object colDate: TcxGridDBColumn
        Caption = #1055#1088#1080#1085#1103#1090#1086
        DataBinding.FieldName = 'ADate'
        Width = 114
      end
      object colUserName: TcxGridDBColumn
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'UserName'
        Width = 125
      end
      object colMessage: TcxGridDBColumn
        Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
        DataBinding.FieldName = 'Message'
        Visible = False
        Width = 110
      end
      object colPhone: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'ContactPhone'
        Width = 76
      end
      object colEmail: TcxGridDBColumn
        Caption = 'EMail'
        DataBinding.FieldName = 'ContactEmail'
        Width = 73
      end
      object colIPAddress: TcxGridDBColumn
        Caption = 'IP '#1040#1076#1088#1077#1089
        DataBinding.FieldName = 'SubmiterIPAdress'
        Width = 59
      end
      object colSystemMessage: TcxGridDBColumn
        Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077
        DataBinding.FieldName = 'SystemMessage'
        Visible = False
        Width = 62
      end
      object colReaded: TcxGridDBColumn
        DataBinding.FieldName = 'Readed'
        Visible = False
      end
    end
  end
end
