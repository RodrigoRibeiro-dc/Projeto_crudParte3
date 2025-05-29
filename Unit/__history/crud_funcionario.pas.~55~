unit crud_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Menus, System.UITypes, Vcl.Buttons;

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
    edt_consulta: TEdit;
    dtp_inicial: TDateTimePicker;
    dtp_final: TDateTimePicker;
    lbl_dtinicial: TLabel;
    lbl_dtfinal: TLabel;
    cbx_consulta: TComboBox;
    Dedt_datanascimento: TDBEdit;
    rdg_tipoconsulta: TRadioGroup;
    sbtn_cancelar: TSpeedButton;
    procedure img_incluirClick(Sender: TObject);
    procedure img_salvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure img_alterarClick(Sender: TObject);
    procedure img_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edt_consultaKeyPress(Sender: TObject; var Key: Char);
    procedure sbtn_consultarClick(Sender: TObject);
    procedure rdg_tipoconsultaClick(Sender: TObject);
    Procedure limpa_campos;
    procedure sbtn_cancelarClick(Sender: TObject);
  private
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

  if dm_funcionarios.fdq_funcionarios.Active and
    not dm_funcionarios.fdq_funcionarios.IsEmpty then
  begin
    dm_funcionarios.fdq_funcionarios.First;
    while not dm_funcionarios.fdq_funcionarios.Eof do
    begin
      Inc(totalFuncionarios);
      totalSalario := totalSalario + dm_funcionarios.fdq_funcionarios.
        FieldByName('FUN_SALARIO').AsCurrency;
      dm_funcionarios.fdq_funcionarios.Next;
    end;
  end;

  menu_funcionarios.dbtxt_totalfuncionarios.Caption :=
    totalFuncionarios.ToString;
  menu_funcionarios.dbtxt_totalsalario.Caption := totalSalario.ToString();
end;

procedure Tmenu_funcionarios.limpa_campos;
begin
  Dedt_datanascimento.Clear;
  Dedt_nome.Clear;
  Dedt_rua.Clear;
  Dedt_numero.Clear;
  Dedt_bairro.Clear;
  Dedt_cidade.Clear;
  Dedt_complemento.Clear;
  Dedt_cep.Clear;
  cbx_cargo.ItemIndex := -1;
  Dedt_salario.Clear;
end;

procedure Tmenu_funcionarios.edt_consultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tmenu_funcionarios.FormActivate(Sender: TObject);
begin
  pnl_altera_funcionario.Enabled := False;
  dm_funcionarios.fdq_funcionarios.Open;
  calcula_total_grid;

  if Trim(Dedt_nome.Text) = '' then
    img_salvar.Enabled := True
  else
    img_salvar.Enabled := False;

  if dm_funcionarios.fdq_funcionarios.IsEmpty then
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
  if not(ActiveControl is TCustomEdit) then
  begin
    case Key of
      VK_F2:
        img_incluirClick(Sender);

      VK_F3:
        img_alterarClick(Sender);

      VK_F4:
        img_excluirClick(Sender);
    end;
  end;
end;

procedure Tmenu_funcionarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if (ActiveControl = cbx_cargo) then
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
  cbx_consulta.Items.Clear;

  cbx_consulta.Items.Add('PROGRAMADOR');
  cbx_consulta.Items.Add('IMPLANTAÇÃO');
  cbx_consulta.Items.Add('SUPORTE');
  cbx_consulta.Items.Add('VENDEDOR');
  cbx_consulta.Items.Add('FINANCEIRO');
  cbx_consulta.Items.Add('CS');
  cbx_consulta.Items.Add('TODOS');

  cbx_consulta.Style := csDropDownList;
end;

procedure Tmenu_funcionarios.img_alterarClick(Sender: TObject);
begin
  pnl_altera_funcionario.Enabled := True;
  img_salvar.Enabled := True;
  img_incluir.Enabled := False;
  img_excluir.Enabled := False;
  img_alterar.Enabled := False;
  sbtn_cancelar.Enabled := True;

  dm_funcionarios.fdq_funcionarios.Open();
  dm_funcionarios.fdq_funcionarios.Edit;
  Dedt_nome.SetFocus;
end;

procedure Tmenu_funcionarios.img_excluirClick(Sender: TObject);
begin
  dm_funcionarios.fdq_funcionarios.Delete;
  dm_funcionarios.tsc_funcionarios.StartTransaction;

  MessageDlg('FUNCIONÁRIO EXCLUÍDO COM SUCESSO.', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbOK], 0);

  pnl_altera_funcionario.Enabled := False;
  dm_funcionarios.fdq_funcionarios.Refresh;
  calcula_total_grid;

  if dm_funcionarios.fdq_funcionarios.IsEmpty then
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
  Dedt_datanascimento.SetFocus;
  limpa_campos;
  dm_funcionarios.fdq_funcionarios.Append;

  img_salvar.Enabled := True;
  img_incluir.Enabled := False;
  img_alterar.Enabled := False;
  img_excluir.Enabled := False;
  sbtn_cancelar.Enabled := True;
end;

procedure Tmenu_funcionarios.img_salvarClick(Sender: TObject);
var
  foiInclusao: Boolean;
  Valor_data: TDateTime;
begin

  if dm_funcionarios.fdq_funcionarios.State in [dsInsert, dsEdit] then
  begin
    foiInclusao := dm_funcionarios.fdq_funcionarios.State = dsInsert;

    if dm_funcionarios.fdq_funcionarios.FieldByName('FUN_DATANASCIMENTO').IsNull
    then
    begin
      MessageDlg('A DATA DE NASCIMENTO NÃO PODE FICAR VAZIO!',
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);

      Dedt_datanascimento.SetFocus;
      exit;
    end
    else if (Trim(Dedt_datanascimento.Text) = '') or
      (not TryStrToDate(Dedt_datanascimento.Text, Valor_data)) or
      (Valor_data < StrToDate('01/01/1800')) or
      (Valor_data > StrToDate('01/01/3000')) then
    begin
      MessageDlg('INFORME UMA DATA VÁLIDA', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbOK], 0);

      Dedt_datanascimento.SetFocus;
      exit;
    end;

    if Trim(Dedt_nome.Text) = '' then
    begin
      MessageDlg('O CAMPO NOME NÃO PODE FICAR VAZIO!', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbOK], 0);

      Dedt_nome.SetFocus;
      exit;
    end;

    if Trim(Dedt_salario.Text) = '' then
    begin
      MessageDlg('O CAMPO SALÁRIO NÃO PODE FICAR VAZIO!', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbOK], 0);

      Dedt_salario.SetFocus;
      exit
    end;

    if Trim(cbx_cargo.Text) = '' then
    begin
      MessageDlg('O CAMPO CARGO NÃO PODE FICAR VAZIO!', TMsgDlgType.mtWarning,
        [TMsgDlgBtn.mbOK], 0);

      cbx_cargo.SetFocus;
      exit
    end;

    dm_funcionarios.fdq_funcionarios.Post;
    dm_funcionarios.tsc_funcionarios.StartTransaction;
    dm_funcionarios.tsc_funcionarios.CommitRetaining;

    if foiInclusao then
    begin
      MessageDlg('FUNCIONÁRIO INCLUÍDO COM SUCESSO.',
        TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);

      img_incluir.Enabled := True;
      img_alterar.Enabled := True;
      img_excluir.Enabled := True;
      img_salvar.Enabled := False;
      pnl_altera_funcionario.Enabled := False;
      calcula_total_grid;
    end
    else
    begin
      dm_funcionarios.fdq_funcionarios.Refresh;
      MessageDlg('FUNCIONÁRIO ALTERADO COM SUCESSO.',
        TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);
    end;

    img_incluir.Enabled := True;
    img_alterar.Enabled := True;
    img_excluir.Enabled := True;
    sbtn_cancelar.Enabled := False;
    pnl_altera_funcionario.Enabled := False;
    calcula_total_grid;
  end;
end;

procedure Tmenu_funcionarios.rdg_tipoconsultaClick(Sender: TObject);
begin
  case rdg_tipoconsulta.ItemIndex of
    0:
      begin
        edt_consulta.Visible := True;
        dtp_inicial.Visible := False;
        dtp_final.Visible := False;
        lbl_dtinicial.Visible := False;
        lbl_dtfinal.Visible := False;
        cbx_consulta.Visible := False;
      end;
    1:
      begin
        edt_consulta.Visible := False;
        dtp_inicial.Visible := True;
        dtp_final.Visible := True;
        lbl_dtinicial.Visible := True;
        lbl_dtfinal.Visible := True;
        cbx_consulta.Visible := False;
      end;
    2:
      begin
        edt_consulta.Visible := False;
        dtp_inicial.Visible := False;
        dtp_final.Visible := False;
        lbl_dtinicial.Visible := False;
        lbl_dtfinal.Visible := False;
        cbx_consulta.Visible := True;
      end;
  end;
end;

procedure Tmenu_funcionarios.sbtn_cancelarClick(Sender: TObject);
begin
  if dm_funcionarios.fdq_funcionarios.State in [dsInsert, dsEdit] then
  begin
    dm_funcionarios.fdq_funcionarios.Cancel;

    img_incluir.Enabled := True;
    img_alterar.Enabled := True;
    img_excluir.Enabled := True;
    img_salvar.Enabled := False;
    sbtn_cancelar.Enabled := False;
    pnl_altera_funcionario.Enabled := False;
  end;
end;

procedure Tmenu_funcionarios.sbtn_consultarClick(Sender: TObject);
begin
  case rdg_tipoconsulta.ItemIndex of
    0:
      begin
        dm_funcionarios.fdq_funcionarios.Close;
        dm_funcionarios.fdq_funcionarios.SQL.Text :=
          'SELECT * FROM FUNCIONARIOS WHERE FUN_NOME LIKE :NOME';
        dm_funcionarios.fdq_funcionarios.ParamByName('NOME').AsString :=
          '%' + edt_consulta.Text + '%';
        dm_funcionarios.fdq_funcionarios.Open;
        calcula_total_grid;
      end;

    1:
      begin
        if dtp_inicial.DateTime > dtp_final.DateTime then
        begin
          MessageDlg('A DATA FINAL DEVE SER MAIOR QUE A INICIAL!',
            TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);

          dtp_final.SetFocus;
        end
        else
        begin
          dm_funcionarios.fdq_funcionarios.Close;
          dm_funcionarios.fdq_funcionarios.SQL.Text :=
            'SELECT *FROM FUNCIONARIOS WHERE FUN_DATANASCIMENTO BETWEEN ' +
            ':DATA_INICIAL AND :DATA_FINAL';
          dm_funcionarios.fdq_funcionarios.ParamByName('DATA_INICIAL').AsDate :=
            dtp_inicial.Date;
          dm_funcionarios.fdq_funcionarios.ParamByName('DATA_FINAL').AsDate :=
            dtp_final.Date;
          dm_funcionarios.fdq_funcionarios.Open;
          calcula_total_grid;
        end;
      end;

    2:
      begin
        if cbx_consulta.Text = '' then
        begin
          MessageDlg('SELECIONE UM CARGO PARA CONSULTAR!',
            TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);

          cbx_consulta.SetFocus;
        end;

        if Trim(cbx_consulta.Text) = 'TODOS' then
        begin
          dm_funcionarios.fdq_funcionarios.Close;
          dm_funcionarios.fdq_funcionarios.SQL.Text :=
            'SELECT *FROM FUNCIONARIOS';
          dm_funcionarios.fdq_funcionarios.Open;
          calcula_total_grid;
        end
        else
        begin
          dm_funcionarios.fdq_funcionarios.Close;
          dm_funcionarios.fdq_funcionarios.SQL.Text :=
            'SELECT *FROM FUNCIONARIOS WHERE FUN_CARGO = :CARGO';
          dm_funcionarios.fdq_funcionarios.ParamByName('CARGO').AsString :=
            cbx_consulta.Text;
          dm_funcionarios.fdq_funcionarios.Open;
          calcula_total_grid;
        end;
      end;
  end;
end;

end.
