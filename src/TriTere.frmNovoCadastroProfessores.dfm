object frmNovoCadastroProfessores: TfrmNovoCadastroProfessores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = 'Cadastro de Professores'
  ClientHeight = 171
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  object lblUsuario: TLabel
    Left = 376
    Top = 24
    Width = 53
    Height = 28
    Caption = 'Login:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblNome: TLabel
    Left = 16
    Top = 24
    Width = 58
    Height = 28
    Caption = 'Nome:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object sbtnGravar: TSpeedButton
    Left = 576
    Top = 128
    Width = 89
    Height = 35
    Caption = '&Gravar'
    OnClick = sbtnGravarClick
  end
  object sbtnCancelar: TSpeedButton
    Left = 456
    Top = 128
    Width = 89
    Height = 35
    Caption = '&Cancelar'
  end
  object lblSenha: TLabel
    Left = 16
    Top = 94
    Width = 57
    Height = 28
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object edtNome: TEdit
    Left = 16
    Top = 58
    Width = 289
    Height = 23
    TabOrder = 0
    TextHint = 'Informe o nome do cliente'
  end
  object edtSenha: TEdit
    Left = 16
    Top = 128
    Width = 289
    Height = 23
    TabOrder = 1
    TextHint = 'Informe a senha'
  end
  object chkMostrarSenha: TCheckBox
    Left = 311
    Top = 131
    Width = 97
    Height = 17
    Caption = 'Mostrar senha'
    TabOrder = 2
    OnClick = chkMostrarSenhaClick
  end
  object edtUsuario: TEdit
    Left = 376
    Top = 58
    Width = 289
    Height = 23
    TabOrder = 3
    TextHint = 'Informe o nome do cliente'
  end
end
