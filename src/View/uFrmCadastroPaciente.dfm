object FrmCadastroPaciente: TFrmCadastroPaciente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Paciente'
  ClientHeight = 209
  ClientWidth = 346
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
  object pnPaciente: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 209
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 330
    ExplicitHeight = 205
    object lDataNascimento: TLabel
      Left = 17
      Top = 142
      Width = 107
      Height = 15
      Caption = 'Data de Nascimento'
    end
    object lbNome: TLabel
      Left = 17
      Top = 86
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
    object edNome: TEdit
      Left = 17
      Top = 107
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
      Top = 51
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
      TabOrder = 4
      StyleName = 'Windows'
      OnClick = btSalvarClick
    end
    object btCancelar: TButton
      Left = 261
      Top = 123
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
      Top = 87
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
      TabOrder = 5
      StyleName = 'Windows'
      OnClick = btAlterarClick
    end
    object btExcluir: TButton
      Left = 261
      Top = 160
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
      TabOrder = 7
      StyleName = 'Windows'
      OnClick = btExcluirClick
    end
    object btIncluir: TButton
      Left = 261
      Top = 15
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
    object edDataNascimento: TJvDateEdit
      Left = 17
      Top = 163
      Width = 121
      Height = 23
      Enabled = False
      ShowNullDate = False
      TabOrder = 3
    end
  end
end
