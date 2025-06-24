object dmConexao: TdmConexao
  Height = 284
  Width = 356
  object fdConexao: TFDConnection
    Params.Strings = (
      'Server='
      'Port='
      'DriverID=PG')
    LoginPrompt = False
    Left = 160
    Top = 136
  end
  object fdDriverLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 160
    Top = 200
  end
  object tbProfessores: TFDTable
    IndexFieldNames = 'id'
    Connection = fdConexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    Left = 72
    Top = 80
    object tbProfessoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object tbProfessoresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object tbProfessoresusuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 50
    end
    object tbProfessoressenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 255
    end
  end
  object dsProfessores: TDataSource
    DataSet = tbProfessores
    Left = 72
    Top = 24
  end
  object tbClientes: TFDTable
    IndexFieldNames = 'nome'
    Connection = fdConexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    Left = 224
    Top = 80
    object tbClientesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbClientesnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object tbClientesprofessor_id: TIntegerField
      FieldName = 'professor_id'
    end
    object tbClientesnome_professor: TStringField
      FieldKind = fkLookup
      FieldName = 'nome_professor'
      LookupDataSet = tbProfessores
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'professor_id'
      Lookup = True
    end
  end
  object dsClientes: TDataSource
    DataSet = tbClientes
    Left = 224
    Top = 22
  end
end
