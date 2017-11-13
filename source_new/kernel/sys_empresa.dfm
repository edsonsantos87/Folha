inherited frmsysempresa: Tfrmsysempresa
  Left = 88
  Top = 11
  HorzScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Configura'#231#227'o da Empresa Usu'#225'ria'
  ClientHeight = 423
  ClientWidth = 642
  Visible = False
  WindowState = wsNormal
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlEscuro: TPanel
    Width = 0
    Height = 423
    Visible = False
    inherited lblSeparador: TLabel
      Width = 0
    end
    inherited lblPrograma: TLabel
      Width = 0
      Caption = 'Empresa'
    end
    inherited pnlPesquisa: TPanel
      Top = 323
      Width = 0
      inherited lblPesquisa: TLabel
        Width = 0
      end
    end
  end
  inherited PnlClaro: TPanel
    Left = 0
    Width = 642
    Height = 423
    inherited PnlControle: TPanel
      Top = 383
      Width = 642
    end
    inherited PnlTitulo: TPanel
      Width = 642
      inherited RxTitulo: TLabel
        Width = 273
        Caption = ' '#183' Listagem de Configura'#231#245'es'
      end
      inherited PnlFechar: TPanel
        Left = 602
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 30
      Width = 642
      Height = 258
      Align = alClient
      HotTrack = True
      MultiLine = True
      Style = tsButtons
      TabOrder = 2
    end
    object dbgRegistro: TDBGrid
      Tag = 1
      Left = 0
      Top = 30
      Width = 642
      Height = 258
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtsRegistro
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentColor = True
      ParentFont = False
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = dbgRegistroDrawColumnCell
      OnTitleClick = dbgRegistroTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CHAVE'
          Title.Caption = 'Chave'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor (max. 100 caracteres)'
          Width = 380
          Visible = True
        end>
    end
    object Panel: TPanel
      Left = 0
      Top = 288
      Width = 642
      Height = 95
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 4
      OnExit = PanelExit
      object lbChave: TLabel
        Left = 8
        Top = 8
        Width = 105
        Height = 13
        Caption = 'Chave (30 caracteres)'
        FocusControl = dbChave
      end
      object lbValor: TLabel
        Left = 8
        Top = 48
        Width = 104
        Height = 13
        Caption = 'Valor (100 caracteres)'
        FocusControl = dbValor
      end
      object dbChave: TDBEdit
        Left = 8
        Top = 23
        Width = 500
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CHAVE'
        DataSource = dtsRegistro
        TabOrder = 0
      end
      object dbValor: TDBEdit
        Left = 8
        Top = 63
        Width = 500
        Height = 21
        DataField = 'VALOR'
        DataSource = dtsRegistro
        TabOrder = 1
      end
      object dbAtivo: TDBCheckBox
        Left = 520
        Top = 64
        Width = 97
        Height = 17
        Caption = 'Ativo'
        DataField = 'ATIVO'
        DataSource = dtsRegistro
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 48
    Top = 200
  end
  inherited mtRegistro: TClientDataSet
    BeforeInsert = mtRegistroBeforeInsert
    AfterPost = mtRegistroAfterCancel
    Left = 82
    Top = 144
    object mtRegistroCHAVE: TStringField
      FieldName = 'CHAVE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 30
    end
    object mtRegistroVALOR: TStringField
      FieldName = 'VALOR'
      Size = 100
    end
    object mtRegistroATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
end
