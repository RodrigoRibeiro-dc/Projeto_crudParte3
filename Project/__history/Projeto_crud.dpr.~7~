program Projeto_crud;

uses
  Vcl.Forms,
  Cadastro_funcionario in '..\Unit\Cadastro_funcionario.pas' {frm_cad_funcionario},
  Vcl.Themes,
  Vcl.Styles,
  conexao_banco_dados in '..\Unit\conexao_banco_dados.pas' {Conexao_db},
  crud_funcionario in '..\Unit\crud_funcionario.pas' {menu_funcionarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(Tmenu_funcionarios, menu_funcionarios);
  Application.CreateForm(Tfrm_cad_funcionario, frm_cad_funcionario);
  Application.CreateForm(TConexao_db, Conexao_db);
  Application.Run;
end.
