inherited frmsysglobal: Tfrmsysglobal
  Left = 97
  Top = 34
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#227'o Globais do Sistema'
  ClientHeight = 423
  ClientWidth = 642
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlEscuro: TPanel
    Width = 0
    Height = 423
    inherited lblSeparador: TLabel
      Width = 0
    end
    inherited lblPrograma: TPanel
      Width = 0
      Caption = 'Global'
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
      TabOrder = 2
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
    inherited dbgRegistro: TDBGrid
      Width = 642
      Height = 218
      TabOrder = 3
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'LOCAL'
          Title.Caption = 'Local'
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
    inherited Panel: TPanel
      Top = 248
      Width = 642
      Height = 135
      BevelOuter = bvNone
      TabOrder = 1
      object lbLocal: TLabel
        Left = 8
        Top = 8
        Width = 100
        Height = 13
        Caption = 'Local (15 caracteres)'
        FocusControl = dbLocal
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
      object lbDescricao: TLabel
        Left = 8
        Top = 88
        Width = 128
        Height = 13
        Caption = 'Descri'#231#227'o (100 caracteres)'
        FocusControl = dbDescricao
      end
      object dbLocal: TDBEdit
        Left = 8
        Top = 23
        Width = 150
        Height = 21
        CharCase = ecUpperCase
        DataField = 'LOCAL'
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
      object dbDescricao: TDBEdit
        Left = 8
        Top = 103
        Width = 505
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dtsRegistro
        TabOrder = 3
      end
      object dbAtivo: TDBCheckBox
        Left = 520
        Top = 104
        Width = 97
        Height = 17
        Caption = 'Ativo'
        DataField = 'ATIVO'
        DataSource = dtsRegistro
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 48
    Top = 248
  end
  inherited mtRegistro: TClientDataSet
    object mtRegistroID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroLOCAL: TStringField
      FieldName = 'LOCAL'
      Size = 15
    end
    object mtRegistroCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 30
    end
    object mtRegistroVALOR: TStringField
      FieldName = 'VALOR'
      Size = 100
    end
    object mtRegistroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object mtRegistroATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
  end
end
