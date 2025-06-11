unit crudRecebimento;

interface

uses
  Recebimento, crud_funcionario;

type
  TcrudRecebimento = class
  private

  public
   constructor Create;
   destructor Destroy; override;
   procedure Inserir(Value: TRecebimentos);
   procedure Excluir(Value: TRecebimentos);
   function Alterar(Value: TRecebimentos): TRecebimentos;
  end;

implementation

{ TcrudRecebimento }

function TcrudRecebimento.Alterar(Value: TRecebimentos): TRecebimentos;
begin
  menu_funcionarios.SQL('UPDATE RECEBIMENTO SET REC_DESCRICAO=:DESCRICAO, ' +
    'REC_VALOR=:VALOR, REC_DATA=:DATA, REC_TIPO=:TIPO WHERE REC_ID=:ID');
  menu_funcionarios.Params('DESCRICAO', Value.descricao);
  menu_funcionarios.Params('VALOR', Value.valor);
  menu_funcionarios.Params('DATA', Value.data);
  menu_funcionarios.Params('TIPO', Value.tipo);
  menu_funcionarios.Params('ID', Value.id);
  menu_funcionarios.ExecSQL;
  menu_funcionarios.Commit;

end;

constructor TcrudRecebimento.Create;
begin

end;

destructor TcrudRecebimento.Destroy;
begin

  inherited;
end;

procedure TcrudRecebimento.Excluir(Value: TRecebimentos);
begin
   menu_funcionarios.SQL('DELETE FROM RECEBIMENTO WHERE REC_ID=:ID');
   menu_funcionarios.Params('ID', Value.id);
   menu_funcionarios.ExecSQL;
   menu_funcionarios.Commit;
end;

procedure TcrudRecebimento.Inserir(Value: TRecebimentos);
begin
  menu_funcionarios.SQL('INSERT INTO RECEBIMENTO' +
    '(REC_DESCRICAO, REC_VALOR, REC_DATA, REC_TIPO)' +
    'VALUES(:DESCRICAO, :VALOR, :DATA, :TIPO );');


  menu_funcionarios.Params('DESCRICAO', Value.descricao);
  menu_funcionarios.Params('VALOR', Value.valor);
  menu_funcionarios.Params('DATA', Value.data);
  menu_funcionarios.Params('TIPO', Value.tipo);
  menu_funcionarios.ExecSQL;
  menu_funcionarios.Commit;
end;

end.
