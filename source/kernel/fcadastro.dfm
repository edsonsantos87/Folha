inherited FrmCadastro: TFrmCadastro
  Left = 160
  Top = 120
  BorderStyle = bsNone
  ClientHeight = 548
  ClientWidth = 722
  FormStyle = fsMDIChild
  OnActivate = FormResize
  OnClose = FormClose
  OnResize = FormResize
  OnShow = FormShow
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Width = 162
    Height = 548
    ExplicitWidth = 162
    inherited lblSeparador: TLabel
      Width = 162
      ExplicitWidth = 162
    end
    inherited lblPrograma: TPanel
      Width = 162
      ExplicitWidth = 162
    end
    inherited pnlPesquisa: TPanel
      Top = 448
      Width = 162
      Visible = True
      ExplicitWidth = 162
      inherited lblPesquisa: TLabel
        Width = 162
      end
      inherited PesquisaTipo: TDBLookupComboBox
        KeyField = 'CHAVE'
        ListField = 'CHAVE'
        ListSource = dtsPesquisa
      end
    end
  end
  inherited PnlClaro: TPanel
    Left = 162
    Width = 560
    Height = 548
    ExplicitLeft = 162
    ExplicitWidth = 560
    inherited PnlControle: TPanel
      Top = 508
      Width = 560
      ExplicitWidth = 560
      inherited btnExcluir: TSpeedButton
        Hint = 'Exclui Registro - [Ctrl+Delete]'
      end
      inherited btnImprimir: TSpeedButton
        OnClick = btnImprimirClick
      end
    end
    inherited PnlTitulo: TPanel
      Width = 560
      ExplicitWidth = 560
      inherited PnlFechar: TPanel
        Left = 431
        Width = 129
        ExplicitLeft = 431
        ExplicitWidth = 129
        inherited RxFechar: TSpeedButton
          Left = 99
          ExplicitLeft = 99
        end
        object btnDetalhar: TSpeedButton
          Left = 4
          Top = 5
          Width = 86
          Height = 22
          Caption = '&Detalhar...'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          Spacing = 5
          OnClick = btnDetalharClick
        end
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 30
      Width = 560
      Height = 478
      ActivePage = TabListagem
      Align = alClient
      Style = tsButtons
      TabOrder = 2
      TabStop = False
      OnChange = PageControl1Change
      ExplicitHeight = 451
      object TabListagem: TTabSheet
        Caption = 'TabListagem'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grdCadastro: TcxGrid
          Left = 0
          Top = 0
          Width = 552
          Height = 419
          Align = alClient
          TabOrder = 0
          object tv: TcxGridDBTableView
            OnDblClick = tvDblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dtsListagem
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnHorzSizing = False
            OptionsCustomize.ColumnMoving = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
          end
          object lv: TcxGridLevel
            GridView = tv
          end
        end
      end
      object TabDetalhe: TTabSheet
        Caption = 'TabDetalhe'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 48
    Top = 328
  end
  object mtListagem: TClientDataSet [5]
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 400
  end
  object dtsListagem: TDataSource [6]
    AutoEdit = False
    DataSet = mtListagem
    Left = 240
    Top = 400
  end
  object mtPesquisa: TClientDataSet [7]
    Aggregates = <>
    IndexFieldNames = 'CHAVE'
    Params = <>
    Left = 402
    Top = 456
    object mtPesquisaCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 30
    end
    object mtPesquisaVALOR: TStringField
      DisplayWidth = 800
      FieldName = 'VALOR'
      Size = 800
    end
    object mtPesquisaACCEPTEMPTY: TBooleanField
      FieldName = 'ACCEPTEMPTY'
    end
    object mtPesquisaACCEPTALL: TBooleanField
      FieldName = 'ACCEPTALL'
    end
  end
  object mtColuna: TClientDataSet [8]
    Aggregates = <>
    Params = <>
    Left = 330
    Top = 456
    object mtColunaCOLUNA: TIntegerField
      FieldName = 'COLUNA'
    end
    object mtColunaTITULO: TStringField
      FieldName = 'TITULO'
      Size = 30
    end
    object mtColunaTAMANHO: TSmallintField
      FieldName = 'TAMANHO'
    end
    object mtColunaDISPLAY: TSmallintField
      FieldName = 'DISPLAY'
    end
    object mtColunaMASCARA: TStringField
      FieldName = 'MASCARA'
      Size = 30
    end
  end
  object dtsPesquisa: TDataSource [9]
    AutoEdit = False
    DataSet = mtPesquisa
    Left = 488
    Top = 456
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    inherited StyloHeader: TcxStyle
      Color = 8270101
    end
  end
  inherited cxLocalizer1: TcxLocalizer
    Top = 288
  end
end
