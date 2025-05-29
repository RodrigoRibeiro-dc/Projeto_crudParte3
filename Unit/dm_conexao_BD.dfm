object dm_funcionarios: Tdm_funcionarios
  OnCreate = DataModuleCreate
  Height = 392
  Width = 918
  PixelsPerInch = 96
  object ctn_conexao: TFDConnection
    Params.Strings = (
      'Server=Localhost'
      'User_Name=sa'
      'Database=PROJETO_CRUD'
      'Password=aram98'
      'DriverID=MSSQL')
    Transaction = tsc_funcionarios
    Left = 40
    Top = 40
  end
  object tsc_funcionarios: TFDTransaction
    Connection = ctn_conexao
    Left = 136
    Top = 40
  end
  object fdq_total: TFDQuery
    Connection = ctn_conexao
    Transaction = tsc_funcionarios
    Left = 352
    Top = 40
  end
  object fdq_consulta: TFDQuery
    Connection = ctn_conexao
    Left = 440
    Top = 40
  end
  object dts_funcionarionovo: TDataSource
    DataSet = fdq_funcionarios
    Left = 288
    Top = 144
  end
  object fdq_funcionarios: TFDQuery
    Connection = ctn_conexao
    SQL.Strings = (
      'SELECT *FROM FUNCIONARIOS')
    Left = 256
    Top = 40
    object fdq_funcionariosFUN_ID: TFDAutoIncField
      FieldName = 'FUN_ID'
      Origin = 'FUN_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdq_funcionariosFUN_NOME: TWideStringField
      FieldName = 'FUN_NOME'
      Origin = 'FUN_NOME'
      Required = True
      Size = 45
    end
    object fdq_funcionariosFUN_DATANASCIMENTO: TSQLTimeStampField
      FieldName = 'FUN_DATANASCIMENTO'
      Origin = 'FUN_DATANASCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object fdq_funcionariosFUN_RUA: TWideStringField
      FieldName = 'FUN_RUA'
      Origin = 'FUN_RUA'
      Size = 45
    end
    object fdq_funcionariosFUN_NUMERO: TIntegerField
      FieldName = 'FUN_NUMERO'
      Origin = 'FUN_NUMERO'
    end
    object fdq_funcionariosFUN_BAIRRO: TWideStringField
      FieldName = 'FUN_BAIRRO'
      Origin = 'FUN_BAIRRO'
      Size = 45
    end
    object fdq_funcionariosFUN_CIDADE: TWideStringField
      FieldName = 'FUN_CIDADE'
      Origin = 'FUN_CIDADE'
    end
    object fdq_funcionariosFUN_COMPLEMENTO: TWideStringField
      FieldName = 'FUN_COMPLEMENTO'
      Origin = 'FUN_COMPLEMENTO'
      Size = 45
    end
    object fdq_funcionariosFUN_CEP: TWideStringField
      FieldName = 'FUN_CEP'
      Origin = 'FUN_CEP'
      EditMask = '99999-999;1;_'
      Size = 9
    end
    object fdq_funcionariosFUN_CARGO: TWideStringField
      FieldName = 'FUN_CARGO'
      Origin = 'FUN_CARGO'
      Size = 25
    end
    object fdq_funcionariosFUN_SALARIO: TBCDField
      FieldName = 'FUN_SALARIO'
      Origin = 'FUN_SALARIO'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
  end
end
