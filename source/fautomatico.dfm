inherited FrmAutomatico: TFrmAutomatico
  Left = 49
  Top = 54
  Caption = 'Eventos Autom'#225'ticos'
  ClientHeight = 456
  ClientWidth = 638
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
    end
    inherited PnlTitulo: TPanel
      Width = 638
      inherited RxTitulo: TLabel
        Width = 393
        Caption = ' '#183' Eventos Autom'#225'ticos para o Funcion'#225'rio'
      end
      inherited PnlFechar: TPanel
        Left = 598
      end
    end
    inherited Panel: TPanel
      Top = 293
      Width = 638
      Height = 123
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
      object dbCompetencias: TGroupBox
        Left = 9
        Top = 52
        Width = 592
        Height = 64
        Caption = 'Compet'#234'ncias'
        TabOrder = 3
        object dbJaneiro: TDBCheckBox
          Tag = 1
          Left = 9
          Top = 17
          Width = 75
          Height = 19
          Caption = '&Janeiro'
          DataField = 'JANEIRO_X'
          DataSource = dtsRegistro
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbFevereiro: TDBCheckBox
          Tag = 2
          Left = 9
          Top = 39
          Width = 75
          Height = 18
          Caption = 'Fevereiro'
          DataField = 'FEVEREIRO_X'
          DataSource = dtsRegistro
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbMarco: TDBCheckBox
          Tag = 3
          Left = 90
          Top = 17
          Width = 79
          Height = 19
          Caption = '&Mar'#231'o'
          DataField = 'MARCO_X'
          DataSource = dtsRegistro
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbAbril: TDBCheckBox
          Tag = 4
          Left = 90
          Top = 39
          Width = 76
          Height = 18
          Caption = '&Abril'
          DataField = 'ABRIL_X'
          DataSource = dtsRegistro
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbMaio: TDBCheckBox
          Tag = 5
          Left = 173
          Top = 17
          Width = 76
          Height = 19
          Caption = 'Maio'
          DataField = 'MAIO_X'
          DataSource = dtsRegistro
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbJunho: TDBCheckBox
          Tag = 6
          Left = 173
          Top = 39
          Width = 76
          Height = 18
          Caption = '&Junho'
          DataField = 'JUNHO_X'
          DataSource = dtsRegistro
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbJulho: TDBCheckBox
          Tag = 7
          Left = 256
          Top = 17
          Width = 76
          Height = 19
          Caption = 'Julho'
          DataField = 'JULHO_X'
          DataSource = dtsRegistro
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbAgosto: TDBCheckBox
          Tag = 8
          Left = 256
          Top = 39
          Width = 76
          Height = 18
          Caption = 'Agosto'
          DataField = 'AGOSTO_X'
          DataSource = dtsRegistro
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbSetembro: TDBCheckBox
          Tag = 9
          Left = 338
          Top = 17
          Width = 76
          Height = 19
          Caption = '&Setembro'
          DataField = 'SETEMBRO_X'
          DataSource = dtsRegistro
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbOutubro: TDBCheckBox
          Tag = 10
          Left = 338
          Top = 39
          Width = 76
          Height = 18
          Caption = '&Outubro'
          DataField = 'OUTUBRO_X'
          DataSource = dtsRegistro
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbNovembro: TDBCheckBox
          Tag = 11
          Left = 421
          Top = 17
          Width = 75
          Height = 19
          Caption = '&Novembro'
          DataField = 'NOVEMBRO_X'
          DataSource = dtsRegistro
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbDezembro: TDBCheckBox
          Tag = 12
          Left = 421
          Top = 39
          Width = 75
          Height = 18
          Caption = '&Dezembro'
          DataField = 'DEZEMBRO_X'
          DataSource = dtsRegistro
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object db13salario: TDBCheckBox
          Tag = 13
          Left = 504
          Top = 17
          Width = 75
          Height = 19
          Caption = '13 &Sal'#225'rio'
          DataField = 'SALARIO13_X'
          DataSource = dtsRegistro
          TabOrder = 12
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    inherited grdCadastro: TcxGrid
      Top = 90
      Width = 638
      Height = 203
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
          Width = 310
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
          Width = 120
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
    Top = 152
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
    object mtRegistroATIVO_X: TSmallintField
      FieldName = 'ATIVO_X'
      ProviderFlags = [pfInWhere, pfHidden]
    end
    object mtRegistroINFORMADO: TCurrencyField
      FieldName = 'INFORMADO'
      DisplayFormat = ',0.##'
    end
    object mtRegistroJANEIRO_X: TSmallintField
      FieldName = 'JANEIRO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroFEVEREIRO_X: TSmallintField
      FieldName = 'FEVEREIRO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroMARCO_X: TSmallintField
      FieldName = 'MARCO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroABRIL_X: TSmallintField
      FieldName = 'ABRIL_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroMAIO_X: TSmallintField
      FieldName = 'MAIO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroJUNHO_X: TSmallintField
      FieldName = 'JUNHO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroJULHO_X: TSmallintField
      FieldName = 'JULHO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroAGOSTO_X: TSmallintField
      FieldName = 'AGOSTO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroSETEMBRO_X: TSmallintField
      FieldName = 'SETEMBRO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroOUTUBRO_X: TSmallintField
      FieldName = 'OUTUBRO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroNOVEMBRO_X: TSmallintField
      FieldName = 'NOVEMBRO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroDEZEMBRO_X: TSmallintField
      FieldName = 'DEZEMBRO_X'
      ProviderFlags = [pfInUpdate]
    end
    object mtRegistroSALARIO13_X: TSmallintField
      FieldName = 'SALARIO13_X'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 32
    Top = 184
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 64
    Top = 184
  end
  object cdFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 152
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
