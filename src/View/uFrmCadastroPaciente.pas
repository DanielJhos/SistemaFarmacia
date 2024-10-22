unit uFrmCadastroPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.Mask, JvExMask, JvToolEdit,
  uPaciente, uPacienteDAO;

type
  TFrmCadastroPaciente = class(TForm)
    pnPaciente: TPanel;
    lDataNascimento: TLabel;
    lbNome: TLabel;
    edNome: TEdit;
    lbCodigo: TLabel;
    edCodigo: TEdit;
    btSalvar: TButton;
    btCancelar: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btIncluir: TButton;
    edDataNascimento: TJvDateEdit;
    procedure btSalvarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    FPaciente: TPaciente;
    FPacienteDAO: TPacienteDAO;

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

procedure TFrmCadastroPaciente.BotoesExcluir;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := False;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroPaciente.BotoesInsercaoEdicao;
begin
  btIncluir.Enabled := False;
  btSalvar.Enabled := True;
  btAlterar.Enabled := False;
  btCancelar.Enabled := True;
  btExcluir.Enabled := False;
end;

procedure TFrmCadastroPaciente.BotoesNavegacao;
begin
  btIncluir.Enabled := True;
  btSalvar.Enabled := False;
  btAlterar.Enabled := True;
  btCancelar.Enabled := False;
  btExcluir.Enabled := True;
end;

procedure TFrmCadastroPaciente.btAlterarClick(Sender: TObject);
begin
  BotoesInsercaoEdicao;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroPaciente.btCancelarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if FPaciente.ID > 0 then
    Exit;

  LimparCampos;
  HabilitaBotoes(False);
  UltimoRegistro;
end;

procedure TFrmCadastroPaciente.btExcluirClick(Sender: TObject);
begin
  BotoesExcluir;

  if FPaciente.ID = 0 then
  begin
    Informa('Sem registros!');
    Exit;
  end;

  FPacienteDAO.Deletar(FPaciente);
  UltimoRegistro;
end;

procedure TFrmCadastroPaciente.btIncluirClick(Sender: TObject);
begin
  LimparCampos;
  BotoesInsercaoEdicao;
  edCodigo.Text := FPacienteDAO.ProximoSequencial;
  HabilitaBotoes(True);
end;

procedure TFrmCadastroPaciente.btSalvarClick(Sender: TObject);
begin
  BotoesNavegacao;

  if edNome.Text.ToString.Trim.IsEmpty then
  begin
    Alerta('Necessário preencher o campo "Nome"!');
    edNome.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  if edDataNascimento.Date = 0 then
  begin
    Alerta('Necessário preencher o campo "Data de Nascimento"!');
    edDataNascimento.ToFocus;
    BotoesInsercaoEdicao;
    Exit;
  end;

  FPaciente.ID := edCodigo.Text.ToIntDef;
  FPaciente.Nome := edNome.Text;
  FPaciente.DataNascimento := edDataNascimento.Date;

  FPacienteDAO.Inserir(FPaciente);
  HabilitaBotoes(False);
end;

procedure TFrmCadastroPaciente.FormCreate(Sender: TObject);
begin
  FPaciente := TPaciente.Create;
  FPacienteDAO := TPacienteDAO.Create;
end;

procedure TFrmCadastroPaciente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FPaciente);
  FreeAndNil(FPacienteDAO);
end;

procedure TFrmCadastroPaciente.FormShow(Sender: TObject);
begin
  btIncluir.Enabled := True;
end;

procedure TFrmCadastroPaciente.HabilitaBotoes(const AHabilitar: Boolean);
begin
  edNome.Enabled := AHabilitar;
  edDataNascimento.Enabled := AHabilitar;
end;

procedure TFrmCadastroPaciente.LimparCampos;
begin
  edCodigo.Clear;
  edNome.Clear;
  edDataNascimento.Clear;
end;

procedure TFrmCadastroPaciente.UltimoRegistro;
begin
  FPacienteDAO.UltimoRegistro(FPaciente);

  if FPaciente.ID = 0 then
  begin
    LimparCampos;
    Exit;
  end;

  edCodigo.Text := FPaciente.ID.ToString;
  edNome.Text := FPaciente.Nome;
  edDataNascimento.Date:= FPaciente.DataNascimento;
end;

end.
