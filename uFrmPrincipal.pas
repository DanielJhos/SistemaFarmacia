unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmSistemaFarmaceutico = class(TForm)
    pnPrincipal: TPanel;
    mnSistemaFarmaceutico: TMainMenu;
    miCadastros: TMenuItem;
    miPaciente: TMenuItem;
    miCadastroFarmaceutico: TMenuItem;
    miCadastroProcedimento: TMenuItem;
    Servi�os: TMenuItem;
    miFarmaceutico: TMenuItem;
    procedure miPacienteClick(Sender: TObject);
    procedure miCadastroFarmaceuticoClick(Sender: TObject);
    procedure miCadastroProcedimentoClick(Sender: TObject);
    procedure miFarmaceuticoClick(Sender: TObject);
  end;

var
  FrmSistemaFarmaceutico: TFrmSistemaFarmaceutico;

implementation

uses
  uDataModule,
  uFrmCadastroPaciente,
  uFrmCadastroFarmaceutico,
  uFrmCadastroProcedimento,
  uFrmServicoFarmaceutico;

{$R *.dfm}

procedure TFrmSistemaFarmaceutico.miCadastroFarmaceuticoClick(Sender: TObject);
begin
  const lFrmCadastroFarmaceutico = TFrmCadastroFarmaceutico.Create(nil);
  try
    lFrmCadastroFarmaceutico.ShowModal;
  finally
    FreeAndNil(lFrmCadastroFarmaceutico);
  end;
end;

procedure TFrmSistemaFarmaceutico.miCadastroProcedimentoClick(Sender: TObject);
begin
  const lFrmCadastroProcedimento = TFrmCadastroProcedimento.Create(nil);
  try
    lFrmCadastroProcedimento.ShowModal;
  finally
    FreeAndNil(lFrmCadastroProcedimento)
  end;
end;

procedure TFrmSistemaFarmaceutico.miFarmaceuticoClick(Sender: TObject);
begin
  const lFrmServicoFarmaceutico = TFrmServicoFarmaceutico.Create(nil);
  try
    lFrmServicoFarmaceutico.ShowModal;
  finally
    FreeAndNil(lFrmServicoFarmaceutico);
  end;
end;

procedure TFrmSistemaFarmaceutico.miPacienteClick(Sender: TObject);
begin
  const lFrmCadastroPaciente = TFrmCadastroPaciente.Create(nil);
  try
    lFrmCadastroPaciente.ShowModal;
  finally
    FreeAndNil(lFrmCadastroPaciente);
  end;
end;

end.
