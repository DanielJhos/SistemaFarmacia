unit uServicoFarmaceuticoDAO;

interface

uses
  FireDAC.Comp.Client,
  uServicoFarmaceutico;

type
  TServicoFarmaceuticoDAO = class
  private
    FQuery: TFDQuery;
  public
    procedure Inserir(const AServicoFarmaceutico: TServicoFarmaceutico);
    procedure Deletar(const AServicoFarmaceutico: TServicoFarmaceutico);
    procedure UltimoRegistro(const AServicoFarmaceutico: TServicoFarmaceutico);

    function ProximoSequencial: String;
    function ConsultarNomeFarmaceutico(const AIDFarmaceutico: Integer): String;
    function ConsultarNomePaciente(const AIDPaciente: Integer): String;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils,
  uDataModule,
  LibUtil;

{ TServicoFarmaceuticoDAO }

function TServicoFarmaceuticoDAO.ConsultarNomeFarmaceutico(const AIDFarmaceutico: Integer): String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT nome');
  FQuery.SQL.Add('FROM farmaceutico');
  FQuery.SQL.Add('WHERE id = ?');
  FQuery.Open([AIDFarmaceutico]);

  Result := FQuery.Fields[0].AsString;
end;

function TServicoFarmaceuticoDAO.ConsultarNomePaciente(const AIDPaciente: Integer): String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT nome');
  FQuery.SQL.Add('FROM paciente');
  FQuery.SQL.Add('WHERE id = ?');
  FQuery.Open([AIDPaciente]);

  Result := FQuery.Fields[0].AsString;
end;

constructor TServicoFarmaceuticoDAO.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dmConexao.FDConnection;
end;

procedure TServicoFarmaceuticoDAO.Deletar(const AServicoFarmaceutico: TServicoFarmaceutico);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('DELETE FROM servico_farmaceutico');
  FQuery.SQL.Add('WHERE id = ?');
  FQuery.Params[0].AsInteger := AServicoFarmaceutico.ID;
  FQuery.ExecSQL;
end;

destructor TServicoFarmaceuticoDAO.Destroy;
begin
  FreeAndNil(FQuery);

  inherited;
end;

procedure TServicoFarmaceuticoDAO.Inserir(const AServicoFarmaceutico: TServicoFarmaceutico);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO servico_farmaceutico ( id, data_servico, observacao, valor_total, id_farmaceutico,');
  FQuery.SQL.Add('                                   id_paciente )');
  FQuery.SQL.Add('VALUES ( ?, ?, ?, ?, ?, ? ) AS novo');
  FQuery.SQL.Add('ON DUPLICATE KEY');
  FQuery.SQL.Add('UPDATE data_servico = novo.data_servico,');
  FQuery.SQL.Add('       observacao = novo.observacao,');
  FQuery.SQL.Add('       valor_total = novo.valor_total,');
  FQuery.SQL.Add('       id_farmaceutico = novo.id_farmaceutico,');
  FQuery.SQL.Add('       id_paciente = novo.id_paciente');
  FQuery.Params[0].AsInteger := AServicoFarmaceutico.ID;
  FQuery.Params[1].AsDate := AServicoFarmaceutico.DataServico;
  FQuery.Params[2].AsString := AServicoFarmaceutico.Observacao;
  FQuery.Params[3].AsFloat := AServicoFarmaceutico.ValorTotal;
  FQuery.Params[4].AsInteger := AServicoFarmaceutico.IDFarmaceutico;
  FQuery.Params[5].AsInteger := AServicoFarmaceutico.IDPaciente;
  FQuery.ExecSQL;
end;

function TServicoFarmaceuticoDAO.ProximoSequencial: String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT COALESCE(MAX(id), 0) + 1');
  FQuery.SQL.Add('FROM servico_farmaceutico');
  FQuery.Open;

  Result := FQuery.Fields[0].AsString;
end;

procedure TServicoFarmaceuticoDAO.UltimoRegistro(const AServicoFarmaceutico: TServicoFarmaceutico);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       data_servico,');
  FQuery.SQL.Add('       observacao,');
  FQuery.SQL.Add('       valor_total,');
  FQuery.SQL.Add('       id_farmaceutico,');
  FQuery.SQL.Add('       id_paciente');
  FQuery.SQL.Add('FROM servico_farmaceutico');
  FQuery.SQL.Add('ORDER BY id DESC');
  FQuery.SQL.Add('{LIMIT(1)}');
  FQuery.Open;

  if FQuery.IsEmpty then
  begin
    AServicoFarmaceutico.LimparCampos;
    Exit;
  end;

  AServicoFarmaceutico.ID := FQuery.FieldByName('id').AsInteger;
  AServicoFarmaceutico.DataServico := FQuery.FieldByName('data_servico').AsDateTime;
  AServicoFarmaceutico.Observacao := FQuery.FieldByName('observacao').AsString;
  AServicoFarmaceutico.ValorTotal := FQuery.FieldByName('valor_total').AsFloat;
  AServicoFarmaceutico.IDFarmaceutico := FQuery.FieldByName('id_farmaceutico').AsInteger;
  AServicoFarmaceutico.IDPaciente := FQuery.FieldByName('id_paciente').AsInteger;
end;

end.
