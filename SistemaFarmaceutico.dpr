program SistemaFarmaceutico;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmSistemaFarmaceutico},
  uDataModule in 'uDataModule.pas' {dmConexao: TDataModule},
  uFrmCadastroPaciente in 'src\View\uFrmCadastroPaciente.pas' {FrmCadastroPaciente},
  uPaciente in 'src\Controller\uPaciente.pas',
  uPacienteDAO in 'src\Model\uPacienteDAO.pas',
  LibUtil in 'LibUtil.pas',
  uFarmaceutico in 'src\Controller\uFarmaceutico.pas',
  uFrmCadastroFarmaceutico in 'src\View\uFrmCadastroFarmaceutico.pas' {FrmCadastroFarmaceutico},
  uFarmaceuticoDAO in 'src\Model\uFarmaceuticoDAO.pas',
  uProcedimento in 'src\Controller\uProcedimento.pas',
  uFrmCadastroProcedimento in 'src\View\uFrmCadastroProcedimento.pas' {FrmCadastroProcedimento},
  uProcedimentoDAO in 'src\Model\uProcedimentoDAO.pas',
  uServicoFarmaceutico in 'src\Controller\uServicoFarmaceutico.pas',
  uServicoFarmaceuticoDAO in 'src\Model\uServicoFarmaceuticoDAO.pas',
  uFrmConsultaPaciente in 'src\View\uFrmConsultaPaciente.pas' {FrmConsultaPaciente},
  uFrmServicoFarmaceutico in 'src\View\uFrmServicoFarmaceutico.pas' {FrmServicoFarmaceutico},
  uFrmConsultaFarmaceutico in 'src\View\uFrmConsultaFarmaceutico.pas' {FrmConsultaFarmaceutico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSistemaFarmaceutico, FrmSistemaFarmaceutico);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;
end.
