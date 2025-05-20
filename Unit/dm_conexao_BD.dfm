object dm_funcionarios: Tdm_funcionarios
  Height = 392
  Width = 918
  PixelsPerInch = 96
  object ctn_conexao: TFDConnection
    Params.Strings = (
      'ConnectionDef=ConnectionDef3')
    Connected = True
    Left = 40
    Top = 40
  end
  object tbl_funcionarios: TFDTable
    Active = True
    IndexFieldNames = 'FUN_ID'
    ConnectionName = 'ConnectionDef3'
    TableName = 'PROJETO_CRUD.dbo.FUNCIONARIOS'
    Left = 40
    Top = 136
    object tbl_funcionariosFUN_ID: TFDAutoIncField
      FieldName = 'FUN_ID'
      Origin = 'FUN_ID'
      ReadOnly = True
    end
    object tbl_funcionariosFUN_DATANASCIMENTO: TSQLTimeStampField
      FieldName = 'FUN_DATANASCIMENTO'
      Origin = 'FUN_DATANASCIMENTO'
      EditMask = '99-99-9999'
    end
    object tbl_funcionariosFUN_NOME: TWideStringField
      FieldName = 'FUN_NOME'
      Origin = 'FUN_NOME'
      Size = 50
    end
    object tbl_funcionariosFUN_RUA: TWideStringField
      FieldName = 'FUN_RUA'
      Origin = 'FUN_RUA'
      Size = 50
    end
    object tbl_funcionariosFUN_NUMERO: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'FUN_NUMERO'
      Origin = 'FUN_NUMERO'
    end
    object tbl_funcionariosFUN_BAIRRO: TWideStringField
      FieldName = 'FUN_BAIRRO'
      Origin = 'FUN_BAIRRO'
      Size = 50
    end
    object tbl_funcionariosFUN_CIDADE: TWideStringField
      FieldName = 'FUN_CIDADE'
      Origin = 'FUN_CIDADE'
      Size = 30
    end
    object tbl_funcionariosFUN_COMPLEMENTO: TWideStringField
      FieldName = 'FUN_COMPLEMENTO'
      Origin = 'FUN_COMPLEMENTO'
      Size = 50
    end
    object tbl_funcionariosFUN_CEP: TWideStringField
      FieldName = 'FUN_CEP'
      Origin = 'FUN_CEP'
      EditMask = '99999-999'
      Size = 9
    end
    object tbl_funcionariosFUN_CARGO: TWideStringField
      FieldName = 'FUN_CARGO'
      Origin = 'FUN_CARGO'
      Size = 50
    end
    object tbl_funcionariosFUN_SALARIO: TBCDField
      Alignment = taLeftJustify
      FieldName = 'FUN_SALARIO'
      Origin = 'FUN_SALARIO'
      Precision = 10
      Size = 2
    end
  end
  object dts_funcionarios: TDataSource
    AutoEdit = False
    DataSet = tbl_funcionarios
    Left = 152
    Top = 136
  end
  object tsc_funcionarios: TFDTransaction
    Connection = ctn_conexao
    Left = 152
    Top = 48
  end
  object fdq_totalfuncionario: TFDQuery
    Active = True
    MasterSource = dts_funcionarios
    Connection = ctn_conexao
    SQL.Strings = (
      'SELECT COUNT(*) FROM FUNCIONARIOS')
    Left = 296
    Top = 40
  end
  object fdq_totalsalario: TFDQuery
    Connection = ctn_conexao
    Left = 400
    Top = 40
  end
end
