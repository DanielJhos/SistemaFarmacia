﻿object FrmSistemaFarmaceutico: TFrmSistemaFarmaceutico
  Left = 0
  Top = 0
  Caption = 'Sistema de Servi'#231'oes Farmac'#234'uticos'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mnSistemaFarmaceutico
  Position = poScreenCenter
  TextHeight = 15
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 441
  end
  object mnSistemaFarmaceutico: TMainMenu
    Left = 112
    Top = 144
    object miCadastros: TMenuItem
      Caption = 'Cadastros'
      object miPaciente: TMenuItem
        Caption = 'Cadastro de Paciente'
        OnClick = miPacienteClick
      end
      object miCadastroFarmaceutico: TMenuItem
        Caption = 'Cadastro de Farmac'#234'utico'
        OnClick = miCadastroFarmaceuticoClick
      end
      object miCadastroProcedimento: TMenuItem
        Caption = 'Cadastro de Procedimento'
        OnClick = miCadastroProcedimentoClick
      end
    end
    object Serviços: TMenuItem
      Caption = 'Servi'#231'os'
      ImageName = 'miServicos'
      object miFarmaceutico: TMenuItem
        Caption = 'Farmac'#234'utico'
        OnClick = miFarmaceuticoClick
      end
    end
  end
end
