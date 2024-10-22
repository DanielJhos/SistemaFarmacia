object FrmCadastroProcedimento: TFrmCadastroProcedimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Farmaceutico'
  ClientHeight = 217
  ClientWidth = 504
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
    Width = 504
    Height = 217
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 344
    ExplicitHeight = 262
    object lbDescricao: TLabel
      Left = 17
      Top = 88
      Width = 51
      Height = 15
      Caption = 'Descricao'
    end
    object lbTipo: TLabel
      Left = 17
      Top = 30
      Width = 117
      Height = 15
      Caption = 'Tipo de Procedimento'
    end
    object lbValorUnitario: TLabel
      Left = 17
      Top = 147
      Width = 71
      Height = 15
      Caption = 'Valor Unit'#225'rio'
    end
    object edDescricao: TEdit
      Left = 17
      Top = 109
      Width = 272
      Height = 23
      Enabled = False
      TabOrder = 2
    end
    object cbTipoProcedimento: TJvComboBox
      Left = 17
      Top = 51
      Width = 368
      Height = 23
      Style = csDropDownList
      Enabled = False
      ParentFlat = False
      TabOrder = 1
      Text = 'Nenhum'
      Items.Strings = (
        'Nenhum'
        'Aten'#231#227'o Farmac'#234'utica Domiciliar'
        'Aferi'#231#227'o de Press'#227'o Arterial (PA)'
        'Aferi'#231#227'o de Temperatura Corporal'
        'Aferi'#231#227'o de Glicemia Capilar'
        'Administra'#231#227'o de Medicamentos - Inala'#231#227'o'
        'Administra'#231#227'o de Medicamentos - Aplica'#231#227'o de Injet'#225'veis')
      ItemIndex = 0
    end
    object btSalvar: TButton
      Left = 413
      Top = 52
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
      Left = 413
      Top = 127
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
      TabOrder = 5
      StyleName = 'Windows'
      OnClick = btCancelarClick
    end
    object btAlterar: TButton
      Left = 413
      Top = 90
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
      TabOrder = 6
      StyleName = 'Windows'
      OnClick = btAlterarClick
    end
    object btExcluir: TButton
      Left = 413
      Top = 165
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
      Left = 413
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
    object edValorUnitario: TEdit
      Left = 17
      Top = 168
      Width = 272
      Height = 23
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 3
      Text = '0.00'
    end
  end
end
