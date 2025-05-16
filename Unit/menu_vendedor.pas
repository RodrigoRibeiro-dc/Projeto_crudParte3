unit menu_vendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Imaging.pngimage, cadastro_vendedor;

type
  Tcad_vendedor = class(TForm)
    rdi_nome: TRadioButton;
    rdicpf: TRadioButton;
    edtpesquisa: TEdit;
    btnconsultar: TButton;
    rdicodigo: TRadioButton;
    pnldivisor: TPanel;
    imgnovo: TImage;
    imgalterar: TImage;
    imgexcluir: TImage;
    imgrelatorio: TImage;
    lblnovo: TLabel;
    lblalterar: TLabel;
    lblexcluir: TLabel;
    lblrelatorio: TLabel;
    pnlmeio: TPanel;
    pnlinicio: TPanel;
    procedure imgnovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cad_vendedor: Tcad_vendedor;

implementation

{$R *.dfm}

procedure Tcad_vendedor.imgnovoClick(Sender: TObject);
begin
   form_cad_vendedor := Tform_cad_vendedor.Create(Self);
   form_cad_vendedor.show;
end;

end.
