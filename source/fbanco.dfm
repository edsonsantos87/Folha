inherited FrmBanco: TFrmBanco
  Left = 140
  Top = 69
  HorzScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Bancos e Ag'#234'ncias Banc'#225'rias'
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
        Width = 193
        Caption = ' '#183' Bancos e Ag'#234'ncias'
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
      ActivePage = TabAgencia
      Align = alClient
      Style = tsButtons
      TabOrder = 2
      OnChange = PageControlChange
      OnChanging = PageControlChanging
      object TabBanco: TTabSheet
        Caption = '&Bancos'
        ImageIndex = 2
        object pnlQuadro: TPanel
          Left = 0
          Top = 232
          Width = 637
          Height = 54
          Align = alBottom
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object lbBanco2: TLabel
            Left = 89
            Top = 9
            Width = 76
            Height = 14
            Caption = 'Nome do Banco'
            FocusControl = dbBanco2
          end
          object lbBanco: TLabel
            Left = 9
            Top = 9
            Width = 33
            Height = 14
            Caption = 'C'#243'digo'
            FocusControl = dbBanco
          end
          object dbBanco: TDBEdit
            Left = 9
            Top = 26
            Width = 75
            Height = 22
            CharCase = ecUpperCase
            DataField = 'IDBANCO'
            DataSource = dtsRegistro
            TabOrder = 0
          end
          object dbBanco2: TDBEdit
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
        object grdBanco: TcxGrid
          Left = 0
          Top = 0
          Width = 637
          Height = 232
          Align = alClient
          TabOrder = 1
          object grdBancoDBTableView1: TcxGridDBTableView
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
            object grdBancoDBTableView1IDBANCO: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'IDBANCO'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
              Width = 80
            end
            object grdBancoDBTableView1NOME: TcxGridDBColumn
              Caption = 'Nome do Banco'
              DataBinding.FieldName = 'NOME'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
              Width = 490
            end
          end
          object grdBancoLevel1: TcxGridLevel
            GridView = grdBancoDBTableView1
          end
        end
      end
      object TabAgencia: TTabSheet
        Caption = '&Ag'#234'ncias'
        object pnlAgencia: TPanel
          Left = 0
          Top = 232
          Width = 637
          Height = 54
          Align = alBottom
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object lbAgencia: TLabel
            Left = 9
            Top = 9
            Width = 33
            Height = 14
            Caption = 'C'#243'digo'
          end
          object lbAgencia2: TLabel
            Left = 89
            Top = 9
            Width = 84
            Height = 14
            Caption = 'Nome da Ag'#234'ncia'
            FocusControl = dbAgencia2
          end
          object dbAgencia2: TDBEdit
            Left = 89
            Top = 26
            Width = 442
            Height = 22
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = dsAgencia
            TabOrder = 1
          end
          object dbAgencia: TDBEdit
            Left = 9
            Top = 26
            Width = 75
            Height = 22
            CharCase = ecUpperCase
            DataField = 'IDAGENCIA'
            DataSource = dsAgencia
            TabOrder = 0
          end
        end
        object grdAgencia: TcxGrid
          Left = 0
          Top = 0
          Width = 637
          Height = 232
          Align = alClient
          TabOrder = 1
          object cxGridDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsAgencia
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
            object cxGridDBTableView1IDAGENCIA: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'IDAGENCIA'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
            end
            object cxGridDBTableView1NOME: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'NOME'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
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
      object dbBancoNome: TDBEdit
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
      object dbBancoID: TDBEdit
        Tag = 1
        Left = 9
        Top = 9
        Width = 75
        Height = 24
        TabStop = False
        Color = clTeal
        DataField = 'IDBANCO'
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
  inherited pnlProgress: TPanel
    inherited imgAguarde: TRxGIFAnimator
      FrameIndex = 11
      Image.Data = {
        C5040000474946383961C3000D00B30D007F7E7DACABA7ACABA67777771B50A6
        10459C62A0FC3E6FBD5D86C990BDFCBEBEBE686868EFEFEFFFFFFFFFFFFF0000
        0021FF0B4E45545343415045322E30030100000021F9040500000D002C000000
        00C3000D000004B7D005B0AABD38EBCDBBFF60288E64590281230C4AEBBE702C
        CF746DDF78AEEF7CEF2B0301A0C5281A8FC8A472C96C3A9FD0A8744AAD565B14
        4591C0ED36BEE0B0784C2E9BCFE8B47ACD6EBBDFE7A2A2A26D20EE78B87ECFEF
        FBFF805F0C730B75078788818A8B8C8D8E6283740C0D0695968F98999A9B6491
        859309A1A29CA4A5A67E9E75A2A3A7ADAEAF9D847505B4B5B0B7B8A6914345B9
        BEBF9B72280356C5C6C7C8C9CACB4E03294226D1D2D3D4D5D6D71C00020E1100
        21F9040500000D002C0B0003000600070000040F90C889AA3D389BCD93FFA057
        8C64040021F9040500000D002C120003000600070000040F90C889AA3D389BCD
        93FFA0578C64040021F9040500000D002C190003000600070000040F90C889AA
        3D389BCD93FFA0578C64040021F9040500000D002C200003000600070000040F
        90C889AA3D389BCD93FFA0578C64040021F9040500000D002C27000300060007
        0000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D002C2E0003
        000600070000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D00
        2C350003000600070000040F90C889AA3D389BCD93FFA0578C64040021F90405
        00000D002C3C0003000600070000040F90C889AA3D389BCD93FFA0578C640400
        21F9040500000D002C430003000600070000040F90C889AA3D389BCD93FFA057
        8C64040021F9040500000D002C4A0003000600070000040F90C889AA3D389BCD
        93FFA0578C64040021F9040500000D002C510003000600070000040F90C889AA
        3D389BCD93FFA0578C64040021F9040500000D002C580003000600070000040F
        90C889AA3D389BCD93FFA0578C64040021F9040500000D002C5F000300060007
        0000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D002C660003
        000600070000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D00
        2C6D0003000600070000040F90C889AA3D389BCD93FFA0578C64040021F90405
        00000D002C740003000600070000040F90C889AA3D389BCD93FFA0578C640400
        21F9040500000D002C7B0003000600070000040F90C889AA3D389BCD93FFA057
        8C64040021F9040500000D002C820003000600070000040F90C889AA3D389BCD
        93FFA0578C64040021F9040500000D002C890003000600070000040F90C889AA
        3D389BCD93FFA0578C64040021F9040500000D002C900003000600070000040F
        90C889AA3D389BCD93FFA0578C64040021F9040500000D002C97000300060007
        0000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D002C9E0003
        000600070000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D00
        2CA50003000600070000040F90C889AA3D389BCD93FFA0578C64040021F90405
        00000D002CAC0003000600070000040F90C889AA3D389BCD93FFA0578C640400
        21F9040500000D002CB30003000600070000040F90C889AA3D389BCD93FFA057
        8C64040021F9040500000D002CBA0003000600070000040F90C889AA3D389BCD
        93FFA0578C6404003B}
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 88
    Top = 144
  end
  object dsAgencia: TDataSource [4]
    AutoEdit = False
    DataSet = cdAgencia
    OnStateChange = dtsRegistroStateChange
    Left = 174
    Top = 144
  end
  inherited mtRegistro: TClientDataSet
    StoreDefs = True
    BeforeInsert = mtRegistroBeforeInsert
    Left = 90
    Top = 200
    object mtRegistroIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      ProviderFlags = [pfInUpdate, pfInKey]
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 88
    Top = 240
    PixelsPerInch = 96
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 176
    Top = 240
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
    object cdAgenciaIDBANCO: TIntegerField
      FieldName = 'IDBANCO'
      ProviderFlags = [pfInUpdate, pfInKey]
    end
    object cdAgenciaIDAGENCIA: TIntegerField
      FieldName = 'IDAGENCIA'
    end
    object cdAgenciaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
end
