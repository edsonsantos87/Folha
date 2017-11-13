inherited frmsysuser: Tfrmsysuser
  Left = 89
  Top = 72
  HorzScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Configura'#231#227'o de Usu'#225'rios'
  ClientHeight = 423
  ClientWidth = 642
  Visible = False
  WindowState = wsNormal
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
      Caption = 'Usu'#225'rios'
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
      Columns = <
        item
          Expanded = False
          FieldName = 'LOGIN'
          Title.Caption = 'Usu'#225'rio'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHAVE'
          Title.Caption = 'Chave'
          Width = 238
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor (max. 100 caracteres)'
          Width = 230
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
      object lbLogin: TLabel
        Left = 8
        Top = 8
        Width = 100
        Height = 13
        Caption = 'Login (15 caracteres)'
        FocusControl = dbLogin
      end
      object lbChave: TLabel
        Left = 163
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
      object dbLogin: TDBEdit
        Left = 8
        Top = 23
        Width = 150
        Height = 21
        CharCase = ecUpperCase
        DataField = 'LOGIN'
        DataSource = dtsRegistro
        TabOrder = 0
      end
      object dbChave: TDBEdit
        Left = 163
        Top = 23
        Width = 350
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CHAVE'
        DataSource = dtsRegistro
        TabOrder = 1
      end
      object dbValor: TDBEdit
        Left = 8
        Top = 63
        Width = 505
        Height = 21
        DataField = 'VALOR'
        DataSource = dtsRegistro
        TabOrder = 2
      end
      object dbAtivo: TDBCheckBox
        Left = 520
        Top = 64
        Width = 97
        Height = 17
        Caption = 'Ativo'
        DataField = 'ATIVO'
        DataSource = dtsRegistro
        TabOrder = 3
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
    Left = 50
    Top = 144
    object mtRegistroLOGIN: TStringField
      FieldName = 'LOGIN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 15
    end
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
