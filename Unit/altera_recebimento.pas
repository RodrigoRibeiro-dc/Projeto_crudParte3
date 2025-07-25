unit altera_recebimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Recebimento, Vcl.ComCtrls, Vcl.Mask, Vcl.NumberBox;

type
  TAltera_rec = class(TForm)
    lbl_valor: TLabel;
    lbl_descricao: TLabel;
    edt_descricao: TEdit;
    lbl_datalanc_pagamento: TLabel;
    btn_confirma_alt_rec: TButton;
    btn_cancelar_alt_rec: TButton;
    lbl_tipo: TLabel;
    dtp_data: TDateTimePicker;
    nbx_valor: TNumberBox;
    cbx_tipo: TComboBox;
    procedure btn_confirma_alt_recClick(Sender: TObject);
    procedure btn_cancelar_alt_recClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Altera_rec: TAltera_rec;

implementation

uses
  campo_funcionario, crud_funcionario;

{$R *.dfm}

procedure TAltera_rec.btn_cancelar_alt_recClick(Sender: TObject);
begin
  Close;
end;

procedure TAltera_rec.btn_confirma_alt_recClick(Sender: TObject);
var
  Recebimento: TRecebimentos;
begin
  Recebimento := TRecebimentos.Create;

  try
    if not cadastro_funcionario.dts_recebimento.DataSet.IsEmpty then
    begin
      if Trim(edt_descricao.text) = '' then
      begin
        MessageDlg('DESCRIÇÃO NÃO PODE FICAR VAZIO.', mtWarning, [mbOk], 0);
        edt_descricao.SetFocus;
        abort;
      end
      else
        Recebimento.descricao := edt_descricao.text;

      if nbx_valor.Value <= 0 then
      begin
        MessageDlg('INFORME UM VALOR MAIOR QUE 0,00.', mtWarning, [mbOk], 0);
        nbx_valor.SetFocus;
        abort;
      end;

      Recebimento.valor := nbx_valor.Value;
      Recebimento.tipo := cbx_tipo.text;
      Recebimento.data := dtp_data.Date;

      Recebimento.Alterar(Recebimento);
      Recebimento.ConsultaGrid(Recebimento);
      Close;
      cadastro_funcionario.Totais_recebimentos();
    end;
  finally
    Recebimento.Free;
  end;
end;

procedure TAltera_rec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TAltera_rec.FormShow(Sender: TObject);
var
  Recebimento: TRecebimentos;
begin
  Recebimento := TRecebimentos.Create;
  try
    if not menu_funcionarios.fdq_recebimento.IsEmpty then
    begin
      edt_descricao.text := menu_funcionarios.fdq_recebimento.FieldByName
        ('REC_DESCRICAO').AsString;
      nbx_valor.text := menu_funcionarios.fdq_recebimento.FieldByName
        ('REC_VALOR').AsString;
      cbx_tipo.ItemIndex := cbx_tipo.Items.IndexOf
        (menu_funcionarios.fdq_recebimento.FieldByName('REC_TIPO').AsString);
      dtp_data.Date := menu_funcionarios.fdq_recebimento.FieldByName('REC_DATA')
        .AsDateTime;
    end;
  finally
    Recebimento.Free;
  end;
end;

end.
