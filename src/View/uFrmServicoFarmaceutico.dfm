object FrmServicoFarmaceutico: TFrmServicoFarmaceutico
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Abastecimento'
  ClientHeight = 567
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pAbastecimento: TPanel
    Left = 0
    Top = 0
    Width = 573
    Height = 567
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 471
    ExplicitHeight = 488
    object lbPaciente: TLabel
      Left = 17
      Top = 315
      Width = 45
      Height = 15
      Caption = 'Paciente'
    end
    object lblDataServico: TLabel
      Left = 17
      Top = 85
      Width = 82
      Height = 15
      Caption = 'Data do Servi'#231'o'
    end
    object lbValorTotal: TLabel
      Left = 17
      Top = 141
      Width = 54
      Height = 15
      Caption = 'Valor Total'
    end
    object lbCodigo: TLabel
      Left = 17
      Top = 29
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblListaProcedimento: TLabel
      Left = 17
      Top = 374
      Width = 123
      Height = 15
      Caption = 'Lista de Procedimentos'
    end
    object lbObservacao: TLabel
      Left = 17
      Top = 196
      Width = 62
      Height = 15
      Caption = 'Observacao'
    end
    object lbFarmaceutico: TLabel
      Left = 17
      Top = 254
      Width = 72
      Height = 15
      Caption = 'Farmaceutico'
    end
    object edCodigoPaciente: TEdit
      Left = 17
      Top = 337
      Width = 30
      Height = 23
      TabStop = False
      Enabled = False
      TabOrder = 8
    end
    object edNomePaciente: TEdit
      Left = 53
      Top = 337
      Width = 172
      Height = 23
      TabStop = False
      Enabled = False
      ImeName = 'edNomePaciente'
      TabOrder = 9
    end
    object edDataServico: TJvDateEdit
      Left = 17
      Top = 107
      Width = 205
      Height = 23
      Enabled = False
      ShowNullDate = False
      TabOrder = 2
    end
    object edValorTotal: TEdit
      Left = 17
      Top = 165
      Width = 205
      Height = 23
      TabStop = False
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 3
      Text = '0,00'
    end
    object edCodigo: TEdit
      Left = 17
      Top = 50
      Width = 205
      Height = 23
      TabStop = False
      Enabled = False
      TabOrder = 1
    end
    object btIncluir: TButton
      Left = 472
      Top = 47
      Width = 81
      Height = 30
      Caption = 'Incluir'
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 0
      StyleName = 'Windows'
      OnClick = btIncluirClick
    end
    object btSalvar: TButton
      Left = 472
      Top = 118
      Width = 81
      Height = 30
      Caption = 'Salvar'
      Enabled = False
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 11
      StyleName = 'Windows'
      OnClick = btSalvarClick
    end
    object btAlterar: TButton
      Left = 472
      Top = 190
      Width = 81
      Height = 30
      Caption = 'Alterar'
      Enabled = False
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 12
      StyleName = 'Windows'
      OnClick = btAlterarClick
    end
    object btCancelar: TButton
      Left = 472
      Top = 261
      Width = 81
      Height = 30
      Caption = 'Cancelar'
      Enabled = False
      ImageIndex = 1
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 13
      StyleName = 'Windows'
      OnClick = btCancelarClick
    end
    object btExcluir: TButton
      Left = 472
      Top = 333
      Width = 81
      Height = 30
      Caption = 'Excluir'
      Enabled = False
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 14
      StyleName = 'Windows'
      OnClick = btExcluirClick
    end
    object btConsultarFarmaceutico: TButton
      Left = 231
      Top = 278
      Width = 70
      Height = 27
      Caption = 'Consultar'
      Enabled = False
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 7
      StyleName = 'Windows'
      OnClick = btConsultarFarmaceuticoClick
    end
    object lbListaProcedimento: TCheckListBox
      Left = 17
      Top = 395
      Width = 536
      Height = 150
      Enabled = False
      ItemHeight = 17
      TabOrder = 15
      OnClickCheck = lbListaProcedimentoClickCheck
    end
    object edObservacao: TEdit
      Left = 17
      Top = 222
      Width = 205
      Height = 23
      Enabled = False
      TabOrder = 4
    end
    object edCodigoFarmaceutico: TEdit
      Left = 17
      Top = 280
      Width = 30
      Height = 23
      TabStop = False
      Enabled = False
      TabOrder = 5
    end
    object edNomeFarmaceutico: TEdit
      Left = 53
      Top = 280
      Width = 172
      Height = 23
      TabStop = False
      Enabled = False
      TabOrder = 6
    end
    object btConsultarPaciente: TButton
      Left = 231
      Top = 335
      Width = 70
      Height = 27
      Caption = 'Consultar'
      Enabled = False
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 10
      StyleName = 'Windows'
      OnClick = btConsultarPacienteClick
    end
  end
end
