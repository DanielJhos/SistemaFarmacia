unit uFrmCadastroTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, uTanque, uTanqueDAO;

type
  TFrmCadastroTanque = class(TForm)
    pnTanque: TPanel;
    lTipoCombustivel: TLabel;
    lbDescricao: TLabel;
    cbTipoCombustivel: TComboBox;
    edDescricao: TEdit;
    lbCodigo: TLabel;
    edCodigo: TEdit;
    btSalvar: TButton;
    btCancelar: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btIncluir: TButton;
    procedure btSalvarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    FTanque: TTanque;
    FTanqueDao: TTanqueDAO;

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

procedure TFrmCadastroTanque.BotoesExcluir;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := False;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroTanque.BotoesInsercaoEdicao;
begin
  btIncluir.Enabled := False;
  btSalvar.Enabled := True;
  btAlterar.Enabled := False;
  btCancelar.Enabled := True;
  btExcluir.Enabled := False;
end;

procedure TFrmCadastroTanque.BotoesNavegacao;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := True;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroTanque.btAlterarClick(Sender: TObject);
begin
  BotoesInsercaoEdicao;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroTanque.btCancelarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if FTanque.ID > 0 then
    Exit;

  LimparCampos;
  HabilitaBotoes(False);
  UltimoRegistro;
end;

procedure TFrmCadastroTanque.btExcluirClick(Sender: TObject);
begin
  BotoesExcluir;

  if FTanque.ID = 0 then
  begin
    Informa('Sem registros!');
    Exit;
  end;

  FTanqueDAO.Deletar(FTanque.ID);
  UltimoRegistro;
end;

procedure TFrmCadastroTanque.btIncluirClick(Sender: TObject);
begin
  LimparCampos;
  BotoesInsercaoEdicao;
  edCodigo.Text := FTanqueDAO.ProximoSequencial;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroTanque.btSalvarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if edDescricao.Text.ToString.Trim.IsEmpty then
  begin
    Alerta('Necessário preencher o campo "Descrição"!');
    edDescricao.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if cbTipoCombustivel.ItemIndex = -1 then
  begin
    Alerta('Necessário preencher o campo "Tipo de Combústivel"!');
    cbTipoCombustivel.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  FTanque.Inserir(edCodigo.Text.ToIntDef, edDescricao.Text, TTipoCombustivel(cbTipoCombustivel.ItemIndex));
  FTanqueDAO.Inserir(FTanque);
  HabilitaBotoes(False);
end;

procedure TFrmCadastroTanque.FormCreate(Sender: TObject);
begin
  FTanque := TTanque.Create;
  FTanqueDAO := TTanqueDAO.Create;
end;

procedure TFrmCadastroTanque.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FTanque);
  FreeAndNil(FTanqueDAO);
end;

procedure TFrmCadastroTanque.FormShow(Sender: TObject);
begin
  btIncluir.Enabled := True;
end;

procedure TFrmCadastroTanque.HabilitaBotoes(const AHabilitar: Boolean);
begin
  edDescricao.Enabled := AHabilitar;
  cbTipoCombustivel.Enabled := AHabilitar;
end;

procedure TFrmCadastroTanque.LimparCampos;
begin
  edCodigo.Clear;
  edDescricao.Clear;
  cbTipoCombustivel.ItemIndex := -1;
end;

procedure TFrmCadastroTanque.UltimoRegistro;
begin
  FTanqueDAO.UltimoRegistro(FTanque);

  if FTanque.ID = 0 then
  begin
    LimparCampos;
    Exit;
  end;

  edCodigo.Text := FTanque.ID.ToString;
  edDescricao.Text := FTanque.Descricao;
  cbTipoCombustivel.ItemIndex := Ord(FTanque.TipoCombustivel);
end;

end.
