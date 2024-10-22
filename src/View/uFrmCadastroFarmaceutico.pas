unit uFrmCadastroFarmaceutico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.Mask, JvExMask, JvToolEdit,
  uFarmaceutico, uFarmaceuticoDAO;

type
  TFrmCadastroFarmaceutico = class(TForm)
    pnFarmaceutico: TPanel;
    lDataRegistro: TLabel;
    lbNome: TLabel;
    edNome: TEdit;
    lbCodigo: TLabel;
    edCodigo: TEdit;
    btSalvar: TButton;
    btCancelar: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btIncluir: TButton;
    edDataRegistro: TJvDateEdit;
    edCRF: TEdit;
    lbCRF: TLabel;
    procedure btSalvarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    FFarmaceutico: TFarmaceutico;
    FFarmaceuticoDAO: TFarmaceuticoDAO;

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

procedure TFrmCadastroFarmaceutico.BotoesExcluir;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := False;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroFarmaceutico.BotoesInsercaoEdicao;
begin
  btIncluir.Enabled := False;
  btSalvar.Enabled := True;
  btAlterar.Enabled := False;
  btCancelar.Enabled := True;
  btExcluir.Enabled := False;
end;

procedure TFrmCadastroFarmaceutico.BotoesNavegacao;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := True;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroFarmaceutico.btAlterarClick(Sender: TObject);
begin
  BotoesInsercaoEdicao;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroFarmaceutico.btCancelarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if FFarmaceutico.ID > 0 then
    Exit;

  LimparCampos;
  HabilitaBotoes(False);
  UltimoRegistro;
end;

procedure TFrmCadastroFarmaceutico.btExcluirClick(Sender: TObject);
begin
  BotoesExcluir;

  if FFarmaceutico.ID = 0 then
  begin
    Informa('Sem registros!');
    Exit;
  end;

  FFarmaceuticoDAO.Deletar(FFarmaceutico);
  UltimoRegistro;
end;

procedure TFrmCadastroFarmaceutico.btIncluirClick(Sender: TObject);
begin
  LimparCampos;
  BotoesInsercaoEdicao;
  edCodigo.Text := FFarmaceuticoDAO.ProximoSequencial;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroFarmaceutico.btSalvarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if edNome.Text.ToString.Trim.IsEmpty then
  begin
    Alerta('Necessário preencher o campo "Nome"!');
    edNome.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if edCRF.Text.ToString.Trim.IsEmpty then
  begin
    Alerta('Necessário preencher o campo "CRF"!');
    edCRF.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if edDataRegistro.Date = 0 then
  begin
    Alerta('Necessário preencher o campo "Data de Registro"!');
    edDataRegistro.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  FFarmaceutico.ID := edCodigo.Text.ToIntDef;
  FFarmaceutico.Nome := edNome.Text;
  FFarmaceutico.CRF := edCRF.Text;
  FFarmaceutico.DataRegistro := edDataRegistro.Date;

  FFarmaceuticoDAO.Inserir(FFarmaceutico);
  HabilitaBotoes(False);
end;

procedure TFrmCadastroFarmaceutico.FormCreate(Sender: TObject);
begin
  FFarmaceutico := TFarmaceutico.Create;
  FFarmaceuticoDAO := TFarmaceuticoDAO.Create;
end;

procedure TFrmCadastroFarmaceutico.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FFarmaceutico);
  FreeAndNil(FFarmaceuticoDAO);
end;

procedure TFrmCadastroFarmaceutico.FormShow(Sender: TObject);
begin
  btIncluir.Enabled := True;
end;

procedure TFrmCadastroFarmaceutico.HabilitaBotoes(const AHabilitar: Boolean);
begin
  edNome.Enabled := AHabilitar;
  edCRF.Enabled := AHabilitar;
  edDataRegistro.Enabled := AHabilitar;
end;

procedure TFrmCadastroFarmaceutico.LimparCampos;
begin
  edCodigo.Clear;
  edNome.Clear;
  edCRF.Clear;
  edDataRegistro.Clear;
end;

procedure TFrmCadastroFarmaceutico.UltimoRegistro;
begin
  FFarmaceuticoDAO.UltimoRegistro(FFarmaceutico);

  if FFarmaceutico.ID = 0 then
  begin
    LimparCampos;
    Exit;
  end;

  edCodigo.Text := FFarmaceutico.ID.ToString;
  edNome.Text := FFarmaceutico.Nome;
  edCRF.Text := FFarmaceutico.CRF;
  edDataRegistro.Date:= FFarmaceutico.DataRegistro;
end;

end.
