inherited FrmEvento_Grupo: TFrmEvento_Grupo
  Left = 111
  Top = 36
  Caption = 'Cadastro de Grupos de Evento'
  ClientHeight = 446
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Height = 446
    inherited pnlPesquisa: TPanel
      Top = 346
    end
  end
  inherited PnlClaro: TPanel
    Height = 446
    inherited PnlControle: TPanel
      Top = 406
    end
    inherited PnlTitulo: TPanel
      inherited RxTitulo: TLabel
        Width = 302
        Caption = ' '#183' Listagem de Grupos de Evento'
      end
    end
    inherited Panel: TPanel
      Top = 316
      Height = 90
      object Label2: TLabel
        Left = 68
        Top = 9
        Width = 27
        Height = 14
        Caption = 'Nome'
        FocusControl = dbNome
      end
      object lbID: TLabel
        Left = 9
        Top = 9
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = dbID
      end
      object Label1: TLabel
        Left = 2
        Top = 60
        Width = 589
        Height = 28
        Align = alBottom
        Alignment = taCenter
        Caption = 
          'Os c'#243'digo de n'#250'meros 1 a 50 est'#227'o reservados para uso interno do' +
          ' sistema, para uso particular utilize os c'#243'digos a partir do n'#250'm' +
          'ero 51 (ciquenta e um).'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object dbNome: TDBEdit
        Left = 68
        Top = 25
        Width = 377
        Height = 22
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dtsRegistro
        TabOrder = 1
      end
      object dbID: TDBEdit
        Left = 9
        Top = 25
        Width = 53
        Height = 22
        DataField = 'IDGRUPO'
        DataSource = dtsRegistro
        TabOrder = 0
      end
    end
    inherited grdCadastro: TcxGrid
      Height = 286
      inherited tv: TcxGridDBTableView
        object tvIDGRUPO: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'IDGRUPO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 60
        end
        object tvNOME: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 465
        end
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Top = 216
  end
  inherited mtRegistro: TClientDataSet
    AfterPost = mtRegistroAfterCancel
    object mtRegistroIDGRUPO: TIntegerField
      FieldName = 'IDGRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 104
    Top = 216
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 104
    Top = 168
  end
end
