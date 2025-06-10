unit Recebimento;

interface

type
  TRecebimentos = class
    Fid: integer;
    Fdescricao: String;
    Fvalor: Currency;
    Fdata : String;
    Ftipo : String;
    Fid_funcionario: Integer;
    private

    public
      property id: Integer read Fid write Fid;
      property descricao: String read Fdescricao write Fdescricao;
      property valor: Currency read Fvalor write Fvalor;
      property data: String read Fdata write Fdata;
      property tipo: String read Ftipo write Ftipo;
      property id_funcionario: Integer read Fid_funcionario write Fid_funcionario;
  end;

implementation

end.
