unit uServicoFarmaceutico;

interface

type
  TServicoFarmaceutico = class
  private
    FID: Integer;
    FDataServico: TDate;
    FObservacao: String;
    FValorTotal: Double;
    FIDFarmaceutico: Integer;
    FIDPaciente: Integer;
  public
    property ID: Integer read FID write FID;
    property DataServico: TDate read FDataServico write FDataServico;
    property Observacao: String read FObservacao write FObservacao;
    property ValorTotal: Double read FValorTotal write FValorTotal;
    property IDFarmaceutico: Integer read FIDFarmaceutico write FIDFarmaceutico;
    property IDPaciente: Integer read FIDPaciente write FIDPaciente;

    procedure LimparCampos;
  end;

implementation

uses
  System.SysUtils;

{ TServicoFarmaceutico }

procedure TServicoFarmaceutico.LimparCampos;
begin
  FID := 0;
  FDataServico := 0;
  FObservacao := EmptyStr;
  FValorTotal := 0;
  FIDFarmaceutico := 0;
  FIDPaciente := 0;
end;

end.
