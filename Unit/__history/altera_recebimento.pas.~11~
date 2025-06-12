unit altera_recebimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, crudRecebimento,
  Recebimento;

type
  TAltera_rec = class(TForm)
    edt_valor: TEdit;
    lbl_valor: TLabel;
    lbl_descricao: TLabel;
    edt_descricao: TEdit;
    lbl_datalanc_pagamento: TLabel;
    edt_data: TEdit;
    cbx_tipo: TComboBox;
    btn_confirma_alt_rec: TButton;
    btn_cancelar_alt_rec: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_confirma_alt_recClick(Sender: TObject);
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

procedure TAltera_rec.btn_confirma_alt_recClick(Sender: TObject);
var
  crud_rec : TcrudRecebimento;
  recebimento: TRecebimentos;
  recebeId: Integer;
begin
  crud_rec := TcrudRecebimento.Create;
  recebimento := TRecebimentos.Create;

  try
  if not cadastro_funcionario.dts_recebimento.DataSet.IsEmpty then

    recebimento.descricao := edt_descricao.Text;
    recebimento.valor := StrToCurr(edt_valor.Text);
    recebimento.tipo := cbx_tipo.Text;
    recebimento.data := edt_data.Text;
    recebeId := menu_funcionarios.fdq_recebimentoREC_ID.Value;

    crud_rec.Alterar(recebimento);
  finally
    crud_rec.Free;
    recebimento.Free;
  end;

end;

procedure TAltera_rec.FormCreate(Sender: TObject);
var
  crud_rec: TcrudRecebimento;
  recebimento: TRecebimentos;
begin
  crud_rec := TcrudRecebimento.Create;
  recebimento:= TRecebimentos.Create;
  try
      if not menu_funcionarios.fdq_recebimento.IsEmpty then
      begin
        edt_descricao.Text:= menu_funcionarios.fdq_recebimento.FieldByName
          ('REC_DESCRICAO').AsString;
        edt_valor.Text := menu_funcionarios.fdq_recebimento.FieldByName
          ('REC_VALOR').AsString;
        cbx_tipo.Text := menu_funcionarios.fdq_recebimento.FieldByName
          ('REC_TIPO').AsString;
        edt_data.Text := menu_funcionarios.fdq_recebimento.FieldByName
          ('REC_DATA').AsString;
      end;
  finally
  crud_rec.Free;
  recebimento.Free;
  end;

end;

end.
