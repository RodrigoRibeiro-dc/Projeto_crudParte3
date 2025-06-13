program Projeto_crud;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  crud_funcionario in '..\Unit\crud_funcionario.pas' {menu_funcionarios},
  campo_funcionario in '..\Unit\campo_funcionario.pas' {cadastro_funcionario},
  Recebimento in '..\Unit\Recebimento.pas',
  crudRecebimento in 'crudRecebimento.pas',
  altera_recebimento in '..\Unit\altera_recebimento.pas' {Altera_rec},
  validaCamposRecebimento in '..\Unit\validaCamposRecebimento.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := False;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(Tmenu_funcionarios, menu_funcionarios);
  Application.CreateForm(TAltera_rec, Altera_rec);
  Application.Run;
end.
