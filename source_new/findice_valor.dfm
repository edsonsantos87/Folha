inherited FrmIndiceValor: TFrmIndiceValor
  Left = 108
  Top = 134
  Caption = 'Indices - Valores por Compet'#234'ncia'
  ClientHeight = 456
  ClientWidth = 638
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Width = 0
    Height = 456
    inherited lblSeparador: TLabel
      Width = 0
    end
    inherited lblPrograma: TPanel
      Width = 0
      Caption = 'Tabelas'
    end
    inherited pnlPesquisa: TPanel
      Top = 356
      Width = 0
      inherited lblPesquisa: TLabel
        Width = 0
      end
    end
  end
  inherited PnlClaro: TPanel
    Left = 0
    Width = 638
    Height = 456
    inherited PnlControle: TPanel
      Top = 416
      Width = 638
      TabOrder = 2
    end
    inherited PnlTitulo: TPanel
      Width = 638
      inherited RxTitulo: TLabel
        Width = 82
        Caption = ' '#183' Indices'
      end
      inherited PnlFechar: TPanel
        Left = 598
      end
    end
    inherited dbgRegistro: TDBGrid
      Width = 638
      Height = 326
      Columns = <
        item
          Expanded = False
          FieldName = 'IDINDICE'
          Title.Caption = 'ID Ind'#237'ce'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome do Indice'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPETENCIA'
          Title.Caption = 'Compet'#234'ncia'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Width = 100
          Visible = True
        end>
    end
    inherited Panel: TPanel
      Top = 356
      Width = 638
      TabOrder = 3
      object lbCodigo: TLabel
        Left = 9
        Top = 9
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel
        Left = 79
        Top = 9
        Width = 259
        Height = 14
        Caption = 'Nome do Indice (Tecle F12 para pesquisar os indices)'
      end
      object lbCompetencia: TLabel
        Left = 386
        Top = 9
        Width = 62
        Height = 14
        Caption = 'Compet'#234'ncia'
        FocusControl = dbCompetencia
      end
      object lbValor: TLabel
        Left = 488
        Top = 9
        Width = 26
        Height = 14
        Caption = 'Valor'
        FocusControl = dbValor
      end
      object dbCodigo: TDBEdit
        Left = 9
        Top = 26
        Width = 64
        Height = 22
        TabStop = False
        DataField = 'IDINDICE'
        DataSource = dtsRegistro
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
      end
      object dbNome: TDBEdit
        Left = 79
        Top = 26
        Width = 301
        Height = 22
        TabStop = False
        DataField = 'NOME'
        DataSource = dtsRegistro
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object dbCompetencia: TDBEdit
        Left = 386
        Top = 26
        Width = 96
        Height = 22
        DataField = 'COMPETENCIA'
        DataSource = dtsRegistro
        TabOrder = 2
      end
      object dbValor: TDBEdit
        Left = 488
        Top = 26
        Width = 108
        Height = 22
        DataField = 'VALOR'
        DataSource = dtsRegistro
        TabOrder = 3
      end
    end
  end
  inherited dtsRegistro: TDataSource
    AutoEdit = True
    Left = 48
    Top = 200
  end
  inherited mtRegistro: TClientDataSet
    FieldDefs = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
      end
      item
        Name = 'IDINDICE'
        DataType = ftInteger
      end
      item
        Name = 'COMPETENCIA'
        DataType = ftDate
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end>
    Left = 48
    Top = 256
    object mtRegistroIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInKey]
    end
    object mtRegistroIDINDICE: TIntegerField
      FieldName = 'IDINDICE'
      ProviderFlags = [pfInKey]
    end
    object mtRegistroCOMPETENCIA: TDateField
      FieldName = 'COMPETENCIA'
      ProviderFlags = [pfInKey]
    end
    object mtRegistroVALOR: TCurrencyField
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.000'
      Precision = 2
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfHidden]
      Size = 50
    end
  end
end
