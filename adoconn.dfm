object DM: TDM
  OldCreateOrder = False
  Height = 329
  Width = 777
  object ADOConn: TADOConnection
    Connected = True
    ConnectionString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=mysql'
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object ADOTgrup: TADOTable
    Active = True
    Connection = ADOConn
    CursorType = ctStatic
    TableName = 'tblgrup'
    Left = 120
    Top = 24
    object ADOTgrupid_grup: TAutoIncField
      FieldName = 'id_grup'
      ReadOnly = True
    end
    object ADOTgrupgrup: TWideStringField
      FieldName = 'grup'
      Size = 50
    end
    object ADOTgrupkurs: TIntegerField
      FieldName = 'kurs'
    end
  end
  object ADOTstudent: TADOTable
    Active = True
    Connection = ADOConn
    CursorType = ctStatic
    IndexFieldNames = 'grup'
    MasterFields = 'id_grup'
    MasterSource = DSgrup
    TableName = 'tblstudent'
    Left = 192
    Top = 24
    object ADOTstudentid_student: TAutoIncField
      FieldName = 'id_student'
      ReadOnly = True
    end
    object ADOTstudentSNP: TWideStringField
      FieldName = 'SNP'
      Size = 255
    end
    object ADOTstudentzachnom: TWideStringField
      FieldName = 'zachnom'
      Size = 10
    end
    object ADOTstudentgrup: TIntegerField
      FieldName = 'grup'
    end
    object ADOTstudentid_predmet: TIntegerField
      FieldName = 'id_predmet'
    end
  end
  object ADOTpredmet: TADOTable
    Active = True
    Connection = ADOConn
    CursorType = ctStatic
    TableName = 'tblpredmet'
    Left = 280
    Top = 24
    object ADOTpredmetid_predmet: TAutoIncField
      FieldName = 'id_predmet'
      ReadOnly = True
    end
    object ADOTpredmetpredmet: TWideStringField
      FieldName = 'predmet'
      Size = 255
    end
    object ADOTpredmetteacher: TWideStringField
      FieldName = 'teacher'
      Size = 255
    end
  end
  object ADOTtest: TADOTable
    Active = True
    Connection = ADOConn
    CursorType = ctStatic
    IndexFieldNames = 'id_predmet'
    MasterFields = 'id_predmet'
    MasterSource = DSpredmet
    TableName = 'tbltest'
    Left = 360
    Top = 24
    object ADOTtestid_test: TAutoIncField
      FieldName = 'id_test'
      ReadOnly = True
    end
    object ADOTtestvopros: TBlobField
      FieldName = 'vopros'
    end
    object ADOTtestotvet1: TBlobField
      FieldName = 'otvet1'
    end
    object ADOTtestotvet2: TBlobField
      FieldName = 'otvet2'
    end
    object ADOTtestotvet3: TBlobField
      FieldName = 'otvet3'
    end
    object ADOTtestotvet4: TBlobField
      FieldName = 'otvet4'
    end
    object ADOTtestotvet5: TBlobField
      FieldName = 'otvet5'
    end
    object ADOTtestid_predmet: TIntegerField
      FieldName = 'id_predmet'
    end
  end
  object DSgrup: TDataSource
    DataSet = ADOTgrup
    Left = 120
    Top = 88
  end
  object DSstudent: TDataSource
    DataSet = ADOTstudent
    Left = 192
    Top = 88
  end
  object DSpredmet: TDataSource
    DataSet = ADOTpredmet
    Left = 280
    Top = 88
  end
  object DStest: TDataSource
    DataSet = ADOTtest
    Left = 360
    Top = 88
  end
  object ADOTAppoint: TADOTable
    Active = True
    Connection = ADOConn
    CursorType = ctStatic
    TableName = 'tblappoint'
    Left = 432
    Top = 24
    object ADOTAppointid_appoint: TAutoIncField
      FieldName = 'id_appoint'
      ReadOnly = True
    end
    object ADOTAppointData: TDateField
      FieldName = 'Data'
    end
    object ADOTAppointIDGrup: TIntegerField
      FieldName = 'IDGrup'
    end
    object ADOTAppointIDPredmet: TIntegerField
      FieldName = 'IDPredmet'
    end
  end
  object DSAppoint: TDataSource
    DataSet = ADOTAppoint
    Left = 432
    Top = 88
  end
  object ADOTrepost: TADOTable
    Active = True
    Connection = ADOConn
    CursorType = ctStatic
    TableName = 'report'
    Left = 184
    Top = 168
    object ADOTrepostid_report: TAutoIncField
      FieldName = 'id_report'
      ReadOnly = True
    end
    object ADOTrepostgrup: TIntegerField
      FieldName = 'grup'
    end
    object ADOTrepostFIO: TWideStringField
      FieldName = 'FIO'
      Size = 255
    end
    object ADOTrepostzachnom: TWideStringField
      FieldName = 'zachnom'
      Size = 10
    end
    object ADOTrepostbilet: TSmallintField
      FieldName = 'bilet'
    end
    object ADOTrepostpredmet1: TSmallintField
      FieldName = 'predmet1'
    end
    object ADOTrepostpredmet2: TSmallintField
      FieldName = 'predmet2'
    end
    object ADOTrepostpredmet3: TSmallintField
      FieldName = 'predmet3'
    end
    object ADOTrepostball: TFloatField
      FieldName = 'ball'
    end
    object ADOTrepostprocent: TSmallintField
      FieldName = 'procent'
    end
    object ADOTrepostbook: TWideStringField
      FieldName = 'book'
      Size = 3
    end
  end
  object DSReport: TDataSource
    DataSet = ADOTrepost
    Left = 304
    Top = 168
  end
end
