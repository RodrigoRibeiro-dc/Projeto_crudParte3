unit crud_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Menus, RxToolEdit, RxDBCtrl;

type
  Tmenu_funcionarios = class(TForm)
    pnl_crud: TPanel;
    pnl_buttons: TPanel;
    pnl_grid: TPanel;
    img_incluir: TImage;
    img_alterar: TImage;
    img_excluir: TImage;
    btn_consultar: TButton;
    edt_nome_consulta: TEdit;
    lbl_nome_consulta: TLabel;
    lbl_incluir: TLabel;
    lbl_alterar: TLabel;
    lbl_excluir: TLabel;
    pnl_altera_funcionario: TPanel;
    pnl_somatorio: TPanel;
    lbl_total_funcionario: TLabel;
    lbl_total_salario: TLabel;
    lbl_count_funcionario: TLabel;
    lbl_sum_salario: TLabel;
    lbl_codigo: TLabel;
    Dedt_codigo: TDBEdit;
    lbl_datanascimento: TLabel;
    lbl_nome: TLabel;
    Dedt_nome: TDBEdit;
    lbl_rua: TLabel;
    Dedt_rua: TDBEdit;
    lbl_numero: TLabel;
    Dedt_numero: TDBEdit;
    lbl_bairro: TLabel;
    Dedt_bairro: TDBEdit;
    lbl_cidade: TLabel;
    Dedt_cidade: TDBEdit;
    lbl_complemento: TLabel;
    Dedt_complemento: TDBEdit;
    lbl_cep: TLabel;
    Dedt_cep: TDBEdit;
    lbl_cargo: TLabel;
    lbl_salario: TLabel;
    Dedt_salario: TDBEdit;
    cbx_cargo: TDBComboBox;
    dbdt_datanascimento: TDBDateEdit;
    img_salvar: TImage;
    lbl_salvar: TLabel;
    DBGrid1: TDBGrid;
    dbtxt_totalfuncionarios: TDBText;
    dbtxt_totalsalario: TDBText;
    procedure edt_salarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_salario_novoKeyPress(Sender: TObject; var Key: Char);
    procedure img_incluirClick(Sender: TObject);
    procedure img_salvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure img_alterarClick(Sender: TObject);
    procedure img_excluirClick(Sender: TObject);
    procedure dbtxt_totalsalarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  menu_funcionarios: Tmenu_funcionarios;

implementation

{$R *.dfm}

uses dm_conexao_BD;

procedure Tmenu_funcionarios.dbtxt_totalsalarioClick(Sender: TObject);
begin
  //lblTotalSalarios.Caption := FormatFloat('#,##0.00', FDQueryTotais.FieldByName('TotalSalarios').AsFloat);
end;

procedure Tmenu_funcionarios.edt_salarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', ',', '.', #8]) then
    Key := #0;
end;

procedure Tmenu_funcionarios.edt_salario_novoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', ',', '.', #8]) then
    Key := #0;
end;

procedure calcula_total(Sender: TObject);
begin
  // Total de funcionários
  dm_funcionarios.fdq_totalfuncionario.Close;
  dm_funcionarios.fdq_totalfuncionario.SQL.Text := 'SELECT COUNT(*) AS QUANTIDADE FROM FUNCIONARIOS';
  dm_funcionarios.fdq_totalfuncionario.Open;
  menu_funcionarios.dbtxt_totalfuncionarios.Caption := dm_funcionarios.fdq_totalfuncionario.FieldByName('QUANTIDADE').AsString;

  // Total de salários
  dm_funcionarios.fdq_totalsalario.Close;
  dm_funcionarios.fdq_totalsalario.SQL.Text := 'SELECT SUM(FUN_SALARIO) AS TOTAL_SALARIO FROM FUNCIONARIOS';
  dm_funcionarios.fdq_totalsalario.Open;
  menu_funcionarios.dbtxt_totalsalario.Caption := dm_funcionarios.fdq_totalsalario.FieldByName('TOTAL_SALARIO').AsString;
end;


procedure Tmenu_funcionarios.FormActivate(Sender: TObject);
begin
    if Trim(Dedt_nome.Text) ='' then img_salvar.Enabled := True
    else
    img_salvar.Enabled := False;
    dm_funcionarios.fdq_totalfuncionario.SQL.Text := 'SELECT COUNT(*) AS QUANTIDADE FROM FUNCIONARIOS ';
    dm_funcionarios.fdq_totalfuncionario.Open();
    dbtxt_totalfuncionarios.Caption := dm_funcionarios.fdq_totalfuncionario.FieldByName('QUANTIDADE').AsString;
    dm_funcionarios.fdq_totalsalario.SQL.Text := 'SELECT SUM(FUN_SALARIO) AS TOTAL_SALARIO FROM FUNCIONARIOS';
    dm_funcionarios.fdq_totalsalario.Open();
    dbtxt_totalsalario.Caption := dm_funcionarios.fdq_totalsalario.FieldByName('TOTAL_SALARIO').AsString;
end;

procedure Tmenu_funcionarios.FormShow(Sender: TObject);
begin
    calcula_total(Sender);
end;

procedure Tmenu_funcionarios.img_alterarClick(Sender: TObject);
begin
  Dedt_nome.SetFocus;
  dm_funcionarios.tbl_funcionarios.Open();
  dm_funcionarios.tbl_funcionarios.Edit;
  dm_funcionarios.tbl_funcionarios.Post;
  dm_funcionarios.tsc_funcionarios.StartTransaction;
  dm_funcionarios.tsc_funcionarios.CommitRetaining;
  MessageDlg('FUNCIONÁRIO ALTERADO COM SUCESSO.', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);
  calcula_total(Sender);
end;

procedure Tmenu_funcionarios.img_excluirClick(Sender: TObject);
begin
  dm_funcionarios.tbl_funcionarios.Delete;
  dm_funcionarios.tsc_funcionarios.StartTransaction;
  MessageDlg('FUNCIONÁRIO EXCLUÍDO COM SUCESSO.',TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);
  dm_funcionarios.tbl_funcionarios.Refresh;
end;

procedure Tmenu_funcionarios.img_incluirClick(Sender: TObject);
begin
   dbdt_datanascimento.SetFocus;
   dbdt_datanascimento.Clear;
   Dedt_nome.Clear;
   Dedt_rua.Clear;
   Dedt_numero.Clear;
   Dedt_bairro.Clear;
   Dedt_cidade.Clear;
   Dedt_complemento.Clear;
   Dedt_cep.Clear;
   cbx_cargo.ClearSelection;
   Dedt_salario.Clear;
   dm_funcionarios.tbl_funcionarios.Open;
   dm_funcionarios.tbl_funcionarios.Append;
   img_salvar.Enabled := True;
   img_incluir.Enabled := false;
   img_alterar.Enabled := False;
   img_excluir.Enabled := False;
   calcula_total(Sender);
end;

procedure Tmenu_funcionarios.img_salvarClick(Sender: TObject);
begin
  if Trim(Dedt_nome.Text) = '' then
  begin
     MessageDlg('O CAMPO NOME NÃO PODE FICAR VAZIO!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
     Dedt_nome.SetFocus;
  end
  else if Trim(Dedt_salario.Text) = '' then
  begin
    MessageDlg('O CAMPO SALÁRIO NÃO PODE FICAR VAZIO!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Dedt_salario.SetFocus;
  end
  else if dm_funcionarios.tbl_funcionarios.State in [dsinsert] then
  begin
    dm_funcionarios.tbl_funcionarios.Post;
    dm_funcionarios.tsc_funcionarios.StartTransaction;
    dm_funcionarios.tsc_funcionarios.CommitRetaining;
    img_salvar.Enabled := false;
    MessageDlg('FUNCIONÁRIO INCLÚIDO COM SUCESSO.', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);
    dbdt_datanascimento.SetFocus;
    dbdt_datanascimento.Clear;
    Dedt_nome.Clear;
    Dedt_rua.Clear;
    Dedt_numero.Clear;
    Dedt_bairro.Clear;
    Dedt_cidade.Clear;
    Dedt_complemento.Clear;
    Dedt_cep.Clear;
    cbx_cargo.ClearSelection;
    Dedt_salario.Clear;
    img_incluir.Enabled := True;
    img_alterar.Enabled := True;
    img_excluir.Enabled := True;
    img_salvar.Enabled := false;
    calcula_total(Sender);

  end;
  

end;

end.
