unit uFrmServicoFarmaceutico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uServicoFarmaceutico, uServicoFarmaceuticoDAO, Vcl.Mask, JvExMask, JvToolEdit, Vcl.CheckLst,
  Generics.Collections;

type
  TFrmServicoFarmaceutico = class(TForm)
    pAbastecimento: TPanel;
    lbPaciente: TLabel;
    lblDataServico: TLabel;
    edCodigoPaciente: TEdit;
    edDataServico: TJvDateEdit;
    edValorTotal: TEdit;
    lbValorTotal: TLabel;
    edCodigo: TEdit;
    lbCodigo: TLabel;
    btIncluir: TButton;
    btSalvar: TButton;
    btAlterar: TButton;
    btCancelar: TButton;
    btExcluir: TButton;
    btConsultarFarmaceutico: TButton;
    lbListaProcedimento: TCheckListBox;
    lblListaProcedimento: TLabel;
    edNomePaciente: TEdit;
    edObservacao: TEdit;
    lbObservacao: TLabel;
    lbFarmaceutico: TLabel;
    edCodigoFarmaceutico: TEdit;
    edNomeFarmaceutico: TEdit;
    btConsultarPaciente: TButton;
    procedure btIncluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btConsultarPacienteClick(Sender: TObject);
    procedure btConsultarFarmaceuticoClick(Sender: TObject);
    procedure lbListaProcedimentoClickCheck(Sender: TObject);
  private
    FServicoFarmaceutico: TServicoFarmaceutico;
    FServicoFarmaceuticoDAO: TServicoFarmaceuticoDAO;
    FListaProcedimento: TDictionary<Integer, Double>;

    procedure PreencherProcedimentos;
  public
    procedure HabilitaBotoes(const AHabilitar: Boolean);
    procedure BotoesInsercaoEdicao;
    procedure BotoesNavegacao;
    procedure BotoesExcluir;
    procedure LimparCampos;
    procedure UltimoRegistro;
  end;

implementation

uses
  FireDAC.Comp.Client,
  FireDAC.DatS,
  uFrmConsultaPaciente,
  uFrmConsultaFarmaceutico,
  uProcedimento,
  uDataModule,
  LibUtil;

{$R *.dfm}

{ TFrmCadastroAbastecimento }

procedure TFrmServicoFarmaceutico.BotoesExcluir;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := False;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmServicoFarmaceutico.BotoesInsercaoEdicao;
begin
  btIncluir.Enabled := False;
  btSalvar.Enabled := True;
  btAlterar.Enabled := False;
  btCancelar.Enabled := True;
  btExcluir.Enabled := False;
end;

procedure TFrmServicoFarmaceutico.BotoesNavegacao;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := True;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmServicoFarmaceutico.btAlterarClick(Sender: TObject);
begin
  BotoesInsercaoEdicao;
  HabilitaBotoes(True);
end;

procedure TFrmServicoFarmaceutico.btCancelarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if FServicoFarmaceutico.ID > 0 then
    Exit;

  LimparCampos;
  HabilitaBotoes(False);
  UltimoRegistro;
end;

procedure TFrmServicoFarmaceutico.btConsultarFarmaceuticoClick(Sender: TObject);
begin
  const lFrmConsultaFarmaceutico = TFrmConsultaFarmaceutico.Create(nil);
  try
    if lFrmConsultaFarmaceutico.ShowModal = mrOk then
    begin
      edCodigoFarmaceutico.Text := lFrmConsultaFarmaceutico.IDFarmaceutico.ToString;
      edNomeFarmaceutico.Text := lFrmConsultaFarmaceutico.NomeFarmaceutico;
    end;
  finally
    FreeAndNil(lFrmConsultaFarmaceutico);
  end;
end;

procedure TFrmServicoFarmaceutico.btConsultarPacienteClick(Sender: TObject);
begin
  const lFrmConsultaPaciente = TFrmConsultaPaciente.Create(nil);
  try
    if lFrmConsultaPaciente.ShowModal = mrOk then
    begin
      edCodigoPaciente.Text := lFrmConsultaPaciente.IDPaciente.ToString;
      edNomePaciente.Text := lFrmConsultaPaciente.NomePaciente;
    end;
  finally
    FreeAndNil(lFrmConsultaPaciente);
  end;
end;

procedure TFrmServicoFarmaceutico.btExcluirClick(Sender: TObject);
begin
  BotoesExcluir;

  if FServicoFarmaceutico.ID = 0 then
  begin
    Informa('Sem registros!');
    Exit;
  end;

  FServicoFarmaceuticoDAO.Deletar(FServicoFarmaceutico);
  UltimoRegistro;
end;

procedure TFrmServicoFarmaceutico.btIncluirClick(Sender: TObject);
begin
  LimparCampos;
  BotoesInsercaoEdicao;
  edCodigo.Text := FServicoFarmaceuticoDAO.ProximoSequencial;
  PreencherProcedimentos;
  HabilitaBotoes(True);
end;

procedure TFrmServicoFarmaceutico.btSalvarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if edDataServico.Date = 0 then
  begin
    Alerta('Necessário preencher o campo "Data do Serviço"!');
    edDataServico.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if lbListaProcedimento.Items.ToString.IsEmpty then
  begin
    Alerta('Necessário preencher o campo "Bomba"!');
    lbListaProcedimento.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  FServicoFarmaceutico.ID := edCodigo.Text.ToIntDef;
  FServicoFarmaceutico.DataServico := edDataServico.Date;
  FServicoFarmaceutico.ValorTotal := edValorTotal.Text.ToFloatDef;
  FServicoFarmaceutico.Observacao := edObservacao.Text;
  FServicoFarmaceutico.IDFarmaceutico := edCodigoFarmaceutico.Text.ToIntDef;
  FServicoFarmaceutico.IDPaciente := edCodigoPaciente.Text.ToIntDef;

  FServicoFarmaceuticoDAO.Inserir(FServicoFarmaceutico);
  HabilitaBotoes(False);
end;

procedure TFrmServicoFarmaceutico.FormCreate(Sender: TObject);
begin
  FServicoFarmaceutico := TServicoFarmaceutico.Create;
  FServicoFarmaceuticoDAO := TServicoFarmaceuticoDAO.Create;

  FListaProcedimento := TDictionary<Integer, Double>.Create;
end;

procedure TFrmServicoFarmaceutico.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FServicoFarmaceutico);
  FreeAndNil(FServicoFarmaceuticoDAO);
  FreeAndNil(FListaProcedimento);
end;

procedure TFrmServicoFarmaceutico.HabilitaBotoes(const AHabilitar: Boolean);
begin
  edDataServico.Enabled := AHabilitar;
  edObservacao.Enabled := AHabilitar;
  edCodigoFarmaceutico.Enabled := AHabilitar;
  edNomeFarmaceutico.Enabled := AHabilitar;
  edCodigoPaciente.Enabled := AHabilitar;
  edNomePaciente.Enabled := AHabilitar;
  lbListaProcedimento.Enabled := AHabilitar;
  btConsultarFarmaceutico.Enabled := AHabilitar;
  btConsultarPaciente.Enabled := AHabilitar;
end;

procedure TFrmServicoFarmaceutico.lbListaProcedimentoClickCheck(Sender: TObject);
begin
  var lValorStr := EmptyStr;
  var lValor: Double := 0;
  var lValorTotal: Double := 0;

  for var i := 0 to lbListaProcedimento.Count - 1 do
  begin
    if lbListaProcedimento.Checked[i] then
    begin
      lValorStr := Trim(Copy(lbListaProcedimento.Items[i], Pos('R$', lbListaProcedimento.Items[i]) + 2, Length(lbListaProcedimento.Items[i])));
      if TryStrToFloat(lValorStr, lValor) then
        lValorTotal := lValorTotal + lValor;
    end;
  end;

 edValorTotal.Text := lValorTotal.ToString;
end;

procedure TFrmServicoFarmaceutico.LimparCampos;
begin
  edCodigo.Clear;
  edDataServico.Clear;
  edValorTotal.Text := '0.00';
  edCodigoFarmaceutico.Clear;
  edNomeFarmaceutico.Clear;
  edCodigoPaciente.Clear;
  edNomePaciente.Clear;
  lbListaProcedimento.Items.Clear;
end;

procedure TFrmServicoFarmaceutico.PreencherProcedimentos;
begin
  const lQuery = TFDQuery.Create(nil);
  try
    lQuery.Connection := dmConexao.FDConnection;
    lQuery.SQL.Add('SELECT tipo,');
    lQuery.SQL.Add('       descricao,');
    lQuery.SQL.Add('       valor_unitario');
    lQuery.SQL.Add('FROM procedimento');
    lQuery.SQL.Add('ORDER BY tipo');
    lQuery.Open;

    var lTipo := EmptyStr;
    for var lRow in lQuery.Table.Rows.ToArray<TFDDatSRow> do
    begin
      case TTipoProcedimento(lRow.AsValue<Integer>(0)) of
        TTipoProcedimento.tpNenhum: lTipo := 'Nenhum';
        TTipoProcedimento.tpAtencaoFarmaceuticaDomiciliar: lTipo := 'Atenção Farmacêutica Domiciliar';
        TTipoProcedimento.tpAfericaoPressaoArterial: lTipo := 'Aferição de Pressão Arterial';
        TTipoProcedimento.tpAfericaoTemperaturaCorporal: lTipo := 'Aferição de Temperatura Corporal';
        TTipoProcedimento.tpAfericaoGlicemiaCapilar: lTipo := 'Aferição de Glicemia Capilar';
        TTipoProcedimento.tpAdministracaoMedicamentosInalacao: lTipo := 'Administração de Medicamentos para Inalação';
        TTipoProcedimento.tpAdministracaoMedicamentosAplicacaoInjetaveis: lTipo := 'Administração de Medicamentos para Aplicação de Injetáveis';
      end;

      lbListaProcedimento.Items.Add(Format('%s - %s - R$%s', [lTipo, lRow.AsValue<String>(1), lRow.AsValue<Double>(2).ToString]));
    end;

  finally
    FreeAndNil(lQuery);
  end;
end;

procedure TFrmServicoFarmaceutico.UltimoRegistro;
begin
  FServicoFarmaceuticoDAO.UltimoRegistro(FServicoFarmaceutico);

  if FServicoFarmaceutico.ID = 0 then
  begin
    LimparCampos;
    Exit;
  end;

  edCodigo.Text := FServicoFarmaceutico.ID.ToString;
  edDataServico.Date := FServicoFarmaceutico.DataServico;
  edValorTotal.Text := FServicoFarmaceutico.ValorTotal.ToString;
  edObservacao.Text := FServicoFarmaceutico.Observacao;
  edNomePaciente.Text := FServicoFarmaceuticoDAO.ConsultarNomeFarmaceutico(FServicoFarmaceutico.IDFarmaceutico);
  edCodigoFarmaceutico.Text := FServicoFarmaceuticoDAO.ConsultarNomeFarmaceutico(FServicoFarmaceutico.IDPaciente);
end;

end.
