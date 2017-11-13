inherited FrmProgramado: TFrmProgramado
  Left = 49
  Top = 54
  Caption = 'Eventos Programados'
  ClientHeight = 501
  ClientWidth = 638
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Width = 0
    Height = 501
    inherited lblSeparador: TLabel
      Width = 0
    end
    inherited lblPrograma: TPanel
      Width = 0
      Caption = 'Tabelas'
    end
    inherited pnlPesquisa: TPanel
      Top = 401
      Width = 0
      inherited lblPesquisa: TLabel
        Width = 0
      end
    end
  end
  inherited PnlClaro: TPanel
    Left = 0
    Width = 638
    Height = 501
    inherited PnlControle: TPanel
      Top = 461
      Width = 638
    end
    inherited PnlTitulo: TPanel
      Width = 638
      inherited RxTitulo: TLabel
        Width = 399
        Caption = ' '#183' Eventos Programados para Funcion'#225'rios'
      end
      inherited PnlFechar: TPanel
        Left = 598
      end
    end
    inherited Panel: TPanel
      Top = 342
      Width = 638
      Height = 119
      TabOrder = 4
      object lbEvento: TLabel
        Left = 9
        Top = 9
        Width = 45
        Height = 14
        Caption = 'ID E&vento'
        FocusControl = dbEvento
      end
      object lbEvento2: TLabel
        Left = 100
        Top = 9
        Width = 100
        Height = 14
        Caption = 'Descri'#231#227'o do Evento'
        FocusControl = dbEvento2
      end
      object lbInformado: TLabel
        Left = 439
        Top = 9
        Width = 76
        Height = 14
        Caption = 'Valor Informado'
      end
      object dbEvento: TAKDBEdit
        Left = 9
        Top = 26
        Width = 62
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDEVENTO'
        DataSource = dtsRegistro
        TabOrder = 0
        ButtonSpacing = 3
        OnButtonClick = dbEventoButtonClick
      end
      object dbEvento2: TDBEdit
        Tag = 1
        Left = 100
        Top = 26
        Width = 334
        Height = 22
        TabStop = False
        DataField = 'EVENTO'
        DataSource = dtsRegistro
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object dbInformado: TDBEdit
        Left = 439
        Top = 26
        Width = 97
        Height = 22
        DataField = 'INFORMADO'
        DataSource = dtsRegistro
        TabOrder = 2
      end
      object dbPeriodo: TGroupBox
        Left = 9
        Top = 52
        Width = 592
        Height = 59
        Caption = 'Per'#237'odo'
        TabOrder = 3
        object lblA: TLabel
          Left = 174
          Top = 27
          Width = 6
          Height = 14
          Caption = 'a'
        end
        object lblDe: TLabel
          Left = 9
          Top = 27
          Width = 13
          Height = 14
          Caption = 'De'
        end
        object dbSuspenso: TDBCheckBox
          Tag = 13
          Left = 345
          Top = 25
          Width = 87
          Height = 18
          Caption = 'Suspenso'
          DataField = 'SUSPENSO_X'
          DataSource = dtsRegistro
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbInicio: TDBEdit
          Left = 48
          Top = 23
          Width = 108
          Height = 22
          DataField = 'INICIO'
          DataSource = dtsRegistro
          TabOrder = 0
        end
        object dbTermino: TDBEdit
          Left = 206
          Top = 23
          Width = 107
          Height = 22
          DataField = 'TERMINO'
          DataSource = dtsRegistro
          TabOrder = 1
        end
      end
    end
    inherited grdCadastro: TcxGrid
      Top = 90
      Width = 638
      Height = 252
      inherited tv: TcxGridDBTableView
        object tvIDEVENTO: TcxGridDBColumn
          Caption = 'ID Evento'
          DataBinding.FieldName = 'IDEVENTO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 75
        end
        object tvEVENTO: TcxGridDBColumn
          Caption = 'Descri'#231#227'o do Evento'
          DataBinding.FieldName = 'EVENTO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 320
        end
        object tvTIPO_EVENTO: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'TIPO_EVENTO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 50
        end
        object tvTIPO_CALCULO: TcxGridDBColumn
          Caption = 'C'#225'lculo'
          DataBinding.FieldName = 'TIPO_CALCULO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 60
        end
        object tvINFORMADO: TcxGridDBColumn
          Caption = 'Valor Informado'
          DataBinding.FieldName = 'INFORMADO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 130
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 30
      Width = 638
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      Color = 8101828
      TabOrder = 1
      object lbFunc: TLabel
        Left = 9
        Top = 9
        Width = 39
        Height = 14
        Caption = 'ID &Func.'
        FocusControl = dbFunc
      end
      object lbFunc2: TLabel
        Left = 102
        Top = 9
        Width = 101
        Height = 14
        Caption = 'Nome do Funcion'#225'rio'
        FocusControl = dbFunc2
      end
      object lbTipo: TLabel
        Left = 474
        Top = 9
        Width = 64
        Height = 14
        Caption = 'Tipo de Folha'
        FocusControl = dbTipo
        ParentShowHint = False
        ShowHint = False
      end
      object dbFunc: TAKDBEdit
        Left = 9
        Top = 26
        Width = 64
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDFUNCIONARIO'
        DataSource = dsFuncionario
        TabOrder = 0
        ButtonSpacing = 3
        OnButtonClick = dbFuncButtonClick
      end
      object dbFunc2: TDBEdit
        Left = 102
        Top = 26
        Width = 366
        Height = 22
        TabStop = False
        DataField = 'FUNCIONARIO'
        DataSource = dsFuncionario
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object dbTipo: TAKDBEdit
        Left = 474
        Top = 26
        Width = 32
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDFOLHA_TIPO'
        DataSource = dsFuncionario
        TabOrder = 2
        ButtonSpacing = 3
        OnButtonClick = dbTipoButtonClick
      end
      object dbTipo2: TDBEdit
        Left = 533
        Top = 26
        Width = 97
        Height = 22
        TabStop = False
        DataField = 'FOLHA_TIPO'
        DataSource = dsFuncionario
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 32
    Top = 120
  end
  inherited mtRegistro: TClientDataSet
    Left = 32
    Top = 151
    object mtRegistroIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroIDFOLHA_TIPO: TStringField
      FieldName = 'IDFOLHA_TIPO'
      ProviderFlags = [pfInUpdate, pfInKey]
      Size = 1
    end
    object mtRegistroIDEVENTO: TIntegerField
      FieldName = 'IDEVENTO'
    end
    object mtRegistroEVENTO: TStringField
      FieldName = 'EVENTO'
      ProviderFlags = [pfHidden]
      Size = 50
    end
    object mtRegistroTIPO_EVENTO: TStringField
      FieldName = 'TIPO_EVENTO'
      ProviderFlags = [pfHidden]
      Size = 1
    end
    object mtRegistroTIPO_CALCULO: TStringField
      FieldName = 'TIPO_CALCULO'
      ProviderFlags = [pfInWhere, pfHidden]
      Size = 1
    end
    object mtRegistroINFORMADO: TCurrencyField
      FieldName = 'INFORMADO'
      DisplayFormat = ',0.##'
    end
    object mtRegistroINICIO: TDateField
      FieldName = 'INICIO'
    end
    object mtRegistroTERMINO: TDateField
      FieldName = 'TERMINO'
    end
    object mtRegistroATIVO_X: TSmallintField
      FieldName = 'ATIVO_X'
      ProviderFlags = [pfInWhere, pfHidden]
    end
    object mtRegistroSUSPENSO_X: TSmallintField
      FieldName = 'SUSPENSO_X'
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 32
    Top = 183
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 64
    Top = 183
  end
  object cdFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 151
    object cdFuncionarioIDFUNCIONARIO: TStringField
      FieldName = 'IDFUNCIONARIO'
      Size = 10
    end
    object cdFuncionarioFUNCIONARIO: TStringField
      FieldName = 'FUNCIONARIO'
      Size = 50
    end
    object cdFuncionarioIDFOLHA_TIPO: TStringField
      FieldName = 'IDFOLHA_TIPO'
      Size = 1
    end
    object cdFuncionarioFOLHA_TIPO: TStringField
      FieldName = 'FOLHA_TIPO'
      Size = 30
    end
  end
  object dsFuncionario: TDataSource
    DataSet = cdFuncionario
    Left = 64
    Top = 120
  end
end
