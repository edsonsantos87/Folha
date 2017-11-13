inherited FrmPlano: TFrmPlano
  Left = 15
  Top = 46
  Caption = 'Plano de Contas'
  ClientHeight = 538
  ClientWidth = 751
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Height = 538
    inherited lblPrograma: TPanel
      Caption = 'Contas'
    end
    inherited pnlPesquisa: TPanel
      Top = 438
    end
  end
  inherited PnlClaro: TPanel
    Width = 750
    Height = 538
    inherited PnlControle: TPanel
      Top = 498
      Width = 750
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
      Width = 750
      inherited RxTitulo: TLabel
        Width = 287
        Caption = ' '#183' Listagem do Plano de Contas'
      end
      inherited PnlFechar: TPanel
        Left = 710
      end
    end
    inherited Panel: TPanel
      Top = 438
      Width = 750
      object Label1: TLabel
        Left = 9
        Top = 9
        Width = 65
        Height = 14
        Caption = 'Classifica'#231#227'o'
        FocusControl = dbOrdem
      end
      object Label2: TLabel
        Left = 89
        Top = 9
        Width = 95
        Height = 14
        Caption = 'Descri'#231#227'o da Conta'
        FocusControl = dbNome
      end
      object lbID: TLabel
        Left = 530
        Top = 9
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = dbID
      end
      object Label3: TLabel
        Left = 438
        Top = 8
        Width = 75
        Height = 13
        Caption = 'Grupo de Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 590
        Top = 9
        Width = 33
        Height = 14
        Caption = 'Partida'
        FocusControl = dbPartida
      end
      object dbOrdem: TDBEdit
        Left = 9
        Top = 25
        Width = 75
        Height = 22
        DataField = 'CODIGO'
        DataSource = dtsRegistro
        TabOrder = 0
      end
      object dbNome: TDBEdit
        Left = 89
        Top = 25
        Width = 345
        Height = 22
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dtsRegistro
        TabOrder = 1
      end
      object dbID: TDBEdit
        Left = 530
        Top = 25
        Width = 54
        Height = 22
        DataField = 'IDPLANO'
        DataSource = dtsRegistro
        TabOrder = 3
      end
      object dbGrupo: TDBLookupComboBox
        Left = 438
        Top = 25
        Width = 86
        Height = 21
        DataField = 'IDPLANO_GRUPO'
        DataSource = dtsRegistro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object dbTipo: TDBCheckBox
        Left = 649
        Top = 25
        Width = 87
        Height = 18
        Caption = 'Sint'#233'tica'
        DataField = 'TIPO'
        DataSource = dtsRegistro
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'A'
      end
      object dbPartida: TDBEdit
        Left = 590
        Top = 25
        Width = 54
        Height = 22
        DataField = 'IDPARTIDA'
        DataSource = dtsRegistro
        TabOrder = 4
      end
    end
    inherited grdCadastro: TcxGrid
      Width = 750
      Height = 408
      inherited tv: TcxGridDBTableView
        object tvCODIGO2: TcxGridDBColumn
          Caption = 'Classificacao'
          DataBinding.FieldName = 'CODIGO2'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 124
        end
        object tvNOME2: TcxGridDBColumn
          Caption = 'Descricao da Conta'
          DataBinding.FieldName = 'NOME2'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 450
        end
        object tvIDPLANO: TcxGridDBColumn
          Caption = 'Codigo'
          DataBinding.FieldName = 'IDPLANO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
        end
        object tvIDPARTIDA: TcxGridDBColumn
          Caption = 'Partida'
          DataBinding.FieldName = 'IDPARTIDA'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 60
        end
        object tvTIPO: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'TIPO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 40
        end
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 48
    Top = 176
  end
  inherited mtRegistro: TClientDataSet
    AfterCancel = mtRegistroAfterPost
    OnCalcFields = mtRegistroCalcFields
    Left = 50
    Top = 144
    object mtRegistroIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroCODIGO: TStringField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object mtRegistroCODIGO2: TStringField
      FieldKind = fkCalculated
      FieldName = 'CODIGO2'
      ProviderFlags = [pfHidden]
      Calculated = True
    end
    object mtRegistroNOME2: TStringField
      DisplayWidth = 65
      FieldKind = fkCalculated
      FieldName = 'NOME2'
      ProviderFlags = [pfHidden]
      Size = 65
      Calculated = True
    end
    object mtRegistroIDPLANO: TIntegerField
      FieldName = 'IDPLANO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroTIPO: TStringField
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object mtRegistroRETIFICADORA_X: TSmallintField
      FieldName = 'RETIFICADORA_X'
    end
    object mtRegistroIDPLANO_GRUPO: TIntegerField
      FieldName = 'IDPLANO_GRUPO'
    end
    object mtRegistroIDPARTIDA: TIntegerField
      FieldName = 'IDPARTIDA'
      DisplayFormat = '0;;""'
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 80
    Top = 144
    object StyloCourier: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
    end
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 80
    Top = 176
  end
end
