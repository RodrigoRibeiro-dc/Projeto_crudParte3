unit campo_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, crud_funcionario;

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
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cadastro_funcionario: Tcadastro_funcionario;

implementation

{$R *.dfm}

procedure Tcadastro_funcionario.btn_salvarClick(Sender: TObject);
var
Valor_data: TDateTime;

begin
if menu_funcionarios.fdq_funcionarios.FieldByName('FUN_DATANASCIMENTO').IsNull
    then
    begin
      MessageDlg('A DATA DE NASCIMENTO NÃO PODE FICAR VAZIA!', mtWarning,
        [mbOk], 0);

      dbedt_datanascimento.SetFocus;
      exit;
    end
    else if (Trim(dbedt_datanascimento.Text) = '') or
      (not TryStrToDate(dbedt_datanascimento.Text, Valor_data)) or
      (Valor_data < StrToDate('01/01/1800')) or
      (Valor_data > StrToDate('01/01/3000')) then
    begin
      MessageDlg('INFORME UMA DATA VÁLIDA.', mtWarning, [TMsgDlgBtn.mbOk], 0);

      dbedt_datanascimento.SetFocus;
      exit;
    end;
    if Trim(dbedt_nome.text) = '' then
    begin
      MessageDlg('NOME NÃO PODE FICAR VAZIO.', mtConfirmation, [mbOk], 0);
      dbedt_nome.SetFocus;
      exit
    end;
    if Trim(dbedt_salario.Text) = '' then
    begin
      MessageDlg('SÁLARIO NÃO PODE FICAR VAZIO.', mtConfirmation, [mbOk], 0);
      dbedt_salario.SetFocus
    end;
menu_funcionarios.tsc_funcionarios.StartTransaction;
menu_funcionarios.fdq_funcionarios.Post;
menu_funcionarios.tsc_funcionarios.CommitRetaining;
cadastro_funcionario.Close;
end;
end.
