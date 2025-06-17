unit campo_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, crud_funcionario, Data.DB, Vcl.Menus, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Recebimento, altera_recebimento,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.NumberBox;

type
  Tcadastro_funcionario = class(TForm)
    dbedt_codigo: TDBEdit;
    dbedt_datanascimento: TDBEdit;
    dbedt_nome: TDBEdit;
    dbedt_salario: TDBEdit;
    dbedt_rua: TDBEdit;
    dbedt_numero: TDBEdit;
    dbedt_bairro: TDBEdit;
    dbedt_cidade: TDBEdit;
    dbedt_complemento: TDBEdit;
    dbedt_cep: TDBEdit;
    dbcbx_cargo: TDBComboBox;
    btn_cancelar: TButton;
    btn_salvar: TButton;
    lbl_codigo: TLabel;
    lbl_nome: TLabel;
    lbl_rua: TLabel;
    lbl_complemento: TLabel;
    lbl_bairro: TLabel;
    lbl_cargo: TLabel;
    lbl_datanascimento: TLabel;
    lbl_salario: TLabel;
    lbl_numero: TLabel;
    lbl_cidade: TLabel;
    lbl_cep: TLabel;
    dts_funcionario: TDataSource;
    pgc_itens: TPageControl;
    tab_dadospessoais: TTabSheet;
    tab_financeiro: TTabSheet;
    dbg_recebimento: TDBGrid;
    lbl_descricao: TLabel;
    lbl_valor: TLabel;
    lbl_datalanc_pagamento: TLabel;
    lbl_tipo: TLabel;
    btn_incluir: TButton;
    btn_alterar: TButton;
    btn_excluir: TButton;
    edt_descricao: TEdit;
    cbx_tipo: TComboBox;
    dts_recebimento: TDataSource;
    dtp_data: TDateTimePicker;
    tbl_filhaRecebimento: TFDQuery;
    tlb_maeFuncionario: TFDQuery;
    dts_tblmae: TDataSource;
    dts_tblfilha: TDataSource;
    tlb_maeFuncionarioFUN_ID: TFDAutoIncField;
    tlb_maeFuncionarioFUN_NOME: TWideStringField;
    tlb_maeFuncionarioFUN_DATANASCIMENTO: TSQLTimeStampField;
    tlb_maeFuncionarioFUN_RUA: TWideStringField;
    tlb_maeFuncionarioFUN_NUMERO: TIntegerField;
    tlb_maeFuncionarioFUN_BAIRRO: TWideStringField;
    tlb_maeFuncionarioFUN_CIDADE: TWideStringField;
    tlb_maeFuncionarioFUN_COMPLEMENTO: TWideStringField;
    tlb_maeFuncionarioFUN_CEP: TWideStringField;
    tlb_maeFuncionarioFUN_CARGO: TWideStringField;
    tlb_maeFuncionarioFUN_SALARIO: TBCDField;
    tbl_filhaRecebimentoREC_ID: TFDAutoIncField;
    tbl_filhaRecebimentoFUN_ID: TIntegerField;
    tbl_filhaRecebimentoREC_DESCRICAO: TWideStringField;
    tbl_filhaRecebimentoREC_VALOR: TBCDField;
    tbl_filhaRecebimentoREC_DATA: TSQLTimeStampField;
    tbl_filhaRecebimentoREC_TIPO: TWideStringField;
    nbx_valor: TNumberBox;
    pnl_calculos: TPanel;
    lbl_totalregistro: TLabel;
    lbl_somaVale: TLabel;
    lbl_somaSalario: TLabel;
    lbl_somaAcerto: TLabel;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure valida_campos;
    procedure btn_incluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure ValidaCampos_recebimento;
    procedure Totais_recebimentos;
  private
  public
    { Public declarations }
  end;

var
  cadastro_funcionario: Tcadastro_funcionario;

implementation

{$R *.dfm}

procedure Tcadastro_funcionario.valida_campos;
var
  valor_data: TDateTime;

begin
  if menu_funcionarios.fdq_funcionarios.FieldByName('FUN_DATANASCIMENTO').IsNull
  then
  begin
    MessageDlg('A DATA DE NASCIMENTO NÃO PODE FICAR VAZIA.', mtWarning,
      [mbOk], 0);

    dbedt_datanascimento.SetFocus;
    abort;
  end
  else if (Trim(dbedt_datanascimento.Text) = '') or
    (not TryStrToDate(dbedt_datanascimento.Text, valor_data)) or
    (valor_data < StrToDate('01/01/1800')) or
    (valor_data > StrToDate('01/01/3000')) then
  begin
    MessageDlg('INFORME UMA DATA VÁLIDA.', mtWarning, [TMsgDlgBtn.mbOk], 0);

    dbedt_datanascimento.SetFocus;
    abort;
  end;

  if Trim(dbedt_nome.Text) = '' then
  begin
    MessageDlg('NOME NÃO PODE FICAR VAZIO.', mtWarning, [mbOk], 0);
    dbedt_nome.SetFocus;
    abort;
  end;

  if Trim(dbedt_salario.Text) = '' then
  begin
    MessageDlg('SALÁRIO NÃO PODE FICAR VAZIO.', mtWarning, [mbOk], 0);
    dbedt_salario.SetFocus;
    abort;
  end;
end;

procedure Tcadastro_funcionario.btn_alterarClick(Sender: TObject);
var
  altera_recebimento: TAltera_rec;
begin
  altera_recebimento := TAltera_rec.Create(Self);
  try
    altera_recebimento.ShowModal;
  finally
    altera_recebimento.Free;
  end;
end;

procedure Tcadastro_funcionario.btn_cancelarClick(Sender: TObject);
begin
  if MessageDlg('DESEJA REALMENTE SAIR SEM SALVAR?', mtConfirmation,
    [mbYes, MbNo], 0) = mrYes then
  begin
    menu_funcionarios.fdq_funcionarios.Cancel;
    cadastro_funcionario.Close;
  end;
end;

procedure Tcadastro_funcionario.btn_consultarClick(Sender: TObject);
var
  Recebimento: TRecebimentos;
begin
  Recebimento := TRecebimentos.Create;
  try
    Recebimento.ConsultaGrid(Recebimento);
  finally
    Recebimento.Free;
  end;
end;

procedure Tcadastro_funcionario.btn_excluirClick(Sender: TObject);
var
  Recebimento: TRecebimentos;
begin
  Recebimento := TRecebimentos.Create;
  try
    if not dts_recebimento.DataSet.IsEmpty then
    begin
      Recebimento.Excluir(Recebimento);
      Recebimento.ConsultaGrid(Recebimento);
      Totais_recebimentos;
    end;
  finally
    Recebimento.Free;
  end;
end;

procedure Tcadastro_funcionario.btn_incluirClick(Sender: TObject);
var
  Recebimento: TRecebimentos;
begin
  Recebimento := TRecebimentos.Create;
  try
    Recebimento.descricao := edt_descricao.Text;
    Recebimento.valor := nbx_valor.Value;
    Recebimento.Data := dtp_data.Date;
    Recebimento.tipo := cbx_tipo.Text;

    ValidaCampos_recebimento;
    Recebimento.Inserir(Recebimento);
    Recebimento.ConsultaGrid(Recebimento);
    Totais_recebimentos;

    edt_descricao.Clear;
    nbx_valor.Clear;
    dtp_data.Date := Date;
  finally
    Recebimento.Free;
  end;

end;

procedure Tcadastro_funcionario.btn_salvarClick(Sender: TObject);
begin
  valida_campos;
  if dts_funcionario.State = dsInsert then
  begin
    if MessageDlg('DESEJA INCLUIR O FUNCIONÁRIO?', mtConfirmation,
      [mbYes, MbNo], 0) = mrYes then
    begin
      menu_funcionarios.fdq_funcionarios.Post;

      MessageDlg('FUNCIONÁRIO INCLUÍDO COM SUCESSO.', mtConfirmation,
        [mbOk], 0);
      cadastro_funcionario.Close;
      menu_funcionarios.calcula_total_grid;
    end
    else
    begin
      menu_funcionarios.fdq_funcionarios.Cancel;
      cadastro_funcionario.Close;
    end;
  end
  else
  begin
    if MessageDlg('DESEJA ALTERAR O FUNCIONÁRIO?', mtConfirmation,
      [mbYes, MbNo], 0) = mrYes then
    begin
      menu_funcionarios.fdq_funcionarios.Post;

      MessageDlg('FUNCIONÁRIO ALTERADO COM SUCESSO.', mtConfirmation,
        [mbOk], 0);
      cadastro_funcionario.Close;
      menu_funcionarios.calcula_total_grid;
    end;
  end;
end;

procedure Tcadastro_funcionario.FormActivate(Sender: TObject);
begin
  pgc_itens.ActivePage := tab_dadospessoais;
  dbedt_datanascimento.SetFocus;
  Totais_recebimentos;

end;

procedure Tcadastro_funcionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  menu_funcionarios.fdq_funcionarios.Cancel;
  menu_funcionarios.fdq_recebimento.Close;
end;

procedure Tcadastro_funcionario.FormCreate(Sender: TObject);
var
  Recebimento: TRecebimentos;
begin
  Recebimento := TRecebimentos.Create;
  try
    if dts_funcionario.State = dsInsert then
      tab_financeiro.TabVisible := False;

    dtp_data.Date := Date;
    Recebimento.ConsultaGrid(Recebimento);
  finally
    Recebimento.Free;
  end;
end;

procedure Tcadastro_funcionario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (ActiveControl = dbedt_cep) then
    exit;

  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tcadastro_funcionario.Totais_recebimentos;
begin
  lbl_totalregistro.Caption := 'TOTAL : ' +
    IntToStr(menu_funcionarios.fdq_recebimentoQTDE.AsInteger);

  lbl_somaVale.Caption := 'TOTAL VALE R$ : ' +
    FormatFloat('#,0.00',
    StrToFloatDef(menu_funcionarios.fdq_recebimentoSomaVale.AsString, 0));

  lbl_somaSalario.Caption := 'TOTAL SALÁRIO R$ : ' +
    FormatFloat('#,0.00',
    StrToFloatDef(menu_funcionarios.fdq_recebimentoSomaSalario.AsString, 0));

  lbl_somaAcerto.Caption := 'TOTAL ACERTO R$ : ' +
    FormatFloat('#,0.00',
    StrToFloatDef(menu_funcionarios.fdq_recebimentoSomaAcerto.AsString, 0));
end;

procedure Tcadastro_funcionario.ValidaCampos_recebimento;
begin
  if Trim(cadastro_funcionario.edt_descricao.Text) = '' then
  begin
    MessageDlg('DESCRIÇÃO NÃO PODE FICAR VAZIO.', mtWarning, [mbOk], 0);
    cadastro_funcionario.edt_descricao.SetFocus;
    abort;
  end;
  if cadastro_funcionario.nbx_valor.Value <= 0 then
  begin
    MessageDlg('VALOR NÃO PODE SER 0,00.', mtWarning, [mbOk], 0);
    cadastro_funcionario.nbx_valor.SetFocus;
    abort;
  end;
  if Trim(cadastro_funcionario.cbx_tipo.Text) = '' then
  begin
    MessageDlg('TIPO NÃO PODE FICAR VAZIO.', mtWarning, [mbOk], 0);
    cadastro_funcionario.cbx_tipo.SetFocus;
    abort;
  end;
end;

end.
