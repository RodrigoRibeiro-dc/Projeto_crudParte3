unit campo_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, crud_funcionario, Data.DB, Vcl.Menus, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Recebimento, crudRecebimento;

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
    edt_valor: TEdit;
    edt_data: TEdit;
    cbx_tipo: TComboBox;
    dts_recebimento: TDataSource;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure valida_campos;
    procedure btn_incluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    crudRec: TcrudRecebimento;
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
    MessageDlg('NOME NÃO PODE FICAR VAZIO.', mtConfirmation, [mbOk], 0);
    dbedt_nome.SetFocus;
    abort;
  end;

  if Trim(dbedt_salario.Text) = '' then
  begin
    MessageDlg('SALÁRIO NÃO PODE FICAR VAZIO.', mtConfirmation, [mbOk], 0);
    dbedt_salario.SetFocus;
    abort;
  end;
end;

procedure Tcadastro_funcionario.btn_cancelarClick(Sender: TObject);
var
  resposta_cancelar: integer;
begin
  resposta_cancelar := MessageDlg('DESEJA REALMENTE SAIR SEM SALVAR?',
    mtConfirmation, [mbYes, MbNo], 0);
  if resposta_cancelar = mrYes then
  begin
    menu_funcionarios.fdq_funcionarios.Cancel;
    cadastro_funcionario.Close;
  end;
end;

procedure Tcadastro_funcionario.btn_excluirClick(Sender: TObject);
var
  Recebimento: TRecebimentos;
begin
Recebimento:= TRecebimentos.Create;
  try
  crudRec.Excluir(Recebimento);

  finally
  Recebimento.Free
  end;
end;

procedure Tcadastro_funcionario.btn_incluirClick(Sender: TObject);
var
  Recebimento: TRecebimentos;
begin
  Recebimento := TRecebimentos.Create;
  try
    recebimento.descricao := edt_descricao.Text;
    recebimento.valor := strToCurr(edt_valor.Text);
    Recebimento.data := edt_data.Text;
    recebimento.tipo := cbx_tipo.Text;

    crudRec.Inserir(Recebimento);

  finally
    recebimento.Free;
  end;

end;

procedure Tcadastro_funcionario.btn_salvarClick(Sender: TObject);
var
  esta_inserindo: Boolean;
  resposta_salvar: integer;
begin
  valida_campos;
  esta_inserindo := menu_funcionarios.fdq_funcionarios.State = dsInsert;
  if esta_inserindo then
  begin
    resposta_salvar := MessageDlg('DESEJA INCLUIR O FUNCIONÁRIO?',
      mtConfirmation, [mbYes, MbNo], 0);
    if resposta_salvar = mrYes then
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
    resposta_salvar := MessageDlg('DESEJA ALTERAR O FUNCIONÁRIO?',
      mtConfirmation, [mbYes, MbNo], 0);
    if resposta_salvar = mrYes then
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
  dbedt_datanascimento.SetFocus;
end;

procedure Tcadastro_funcionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  menu_funcionarios.fdq_funcionarios.Cancel;
end;

procedure Tcadastro_funcionario.FormCreate(Sender: TObject);
begin
crudRec:= TcrudRecebimento.Create;
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

end.
