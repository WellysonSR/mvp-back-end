object frmCadastroProfessores: TfrmCadastroProfessores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 10
  Caption = 'Cadastro de Professores'
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
  object pnlLocalizarProfessor: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 74
    Width = 289
    Height = 283
    Align = alLeft
    TabOrder = 0
    object lblLocalizar: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 11
      Width = 71
      Height = 20
      Margins.Left = 10
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Localizar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
    end
    object dbgProfessores: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 73
      Width = 281
      Height = 206
      Align = alClient
      Color = clGrayText
      DataSource = dmConexao.dsProfessores
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Visible = True
        end>
    end
    object edtLocalizarProfessor: TEdit
      AlignWithMargins = True
      Left = 11
      Top = 44
      Width = 267
      Height = 23
      Margins.Left = 10
      Margins.Right = 10
      Align = alTop
      TabOrder = 1
      TextHint = 'Comece a digitar...'
      OnChange = edtLocalizarProfessorChange
    end
  end
  object pnlTituloCadastroProfessores: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 554
    Height = 65
    Align = alTop
    TabOrder = 1
    object sbtnNovo: TSpeedButton
      Left = 1
      Top = 1
      Width = 80
      Height = 63
      Align = alLeft
      Caption = '&Novo'
      OnClick = sbtnNovoClick
    end
  end
  object pnlInformacoesProfessor: TPanel
    AlignWithMargins = True
    Left = 295
    Top = 74
    Width = 262
    Height = 283
    Align = alRight
    TabOrder = 2
    object lblCodigo: TLabel
      Left = 28
      Top = 41
      Width = 56
      Height = 20
      Caption = 'C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
    end
    object lblLogin: TLabel
      Left = 29
      Top = 178
      Width = 44
      Height = 20
      Caption = 'Login'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 27
      Top = 104
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
    object dbedtCodigoProfessor: TDBEdit
      Left = 28
      Top = 67
      Width = 121
      Height = 23
      BevelOuter = bvNone
      DataField = 'id'
      DataSource = dmConexao.dsProfessores
      Enabled = False
      TabOrder = 0
    end
    object dbedtLoginProfessor: TDBEdit
      Left = 28
      Top = 204
      Width = 185
      Height = 23
      BevelOuter = bvRaised
      DataField = 'usuario'
      DataSource = dmConexao.dsProfessores
      Enabled = False
      TabOrder = 1
    end
    object dbedtNomeProfessor: TDBEdit
      Left = 28
      Top = 130
      Width = 185
      Height = 23
      BevelOuter = bvRaised
      DataField = 'nome'
      DataSource = dmConexao.dsProfessores
      Enabled = False
      TabOrder = 2
    end
  end
end
