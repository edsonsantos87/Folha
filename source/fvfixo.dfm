inherited FrmVFixo: TFrmVFixo
  Caption = 'Valores Fixos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlClaro: TPanel
    inherited PnlTitulo: TPanel
      inherited RxTitulo: TLabel
        Width = 260
        Caption = ' '#183' Listagem de Valores Fixos'
      end
    end
    inherited Panel: TPanel
      object lbID: TLabel
        Left = 9
        Top = 9
        Width = 53
        Height = 14
        Caption = 'ID (C'#243'digo)'
        FocusControl = dbID
      end
      object Label2: TLabel
        Left = 100
        Top = 9
        Width = 27
        Height = 14
        Caption = 'Nome'
        FocusControl = dbNome
      end
      object lbValor: TLabel
        Left = 482
        Top = 9
        Width = 25
        Height = 14
        Caption = 'Valor'
        FocusControl = dbValor
      end
      object dbID: TDBEdit
        Left = 9
        Top = 26
        Width = 86
        Height = 22
        DataField = 'IDVFIXO'
        DataSource = dtsRegistro
        TabOrder = 0
      end
      object dbNome: TDBEdit
        Left = 100
        Top = 26
        Width = 377
        Height = 22
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dtsRegistro
        TabOrder = 1
      end
      object dbValor: TDBEdit
        Left = 482
        Top = 26
        Width = 97
        Height = 22
        DataField = 'VALOR'
        DataSource = dtsRegistro
        TabOrder = 2
      end
    end
    inherited grdCadastro: TcxGrid
      inherited tv: TcxGridDBTableView
        object tvIDVFIXO: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'IDVFIXO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 60
        end
        object tvNOME: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 380
        end
        object tvVALOR: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'VALOR'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 80
        end
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 48
    Top = 200
  end
  inherited mtRegistro: TClientDataSet
    AfterPost = mtRegistroAfterCancel
    Left = 48
    Top = 256
    object mtRegistroIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroIDVFIXO: TIntegerField
      FieldName = 'IDVFIXO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object mtRegistroVALOR: TCurrencyField
      FieldName = 'VALOR'
      DisplayFormat = ',0.##'
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 80
    Top = 256
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 80
    Top = 200
  end
end
