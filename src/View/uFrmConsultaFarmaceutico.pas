unit uFrmConsultaFarmaceutico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uFarmaceuticoDAO;

type
  TFrmConsultaFarmaceutico = class(TForm)
    pnConsulta: TPanel;
    edDescricaoPaciente: TEdit;
    dgConsultaFarmaceutico: TDBGrid;
    lbPesquisar: TLabel;
    dsConsultaFarmaceutico: TDataSource;
    btFiltrar: TButton;
    procedure btFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dgConsultaFarmaceuticoDblClick(Sender: TObject);
  private
    FFarmaceuticoDAO: TFarmaceuticoDAO;
    FIDFarmaceutico: Integer;
    FNomeFarmaceutico: String;
  public
    property IDFarmaceutico: Integer read FIDFarmaceutico write FIDFarmaceutico;
    property NomeFarmaceutico: String read FNomeFarmaceutico write FNomeFarmaceutico;
  end;

implementation

uses
  LibUtil;

{$R *.dfm}

procedure TFrmConsultaFarmaceutico.btFiltrarClick(Sender: TObject);
begin
  dsConsultaFarmaceutico.DataSet := FFarmaceuticoDAO.ConsultarFarmaceuticos(edDescricaoPaciente.Text.ToString.Trim);
end;

procedure TFrmConsultaFarmaceutico.dgConsultaFarmaceuticoDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
  FIDFarmaceutico := dgConsultaFarmaceutico.DataSource.DataSet.FieldByName('id').Value;
  FNomeFarmaceutico := VarToStr(dgConsultaFarmaceutico.DataSource.DataSet.FieldByName('nome').Value);
end;

procedure TFrmConsultaFarmaceutico.FormCreate(Sender: TObject);
begin
  FFarmaceuticoDAO := TFarmaceuticoDAO.Create;
end;

procedure TFrmConsultaFarmaceutico.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FFarmaceuticoDAO);
end;

end.
