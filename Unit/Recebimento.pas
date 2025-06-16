unit Recebimento;

interface

uses
  crud_funcionario, System.SysUtils, System.Classes, Vcl.Forms,
  Vcl.Dialogs, Vcl.Controls;

type
  TRecebimentos = class
    Fid_recebimento: integer;
    Fid_funcionario: integer;
    Fdescricao: String;
    Fvalor: Currency;
    Fdata: TDateTime;
    Ftipo: String;
  private

  public
    property id_recebimento: integer read Fid_recebimento write Fid_recebimento;
    property id_funcionario: integer read Fid_funcionario write Fid_funcionario;
    property descricao: String read Fdescricao write Fdescricao;
    property valor: Currency read Fvalor write Fvalor;
    property data: TDateTime read Fdata write Fdata;
    property tipo: String read Ftipo write Ftipo;

    procedure Inserir(Value: TRecebimentos);
    procedure Excluir(Value: TRecebimentos);
    procedure Alterar(Value: TRecebimentos);
    procedure ConsultaGrid(Value: TRecebimentos);
  end;

implementation

uses
  campo_funcionario;

procedure TRecebimentos.Alterar(Value: TRecebimentos);
begin
  Value.id_recebimento := menu_funcionarios.fdq_recebimentoREC_ID.Value;

  if MessageDlg('DESEJA ALTERAR O REGISTRO?', mtconfirmation, [mbYes, mbNo], 0)
    = mrYes then
  begin
    menu_funcionarios.SQLOpen;
    menu_funcionarios.SQL('UPDATE RECEBIMENTO SET REC_DESCRICAO=:DESCRICAO, ' +
      'REC_VALOR=:VALOR, REC_DATA=:DATA, REC_TIPO=:TIPO WHERE REC_ID=:ID');

    menu_funcionarios.Params('DESCRICAO', Value.descricao);
    menu_funcionarios.Params('VALOR', Value.valor);
    menu_funcionarios.Params('DATA', Value.data);
    menu_funcionarios.Params('TIPO', Value.tipo);
    menu_funcionarios.Params('ID', Value.id_recebimento);

    menu_funcionarios.ExecSQL;
    menu_funcionarios.Commit;
    MessageDlg('REGISTRO ALTERADO COM SUCESSO.', mtconfirmation, [mbOk], 0);
  end
end;

procedure TRecebimentos.Excluir(Value: TRecebimentos);
begin
  Value.id_recebimento := menu_funcionarios.fdq_recebimentoREC_ID.Value;

  if MessageDlg('DESEJA EXCLUIR O REGISTRO?', mtconfirmation, [mbYes, mbNo], 0)
    = mrYes then
  begin
    menu_funcionarios.SQL('DELETE FROM RECEBIMENTO WHERE REC_ID=:ID');
    menu_funcionarios.Params('ID', Value.id_recebimento);
    menu_funcionarios.ExecSQL;
    menu_funcionarios.Commit;
    MessageDlg('REGISTRO EXCLUIDO COM SUCESSO.', mtconfirmation, [mbOk], 0);
  end;
end;

procedure TRecebimentos.Inserir(Value: TRecebimentos);
begin
  if not menu_funcionarios.fdq_funcionarios.IsEmpty then
  begin
    Value.id_funcionario := menu_funcionarios.fdq_funcionariosFUN_ID.Value;
    if MessageDlg('DESEJA INCLUIR O REGISTRO?', mtconfirmation, [mbYes, mbNo],
      0) = mrYes then
    begin
      menu_funcionarios.SQLOpen;
      menu_funcionarios.SQL('INSERT INTO RECEBIMENTO' +
        '(REC_DESCRICAO, REC_VALOR, REC_DATA, REC_TIPO, FUN_ID)' +
        'VALUES(:DESCRICAO, :VALOR, :DATA, :TIPO, :IDFUNCIONARIO );');

      menu_funcionarios.Params('DESCRICAO', Value.descricao);
      menu_funcionarios.Params('VALOR', Value.valor);
      menu_funcionarios.Params('DATA', Value.data);
      menu_funcionarios.Params('TIPO', Value.tipo);
      menu_funcionarios.Params('IDFUNCIONARIO', Value.id_funcionario);

      menu_funcionarios.ExecSQL;
      menu_funcionarios.Commit;
      MessageDlg('REGISTRO INCLUIDO COM SUCESSO.', mtconfirmation, [mbOk], 0);
    end;
  end;
end;

procedure TRecebimentos.ConsultaGrid(Value: TRecebimentos);
begin
  if not menu_funcionarios.fdq_funcionarios.IsEmpty then
  begin
    Value.id_funcionario := menu_funcionarios.fdq_funcionariosFUN_ID.Value;
    menu_funcionarios.SQL('SELECT REC_DESCRICAO, REC_VALOR,' +
      'REC_DATA, REC_TIPO, REC_ID FROM RECEBIMENTO WHERE FUN_ID = :IDFUNCIONARIO');

    Value.descricao := menu_funcionarios.fdq_recebimento.FieldByName
      ('REC_DESCRICAO').AsString;
    Value.valor := menu_funcionarios.fdq_recebimento.FieldByName('REC_VALOR')
      .AsCurrency;
    Value.tipo := menu_funcionarios.fdq_recebimento.FieldByName
      ('REC_TIPO').AsString;
    Value.data := menu_funcionarios.fdq_recebimento.FieldByName('REC_DATA')
      .AsDateTime;
    menu_funcionarios.Params('IDFUNCIONARIO', Value.id_funcionario);
    menu_funcionarios.fdq_recebimento.open;
  end;
end;

end.
