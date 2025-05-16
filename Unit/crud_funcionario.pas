unit crud_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,Cadastro_funcionario,
  Vcl.ComCtrls;

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
    dbg_grid_consulta: TDBGrid;
    pnl_altera_funcionario: TPanel;
    lbl_nome: TLabel;
    lbl_salario: TLabel;
    lbl_rua: TLabel;
    lbl_bairro: TLabel;
    lbl_numero: TLabel;
    lbl_cep: TLabel;
    lbl_complemento: TLabel;
    lbl_cidade: TLabel;
    lbl_cargo: TLabel;
    lbl_data_nascimento: TLabel;
    cbx_cargo: TComboBox;
    edt_nome: TEdit;
    edt_rua: TEdit;
    edt_bairro: TEdit;
    edt_complemento: TEdit;
    edt_numero: TEdit;
    edt_cidade: TEdit;
    edt_salario_novo: TEdit;
    dtp_data: TDateTimePicker;
    pnl_somatorio: TPanel;
    lbl_total_funcionario: TLabel;
    lbl_total_salario: TLabel;
    lbl_count_funcionario: TLabel;
    lbl_sum_salario: TLabel;
    msk_edit_cep: TMaskEdit;
    procedure img_incluirClick(Sender: TObject);
    procedure btn_consultarClick(Sender: TObject);
    procedure img_alterarClick(Sender: TObject);
    procedure dbg_grid_consultaCellClick(Column: TColumn);
    procedure img_excluirClick(Sender: TObject);
    procedure lbl_count_funcionarioClick(Sender: TObject);
    procedure edt_salarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_salario_novoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  menu_funcionarios: Tmenu_funcionarios;

implementation

{$R *.dfm}

uses conexao_banco_dados;

procedure Tmenu_funcionarios.btn_consultarClick(Sender: TObject);
begin
  if edt_nome_consulta.Text <> '' then
  begin
    conexao_db.FDQuery1.SQL.Text :=
      'SELECT * FROM FUNCIONARIOS WHERE FUN_NOME LIKE :nome';
    conexao_db.FDQuery1.ParamByName('nome').AsString := '%' + edt_nome_consulta.Text + '%';
  end
  else
  begin
    conexao_db.FDQuery1.SQL.Text := 'SELECT * FROM FUNCIONARIOS';
  end;

  conexao_db.FDQuery1.Open;
  with conexao_db.FDQuery2 do
  begin
    Close;
    SQL.Text := 'SELECT COUNT(*) AS total_funcionarios, SUM(FUN_SALARIO) AS total_salarios FROM FUNCIONARIOS';
    Open;
    lbl_count_funcionario.Caption := FieldByName('total_funcionarios').AsString;
    lbl_sum_salario.Caption := FormatFloat('#,##0.00', FieldByName('total_salarios').AsFloat);
    Close;
  end;
end;


procedure Tmenu_funcionarios.dbg_grid_consultaCellClick(Column: TColumn);
begin
  edt_nome.Text := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_NOME').AsString;
  dtp_data.Date := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_DATANASCIMENTO').AsDateTime;
  edt_rua.Text := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_RUA').AsString;
  edt_numero.Text := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_NUMERO').AsString;
  edt_bairro.Text := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_BAIRRO').AsString;
  edt_cidade.Text := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_CIDADE').AsString;
  edt_complemento.Text := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_COMPLEMENTO').AsString;
  msk_edit_cep.Text := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_CEP').AsString;
  cbx_cargo.Text := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_CARGO').AsString;
  edt_salario_novo.Text := dbg_grid_consulta.DataSource.DataSet.FieldByName('FUN_SALARIO').AsString;
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

procedure Tmenu_funcionarios.img_alterarClick(Sender: TObject);
begin
 if edt_nome.Text = '' then
 begin
  MessageBox(0, 'SELECIONE UM FUNCIONÁRIO PARA ALTERAR', 'ALERTA', MB_ICONINFORMATION);
 end
 else
 Begin
  with Conexao_db.stp_alterar_funcionario do
  begin
    close;
    ParamByName('@ID').Value := dbg_grid_consulta.Fields[0].Value;
    ParamByName('@NOME').Value := menu_funcionarios.edt_nome.Text;
    ParamByName('@DATA_NASCIMENTO').Value := menu_funcionarios.dtp_data.DateTime;
    ParamByName('@RUA').Value := menu_funcionarios.edt_rua.Text;
    ParamByName('@NUMERO').Value := menu_funcionarios.edt_numero.Text;
    ParamByName('@BAIRRO').Value := menu_funcionarios.edt_bairro.Text;
    ParamByName('@CIDADE').Value := menu_funcionarios.edt_cidade.Text;
    ParamByName('@COMPLEMENTO').Value := menu_funcionarios.edt_complemento.Text;
    ParamByName('@CEP').Value := menu_funcionarios.msk_edit_cep.Text;
    ParamByName('@CARGO').Value := menu_funcionarios.cbx_cargo.Text;
    ParamByName('@SALARIO').Value := menu_funcionarios.edt_salario_novo.Text;
    ExecProc;
    MessageBox(0, 'FUNCIONÁRIO ALTERADO COM SUCESSO!', 'CONFIRMAÇÃO', MB_ICONINFORMATION);
    conexao_db.FDQuery1.Refresh;
  end;
 End;
end;

procedure Tmenu_funcionarios.img_excluirClick(Sender: TObject);
begin
  if menu_funcionarios.edt_nome.Text = '' then
    begin
      MessageBox(0, 'SELECIONE UM FUNCIONÁRIO PARA EXCLUSÃO!', 'ALERTA', MB_ICONINFORMATION);
    end
  else
    begin
      with Conexao_db.stp_excluir_funcionario do
        begin
          close;
          ParamByName('@ID').Value := dbg_grid_consulta.Fields[0].Value;
          ExecProc;
          MessageBox(0, 'FUNCIONÁRIO EXCLUIDO COM SUCESSO!', 'CONFIRMAÇÃO', MB_ICONINFORMATION);
          menu_funcionarios.edt_nome.Clear;
          menu_funcionarios.edt_rua.Clear;
          menu_funcionarios.edt_numero.Clear;
          menu_funcionarios.edt_bairro.Clear;
          menu_funcionarios.edt_cidade.Clear;
          menu_funcionarios.edt_complemento.Clear;
          menu_funcionarios.msk_edit_cep.Clear;
          menu_funcionarios.cbx_cargo.Clear;
          menu_funcionarios.edt_salario_novo.Clear;
          Conexao_db.FDQuery1.Refresh;
      end;
    end;
end;

procedure Tmenu_funcionarios.img_incluirClick(Sender: TObject);

begin
  var
  frm_cad_funcionario: Tfrm_cad_funcionario;
  frm_cad_funcionario := Tfrm_cad_funcionario.Create(Self);
  frm_cad_funcionario.ShowModal;
end;
procedure Tmenu_funcionarios.lbl_count_funcionarioClick(Sender: TObject);
begin
    //lbl_count_funcionario.Caption:= Conexao_db.FDQuery1.SQL.Text :=
    // 'SELECT COUNT(*) FROM FUNCIONARIOS'
end;

end.
