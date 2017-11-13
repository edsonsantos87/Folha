inherited FrmPadrao: TFrmPadrao
  Left = 68
  Top = 29
  HorzScrollBar.Range = 0
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Eventos Padr'#245'es'
  ClientHeight = 488
  ClientWidth = 724
  Visible = False
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Width = 0
    Height = 488
    Visible = False
    inherited lblSeparador: TLabel
      Width = 0
    end
    inherited lblPrograma: TPanel
      Width = 0
      Caption = 'Tabelas'
    end
    inherited pnlPesquisa: TPanel
      Top = 388
      Width = 0
      inherited lblPesquisa: TLabel
        Width = 0
      end
    end
  end
  inherited PnlClaro: TPanel
    Left = 0
    Width = 724
    Height = 488
    inherited PnlControle: TPanel
      Top = 448
      Width = 724
      TabOrder = 2
    end
    inherited PnlTitulo: TPanel
      Width = 724
      TabOrder = 1
      inherited RxTitulo: TLabel
        Width = 174
        Caption = ' '#183' Eventos Padr'#245'es'
      end
      inherited PnlFechar: TPanel
        Left = 684
      end
    end
    object dbgRegistro: TDBGrid
      Tag = 1
      Left = 0
      Top = 90
      Width = 724
      Height = 212
      Align = alClient
      BorderStyle = bsNone
      DataSource = dtsRegistro
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentColor = True
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDrawColumnCell = dbgRegistroDrawColumnCell
      OnTitleClick = dbgRegistroTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDEVENTO'
          Title.Caption = 'ID Evento'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EVENTO'
          Title.Caption = 'Descri'#231#227'o do Evento'
          Width = 285
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDTIPO'
          Title.Caption = 'Tipo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDSITUACAO'
          Title.Caption = 'Sit.'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDVINCULO'
          Title.Caption = 'V'#237'nc.'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDSALARIO'
          Title.Caption = 'Sal'#225'rio'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INFORMADO'
          Title.Caption = 'V. Informado'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDPADRAO'
          Title.Caption = 'ID'
          Width = 50
          Visible = True
        end>
    end
    object Panel: TPanel
      Left = 0
      Top = 302
      Width = 724
      Height = 146
      Align = alBottom
      ParentColor = True
      TabOrder = 4
      object lbEvento: TLabel
        Left = 9
        Top = 9
        Width = 33
        Height = 14
        Caption = 'Evento'
        FocusControl = dbEvento
      end
      object lbEvento2: TLabel
        Left = 68
        Top = 9
        Width = 100
        Height = 14
        Caption = 'Descri'#231#227'o do Evento'
        Enabled = False
        FocusControl = dbEvento2
      end
      object lbTipo: TLabel
        Left = 9
        Top = 52
        Width = 92
        Height = 14
        Caption = 'Tipo de funcion'#225'rio'
        FocusControl = dbTipo
      end
      object lbSituacao: TLabel
        Left = 235
        Top = 52
        Width = 114
        Height = 14
        Caption = 'Situa'#231#227'o de funcion'#225'rio'
        FocusControl = dbSituacao
      end
      object lbVinculo: TLabel
        Left = 9
        Top = 95
        Width = 100
        Height = 14
        Caption = 'V'#237'nculo Empregat'#237'cio'
        FocusControl = dbVinculo
      end
      object lbSalario: TLabel
        Left = 235
        Top = 95
        Width = 105
        Height = 14
        Caption = 'Sal'#225'rio de funcion'#225'rio'
        FocusControl = dbSalario
      end
      object lbInformado: TLabel
        Left = 359
        Top = 9
        Width = 77
        Height = 14
        Caption = 'Valor Informado'
      end
      object dbEvento: TAKDBEdit
        Left = 9
        Top = 26
        Width = 32
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDEVENTO'
        DataSource = dtsRegistro
        TabOrder = 0
        ButtonSpacing = 2
        OnButtonClick = dbEventoButtonClick
      end
      object dbEvento2: TDBEdit
        Left = 68
        Top = 26
        Width = 285
        Height = 22
        DataField = 'EVENTO'
        DataSource = dtsRegistro
        Enabled = False
        ParentColor = True
        TabOrder = 1
      end
      object dbTipo: TAKDBEdit
        Left = 9
        Top = 69
        Width = 32
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDTIPO'
        DataSource = dtsRegistro
        TabOrder = 3
        ButtonSpacing = 2
        OnButtonClick = dbTipoButtonClick
      end
      object dbSituacao: TAKDBEdit
        Left = 235
        Top = 69
        Width = 32
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDSITUACAO'
        DataSource = dtsRegistro
        TabOrder = 5
        ButtonSpacing = 2
        OnButtonClick = dbTipoButtonClick
      end
      object dbVinculo: TAKDBEdit
        Left = 9
        Top = 112
        Width = 32
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDVINCULO'
        DataSource = dtsRegistro
        TabOrder = 7
        ButtonSpacing = 2
        OnButtonClick = dbTipoButtonClick
      end
      object dbSalario: TAKDBEdit
        Left = 235
        Top = 112
        Width = 32
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDSALARIO'
        DataSource = dtsRegistro
        TabOrder = 9
        ButtonSpacing = 2
        OnButtonClick = dbTipoButtonClick
      end
      object dbCompetencias: TGroupBox
        Left = 466
        Top = 9
        Width = 248
        Height = 123
        Caption = 'Compet'#234'ncias'
        TabOrder = 11
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
          Left = 9
          Top = 60
          Width = 75
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
          Left = 9
          Top = 82
          Width = 75
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
          Left = 89
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
          Left = 89
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
          Left = 89
          Top = 60
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
          Left = 89
          Top = 82
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
          Left = 165
          Top = 17
          Width = 75
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
          Left = 165
          Top = 39
          Width = 75
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
          Left = 165
          Top = 60
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
          Left = 165
          Top = 82
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
          Left = 165
          Top = 103
          Width = 75
          Height = 19
          Caption = '13 &Sal'#225'rio'
          DataField = 'SALARIO13_X'
          DataSource = dtsRegistro
          TabOrder = 12
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbMarcar: TCheckBox
          Left = 9
          Top = 103
          Width = 145
          Height = 19
          TabStop = False
          Caption = '[&Des]Marcar Todos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          OnClick = dbMarcarClick
        end
      end
      object dbTipo2: TDBEdit
        Left = 68
        Top = 69
        Width = 161
        Height = 22
        DataField = 'TIPO'
        DataSource = dtsRegistro
        Enabled = False
        ParentColor = True
        TabOrder = 4
      end
      object dbSituacao2: TDBEdit
        Left = 294
        Top = 69
        Width = 162
        Height = 22
        DataField = 'SITUACAO'
        DataSource = dtsRegistro
        Enabled = False
        ParentColor = True
        TabOrder = 6
      end
      object dbVinculo2: TDBEdit
        Left = 68
        Top = 112
        Width = 161
        Height = 22
        DataField = 'VINCULO'
        DataSource = dtsRegistro
        Enabled = False
        ParentColor = True
        TabOrder = 8
      end
      object dbSalario2: TDBEdit
        Left = 294
        Top = 112
        Width = 162
        Height = 22
        DataField = 'SALARIO'
        DataSource = dtsRegistro
        Enabled = False
        ParentColor = True
        TabOrder = 10
      end
      object dbInformado: TDBEdit
        Left = 359
        Top = 26
        Width = 97
        Height = 22
        DataField = 'INFORMADO'
        DataSource = dtsRegistro
        TabOrder = 2
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 30
      Width = 724
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      Color = 8101828
      TabOrder = 0
      object lbGE: TLabel
        Left = 9
        Top = 9
        Width = 26
        Height = 14
        Caption = 'ID GE'
        FocusControl = dbGE
      end
      object lbGE2: TLabel
        Left = 68
        Top = 9
        Width = 157
        Height = 14
        Caption = 'Descri'#231#227'o do Grupo de Empresa'
        FocusControl = dbGE2
      end
      object lbGP: TLabel
        Left = 267
        Top = 9
        Width = 26
        Height = 14
        Caption = 'ID GP'
        FocusControl = dbGP
      end
      object lbGP2: TLabel
        Left = 326
        Top = 9
        Width = 168
        Height = 14
        Caption = 'Descri'#231#227'o do Grupo de Pagamento'
        FocusControl = dbGP2
      end
      object lbFolha: TLabel
        Left = 547
        Top = 9
        Width = 64
        Height = 14
        Caption = 'Tipo de Folha'
        FocusControl = dbFolha
      end
      object dbGE: TAKDBEdit
        Left = 9
        Top = 26
        Width = 32
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDGE'
        DataSource = dsGP
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
        ButtonSpacing = 3
        OnButtonClick = dbGEButtonClick
      end
      object dbGE2: TDBEdit
        Left = 68
        Top = 26
        Width = 194
        Height = 22
        TabStop = False
        DataField = 'GE'
        DataSource = dsGP
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object dbGP: TAKDBEdit
        Left = 267
        Top = 26
        Width = 32
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDGP'
        DataSource = dsGP
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
        ButtonSpacing = 3
        OnButtonClick = dbGEButtonClick
      end
      object dbGP2: TDBEdit
        Left = 326
        Top = 26
        Width = 216
        Height = 22
        TabStop = False
        DataField = 'GP'
        DataSource = dsGP
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
      end
      object dbFolha: TAKDBEdit
        Left = 547
        Top = 26
        Width = 32
        Height = 22
        CharCase = ecUpperCase
        DataField = 'IDFOLHA_TIPO'
        DataSource = dsGP
        ParentColor = True
        ReadOnly = True
        TabOrder = 4
        ButtonSpacing = 3
        OnButtonClick = dbFolhaButtonClick
      end
      object dbFolha2: TDBEdit
        Left = 608
        Top = 26
        Width = 97
        Height = 22
        TabStop = False
        DataField = 'FOLHA_TIPO'
        DataSource = dsGP
        ParentColor = True
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 32
    Top = 136
  end
  inherited mtRegistro: TClientDataSet
    BeforeInsert = mtRegistroBeforeInsert
    Left = 32
    Top = 200
    object mtRegistroIDGP: TIntegerField
      FieldName = 'IDGP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroIDPADRAO: TIntegerField
      FieldName = 'IDPADRAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroIDFOLHA_TIPO: TStringField
      FieldName = 'IDFOLHA_TIPO'
      Size = 1
    end
    object mtRegistroIDEVENTO: TIntegerField
      FieldName = 'IDEVENTO'
    end
    object mtRegistroIDVINCULO: TStringField
      FieldName = 'IDVINCULO'
      Size = 2
    end
    object mtRegistroIDTIPO: TStringField
      FieldName = 'IDTIPO'
      Size = 2
    end
    object mtRegistroIDSITUACAO: TStringField
      FieldName = 'IDSITUACAO'
      Size = 2
    end
    object mtRegistroIDSALARIO: TStringField
      FieldName = 'IDSALARIO'
      Size = 2
    end
    object mtRegistroINFORMADO: TCurrencyField
      FieldName = 'INFORMADO'
      DisplayFormat = ',0.00'
    end
    object mtRegistroEVENTO: TStringField
      FieldName = 'EVENTO'
      ProviderFlags = [pfHidden]
      Size = 50
    end
    object mtRegistroTIPO: TStringField
      FieldKind = fkLookup
      FieldName = 'TIPO'
      LookupDataSet = cdTipo
      LookupKeyFields = 'IDTIPO'
      LookupResultField = 'NOME'
      KeyFields = 'IDTIPO'
      Size = 30
      Lookup = True
    end
    object mtRegistroSITUACAO: TStringField
      FieldKind = fkLookup
      FieldName = 'SITUACAO'
      LookupDataSet = cdSituacao
      LookupKeyFields = 'IDSITUACAO'
      LookupResultField = 'NOME'
      KeyFields = 'IDSITUACAO'
      Size = 30
      Lookup = True
    end
    object mtRegistroVINCULO: TStringField
      FieldKind = fkLookup
      FieldName = 'VINCULO'
      LookupDataSet = cdVinculo
      LookupKeyFields = 'IDVINCULO'
      LookupResultField = 'NOME'
      KeyFields = 'IDVINCULO'
      Size = 50
      Lookup = True
    end
    object mtRegistroSALARIO: TStringField
      FieldKind = fkLookup
      FieldName = 'SALARIO'
      LookupDataSet = cdSalario
      LookupKeyFields = 'IDSALARIO'
      LookupResultField = 'NOME'
      KeyFields = 'IDSALARIO'
      Size = 30
      Lookup = True
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
    object mtRegistroTIPO_EVENTO: TStringField
      FieldName = 'TIPO_EVENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
      Size = 1
    end
    object mtRegistroATIVO_X: TSmallintField
      FieldName = 'ATIVO_X'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
    end
  end
  object cdGP: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 216
    object cdGPIDGE: TIntegerField
      FieldName = 'IDGE'
    end
    object cdGPIDGP: TIntegerField
      FieldName = 'IDGP'
    end
    object cdGPGE: TStringField
      FieldName = 'GE'
      Size = 30
    end
    object cdGPGP: TStringField
      FieldName = 'GP'
      Size = 30
    end
    object cdGPIDFOLHA_TIPO: TStringField
      FieldName = 'IDFOLHA_TIPO'
      Size = 1
    end
    object cdGPFOLHA_TIPO: TStringField
      FieldName = 'FOLHA_TIPO'
      Size = 30
    end
  end
  object dsGP: TDataSource
    DataSet = cdGP
    Left = 104
    Top = 136
  end
  object cdTipo: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 128
    object cdTipoIDTIPO: TStringField
      DisplayLabel = 'ID'
      FieldName = 'IDTIPO'
      Size = 2
    end
    object cdTipoNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 30
    end
  end
  object cdSituacao: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 184
    object cdSituacaoIDSITUACAO: TStringField
      FieldName = 'IDSITUACAO'
      Size = 2
    end
    object cdSituacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object cdVinculo: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 128
    object cdVinculoIDVINCULO: TStringField
      FieldName = 'IDVINCULO'
      Size = 2
    end
    object cdVinculoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object cdSalario: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 184
    object cdSalarioIDSALARIO: TStringField
      FieldName = 'IDSALARIO'
      Size = 2
    end
    object cdSalarioNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object cdFolhaTipo: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 448
    Top = 176
    object cdFolhaTipoIDFOLHA_TIPO: TStringField
      FieldName = 'IDFOLHA_TIPO'
      Size = 1
    end
    object cdFolhaTipoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
end
