inherited FrmBanco: TFrmBanco
  Left = 140
  Top = 69
  HorzScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Bancos e Ag'#234'ncias Banc'#225'rias'
  ClientHeight = 400
  ClientWidth = 600
  Position = poDesktopCenter
  Visible = False
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlEscuro: TPanel
    Width = 1
    Height = 400
    Visible = False
    inherited lblSeparador: TLabel
      Width = 1
    end
    inherited lblPrograma: TPanel
      Width = 1
      Caption = 'Unidades'
    end
    inherited pnlPesquisa: TPanel
      Top = 300
      Width = 1
      inherited lblPesquisa: TLabel
        Width = 1
      end
    end
  end
  inherited PnlClaro: TPanel
    Left = 1
    Width = 599
    Height = 400
    inherited PnlControle: TPanel
      Top = 360
      Width = 599
      inherited btnExcluir: TSpeedButton
        OnClick = btnExcluirClick
      end
      inherited btnEditar: TSpeedButton
        OnClick = btnEditarClick
      end
      inherited btnGravar: TSpeedButton
        OnClick = btnGravarClick
      end
      inherited btnCancelar: TSpeedButton
        OnClick = btnCancelarClick
      end
    end
    inherited PnlTitulo: TPanel
      Width = 599
      inherited RxTitulo: TLabel
        Width = 199
        Caption = ' '#183' Bancos e Ag'#234'ncias'
      end
      inherited PnlFechar: TPanel
        Left = 559
      end
    end
    object PageControl: TPageControl
      Left = 0
      Top = 70
      Width = 599
      Height = 290
      ActivePage = TabAgencia
      Align = alClient
      Style = tsButtons
      TabIndex = 1
      TabOrder = 2
      OnChange = PageControlChange
      OnChanging = PageControlChanging
      object TabBanco: TTabSheet
        Caption = '&Bancos'
        ImageIndex = 2
        object dbgBanco: TDBGrid
          Tag = 1
          Left = 0
          Top = 0
          Width = 591
          Height = 209
          Align = alClient
          BorderStyle = bsNone
          DataSource = dtsRegistro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgBancoDrawColumnCell
          OnTitleClick = dbgBancoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'IDBANCO'
              Title.Caption = 'C'#243'digo'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome do Banco'
              Width = 490
              Visible = True
            end>
        end
        object pnlQuadro: TPanel
          Left = 0
          Top = 209
          Width = 591
          Height = 50
          Align = alBottom
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 1
          object lbBanco2: TLabel
            Left = 83
            Top = 8
            Width = 77
            Height = 13
            Caption = 'Nome do Banco'
            FocusControl = dbBanco2
          end
          object lbBanco: TLabel
            Left = 8
            Top = 8
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = dbBanco
          end
          object dbBanco: TDBEdit
            Left = 8
            Top = 24
            Width = 70
            Height = 21
            CharCase = ecUpperCase
            DataField = 'IDBANCO'
            DataSource = dtsRegistro
            TabOrder = 0
          end
          object dbBanco2: TDBEdit
            Left = 83
            Top = 24
            Width = 400
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = dtsRegistro
            TabOrder = 1
          end
        end
      end
      object TabAgencia: TTabSheet
        Caption = '&Ag'#234'ncias'
        object dbgAgencia: TDBGrid
          Tag = 1
          Left = 0
          Top = 0
          Width = 591
          Height = 209
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsAgencia
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = dbgBancoDrawColumnCell
          OnTitleClick = dbgBancoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'IDAGENCIA'
              Title.Caption = 'C'#243'digo'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome da Ag'#234'ncia'
              Width = 490
              Visible = True
            end>
        end
        object pnlAgencia: TPanel
          Left = 0
          Top = 209
          Width = 591
          Height = 50
          Align = alBottom
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 1
          object lbAgencia: TLabel
            Left = 8
            Top = 8
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object lbAgencia2: TLabel
            Left = 83
            Top = 8
            Width = 85
            Height = 13
            Caption = 'Nome da Ag'#234'ncia'
            FocusControl = dbAgencia2
          end
          object dbAgencia2: TDBEdit
            Left = 83
            Top = 24
            Width = 410
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = dsAgencia
            TabOrder = 1
          end
          object dbAgencia: TDBEdit
            Left = 8
            Top = 24
            Width = 70
            Height = 21
            CharCase = ecUpperCase
            DataField = 'IDAGENCIA'
            DataSource = dsAgencia
            TabOrder = 0
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 30
      Width = 599
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 3
      object dbBancoNome: TDBEdit
        Tag = 1
        Left = 83
        Top = 8
        Width = 480
        Height = 24
        TabStop = False
        Color = clTeal
        DataField = 'NOME'
        DataSource = dtsRegistro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbBancoID: TDBEdit
        Tag = 1
        Left = 8
        Top = 8
        Width = 70
        Height = 24
        TabStop = False
        Color = clTeal
        DataField = 'IDBANCO'
        DataSource = dtsRegistro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 88
    Top = 144
  end
  inherited mtRegistro: TClientDataSet
    StoreDefs = True
    BeforeInsert = mtRegistroBeforeInsert
    Left = 90
    Top = 200
    object mtRegistroIDBANCO: TStringField
      FieldName = 'IDBANCO'
      ProviderFlags = [pfInUpdate, pfInKey]
      Size = 3
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object cdAgencia: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeInsert = mtRegistroBeforeInsert
    BeforeEdit = mtRegistroBeforeEdit
    BeforePost = mtRegistroBeforePost
    AfterPost = mtRegistroAfterPost
    AfterCancel = mtRegistroAfterCancel
    BeforeDelete = mtRegistroBeforeDelete
    OnNewRecord = mtRegistroNewRecord
    Left = 176
    Top = 200
    object cdAgenciaIDBANCO: TStringField
      FieldName = 'IDBANCO'
      ProviderFlags = [pfInUpdate, pfInKey]
      Size = 3
    end
    object cdAgenciaIDAGENCIA: TStringField
      FieldName = 'IDAGENCIA'
      ProviderFlags = [pfInUpdate, pfInKey]
      OnGetText = cdAgenciaIDAGENCIAGetText
      Size = 5
    end
    object cdAgenciaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object dsAgencia: TDataSource
    AutoEdit = False
    DataSet = cdAgencia
    OnStateChange = dtsRegistroStateChange
    Left = 174
    Top = 144
  end
end
