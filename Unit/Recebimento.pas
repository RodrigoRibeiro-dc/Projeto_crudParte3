unit Recebimento;

interface

type
  TRecebimentos = class
    Fid_recebimento: integer;
    Fdescricao: String;
    Fvalor: Currency;
    Fdata : String;
    Ftipo : String;
    private

    public
      property id_recebimento: Integer read Fid_recebimento write Fid_recebimento;
      property descricao: String read Fdescricao write Fdescricao;
      property valor: Currency read Fvalor write Fvalor;
      property data: String read Fdata write Fdata;
      property tipo: String read Ftipo write Ftipo;
  end;

implementation

end.
