unit crud_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Menus, System.UITypes, Vcl.Buttons, RxToolEdit, RxDBCtrl;

type
  Tmenu_funcionarios = class(TForm)
    pnl_crud: TPanel;
    pnl_grid: TPanel;
    img_incluir: TImage;
    img_alterar: TImage;
    img_excluir: TImage;
    lbl_incluir: TLabel;
    lbl_alterar: TLabel;
    lbl_excluir: TLabel;
    pnl_altera_funcionario: TPanel;
    pnl_somatorio: TPanel;
    lbl_total_funcionario: TLabel;
    lbl_total_salario: TLabel;
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
    img_salvar: TImage;
    lbl_salvar: TLabel;
    dbg_funcionarios: TDBGrid;
    dbtxt_totalfuncionarios: TDBText;
    dbtxt_totalsalario: TDBText;
    sbtn_consultar: TSpeedButton;
    pnl_consulta: TPanel;
    rbtn_nome: TRadioButton;
    rbtn_cargo: TRadioButton;
    rbtn_datanascimento: TRadioButton;
    edt_consulta: TEdit;
    dtp_inicial: TDateTimePicker;
    dtp_final: TDateTimePicker;
    lbl_dtinicial: TLabel;
    lbl_dtfinal: TLabel;
    cbx_consulta: TComboBox;
    Dbdt_datanascimento: TDBDateEdit;
    procedure img_incluirClick(Sender: TObject);
    procedure img_salvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure img_alterarClick(Sender: TObject);
    procedure img_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_consultarClick(Sender: TObject);
    procedure rbtn_cargoClick(Sender: TObject);
    procedure rbtn_datanascimentoClick(Sender: TObject);
    procedure rbtn_nomeClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edt_consultaKeyPress(Sender: TObject; var Key: Char);
  private
    controle_key : Boolean;
  public
    { Public declarations }
  end;

var
  menu_funcionarios: Tmenu_funcionarios;

implementation

{$R *.dfm}

uses dm_conexao_BD;

procedure calcula_total_grid;
var
  totalSalario: Currency;
  totalFuncionarios: Integer;
begin
  totalSalario := 0;
  totalFuncionarios := 0;

  dm_funcionarios.tbl_funcionarios.DisableControls;
  try
    dm_funcionarios.tbl_funcionarios.First;
    while not dm_funcionarios.tbl_funcionarios.Eof do
    begin
      Inc(totalFuncionarios);
      totalSalario := totalSalario + dm_funcionarios.tbl_funcionarios.
        FieldByName('FUN_SALARIO').AsCurrency;
      dm_funcionarios.tbl_funcionarios.Next;
    end;
  finally
    dm_funcionarios.tbl_funcionarios.EnableControls;
  end;

  menu_funcionarios.dbtxt_totalfuncionarios.Caption :=
    totalFuncionarios.ToString;
  menu_funcionarios.dbtxt_totalsalario.Caption :=
    FormatFloat('#,##0.00', totalSalario);
end;

{ procedure calcula_total(Sender: TObject);
  begin
  dm_funcionarios.fdq_totalfuncionario.SQL.Text := 'SELECT COUNT(*) AS QUANTIDADE FROM FUNCIONARIOS';
  dm_funcionarios.fdq_totalfuncionario.Open;
  menu_funcionarios.dbtxt_totalfuncionarios.Caption := dm_funcionarios.fdq_totalfuncionario.FieldByName('QUANTIDADE').AsString;

  dm_funcionarios.fdq_totalsalario.SQL.Text :=
  'SELECT CASE WHEN SUM(FUN_SALARIO) IS NULL THEN 0 ELSE SUM(FUN_SALARIO) END AS TOTAL_SALARIO FROM FUNCIONARIOS';
  dm_funcionarios.fdq_totalsalario.Open;
  menu_funcionarios.dbtxt_totalsalario.Caption :=
  FormatFloat('#,##0.00', dm_funcionarios.fdq_totalsalario.FieldByName('TOTAL_SALARIO').AsCurrency);
  end; }

procedure Tmenu_funcionarios.edt_consultaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
  key := #0;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

end;

procedure Tmenu_funcionarios.FormActivate(Sender: TObject);
begin
  pnl_altera_funcionario.Enabled := False;
  calcula_total_grid;
  if Trim(Dedt_nome.Text) = '' then
    img_salvar.Enabled := True
  else
    img_salvar.Enabled := False;
  if dm_funcionarios.tbl_funcionarios.IsEmpty then
  begin
    img_salvar.Enabled := False;
    img_alterar.Enabled := False;
    img_excluir.Enabled := False;
  end
  else
  begin
    img_alterar.Enabled := True;
    img_excluir.Enabled := True;
  end;
end;

procedure Tmenu_funcionarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2:
      begin
        if not controle_key then
        begin
          controle_key := True;
          img_incluirClick(Sender);
        end;
      end;

    VK_F3:
      begin
        if not controle_key then
        begin
          controle_key := True;
          img_alterarClick(Sender);
        end;
      end;

    VK_F4:
      begin
        if not controle_key then
          img_excluirClick(Sender);
      end;

    VK_F5:
      begin
        if controle_key then
        begin
          var
            estaEditando := dm_funcionarios.tbl_funcionarios.State
            in [dsInsert, dsEdit];
            img_salvarClick(Sender);
            if estaEditando and not(dm_funcionarios.tbl_funcionarios.State
            in [dsInsert, dsEdit]) then
            controle_key := False;
        end;
      end;
  end;
end;

procedure Tmenu_funcionarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ActiveControl = Dedt_salario) then
      Key := #0
    else if (ActiveControl is TDBEdit) or (ActiveControl is TDBComboBox) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure Tmenu_funcionarios.FormShow(Sender: TObject);
begin
  calcula_total_grid;
  cbx_consulta.Items.Clear;
  cbx_consulta.Items.Add('PROGRAMADOR');
  cbx_consulta.Items.Add('IMPLANTAÇÃO');
  cbx_consulta.Items.Add('SUPORTE');
  cbx_consulta.Items.Add('VENDEDOR');
  cbx_consulta.Items.Add('FINANCEIRO');
  cbx_consulta.Items.Add('CS');
  cbx_consulta.Style := csDropDownList;
end;

procedure Tmenu_funcionarios.img_alterarClick(Sender: TObject);
begin
  pnl_altera_funcionario.Enabled := True;
  if img_alterar.Enabled = True then
    img_salvar.Enabled := True;

  if img_alterar.Enabled = True then
    img_incluir.Enabled := False;

  if img_alterar.Enabled = True then
    img_excluir.Enabled := False;

  if img_salvar.Enabled = True then
    img_alterar.Enabled := False;

  dm_funcionarios.tbl_funcionarios.Open();
  Dedt_nome.SetFocus;
  dm_funcionarios.tbl_funcionarios.Edit;
  controle_key := True;
end;

procedure Tmenu_funcionarios.img_excluirClick(Sender: TObject);
begin
  dm_funcionarios.tbl_funcionarios.Delete;
  dm_funcionarios.tsc_funcionarios.StartTransaction;
  MessageDlg('FUNCIONÁRIO EXCLUÍDO COM SUCESSO.', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbOK], 0);
  pnl_altera_funcionario.Enabled := False;
  dm_funcionarios.tbl_funcionarios.Refresh;
  calcula_total_grid;
  if dm_funcionarios.tbl_funcionarios.IsEmpty then
  begin
    img_salvar.Enabled := False;
    img_alterar.Enabled := False;
    img_excluir.Enabled := False;
  end
  else
  begin
    img_alterar.Enabled := True;
    img_excluir.Enabled := True;
  end;
end;

procedure Tmenu_funcionarios.img_incluirClick(Sender: TObject);
begin
  pnl_altera_funcionario.Enabled := True;
  Dbdt_datanascimento.SetFocus;
  Dbdt_datanascimento.Clear;
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
  img_incluir.Enabled := False;
  img_alterar.Enabled := False;
  img_excluir.Enabled := False;
  controle_key := True;
end;

procedure Tmenu_funcionarios.img_salvarClick(Sender: TObject);
var
  foiInclusao: Boolean;
begin
  if dm_funcionarios.tbl_funcionarios.FieldByName('FUN_DATANASCIMENTO').IsNull
  then
  begin
    MessageDlg('A DATA DE NASCIMENTO NÃO PODE FICAR VAZIO!',
      TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    Dbdt_datanascimento.SetFocus;
  end

  else if Trim(Dedt_nome.Text) = '' then
  begin
    MessageDlg('O CAMPO NOME NÃO PODE FICAR VAZIO!', TMsgDlgType.mtWarning,
      [TMsgDlgBtn.mbOK], 0);
    Dedt_nome.SetFocus;

  end
  else if Trim(Dedt_salario.Text) = '' then
  begin
    MessageDlg('O CAMPO SALÁRIO NÃO PODE FICAR VAZIO!', TMsgDlgType.mtWarning,
      [TMsgDlgBtn.mbOK], 0);
    Dedt_salario.SetFocus;
  end
  else if dm_funcionarios.tbl_funcionarios.State in [dsInsert, dsEdit] then
  begin
    foiInclusao := dm_funcionarios.tbl_funcionarios.State = dsInsert;
    dm_funcionarios.tbl_funcionarios.Post;
    dm_funcionarios.tsc_funcionarios.StartTransaction;
    dm_funcionarios.tsc_funcionarios.CommitRetaining;
    if foiInclusao then
    begin
      MessageDlg('FUNCIONÁRIO INCLUÍDO COM SUCESSO.',
        TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);
      Dbdt_datanascimento.Clear;
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
      img_salvar.Enabled := False;
      dm_funcionarios.tbl_funcionarios.Close;
      dm_funcionarios.tbl_funcionarios.Open;
      calcula_total_grid;
      pnl_altera_funcionario.Enabled := False;
    end
    else
    begin
      MessageDlg('FUNCIONÁRIO ALTERADO COM SUCESSO.',
        TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);
    end;
    calcula_total_grid;
    img_incluir.Enabled := True;
    img_alterar.Enabled := True;
    img_excluir.Enabled := True;
    pnl_altera_funcionario.Enabled := False;
  end;
end;

procedure Tmenu_funcionarios.rbtn_cargoClick(Sender: TObject);
begin
  if rbtn_cargo.Checked then
  edt_consulta.Visible := False;
  dtp_inicial.Visible := False;
  dtp_final.Visible := False;
  lbl_dtinicial.Visible := False;
  lbl_dtfinal.Visible := False;
  cbx_consulta.Visible := True;
end;

procedure Tmenu_funcionarios.rbtn_datanascimentoClick(Sender: TObject);
begin
  if rbtn_datanascimento.Checked then
  begin
    edt_consulta.Visible := False;
    dtp_inicial.Visible := True;
    dtp_final.Visible := True;
    lbl_dtinicial.Visible := True;
    lbl_dtfinal.Visible := True;
    cbx_consulta.Visible := False;
  end
end;

procedure Tmenu_funcionarios.rbtn_nomeClick(Sender: TObject);
begin
  if rbtn_nome.Checked then
  edt_consulta.Visible := True;
  dtp_inicial.Visible := False;
  dtp_final.Visible := False;
  lbl_dtinicial.Visible := False;
  lbl_dtfinal.Visible := False;
  cbx_consulta.Visible := False;
end;

procedure Tmenu_funcionarios.sbtn_consultarClick(Sender: TObject);
begin
  if rbtn_nome.Checked then
  begin
    dm_funcionarios.tbl_funcionarios.Close;
    dm_funcionarios.tbl_funcionarios.Filter := 'FUN_NOME LIKE ' +
      QuotedStr('%' + edt_consulta.Text + '%');
    dm_funcionarios.tbl_funcionarios.Filtered := True;
    dm_funcionarios.tbl_funcionarios.Open;
    calcula_total_grid;
  end;

if rbtn_cargo.Checked then
begin
  if cbx_consulta.Text = '' then
  begin
    MessageDlg('SELECIONE UM CARGO PARA CONSULTAR!',TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK],0);
    cbx_consulta.SetFocus;
    Exit;
  end;

  dm_funcionarios.tbl_funcionarios.Close;
  dm_funcionarios.tbl_funcionarios.Open;
  dm_funcionarios.tbl_funcionarios.Filtered := False;
  dm_funcionarios.tbl_funcionarios.Filter := 'FUN_CARGO = ' + QuotedStr(cbx_consulta.Text);
  dm_funcionarios.tbl_funcionarios.Filtered := True;
  calcula_total_grid;
end;

  if rbtn_datanascimento.Checked then
  begin

    dm_funcionarios.tbl_funcionarios.Filter := 'FUN_DATANASCIMENTO >= ''' +
      DateToStr(dtp_inicial.Date) + ''' AND ' + 'FUN_DATANASCIMENTO <= ''' +
      DateToStr(dtp_final.Date) + '''';

    dm_funcionarios.tbl_funcionarios.Filtered := True;
    calcula_total_grid;
  end;
end;

end.
