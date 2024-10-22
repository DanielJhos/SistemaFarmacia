unit uFrmConsultaPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uPacienteDAO;

type
  TFrmConsultaPaciente = class(TForm)
    pnConsulta: TPanel;
    edNomePaciente: TEdit;
    dgConsultaPaciente: TDBGrid;
    lbPesquisar: TLabel;
    dsConsultaPaciente: TDataSource;
    btFiltrar: TButton;
    procedure btFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dgConsultaPacienteDblClick(Sender: TObject);
  private
    FPacienteDAO: TPacienteDAO;
    FIDPaciente: Integer;
    FNomePaciente: String;
  public
    property IDPaciente: Integer read FIDPaciente write FIDPaciente;
    property NomePaciente: String read FNomePaciente write FNomePaciente;
  end;

implementation

uses
  LibUtil;

{$R *.dfm}

procedure TFrmConsultaPaciente.btFiltrarClick(Sender: TObject);
begin
  dsConsultaPaciente.DataSet := FPacienteDAO.ConsultarPacientes(edNomePaciente.Text.ToString.Trim);
end;

procedure TFrmConsultaPaciente.dgConsultaPacienteDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
  FIDPaciente := dgConsultaPaciente.DataSource.DataSet.FieldByName('id').Value;
  FNomePaciente := VarToStr(dgConsultaPaciente.DataSource.DataSet.FieldByName('nome').Value);
end;

procedure TFrmConsultaPaciente.FormCreate(Sender: TObject);
begin
  FPacienteDAO := TPacienteDAO.Create;
end;

procedure TFrmConsultaPaciente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FPacienteDAO);
end;

end.
