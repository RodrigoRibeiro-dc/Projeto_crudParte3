unit dm_conexao_BD;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.FMTBcd, Data.SqlExpr,Vcl.Dialogs;

type
  Tdm_funcionarios = class(TDataModule)
    ctn_conexao: TFDConnection;
    tsc_funcionarios: TFDTransaction;
    fdq_total: TFDQuery;
    fdq_consulta: TFDQuery;
    dts_funcionarionovo: TDataSource;
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
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_funcionarios: Tdm_funcionarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm_funcionarios.DataModuleCreate(Sender: TObject);
begin
  ctn_conexao.Params.Database := 'PROJETO_CRUD';
  ctn_conexao.Params.UserName := 'sa';
  ctn_conexao.Params.Password := 'aram98';

  ctn_conexao.LoginPrompt := False;
  ctn_conexao.Connected := True;
end;

end.
