inherited FrmPlano: TFrmPlano
  Left = 15
  Top = 46
  Caption = 'Plano de Contas'
  ClientHeight = 500
  ClientWidth = 697
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlEscuro: TPanel
    Height = 500
    inherited lblPrograma: TPanel
      Caption = 'Contas'
    end
    inherited pnlPesquisa: TPanel
      Top = 400
    end
  end
  inherited PnlClaro: TPanel
    Width = 696
    Height = 500
    inherited PnlControle: TPanel
      Top = 460
      Width = 696
      TabOrder = 2
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
      Width = 696
      inherited RxTitulo: TLabel
        Width = 291
        Caption = ' '#183' Listagem do Plano de Contas'
      end
      inherited PnlFechar: TPanel
        Left = 656
      end
    end
    inherited dbgRegistro: TDBGrid
      Width = 696
      Height = 375
      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO2'
          Title.Caption = 'Classificacao'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME2'
          Title.Caption = 'Descricao da Conta'
          Width = 448
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDPLANO'
          Title.Caption = 'Codigo'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDPARTIDA'
          Title.Caption = 'Partida'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'T'
          Width = 20
          Visible = True
        end>
    end
    inherited Panel: TPanel
      Top = 405
      Width = 696
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Classifica'#231#227'o'
        FocusControl = dbOrdem
      end
      object Label2: TLabel
        Left = 83
        Top = 8
        Width = 94
        Height = 13
        Caption = 'Descri'#231#227'o da Conta'
        FocusControl = dbNome
      end
      object lbID: TLabel
        Left = 492
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbID
      end
      object Label3: TLabel
        Left = 407
        Top = 7
        Width = 75
        Height = 13
        Caption = 'Grupo de Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 548
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Partida'
        FocusControl = dbPartida
      end
      object dbOrdem: TDBEdit
        Left = 8
        Top = 23
        Width = 70
        Height = 21
        DataField = 'CODIGO'
        DataSource = dtsRegistro
        TabOrder = 0
      end
      object dbNome: TDBEdit
        Left = 83
        Top = 23
        Width = 320
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dtsRegistro
        TabOrder = 1
      end
      object dbID: TDBEdit
        Left = 492
        Top = 23
        Width = 50
        Height = 21
        DataField = 'IDPLANO'
        DataSource = dtsRegistro
        TabOrder = 3
      end
      object dbGrupo: TDBLookupComboBox
        Left = 407
        Top = 23
        Width = 80
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
        Left = 603
        Top = 23
        Width = 80
        Height = 17
        Caption = 'Sint'#233'tica'
        DataField = 'TIPO'
        DataSource = dtsRegistro
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'A'
      end
      object dbPartida: TDBEdit
        Left = 548
        Top = 23
        Width = 50
        Height = 21
        DataField = 'IDPARTIDA'
        DataSource = dtsRegistro
        TabOrder = 4
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 48
    Top = 200
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
end
