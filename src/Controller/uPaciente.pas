unit uPaciente;

interface

type
  TPaciente = class
  private
    FID: Integer;
    FNome: String;
    FDataNascimento: TDate;
  public
    property ID: Integer read FID write FID;
    property Nome: String read FNome write FNome;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;

    procedure LimparCampos;
  end;

implementation

uses
  System.SysUtils;

{ TPaciente }

procedure TPaciente.LimparCampos;
begin
  FID := 0;
  FNome := EmptyStr;
  FDataNascimento := 0;
end;

end.
