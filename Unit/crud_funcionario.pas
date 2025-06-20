unit crud_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Menus, System.UITypes, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ppDB, ppDBPipe, ppBands, ppCache,
  ppClass, ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd, ppReport,
  ppCtrls, ppVar, ppPrnabl, ppModule, raCodMod, ppFormWrapper, ppRptExp;

type
  Tmenu_funcionarios = class(TForm)
    pnl_crud: TPanel;
    pnl_grid: TPanel;
    img_incluir: TImage;
    img_alterar: TImage;
    img_excluir: TImage;
    lbl_incluir: TLabel;
    lbl_alterar: TLabel;
    lbl_excluir: TLabel;
    dbg_funcionarios: TDBGrid;
    pnl_consulta: TPanel;
    sbtn_consultar: TSpeedButton;
    lbl_dtinicial: TLabel;
    lbl_dtfinal: TLabel;
    edt_consulta: TEdit;
    dtp_inicial: TDateTimePicker;
    dtp_final: TDateTimePicker;
    cbx_consulta: TComboBox;
    rdg_tipoconsulta: TRadioGroup;
    ctn_conexao: TFDConnection;
    tsc_funcionarios: TFDTransaction;
    fdq_funcionarios: TFDQuery;
    fdq_funcionariosFUN_ID: TFDAutoIncField;
    fdq_funcionariosFUN_NOME: TWideStringField;
    fdq_funcionariosFUN_DATANASCIMENTO: TSQLTimeStampField;
    fdq_funcionariosFUN_RUA: TWideStringField;
    fdq_funcionariosFUN_NUMERO: TIntegerField;
    fdq_funcionariosFUN_BAIRRO: TWideStringField;
    fdq_funcionariosFUN_CIDADE: TWideStringField;
    fdq_funcionariosFUN_COMPLEMENTO: TWideStringField;
    fdq_funcionariosFUN_CEP: TWideStringField;
    fdq_funcionariosFUN_CARGO: TWideStringField;
    fdq_funcionariosFUN_SALARIO: TBCDField;
    lbl_txttotal_funcionario: TLabel;
    lbl_txt_totalsalario: TLabel;
    lbl_totalsalario: TLabel;
    lbl_totalfuncionario: TLabel;
    dts_grid: TDataSource;
    fdq_recebimento: TFDQuery;
    fdq_recebimentoREC_ID: TFDAutoIncField;
    fdq_recebimentoREC_DESCRICAO: TWideStringField;
    fdq_recebimentoREC_VALOR: TBCDField;
    fdq_recebimentoREC_DATA: TSQLTimeStampField;
    fdq_recebimentoREC_TIPO: TWideStringField;
    fdq_recebimentoQTDE: TIntegerField;
    fdq_recebimentoSomaSalario: TAggregateField;
    fdq_recebimentoSomaAcerto: TAggregateField;
    fdq_recebimentoSomaVale: TAggregateField;
    img_relatorioGeral: TImage;
    lbl_imprimir: TLabel;
    ppRpt_funcionarioReceb: TppReport;
    ppParameterList1: TppParameterList;
    ppdb_recebimento: TppDBPipeline;
    dts_recebimento_imp: TDataSource;
    fdq_recebimento_imp: TFDQuery;
    fdq_recebimento_impFUN_ID: TFDAutoIncField;
    fdq_recebimento_impFUN_NOME: TWideStringField;
    fdq_recebimento_impFUN_CARGO: TWideStringField;
    fdq_recebimento_impFUN_SALARIO: TBCDField;
    fdq_recebimento_impREC_TIPO: TWideStringField;
    fdq_recebimento_impREC_VALOR: TBCDField;
    img_relatorioConsolidado: TImage;
    lbl_imprimeConsolidado: TLabel;
    dts_recebimentoConsolidado: TDataSource;
    ppDB_recebimentoConsolidado: TppDBPipeline;
    fdq_recebimentoConsolidado: TFDQuery;
    ppRpt_recebimentoConsolidado: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel11: TppLabel;
    sysVariableData: TppSystemVariable;
    fdq_recebimentoConsolidadoREC_TIPO: TWideStringField;
    fdq_recebimentoConsolidadoFUN_NOME: TWideStringField;
    fdq_recebimentoConsolidadoFUN_CARGO: TWideStringField;
    fdq_recebimentoConsolidadoFUN_SALARIO: TBCDField;
    fdq_recebimentoConsolidadoREC_VALOR: TBCDField;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine5: TppLine;
    ppDBText7: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    fdq_recebimentoConsolidadoFUN_ID: TFDAutoIncField;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel18: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSystemVariable4: TppSystemVariable;
    ppLabel19: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine3: TppLine;
    ppImage1: TppImage;
    ppLabel10: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine4: TppLine;
    ppDBCalc2: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    procedure img_excluirClick(Sender: TObject);
    procedure rdg_tipoconsultaClick(Sender: TObject);
    procedure sbtn_consultarClick(Sender: TObject);
    procedure img_incluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure img_alterarClick(Sender: TObject);
    procedure calcula_total_grid;
    procedure FormCreate(Sender: TObject);
    procedure fdq_recebimentoCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure img_relatorioGeralClick(Sender: TObject);
    procedure img_relatorioConsolidadoClick(Sender: TObject);
  private

  public
    procedure SQL(Value: String);
    procedure Params(aParam: String; aValue: Variant); overload;
    procedure ExecSQL;
    procedure SQLOpen;
    procedure Commit;
  end;

var
  menu_funcionarios: Tmenu_funcionarios;

implementation

uses campo_funcionario;

{$R *.dfm}

procedure Tmenu_funcionarios.calcula_total_grid;
var
  total_salario: currency;
  posicao_cursor: TBookmark;
begin
  posicao_cursor := fdq_funcionarios.GetBookmark;
  //posicao_cursor := fdq_funcionarios.RecNo;
  fdq_funcionarios.DisableControls;
  lbl_totalfuncionario.Caption := IntToStr(fdq_funcionarios.RecordCount);

  total_salario := 0.0;
  fdq_funcionarios.First;

  while not fdq_funcionarios.eof do
  begin
    total_salario := total_salario + fdq_funcionarios.FieldByName('FUN_SALARIO')
      .AsCurrency;
    fdq_funcionarios.Next;
  end;
  //fdq_funcionarios.RecNo := posicao_cursor;
  fdq_funcionarios.GotoBookmark(posicao_cursor);
  fdq_funcionarios.EnableControls;
  lbl_totalsalario.Caption := total_salario.ToString;
  fdq_funcionarios.FreeBookmark(posicao_cursor);
end;

procedure Tmenu_funcionarios.FormActivate(Sender: TObject);
begin
calcula_total_grid();
end;

procedure Tmenu_funcionarios.FormCreate(Sender: TObject);
begin
  ctn_conexao.Params.UserName := 'sa';
  ctn_conexao.Params.Password := 'aram98';
  ctn_conexao.Params.Database := 'PROJETO_CRUD';
  fdq_funcionarios.Open;
end;

procedure Tmenu_funcionarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not(ActiveControl is TCustomEdit) then
  begin
    case Key of
      VK_F2:
        img_incluirClick(Sender);

      VK_F3:
        img_alterarClick(Sender);

      VK_F4:
        img_excluirClick(Sender);
    end;
  end;
end;

procedure Tmenu_funcionarios.img_relatorioGeralClick(Sender: TObject);
var
idFuncionario: Integer;
const
  SQL = 'SELECT '                                             +
          'F.FUN_ID, F.FUN_NOME, F.FUN_CARGO, F.FUN_SALARIO,' +
          'R.REC_TIPO, R.REC_VALOR '                          +
        'FROM '                                               +
          'RECEBIMENTO R '                                    +
          'INNER JOIN '                                       +
          'FUNCIONARIOS F ON  R.FUN_ID = F.FUN_ID '           +
        'WHERE '                                              +
          'F.FUN_ID = :ID';
begin
  if not fdq_funcionarios.IsEmpty then
  begin
    idFuncionario := fdq_funcionariosFUN_ID.Value;

    fdq_recebimento_imp.SQL.Clear;
    fdq_recebimento_imp.SQL.Add(SQL);
    fdq_recebimento_imp.ParamByName('ID').AsInteger := idFuncionario;
    fdq_recebimento_imp.Open;
    if fdq_recebimento_imp.IsEmpty then
    begin
      MessageDlg('ESSE FUNCIONÁRIO NÃO POSSUI RECEBIMENTOS.'
        , mtWarning, [mbOk], 0);
    end
    else
      ppRpt_funcionarioReceb.Print;
  end;
end;

procedure Tmenu_funcionarios.img_relatorioConsolidadoClick(Sender: TObject);
var
  idFuncionario: Integer;
const
  SQL = 'SELECT '                                             +
          'R.REC_TIPO, F.FUN_ID, F.FUN_NOME, F.FUN_CARGO,   ' +
          'F.FUN_SALARIO, R.REC_VALOR '                          +
        'FROM '                                               +
          'RECEBIMENTO R '                                    +
          'INNER JOIN '                                       +
          'FUNCIONARIOS F ON  R.FUN_ID = F.FUN_ID '           +
        'WHERE '                                              +
          'F.FUN_ID = :ID';
begin
  if not fdq_funcionarios.IsEmpty then
  begin
    idFuncionario := fdq_funcionariosFUN_ID.Value;

    fdq_recebimento_imp.SQL.Clear;
    fdq_recebimento_imp.SQL.Add(SQL);
    fdq_recebimento_imp.ParamByName('ID').AsInteger := idFuncionario;
    fdq_recebimento_imp.Open;
    if fdq_recebimento_imp.IsEmpty then
    begin
      MessageDlg('ESSE FUNCIONÁRIO NÃO POSSUI RECEBIMENTOS.'
        , mtWarning, [mbOk], 0);
    end
    else
      ppRpt_recebimentoConsolidado.Print;
  end;
end;

procedure Tmenu_funcionarios.img_alterarClick(Sender: TObject);
begin
  fdq_funcionarios.Edit;
  cadastro_funcionario := Tcadastro_funcionario.Create(Self);
  try
    cadastro_funcionario.ShowModal;
  finally
    cadastro_funcionario.Free;
  end;

end;

procedure Tmenu_funcionarios.img_excluirClick(Sender: TObject);
begin
  try
    if MessageDlg('DESEJA REALMENTE EXCLUIR O FUNCIONÁRIO?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
    begin
      fdq_funcionarios.Delete;

      MessageDlg('FUNCIONÁRIO EXCLUÍDO COM SUCESSO.', mtConfirmation,
        [mbOK], 0);
      calcula_total_grid();
    end;
  except
    MessageDlg('EXISTE VÍNCULO DE RECEBIMENTO NO FUNCIONÁRIO, FAÇA A EXCLUSÃO' +
      'DO REGISTRO PARA CONTINUAR.', mtWarning, [mbOK], 0);
  end;
end;

procedure Tmenu_funcionarios.img_incluirClick(Sender: TObject);
begin
  fdq_funcionarios.Append;
  cadastro_funcionario := Tcadastro_funcionario.Create(Self);
  try
    cadastro_funcionario.ShowModal;
  finally
    cadastro_funcionario.Free;
  end;

end;

procedure Tmenu_funcionarios.rdg_tipoconsultaClick(Sender: TObject);
begin
  case rdg_tipoconsulta.ItemIndex of
    0:
      begin
        edt_consulta.Visible := True;
        dtp_inicial.Visible := False;
        dtp_final.Visible := False;
        lbl_dtinicial.Visible := False;
        lbl_dtfinal.Visible := False;
        cbx_consulta.Visible := False;
      end;
    1:
      begin
        edt_consulta.Visible := False;
        dtp_inicial.Visible := True;
        dtp_final.Visible := True;
        lbl_dtinicial.Visible := True;
        lbl_dtfinal.Visible := True;
        cbx_consulta.Visible := False;
      end;
    2:
      begin
        edt_consulta.Visible := False;
        dtp_inicial.Visible := False;
        dtp_final.Visible := False;
        lbl_dtinicial.Visible := False;
        lbl_dtfinal.Visible := False;
        cbx_consulta.Visible := True;
      end;
  end;
end;

procedure Tmenu_funcionarios.sbtn_consultarClick(Sender: TObject);
Const
  SQLSELECT = 'SELECT * FROM FUNCIONARIOS WHERE';
  SQLNOME   = 'FUN_NOME LIKE :NOME';
  SQLDATA   = 'FUN_DATANASCIMENTO BETWEEN :DATA_INICIAL AND :DATA_FINAL';
  SQLCARGO  = 'FUN_CARGO = :CARGO';
begin
  case rdg_tipoconsulta.ItemIndex of
    0:
      begin
        fdq_funcionarios.Close;
        fdq_funcionarios.SQL.Clear;
        fdq_funcionarios.SQL.Add(SQLSELECT + SQLNOME);
        fdq_funcionarios.ParamByName('NOME').AsString :=
          '%' + edt_consulta.Text + '%';
        fdq_funcionarios.Open;
        calcula_total_grid();
      end;

    1:
      begin
        if dtp_inicial.DateTime > dtp_final.DateTime then
        begin
          MessageDlg('A DATA FINAL DEVE SER MAIOR QUE A INICIAL.',
            TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);

          dtp_final.SetFocus;
        end
        else
        begin
          fdq_funcionarios.Close;
          fdq_funcionarios.SQL.Clear;
          fdq_funcionarios.SQL.Add(SQLSELECT + SQLDATA);
          fdq_funcionarios.ParamByName('DATA_INICIAL').AsDate :=
            dtp_inicial.Date;
          fdq_funcionarios.ParamByName('DATA_FINAL').AsDate := dtp_final.Date;
          fdq_funcionarios.Open;
          calcula_total_grid();
        end;
      end;

    2:
      begin
        if cbx_consulta.Text = '' then
        begin
          MessageDlg('SELECIONE UM CARGO PARA CONSULTAR.',
            TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);

          cbx_consulta.SetFocus;
        end;

        if Trim(cbx_consulta.Text) = 'TODOS' then
        begin
          fdq_funcionarios.Close;
          fdq_funcionarios.SQL.Clear;
          fdq_funcionarios.SQL.Add(SQLSELECT);
          fdq_funcionarios.Open;
          calcula_total_grid();
        end
        else
        begin
          fdq_funcionarios.Close;
          fdq_funcionarios.SQL.Clear;
          fdq_funcionarios.SQL.Add(SQLSELECT + SQLCARGO);
          fdq_funcionarios.ParamByName('CARGO').AsString := cbx_consulta.Text;
          fdq_funcionarios.Open;
          calcula_total_grid();
        end;
      end
  end;
end;

procedure Tmenu_funcionarios.SQL(Value: String);
begin
  fdq_recebimento.SQL.Clear;
  fdq_recebimento.SQL.Add(Value);
end;

procedure Tmenu_funcionarios.Commit;
begin
  ctn_conexao.Commit;
end;

procedure Tmenu_funcionarios.ExecSQL;
begin
  fdq_recebimento.ExecSQL;
end;

procedure Tmenu_funcionarios.fdq_recebimentoCalcFields(DataSet: TDataSet);
begin
fdq_recebimento.FieldByName('QTDE').AsInteger := fdq_recebimento.RecordCount;
end;

procedure Tmenu_funcionarios.SQLOpen;
begin
  fdq_recebimento.Close;
  fdq_recebimento.Open;
end;

procedure Tmenu_funcionarios.Params(aParam: String; aValue: Variant);
begin
  fdq_recebimento.ParamByName(aParam).Value := aValue;
end;

end.
