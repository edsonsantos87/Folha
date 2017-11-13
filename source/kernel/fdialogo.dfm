inherited FrmDialogo: TFrmDialogo
  Left = 82
  Top = 41
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Cadastro'
  ClientHeight = 402
  ClientWidth = 594
  Visible = False
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Width = 1
    Height = 402
    Visible = False
    ExplicitWidth = 1
    ExplicitHeight = 402
    inherited lblSeparador: TLabel
      Width = 1
      ExplicitWidth = 1
    end
    inherited lblPrograma: TPanel
      Width = 1
      Caption = 'Lota'#231#227'o'
      ExplicitWidth = 1
    end
    inherited pnlPesquisa: TPanel
      Top = 302
      Width = 1
      ExplicitTop = 302
      ExplicitWidth = 1
      inherited lblPesquisa: TLabel
        Width = 1
      end
    end
  end
  inherited PnlClaro: TPanel
    Left = 1
    Width = 593
    Height = 402
    ExplicitLeft = 1
    ExplicitWidth = 593
    ExplicitHeight = 402
    inherited PnlControle: TPanel
      Top = 362
      Width = 593
      TabOrder = 2
      ExplicitTop = 362
      ExplicitWidth = 593
      inherited btnImprimir: TSpeedButton
        OnClick = btnImprimirClick
      end
    end
    inherited PnlTitulo: TPanel
      Width = 593
      UseDockManager = False
      DockSite = True
      ExplicitWidth = 593
      inherited RxTitulo: TLabel
        Width = 101
        Caption = ' '#183' Listagem'
        ExplicitWidth = 101
      end
      inherited PnlFechar: TPanel
        Left = 553
        ExplicitLeft = 553
      end
    end
    object Panel: TPanel
      Left = 0
      Top = 302
      Width = 593
      Height = 60
      Align = alBottom
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 1
      OnExit = PanelExit
    end
    object grdCadastro: TcxGrid
      Left = 0
      Top = 30
      Width = 593
      Height = 272
      Align = alClient
      TabOrder = 3
      object tv: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dtsRegistro
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
  inherited dtsRegistro: TDataSource
    Top = 224
  end
  inherited mtRegistro: TClientDataSet
    StoreDefs = True
    BeforeInsert = mtRegistroBeforeInsert
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    inherited StyloHeader: TcxStyle
      Color = 8270101
    end
  end
end
