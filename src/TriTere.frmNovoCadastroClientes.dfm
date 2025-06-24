object frmNovoCadastroClientes: TfrmNovoCadastroClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 5
  Caption = 'Cadastrar - Clientes'
  ClientHeight = 171
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object lblProfessor: TLabel
    Left = 376
    Top = 24
    Width = 175
    Height = 28
    Caption = 'Professor vinculado:'
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
    OnClick = sbtnCancelarClick
  end
  object edtNome: TEdit
    Left = 16
    Top = 58
    Width = 289
    Height = 23
    TabOrder = 0
    TextHint = 'Informe o nome do aluno...'
  end
  object cbProfessores: TDBLookupComboBox
    Left = 376
    Top = 58
    Width = 281
    Height = 23
    TabOrder = 1
  end
end
