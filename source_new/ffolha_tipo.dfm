inherited FrmFolhaTipo: TFrmFolhaTipo
  Left = 140
  Top = 69
  HorzScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Tipos de Folhas e Situa'#231#245'es de Funcion'#225'rios'
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
        Width = 423
        Caption = ' '#183' Tipos de Folha e Situa'#231#245'es de Funcion'#225'rio'
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
      ActivePage = TabTipo
      Align = alClient
      Style = tsButtons
      TabIndex = 0
      TabOrder = 2
      OnChange = PageControlChange
      OnChanging = PageControlChanging
      object TabTipo: TTabSheet
        Caption = '&Tipos de Folhas'
        ImageIndex = 2
        object dbgTipo: TDBGrid
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
          OnDrawColumnCell = dbgTipoDrawColumnCell
          OnTitleClick = dbgTipoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'IDFOLHA_TIPO'
              Title.Caption = 'C'#243'digo'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Descri'#231#227'o'
              Width = 430
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Caption = 'Tipos'
              Width = 50
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
          object lbTipoNome: TLabel
            Left = 83
            Top = 8
            Width = 87
            Height = 13
            Caption = 'Descri'#231#227'o do Tipo'
            FocusControl = dbTipoNome
          end
          object lbTipo: TLabel
            Left = 8
            Top = 8
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = dbTipo
          end
          object dbTipo: TDBEdit
            Left = 8
            Top = 24
            Width = 70
            Height = 21
            CharCase = ecUpperCase
            DataField = 'IDFOLHA_TIPO'
            DataSource = dtsRegistro
            TabOrder = 0
          end
          object dbTipoNome: TDBEdit
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
      object TabSituacao: TTabSheet
        Caption = '&Situa'#231#245'es de Funcion'#225'rios'
        object dbgSituacao: TDBGrid
          Tag = 1
          Left = 0
          Top = 0
          Width = 591
          Height = 259
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsSituacao
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
          OnDrawColumnCell = dbgTipoDrawColumnCell
          OnTitleClick = dbgTipoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'IDSITUACAO'
              Title.Caption = 'C'#243'digo'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Descri'#231#227'o da Situa'#231#227'o'
              Width = 490
              Visible = True
            end>
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
      object dbTipoNome2: TDBEdit
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
      object dbTipo2: TDBEdit
        Tag = 1
        Left = 8
        Top = 8
        Width = 70
        Height = 24
        TabStop = False
        Color = clTeal
        DataField = 'IDFOLHA_TIPO'
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
    Top = 144
  end
  inherited mtRegistro: TClientDataSet
    ProviderName = 'dpTipo'
    StoreDefs = True
    BeforeInsert = mtRegistroBeforeInsert
    Left = 130
    Top = 144
    object mtRegistroIDBANCO: TStringField
      FieldName = 'IDFOLHA_TIPO'
      ProviderFlags = [pfInUpdate, pfInKey]
      Size = 3
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object mtRegistroQTDE: TIntegerField
      FieldName = 'QTDE'
    end
  end
  object cdSituacao: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dpSituacao'
    StoreDefs = True
    BeforeInsert = mtRegistroBeforeInsert
    BeforeEdit = mtRegistroBeforeEdit
    BeforePost = mtRegistroBeforePost
    AfterPost = mtRegistroAfterPost
    AfterCancel = mtRegistroAfterCancel
    BeforeDelete = mtRegistroBeforeDelete
    OnNewRecord = mtRegistroNewRecord
    Left = 128
    Top = 224
    object cdSituacaoIDFOLHA_TIPO: TStringField
      FieldName = 'IDFOLHA_TIPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 1
    end
    object cdSituacaoIDSITUACAO: TStringField
      FieldName = 'IDSITUACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 2
    end
    object cdSituacaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
      Size = 30
    end
  end
  object dsSituacao: TDataSource
    AutoEdit = False
    DataSet = cdSituacao
    OnStateChange = dtsRegistroStateChange
    Left = 62
    Top = 224
  end
end
