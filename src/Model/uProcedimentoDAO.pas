unit uProcedimentoDAO;

interface

uses
  FireDAC.Comp.Client,
  uProcedimento;

type
  TProcedimentoDAO = class
  private
    FQuery: TFDQuery;
  public
    procedure Inserir(const AProcedimento: TProcedimento);
    procedure Deletar(const AProcedimento: TProcedimento);
    procedure UltimoRegistro(const AProcedimento: TProcedimento);

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils,
  uDataModule,
  LibUtil;

{ TFarmaceuticoDAO }

constructor TProcedimentoDAO.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := dmConexao.FDConnection;
end;

procedure TProcedimentoDAO.Deletar(const AProcedimento: TProcedimento);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('DELETE FROM procedimento');
  FQuery.SQL.Add('WHERE tipo = ?');
  FQuery.Params[0].AsInteger := Ord(AProcedimento.Tipo);
  FQuery.ExecSQL;
end;

destructor TProcedimentoDAO.Destroy;
begin
  FreeAndNil(FQuery);

  inherited;
end;

procedure TProcedimentoDAO.Inserir(const AProcedimento: TProcedimento);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('INSERT INTO procedimento ( tipo, descricao, valor_unitario )');
  FQuery.SQL.Add('VALUES ( ?, ?, ?) AS novo');
  FQuery.SQL.Add('ON DUPLICATE KEY');
  FQuery.SQL.Add('UPDATE descricao = novo.descricao,');
  FQuery.SQL.Add('       valor_unitario = novo.valor_unitario');
  FQuery.Params[0].AsInteger := Ord(AProcedimento.Tipo);
  FQuery.Params[1].AsString := AProcedimento.Descricao;
  FQuery.Params[2].AsFloat := AProcedimento.ValorUnitario;
  FQuery.ExecSQL;
end;

procedure TProcedimentoDAO.UltimoRegistro(const AProcedimento: TProcedimento);
begin
  FQuery.SQL.Clear;
  FQuery.SQL.Add('SELECT tipo,');
  FQuery.SQL.Add('       descricao,');
  FQuery.SQL.Add('       valor_unitario');
  FQuery.SQL.Add('FROM procedimento');
  FQuery.SQL.Add('ORDER BY tipo DESC');
  FQuery.SQL.Add('LIMIT 1');
  FQuery.Open;

  if FQuery.IsEmpty then
  begin
    AProcedimento.LimparCampos;
    Exit;
  end;

  AProcedimento.Tipo := TTipoProcedimento(FQuery.FieldByName('tipo').AsInteger);
  AProcedimento.Descricao := FQuery.FieldByName('descricao').AsString;
  AProcedimento.ValorUnitario := FQuery.FieldByName('valor_unitario').AsFloat;
end;

end.
