unit uFrmCadastroProcedimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.Mask, JvExMask, JvToolEdit,
  uProcedimento, uProcedimentoDAO, JvExStdCtrls, JvCombobox;

type
  TFrmCadastroProcedimento = class(TForm)
    pnFarmaceutico: TPanel;
    lbDescricao: TLabel;
    edDescricao: TEdit;
    lbTipo: TLabel;
    cbTipoProcedimento: TJvComboBox;
    btSalvar: TButton;
    btCancelar: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btIncluir: TButton;
    edValorUnitario: TEdit;
    lbValorUnitario: TLabel;
    procedure btSalvarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    FProcedimento: TProcedimento;
    FProcedimentoDAO: TProcedimentoDAO;

    procedure HabilitaBotoes(const AHabilitar: Boolean);
    procedure BotoesInsercaoEdicao;
    procedure BotoesNavegacao;
    procedure BotoesExcluir;
    procedure LimparCampos;
    procedure UltimoRegistro;
  end;

implementation

uses
  LibUtil;

{$R *.dfm}

procedure TFrmCadastroProcedimento.BotoesExcluir;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := False;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroProcedimento.BotoesInsercaoEdicao;
begin
  btIncluir.Enabled := False;
  btSalvar.Enabled := True;
  btAlterar.Enabled := False;
  btCancelar.Enabled := True;
  btExcluir.Enabled := False;
end;

procedure TFrmCadastroProcedimento.BotoesNavegacao;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := True;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroProcedimento.btAlterarClick(Sender: TObject);
begin
  BotoesInsercaoEdicao;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroProcedimento.btCancelarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if FProcedimento.Tipo > TTipoProcedimento.tpNenhum then
    Exit;

  LimparCampos;
  HabilitaBotoes(False);
  UltimoRegistro;
end;

procedure TFrmCadastroProcedimento.btExcluirClick(Sender: TObject);
begin
  BotoesExcluir;

  if FProcedimento.Tipo = TTipoProcedimento.tpNenhum then
  begin
    Informa('Sem registros!');
    Exit;
  end;

  FProcedimentoDAO.Deletar(FProcedimento);
  UltimoRegistro;
end;

procedure TFrmCadastroProcedimento.btIncluirClick(Sender: TObject);
begin
  LimparCampos;
  BotoesInsercaoEdicao;
  cbTipoProcedimento.ItemIndex := Ord(TTipoProcedimento.tpNenhum);
  HabilitaBotoes(True);
end;

procedure TFrmCadastroProcedimento.btSalvarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if TTipoProcedimento(cbTipoProcedimento.ItemIndex) = TTipoProcedimento.tpNenhum then
  begin
    Alerta('Necess rio preencher o campo "Tipo de Procedimento"!');
    cbTipoProcedimento.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if edDescricao.Text.ToString.Trim.IsEmpty then
  begin
    Alerta('Necess rio preencher o campo "Descri��o"!');
    edDescricao.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if edValorUnitario.Text.ToFloatDef = 0 then
  begin
    Alerta('Necess rio preencher o campo "Valor Unit�rio"!');
    edValorUnitario.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  FProcedimento.Tipo := TTipoProcedimento(cbTipoProcedimento.ItemIndex);
  FProcedimento.Descricao := edDescricao.Text;
  FProcedimento.ValorUnitario := edValorUnitario.Text.ToFloatDef;

  FProcedimentoDAO.Inserir(FProcedimento);
  HabilitaBotoes(False);
end;

procedure TFrmCadastroProcedimento.FormCreate(Sender: TObject);
begin
  FProcedimento := TProcedimento.Create;
  FProcedimentoDAO := TProcedimentoDAO.Create;
end;

procedure TFrmCadastroProcedimento.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FProcedimento);
  FreeAndNil(FProcedimentoDAO);
end;

procedure TFrmCadastroProcedimento.FormShow(Sender: TObject);
begin
  btIncluir.Enabled := True;
end;

procedure TFrmCadastroProcedimento.HabilitaBotoes(const AHabilitar: Boolean);
begin
  cbTipoProcedimento.Enabled := AHabilitar;
  edDescricao.Enabled := AHabilitar;
  edValorUnitario.Enabled := AHabilitar;
end;

procedure TFrmCadastroProcedimento.LimparCampos;
begin
  cbTipoProcedimento.ItemIndex := Ord(TTipoProcedimento.tpNenhum);
  edDescricao.Clear;
  edValorUnitario.Text := '0.00';
end;

procedure TFrmCadastroProcedimento.UltimoRegistro;
begin
  FProcedimentoDAO.UltimoRegistro(FProcedimento);

  if TTipoProcedimento(FProcedimento.Tipo) = TTipoProcedimento.tpNenhum then
  begin
    LimparCampos;
    Exit;
  end;

  cbTipoProcedimento.ItemIndex := Ord(FProcedimento.Tipo);
  edDescricao.Text := FProcedimento.Descricao;
  edValorUnitario.Text := FProcedimento.ValorUnitario.ToString;
end;

end.
