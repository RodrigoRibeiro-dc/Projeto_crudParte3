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
    lbl_txttotal_funcionario: TLabel;
    lbl_txt_totalsalario: TLabel;
    lbl_totalsalario: TLabel;
    lbl_totalfuncionario: TLabel;
    procedure img_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdg_tipoconsultaClick(Sender: TObject);
    procedure sbtn_consultarClick(Sender: TObject);
    procedure img_incluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure img_alterarClick(Sender: TObject);
    procedure calcula_total_grid;
    procedure FormCreate(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  menu_funcionarios: Tmenu_funcionarios;

implementation

{$R *.dfm}

uses campo_funcionario;

procedure Tmenu_funcionarios.calcula_total_grid;
var
  total_salario: currency;
begin
  lbl_totalfuncionario.Caption := IntToStr(fdq_funcionarios.RecordCount);

  total_salario := 0.0;
  fdq_funcionarios.First;

  while not fdq_funcionarios.eof do
  begin
    total_salario := total_salario + fdq_funcionarios.FieldByName('FUN_SALARIO')
      .AsCurrency;
    fdq_funcionarios.Next;
  end;

  lbl_totalsalario.Caption := total_salario.ToString;
end;

procedure Tmenu_funcionarios.FormCreate(Sender: TObject);
begin
  ctn_conexao.Params.UserName := 'sa';
  ctn_conexao.Params.Password := 'aram98';
  ctn_conexao.Params.Database := 'PROJETO_CRUD';

  calcula_total_grid;
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
  fdq_funcionarios.Edit;
  cadastro_funcionario.ShowModal;
end;

procedure Tmenu_funcionarios.img_excluirClick(Sender: TObject);
var
  resposta_excluir: integer;
begin
  resposta_excluir := MessageDlg('DESEJA REALMENTE EXCLUIR O FUNCIONÁRIO?',
    mtConfirmation, [mbYes, mbNo], 0);
  if resposta_excluir = mrYes then
  begin
    fdq_funcionarios.Delete;

    MessageDlg('FUNCIONÁRIO EXCLUÍDO COM SUCESSO.', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbOK], 0);
    calcula_total_grid;
  end;
end;

procedure Tmenu_funcionarios.img_incluirClick(Sender: TObject);
begin
  fdq_funcionarios.Append;
  cadastro_funcionario.ShowModal;
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
        calcula_total_grid;
      end;

    1:
      begin
        if dtp_inicial.DateTime > dtp_final.DateTime then
        begin
          MessageDlg('A DATA FINAL DEVE SER MAIOR QUE A INICIAL.',
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
          fdq_funcionarios.ParamByName('DATA_FINAL').AsDate := dtp_final.Date;
          fdq_funcionarios.Open;
          calcula_total_grid;
        end;
      end;

    2:
      begin
        if cbx_consulta.Text = '' then
        begin
          MessageDlg('SELECIONE UM CARGO PARA CONSULTAR.',
            TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);

          cbx_consulta.SetFocus;
        end;

        if Trim(cbx_consulta.Text) = 'TODOS' then
        begin
          fdq_funcionarios.Close;
          fdq_funcionarios.SQL.Text := 'SELECT *FROM FUNCIONARIOS';
          fdq_funcionarios.Open;
        end
        else
        begin
          fdq_funcionarios.Close;
          fdq_funcionarios.SQL.Text :=
            'SELECT *FROM FUNCIONARIOS WHERE FUN_CARGO = :CARGO';
          fdq_funcionarios.ParamByName('CARGO').AsString := cbx_consulta.Text;
          fdq_funcionarios.Open;
          calcula_total_grid;
        end;
      end
  end;
end;

end.
