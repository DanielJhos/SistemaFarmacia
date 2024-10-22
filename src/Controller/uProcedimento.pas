unit uProcedimento;

interface

type
  TTipoProcedimento = (
    tpNenhum,
    tpAtencaoFarmaceuticaDomiciliar,
    tpAfericaoPressaoArterial,
    tpAfericaoTemperaturaCorporal,
    tpAfericaoGlicemiaCapilar,
    tpAdministracaoMedicamentosInalacao,
    tpAdministracaoMedicamentosAplicacaoInjetaveis
  );

  TProcedimento = class
  private
    FTipo: TTipoProcedimento;
    FDescricao: String;
    FValorUnitario: Double;
  public
    property Tipo: TTipoProcedimento read FTipo write FTipo;
    property Descricao: String read FDescricao write FDescricao;
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;

    procedure LimparCampos;
  end;

implementation

uses
  System.SysUtils;

{ TProcedimento }

procedure TProcedimento.LimparCampos;
begin
  FTipo := TTipoProcedimento.tpNenhum;
  FDescricao := EmptyStr;
  FValorUnitario := 0;
end;

end.
