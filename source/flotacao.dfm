inherited FrmLotacao: TFrmLotacao
  Left = 40
  Top = 24
  Caption = 'Lota'#231#245'es'
  ClientHeight = 538
  ClientWidth = 640
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Height = 538
    ExplicitHeight = 538
    inherited lblPrograma: TPanel
      Caption = 'Contas'
    end
    inherited pnlPesquisa: TPanel
      Top = 438
      ExplicitTop = 438
    end
  end
  inherited PnlClaro: TPanel
    Width = 639
    Height = 538
    ExplicitWidth = 639
    ExplicitHeight = 538
    inherited PnlControle: TPanel
      Top = 498
      Width = 639
      ExplicitTop = 498
      ExplicitWidth = 639
    end
    inherited PnlTitulo: TPanel
      Width = 639
      ExplicitWidth = 639
      inherited RxTitulo: TLabel
        Width = 231
        Height = 22
        Caption = ' '#183' Listagem das Lota'#231#245'es'
        ExplicitWidth = 231
      end
      inherited PnlFechar: TPanel
        Left = 599
        ExplicitLeft = 599
      end
    end
    inherited Panel: TPanel
      Top = 305
      Width = 639
      Height = 193
      ExplicitTop = 305
      ExplicitWidth = 639
      ExplicitHeight = 193
      object Label2: TLabel
        Left = 197
        Top = 9
        Width = 106
        Height = 14
        Caption = 'Descri'#231#227'o da Lota'#231#227'o'
        FocusControl = dbNome
      end
      object lbLotacao: TLabel
        Left = 9
        Top = 9
        Width = 39
        Height = 14
        Caption = 'Lota'#231#227'o'
        FocusControl = dbLotacao
      end
      object lbEndereco: TLabel
        Left = 9
        Top = 99
        Width = 218
        Height = 14
        Caption = 'Endere'#231'o - Logradouro, rua, no., andar, apto.'
      end
      object lbBairro: TLabel
        Left = 9
        Top = 141
        Width = 29
        Height = 14
        Caption = 'Bairro'
        FocusControl = dbBairro
      end
      object lbCidade: TLabel
        Left = 229
        Top = 141
        Width = 33
        Height = 14
        Caption = 'Cidade'
        FocusControl = dbCidade
      end
      object lbCEP1: TLabel
        Left = 450
        Top = 141
        Width = 19
        Height = 14
        Caption = 'CEP'
        FocusControl = dbCEP
      end
      object lbResponsavel: TLabel
        Left = 9
        Top = 55
        Width = 108
        Height = 14
        Caption = 'Nome do Respons'#225'vel'
        FocusControl = dbResponsavel
      end
      object lbTelefone: TLabel
        Left = 326
        Top = 55
        Width = 41
        Height = 14
        Caption = 'Telefone'
        FocusControl = dbTelefone
      end
      object lbFax: TLabel
        Left = 439
        Top = 55
        Width = 18
        Height = 14
        Caption = 'Fax'
        FocusControl = dbFax
      end
      object lbDepartamento: TLabel
        Left = 79
        Top = 9
        Width = 25
        Height = 14
        Caption = 'Dept.'
        FocusControl = dbDepartamento
        ParentShowHint = False
        ShowHint = False
      end
      object lbSetor: TLabel
        Left = 116
        Top = 9
        Width = 26
        Height = 14
        Caption = 'Setor'
        FocusControl = dbSetor
        ParentShowHint = False
        ShowHint = False
      end
      object lbSecao: TLabel
        Left = 154
        Top = 9
        Width = 31
        Height = 14
        Caption = 'Se'#231#227'o'
        FocusControl = dbSecao
        ParentShowHint = False
        ShowHint = False
      end
      object dbNome: TDBEdit
        Left = 197
        Top = 25
        Width = 350
        Height = 22
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dtsRegistro
        TabOrder = 4
      end
      object dbLotacao: TDBEdit
        Left = 9
        Top = 25
        Width = 64
        Height = 22
        DataField = 'IDLOTACAO'
        DataSource = dtsRegistro
        TabOrder = 0
      end
      object dbEndereco: TDBEdit
        Left = 9
        Top = 116
        Width = 538
        Height = 22
        CharCase = ecUpperCase
        DataField = 'ENDERECO'
        DataSource = dtsRegistro
        TabOrder = 8
      end
      object dbBairro: TDBEdit
        Left = 9
        Top = 158
        Width = 215
        Height = 22
        AutoSelect = False
        CharCase = ecUpperCase
        DataField = 'BAIRRO'
        DataSource = dtsRegistro
        TabOrder = 9
      end
      object dbCidade: TDBEdit
        Left = 229
        Top = 158
        Width = 216
        Height = 22
        AutoSelect = False
        CharCase = ecUpperCase
        DataField = 'CIDADE'
        DataSource = dtsRegistro
        TabOrder = 10
      end
      object dbCEP: TDBEdit
        Left = 450
        Top = 158
        Width = 97
        Height = 22
        CharCase = ecUpperCase
        DataField = 'CEP'
        DataSource = dtsRegistro
        TabOrder = 11
      end
      object dbResponsavel: TDBEdit
        Left = 9
        Top = 72
        Width = 312
        Height = 22
        AutoSelect = False
        CharCase = ecUpperCase
        DataField = 'RESPONSAVEL'
        DataSource = dtsRegistro
        TabOrder = 5
      end
      object dbTelefone: TDBEdit
        Left = 326
        Top = 72
        Width = 108
        Height = 22
        AutoSelect = False
        CharCase = ecUpperCase
        DataField = 'TELEFONE'
        DataSource = dtsRegistro
        TabOrder = 6
      end
      object dbFax: TDBEdit
        Left = 439
        Top = 72
        Width = 108
        Height = 22
        CharCase = ecUpperCase
        DataField = 'FAX'
        DataSource = dtsRegistro
        TabOrder = 7
      end
      object dbAtivo: TDBCheckBox
        Left = 560
        Top = 160
        Width = 65
        Height = 19
        Caption = 'Ativo'
        DataField = 'ATIVO_X'
        DataSource = dtsRegistro
        TabOrder = 12
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbDepartamento: TDBEdit
        Left = 79
        Top = 25
        Width = 32
        Height = 22
        Hint = 'Departamento'
        AutoSelect = False
        CharCase = ecUpperCase
        DataField = 'DEPARTAMENTO'
        DataSource = dtsRegistro
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object dbSetor: TDBEdit
        Left = 116
        Top = 25
        Width = 33
        Height = 22
        Hint = 'Setor'
        AutoSelect = False
        CharCase = ecUpperCase
        DataField = 'SETOR'
        DataSource = dtsRegistro
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object dbSecao: TDBEdit
        Left = 154
        Top = 25
        Width = 38
        Height = 22
        Hint = 'Se'#231#227'o'
        AutoSelect = False
        CharCase = ecUpperCase
        DataField = 'SECAO'
        DataSource = dtsRegistro
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
    end
    inherited grdCadastro: TcxGrid
      Width = 639
      Height = 275
      ExplicitWidth = 639
      ExplicitHeight = 275
      inherited tv: TcxGridDBTableView
        object tvIDLOTACAO: TcxGridDBColumn
          Caption = 'Lota'#231#227'o'
          DataBinding.FieldName = 'IDLOTACAO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 60
        end
        object tvNOME: TcxGridDBColumn
          Caption = 'Descri'#231#227'o da Lota'#231#227'o'
          DataBinding.FieldName = 'NOME'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
        end
        object tvCODIGO: TcxGridDBColumn
          Caption = 'Dep / Setor / Se'#231#227'o'
          DataBinding.FieldName = 'CODIGO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 150
        end
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 120
    Top = 72
  end
  inherited mtRegistro: TClientDataSet
    AfterCancel = mtRegistroAfterPost
    OnCalcFields = mtRegistroCalcFields
    Left = 50
    Top = 72
    object mtRegistroIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroIDLOTACAO: TIntegerField
      FieldName = 'IDLOTACAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object mtRegistroDEPARTAMENTO: TIntegerField
      FieldName = 'DEPARTAMENTO'
    end
    object mtRegistroSETOR: TIntegerField
      FieldName = 'SETOR'
    end
    object mtRegistroSECAO: TIntegerField
      FieldName = 'SECAO'
    end
    object mtRegistroCODIGO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CODIGO'
      Size = 15
      Calculated = True
    end
    object mtRegistroENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object mtRegistroCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object mtRegistroBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object mtRegistroRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 50
    end
    object mtRegistroCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object mtRegistroTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object mtRegistroFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object mtRegistroATIVO_X: TSmallintField
      FieldName = 'ATIVO_X'
    end
    object mtRegistroTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 88
    Top = 168
    PixelsPerInch = 96
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 48
    Top = 168
  end
end
