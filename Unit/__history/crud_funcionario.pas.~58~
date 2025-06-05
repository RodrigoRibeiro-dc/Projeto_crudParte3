unit crud_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Menus, System.UITypes, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    dbg_funcionarios: TDBGrid;
    pnl_consulta: TPanel;
    sbtn_consultar: TSpeedButton;
    lbl_dtinicial: TLabel;
    lbl_dtfinal: TLabel;
    edt_consulta: TEdit;
    dtp_inicial: TDateTimePicker;
    dtp_final: TDateTimePicker;
    cbx_consulta: TComboBox;
    rdg_tipoconsulta: TRadioGroup;
    ctn_conexao: TFDConnection;
    tsc_funcionarios: TFDTransaction;
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
    fdq_total: TFDQuery;
    fdq_consulta: TFDQuery;
    dts_funcionarionovo: TDataSource;
    procedure img_salvarClick(Sender: TObject);
    procedure img_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_consultaKeyPress(Sender: TObject; var Key: Char);
    procedure rdg_tipoconsultaClick(Sender: TObject);
    procedure sbtn_cancelarClick(Sender: TObject);
    procedure sbtn_consultarClick(Sender: TObject);
    procedure img_incluirClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  menu_funcionarios: Tmenu_funcionarios;

implementation

{$R *.dfm}

uses campo_funcionario;


procedure Tmenu_funcionarios.edt_consultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

{procedure Tmenu_funcionarios.FormKeyDown(Sender: TObject; var Key: Word;
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
end;   }

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

procedure Tmenu_funcionarios.img_excluirClick(Sender: TObject);
begin
  fdq_funcionarios.Delete;

  MessageDlg('FUNCIONÁRIO EXCLUÍDO COM SUCESSO.', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbOK], 0);
end;

procedure Tmenu_funcionarios.img_incluirClick(Sender: TObject);
begin
fdq_funcionarios.Append;
cadastro_funcionario.ShowModal;
end;

procedure Tmenu_funcionarios.img_salvarClick(Sender: TObject);
{var
  foiInclusao: Boolean;
  Valor_data: TDateTime; }
begin

  {if dm_funcionarios.fdq_funcionarios.State in [dsInsert, dsEdit] then
  begin
    foiInclusao := dm_funcionarios.fdq_funcionarios.State = dsInsert;

    if dm_funcionarios.fdq_funcionarios.FieldByName('FUN_DATANASCIMENTO').IsNull
    then
    begin
      MessageDlg('A DATA DE NASCIMENTO NÃO PODE FICAR VAZIO!',
        TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);

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


    end
    else
    begin
      dm_funcionarios.fdq_funcionarios.Refresh;
      MessageDlg('FUNCIONÁRIO ALTERADO COM SUCESSO.',
        TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbOK], 0);
    end;

  end; }
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
  {if dm_funcionarios.fdq_funcionarios.State in [dsInsert, dsEdit] then
  begin
    dm_funcionarios.fdq_funcionarios.Cancel;
  end;}
end;

procedure Tmenu_funcionarios.sbtn_consultarClick(Sender: TObject);
begin
  case rdg_tipoconsulta.ItemIndex of
    0:
      begin
        fdq_funcionarios.Close;
        fdq_funcionarios.SQL.Text :=
          'SELECT * FROM FUNCIONARIOS WHERE FUN_NOME LIKE :NOME';
        fdq_funcionarios.ParamByName('NOME').AsString :=
          '%' + edt_consulta.Text + '%';
        fdq_funcionarios.Open;
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
          fdq_funcionarios.Close;
          fdq_funcionarios.SQL.Text :=
            'SELECT *FROM FUNCIONARIOS WHERE FUN_DATANASCIMENTO BETWEEN ' +
            ':DATA_INICIAL AND :DATA_FINAL';
          fdq_funcionarios.ParamByName('DATA_INICIAL').AsDate :=
            dtp_inicial.Date;
          fdq_funcionarios.ParamByName('DATA_FINAL').AsDate :=
            dtp_final.Date;
          fdq_funcionarios.Open;
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
          fdq_funcionarios.Close;
          fdq_funcionarios.SQL.Text :=
            'SELECT *FROM FUNCIONARIOS';
          fdq_funcionarios.Open;
        end
        else
        begin
          fdq_funcionarios.Close;
          fdq_funcionarios.SQL.Text :=
            'SELECT *FROM FUNCIONARIOS WHERE FUN_CARGO = :CARGO';
          fdq_funcionarios.ParamByName('CARGO').AsString :=
            cbx_consulta.Text;
          fdq_funcionarios.Open;
        end;
      end
  end;
end;
end.
