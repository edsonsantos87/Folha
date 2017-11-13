inherited FrmFolhaTipo: TFrmFolhaTipo
  Left = 140
  Top = 69
  HorzScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Tipos de Folhas e Situa'#231#245'es de Funcion'#225'rios'
  ClientHeight = 431
  ClientWidth = 646
  Position = poDesktopCenter
  Visible = False
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Width = 1
    Height = 431
    Visible = False
    inherited lblSeparador: TLabel
      Width = 1
    end
    inherited lblPrograma: TPanel
      Width = 1
      Caption = 'Unidades'
    end
    inherited pnlPesquisa: TPanel
      Top = 331
      Width = 1
      inherited lblPesquisa: TLabel
        Width = 1
      end
    end
  end
  inherited PnlClaro: TPanel
    Left = 1
    Width = 645
    Height = 431
    inherited PnlControle: TPanel
      Top = 391
      Width = 645
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
      Width = 645
      inherited RxTitulo: TLabel
        Width = 412
        Caption = ' '#183' Tipos de Folha e Situa'#231#245'es de Funcion'#225'rio'
      end
      inherited PnlFechar: TPanel
        Left = 605
      end
    end
    object PageControl: TPageControl
      Left = 0
      Top = 73
      Width = 645
      Height = 318
      ActivePage = TabTipo
      Align = alClient
      Style = tsButtons
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
          Width = 637
          Height = 232
          Align = alClient
          BorderStyle = bsNone
          DataSource = dtsRegistro
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
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
          Top = 232
          Width = 637
          Height = 54
          Align = alBottom
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 1
          object lbTipoNome: TLabel
            Left = 89
            Top = 9
            Width = 87
            Height = 14
            Caption = 'Descri'#231#227'o do Tipo'
            FocusControl = dbTipoNome
          end
          object lbTipo: TLabel
            Left = 9
            Top = 9
            Width = 33
            Height = 14
            Caption = 'C'#243'digo'
            FocusControl = dbTipo
          end
          object dbTipo: TDBEdit
            Left = 9
            Top = 26
            Width = 75
            Height = 22
            CharCase = ecUpperCase
            DataField = 'IDFOLHA_TIPO'
            DataSource = dtsRegistro
            TabOrder = 0
          end
          object dbTipoNome: TDBEdit
            Left = 89
            Top = 26
            Width = 431
            Height = 22
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
          Width = 636
          Height = 279
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsSituacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
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
      Width = 645
      Height = 43
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 3
      object dbTipoNome2: TDBEdit
        Tag = 1
        Left = 89
        Top = 9
        Width = 517
        Height = 24
        TabStop = False
        Color = clTeal
        DataField = 'NOME'
        DataSource = dtsRegistro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbTipo2: TDBEdit
        Tag = 1
        Left = 9
        Top = 9
        Width = 75
        Height = 24
        TabStop = False
        Color = clTeal
        DataField = 'IDFOLHA_TIPO'
        DataSource = dtsRegistro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
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
