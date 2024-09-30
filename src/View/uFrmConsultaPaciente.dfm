object FrmConsultaPaciente: TFrmConsultaPaciente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Consulta de Pacientes'
  ClientHeight = 356
  ClientWidth = 406
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
  object pnConsulta: TPanel
    Left = 0
    Top = 0
    Width = 406
    Height = 356
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 402
    ExplicitHeight = 355
    object lbPesquisar: TLabel
      Left = 16
      Top = 19
      Width = 53
      Height = 15
      Caption = 'Pesquisar:'
    end
    object edNomePaciente: TEdit
      Left = 16
      Top = 40
      Width = 289
      Height = 23
      ImeName = 'edNomePaciente'
      TabOrder = 0
    end
    object dgConsultaPaciente: TDBGrid
      Left = 0
      Top = 79
      Width = 406
      Height = 277
      Align = alBottom
      BorderStyle = bsNone
      DataSource = dsConsultaPaciente
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dgConsultaPacienteDblClick
    end
    object btFiltrar: TButton
      Left = 311
      Top = 37
      Width = 81
      Height = 30
      Caption = 'Filtrar'
      ImageIndex = 0
      ImageMargins.Left = 5
      ImageMargins.Top = 5
      ImageMargins.Right = 5
      ImageMargins.Bottom = 5
      StylusHotImageIndex = 0
      TabOrder = 2
      StyleName = 'Windows'
      OnClick = btFiltrarClick
    end
  end
  object dsConsultaPaciente: TDataSource
    AutoEdit = False
    Left = 176
    Top = 256
  end
end
