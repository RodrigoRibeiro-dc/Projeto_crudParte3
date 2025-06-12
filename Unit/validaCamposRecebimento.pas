unit validaCamposRecebimento;

interface

uses
  Dialogs, System.SysUtils, System.Variants;

type
  TvalidacamposRec = class

  private

  public
    procedure validacampos;
  end;

implementation

uses
  campo_funcionario;

{ validacamposRec }

{ TvalidacamposRec }

procedure TvalidacamposRec.validacampos;
begin
  if Trim(cadastro_funcionario.edt_descricao.Text) = '' then
  begin
    MessageDlg('DESCRIÇÃO NÃO PODE FICAR VAZIO.', mtWarning, [mbOk], 0);
    cadastro_funcionario.edt_descricao.SetFocus;
    abort;
  end;
  if Trim(cadastro_funcionario.edt_valor.Text) = '' then
  begin
      MessageDlg('VALOR NÃO PODE FICAR VAZIO.', mtWarning, [mbOk], 0);
      cadastro_funcionario.edt_valor.SetFocus;
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
