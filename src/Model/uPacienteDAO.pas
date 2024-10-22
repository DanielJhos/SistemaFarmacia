unit uPacienteDAO;

interface

uses
  FireDAC.Comp.Client,
  uPaciente;

type
  TPacienteDAO = class
  private
    FQuery: TFDQuery;
  public
    procedure Inserir(const APaciente: TPaciente);
    procedure Deletar(const APaciente: TPaciente);
    procedure UltimoRegistro(const APaciente: TPaciente);

    function ProximoSequencial: String;
    function ConsultarPacientes(const ANomePaciente: String): TFDQuery;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils,
  uDataModule,
  LibUtil;

{ TPacienteDAO }

function TPacienteDAO.ConsultarPacientes(const ANomePaciente: String): TFDQuery;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       nome,');
  FQuery.SQL.Add('       data_nascimento');
  FQuery.SQL.Add('FROM paciente');
  FQuery.SQL.Add('WHERE ? IN ('''', {UCASE(nome)})');
  FQuery.SQL.Add('ORDER BY id');
  FQuery.Open([ANomePaciente.ToUpper]);

  Result := FQuery;
end;

constructor TPacienteDAO.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dmConexao.FDConnection;
end;

procedure TPacienteDAO.Inserir(const APaciente: TPaciente);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO paciente ( id, nome, data_nascimento )');
  FQuery.SQL.Add('VALUES ( ?, ?, ? ) AS novo');
  FQuery.SQL.Add('ON DUPLICATE KEY');
  FQuery.SQL.Add('UPDATE nome = novo.nome,');
  FQuery.SQL.Add('       data_nascimento = novo.data_nascimento');
  FQuery.Params[0].AsInteger := APaciente.ID;
  FQuery.Params[1].AsString := APaciente.Nome;
  FQuery.Params[2].AsDateTime := APaciente.DataNascimento;
  FQuery.ExecSQL;
end;

function TPacienteDAO.ProximoSequencial: String;
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT COALESCE(MAX(id), 0) + 1');
  FQuery.SQL.Add('FROM paciente');
  FQuery.Open;

  Result := FQuery.Fields[0].AsString;
end;

procedure TPacienteDAO.UltimoRegistro(const APaciente: TPaciente);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT id,');
  FQuery.SQL.Add('       nome,');
  FQuery.SQL.Add('       data_nascimento');
  FQuery.SQL.Add('FROM paciente');
  FQuery.SQL.Add('ORDER BY id desc');
  FQuery.SQL.Add('{LIMIT(1)}');
  FQuery.Open;

  if FQuery.IsEmpty then
  begin
    APaciente.LimparCampos;
    Exit;
  end;

  APaciente.ID := FQuery.FieldByName('id').AsInteger;
  APaciente.Nome := FQuery.FieldByName('nome').AsString;
  APaciente.DataNascimento := FQuery.FieldByName('data_nascimento').AsDateTime;
end;

procedure TPacienteDAO.Deletar(const APaciente: TPaciente);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('DELETE FROM paciente');
  FQuery.SQL.Add('WHERE id = ?');
  FQuery.Params[0].AsInteger := APaciente.ID;
  FQuery.ExecSQL;
end;

destructor TPacienteDAO.Destroy;
begin
  FreeAndNil(FQuery);

  inherited;
end;

end.
