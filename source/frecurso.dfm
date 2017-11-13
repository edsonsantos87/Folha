inherited FrmRecurso: TFrmRecurso
  Top = 49
  Caption = 'Recursos'
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlClaro: TPanel
    inherited PnlTitulo: TPanel
      inherited RxTitulo: TLabel
        Width = 223
        Caption = ' '#183' Listagem de Recursos'
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
      object dbID: TDBEdit
        Left = 9
        Top = 26
        Width = 86
        Height = 22
        DataField = 'IDRECURSO'
        DataSource = dtsRegistro
        TabOrder = 0
      end
      object dbNome: TDBEdit
        Left = 100
        Top = 26
        Width = 431
        Height = 22
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dtsRegistro
        TabOrder = 1
      end
    end
    inherited grdCadastro: TcxGrid
      inherited tv: TcxGridDBTableView
        object tvIDRECURSO: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'IDRECURSO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
        end
        object tvNOME: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 460
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
    Top = 232
    object mtRegistroIDRECURSO: TIntegerField
      FieldName = 'IDRECURSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 80
    Top = 200
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 80
    Top = 232
  end
end
