unit uFarmaceuticoDAO;

interface

uses
  FireDAC.Comp.Client,
  uFarmaceutico;

type
  TFarmaceuticoDAO = class
  private
    FQuery: TFDQuery;
  public
    procedure Inserir(const AFarmaceutico: TFarmaceutico);
    procedure Deletar(const AFarmaceutico: TFarmaceutico);
    procedure UltimoRegistro(const AFarmaceutico: TFarmaceutico);

    function ProximoSequencial: String;
    function ConsultarFarmaceuticos(const ANomeFarmaceutico: String): TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils,
  uDataModule,
  LibUtil;

{ TFarmaceuticoDAO }

function TFarmaceuticoDAO.ConsultarFarmaceuticos(const ANomeFarmaceutico: String): TFDQuery;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       nome,');
  FQuery.SQL.Add('       data_registro');
  FQuery.SQL.Add('FROM farmaceutico');
  FQuery.SQL.Add('WHERE ? IN ('''', {UCASE(nome)})');
  FQuery.SQL.Add('ORDER BY id');
  FQuery.Open([ANomeFarmaceutico.ToUpper]);

  Result := FQuery;
end;

constructor TFarmaceuticoDAO.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dmConexao.FDConnection;
end;

procedure TFarmaceuticoDAO.Deletar(const AFarmaceutico: TFarmaceutico);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('DELETE FROM farmaceutico');
  FQuery.SQL.Add('WHERE id = ?');
  FQuery.Params[0].AsInteger := AFarmaceutico.ID;
  FQuery.ExecSQL;
end;

destructor TFarmaceuticoDAO.Destroy;
begin
  FreeAndNil(FQuery);

  inherited;
end;

procedure TFarmaceuticoDAO.Inserir(const AFarmaceutico: TFarmaceutico);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO farmaceutico ( id, nome, crf, data_registro )');
  FQuery.SQL.Add('VALUES ( ?, ?, ?, ? ) AS novo');
  FQuery.SQL.Add('ON DUPLICATE KEY');
  FQuery.SQL.Add('UPDATE nome = novo.nome,');
  FQuery.SQL.Add('       crf = novo.crf,');
  FQuery.SQL.Add('       data_registro = novo.data_registro');
  FQuery.Params[0].AsInteger := AFarmaceutico.ID;
  FQuery.Params[1].AsString := AFarmaceutico.Nome;
  FQuery.Params[2].AsString := AFarmaceutico.CRF;
  FQuery.Params[3].AsDate := AFarmaceutico.DataRegistro;
  FQuery.ExecSQL;
end;

function TFarmaceuticoDAO.ProximoSequencial: String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT COALESCE(MAX(id), 0) + 1');
  FQuery.SQL.Add('FROM farmaceutico');
  FQuery.Open;

  Result := FQuery.Fields[0].AsString;
end;

procedure TFarmaceuticoDAO.UltimoRegistro(const AFarmaceutico: TFarmaceutico);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       nome,');
  FQuery.SQL.Add('       crf,');
  FQuery.SQL.Add('       data_registro');
  FQuery.SQL.Add('FROM farmaceutico');
  FQuery.SQL.Add('ORDER BY id DESC');
  FQuery.SQL.Add('{LIMIT(1)}');
  FQuery.Open;

  if FQuery.IsEmpty then
  begin
    AFarmaceutico.LimparCampos;
    Exit;
  end;

  AFarmaceutico.ID := FQuery.FieldByName('id').AsInteger;
  AFarmaceutico.Nome := FQuery.FieldByName('nome').AsString;
  AFarmaceutico.CRF := FQuery.FieldByName('crf').AsString;
  AFarmaceutico.DataRegistro := FQuery.FieldByName('data_registro').AsDateTime;
end;

end.

