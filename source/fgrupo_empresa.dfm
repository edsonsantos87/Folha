inherited FrmGrupoEmpresa: TFrmGrupoEmpresa
  Left = 369
  Top = 113
  Caption = 'Grupo de Empresas'
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlClaro: TPanel
    inherited PnlTitulo: TPanel
      inherited RxTitulo: TLabel
        Width = 213
        Caption = ' '#183' Grupos de Empresas'
        ExplicitWidth = 213
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
        Top = 25
        Width = 86
        Height = 22
        DataField = 'IDGE'
        DataSource = dtsRegistro
        TabOrder = 0
      end
      object dbNome: TDBEdit
        Left = 100
        Top = 25
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
        object tvIDGE: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'IDGE'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 60
        end
        object tvNOME: TcxGridDBColumn
          DataBinding.FieldName = 'NOME'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 460
        end
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 96
    Top = 200
  end
  inherited mtRegistro: TClientDataSet
    object mtRegistroIDGE: TIntegerField
      FieldName = 'IDGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 96
    Top = 168
    PixelsPerInch = 96
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 64
    Top = 200
  end
end
