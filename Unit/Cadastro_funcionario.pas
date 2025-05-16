unit Cadastro_funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.Mask;

type
  Tfrm_cad_funcionario = class(TForm)
    lbl_nome: TLabel;
    lbl_salario: TLabel;
    lbl_rua: TLabel;
    lbl_bairro: TLabel;
    lbl_numero: TLabel;
    lbl_cep: TLabel;
    lbl_complemento: TLabel;
    lbl_cidade: TLabel;
    cbx_cargo: TComboBox;
    lbl_cargo: TLabel;
    edt_nome: TEdit;
    edt_rua: TEdit;
    edt_bairro: TEdit;
    edt_complemento: TEdit;
    edt_numero: TEdit;
    edt_cidade: TEdit;
    edt_salario: TEdit;
    btn_cancelar: TButton;
    btn_gravar: TButton;
    dtp_data: TDateTimePicker;
    lbl_data_nascimento: TLabel;
    msk_edit_cep: TMaskEdit;
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure edt_salarioKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_funcionario: Tfrm_cad_funcionario;

implementation

{$R *.dfm}

uses conexao_banco_dados;

procedure Tfrm_cad_funcionario.btn_cancelarClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cad_funcionario.btn_gravarClick(Sender: TObject);
begin
  if edt_nome.Text = '' then
    begin
      MessageBox(0, 'NOME NÃO PODE FICAR VAZIO', 'ALERTA', MB_ICONINFORMATION);
      edt_nome.Focused;
    end
  else if edt_salario.Text = '' then
    begin
       MessageBox(0, 'SALARIO NAO PODE FICAR VAZIO','ALERTA', MB_ICONINFORMATION);
       edt_salario.Focused;
    end
  else
  begin
    with Conexao_db.stp_insere_funcionario do
    begin
      ParamByName('@NOME').Value := edt_nome.Text;
      ParamByName('@DATA_NASCIMENTO').Value := dtp_data.DateTime;
      ParamByName('@RUA').Value := edt_rua.Text;
      ParamByName('@NUMERO').Value := edt_numero.Text;
      ParamByName('@BAIRRO').Value := edt_bairro.Text;
      ParamByName('@CIDADE').Value := edt_cidade.Text;
      ParamByName('@COMPLEMENTO').Value := edt_complemento.Text;
      ParamByName('@CEP').Value := msk_edit_cep.Text;
      ParamByName('@CARGO').Value := cbx_cargo.Text;
      ParamByName('@SALARIO').Value := edt_salario.Text;
      ExecProc;
      MessageBox(0, 'FUNCIONÁRIO CADASTRADO', 'CONFIRMAÇÃO', MB_ICONINFORMATION);;
      edt_nome.Clear;
      edt_rua.Clear;
      edt_numero.Clear;
      edt_bairro.Clear;
      edt_cidade.Clear;
      edt_complemento.Clear;
      msk_edit_cep.Clear;
      edt_salario.Clear;
    end;
  end;

end;
procedure Tfrm_cad_funcionario.edt_salarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', ',', '.', #8]) then
    Key := #0;
end;

end.

