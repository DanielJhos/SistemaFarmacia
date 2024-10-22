unit uFarmaceutico;

interface

type
  TFarmaceutico = class
  private
    FID: Integer;
    FNome: String;
    FCRF: String;
    FDataRegistro: TDate;
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write FNome;
    property CRF: String read FCRF write FCRF;
    property DataRegistro: TDate read FDataRegistro write FDataRegistro;
    procedure LimparCampos;
  end;

implementation

uses
  System.SysUtils;

{ TFarmaceutico }

procedure TFarmaceutico.LimparCampos;
begin
  FID := 0;
  FNome := EmptyStr;
  FCRF := EmptyStr;
  FDataRegistro := 0;
end;

end.
