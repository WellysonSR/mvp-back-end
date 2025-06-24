object frmCadastroClientes: TfrmCadastroClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 10
  Caption = 'Cadastro de Clientes'
  ClientHeight = 360
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlTituloCadastroClientes: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 554
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -2
    object SpeedButton1: TSpeedButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 77
      Height = 57
      Align = alLeft
      Caption = '&Novo'
      OnClick = SpeedButton1Click
      ExplicitTop = 0
      ExplicitHeight = 61
    end
  end
  object pnlLocalizarClientes: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 74
    Width = 289
    Height = 283
    Align = alLeft
    TabOrder = 1
    object lblLocalizarClientes: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 11
      Width = 274
      Height = 20
      Margins.Left = 10
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Localizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 71
    end
    object edtLocalizarClientes: TEdit
      AlignWithMargins = True
      Left = 11
      Top = 44
      Width = 267
      Height = 23
      Margins.Left = 10
      Margins.Right = 10
      Align = alTop
      TabOrder = 0
      TextHint = 'Comece a digitar...'
      OnChange = edtLocalizarClientesChange
    end
    object dbgClientes: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 73
      Width = 281
      Height = 206
      Align = alClient
      Color = clGrayText
      DataSource = dmConexao.dsClientes
      Options = [dgTitles, dgIndicator, dgRowLines]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object pnlInformacoesClientes: TPanel
    AlignWithMargins = True
    Left = 293
    Top = 74
    Width = 264
    Height = 283
    Align = alRight
    TabOrder = 2
    object lblNome: TLabel
      Left = 28
      Top = 73
      Width = 47
      Height = 20
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
    end
    object lblProfessor: TLabel
      Left = 28
      Top = 170
      Width = 155
      Height = 20
      Caption = 'Professor vinculado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
    end
    object dbedtNome: TDBEdit
      Left = 28
      Top = 99
      Width = 197
      Height = 23
      DataField = 'nome'
      DataSource = dmConexao.dsClientes
      Enabled = False
      TabOrder = 0
    end
    object dbedtProfessorVinculado: TDBEdit
      Left = 28
      Top = 196
      Width = 197
      Height = 23
      DataField = 'nome_professor'
      DataSource = dmConexao.dsClientes
      Enabled = False
      TabOrder = 1
    end
  end
end
