object FrmCadastroFarmaceutico: TFrmCadastroFarmaceutico
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Farmaceutico'
  ClientHeight = 263
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnFarmaceutico: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 263
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 344
    ExplicitHeight = 262
    object lDataRegistro: TLabel
      Left = 17
      Top = 206
      Width = 86
      Height = 15
      Caption = 'Data de Registro'
    end
    object lbNome: TLabel
      Left = 17
      Top = 88
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lbCodigo: TLabel
      Left = 17
      Top = 30
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lbCRF: TLabel
      Left = 17
      Top = 147
      Width = 21
      Height = 15
      Caption = 'CRF'
    end
    object edNome: TEdit
      Left = 17
      Top = 109
      Width = 209
      Height = 23
      Enabled = False
      TabOrder = 2
    end
    object edCodigo: TEdit
      Left = 17
      Top = 51
      Width = 97
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object btSalvar: TButton
      Left = 261
      Top = 74
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
      TabOrder = 5
      StyleName = 'Windows'
      OnClick = btSalvarClick
    end
    object btCancelar: TButton
      Left = 261
      Top = 174
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
      TabOrder = 6
      StyleName = 'Windows'
      OnClick = btCancelarClick
    end
    object btAlterar: TButton
      Left = 261
      Top = 124
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
      TabOrder = 7
      StyleName = 'Windows'
      OnClick = btAlterarClick
    end
    object btExcluir: TButton
      Left = 261
      Top = 224
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
      TabOrder = 8
      StyleName = 'Windows'
      OnClick = btExcluirClick
    end
    object btIncluir: TButton
      Left = 261
      Top = 24
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
    object edDataRegistro: TJvDateEdit
      Left = 17
      Top = 227
      Width = 121
      Height = 23
      Enabled = False
      ShowNullDate = False
      TabOrder = 4
    end
    object edCRF: TEdit
      Left = 17
      Top = 168
      Width = 209
      Height = 23
      Enabled = False
      TabOrder = 3
    end
  end
end
