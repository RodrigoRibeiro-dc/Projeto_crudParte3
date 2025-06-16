unit validaCamposRecebimento;

interface

uses
  Dialogs, System.SysUtils, System.Variants, System.UITypes, Recebimento;

type
  TvalidacamposRec = class

  private

  public
    procedure ValidaCampos;
  end;

implementation

uses
  campo_funcionario, altera_recebimento;

{ validacamposRec }

{ TvalidacamposRec }

procedure TvalidacamposRec.ValidaCampos;
begin
  if Trim(cadastro_funcionario.edt_descricao.Text) = '' then
  begin
    MessageDlg('DESCRIÇÃO NÃO PODE FICAR VAZIO.', mtWarning, [mbOk], 0);
    cadastro_funcionario.edt_descricao.SetFocus;
    abort;
  end;
  if cadastro_funcionario.nbx_valor.Value < 1 then
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
