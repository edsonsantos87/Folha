inherited FrmCidade: TFrmCidade
  Left = 150
  Top = 57
  Caption = 'Cadastro de Cidades'
  ClientHeight = 432
  ClientWidth = 569
  WindowState = wsNormal
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Height = 432
    ExplicitHeight = 432
    inherited pnlPesquisa: TPanel
      Top = 332
      ExplicitTop = 332
    end
  end
  inherited PnlClaro: TPanel
    Width = 568
    Height = 432
    ExplicitWidth = 568
    ExplicitHeight = 432
    inherited PnlControle: TPanel
      Top = 392
      Width = 568
      ExplicitTop = 392
      ExplicitWidth = 568
    end
    inherited PnlTitulo: TPanel
      Width = 568
      ExplicitWidth = 568
      inherited RxTitulo: TLabel
        Width = 76
        Caption = 'Cidades'
        ExplicitWidth = 76
      end
      inherited PnlFechar: TPanel
        Left = 528
        ExplicitLeft = 528
      end
    end
    inherited Panel: TPanel
      Top = 296
      Width = 568
      Height = 96
      ExplicitTop = 296
      ExplicitWidth = 568
      ExplicitHeight = 96
      object Label2: TLabel
        Left = 81
        Top = 6
        Width = 84
        Height = 14
        Caption = 'C'#243'd. do Munic'#237'pio'
        FocusControl = edtCodMunicipio
      end
      object Label3: TLabel
        Left = 230
        Top = 8
        Width = 13
        Height = 14
        Caption = 'UF'
      end
      object Label4: TLabel
        Left = 9
        Top = 48
        Width = 89
        Height = 14
        Caption = 'Nome do Munic'#237'pio'
        FocusControl = edtNome
      end
      object Label1: TLabel
        Left = 9
        Top = 6
        Width = 33
        Height = 14
        Caption = 'C'#243'digo'
        FocusControl = edtCodMunicipio
      end
      object edtCodigo: TDBEdit
        Left = 9
        Top = 22
        Width = 60
        Height = 22
        CharCase = ecUpperCase
        DataField = 'ID'
        DataSource = dtsRegistro
        Enabled = False
        TabOrder = 0
      end
      object edtCodMunicipio: TDBEdit
        Left = 81
        Top = 22
        Width = 144
        Height = 22
        CharCase = ecUpperCase
        DataField = 'COD_MUNICIPIO'
        DataSource = dtsRegistro
        MaxLength = 8
        TabOrder = 1
      end
      object edtNome: TDBEdit
        Left = 9
        Top = 64
        Width = 366
        Height = 22
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dtsRegistro
        TabOrder = 3
      end
      object cboUF: TcxDBLookupComboBox
        Left = 230
        Top = 22
        DataBinding.DataField = 'UF'
        DataBinding.DataSource = dtsRegistro
        Properties.KeyFieldNames = 'iduf'
        Properties.ListColumns = <
          item
            FieldName = 'nome'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dtsUF
        TabOrder = 2
        Width = 145
      end
    end
    inherited grdCadastro: TcxGrid
      Width = 568
      Height = 266
      ExplicitWidth = 568
      ExplicitHeight = 266
      inherited tv: TcxGridDBTableView
        object tvUF: TcxGridDBColumn
          DataBinding.FieldName = 'UF'
          GroupIndex = 0
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 40
        end
        object tvID: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'ID'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
        end
        object tvCOD_MUNICIPIO: TcxGridDBColumn
          Caption = 'C'#243'd. Munic'#237'pio'
          DataBinding.FieldName = 'COD_MUNICIPIO'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 130
        end
        object tvNOME: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
          HeaderAlignmentHorz = taCenter
          Styles.Header = StyloHeader
          Width = 340
        end
      end
    end
  end
  inherited pnlProgress: TPanel
    Left = 135
    ExplicitLeft = 135
  end
  inherited dtsRegistro: TDataSource
    Top = 200
  end
  inherited mtRegistro: TClientDataSet
    object mtRegistroID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroCOD_MUNICIPIO: TFloatField
      FieldName = 'COD_MUNICIPIO'
    end
    object mtRegistroUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mtRegistroNOME: TStringField
      DisplayWidth = 100
      FieldName = 'NOME'
      Size = 255
    end
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 104
    Top = 168
    PixelsPerInch = 96
  end
  inherited cxLocalizer1: TcxLocalizer
    Left = 136
    Top = 200
  end
  object cdsUF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 105
    Top = 200
    object cdsUFid: TIntegerField
      FieldName = 'id'
    end
    object cdsUFiduf: TStringField
      FieldName = 'iduf'
      Size = 2
    end
    object cdsUFnome: TStringField
      FieldName = 'nome'
      Size = 30
    end
  end
  object dtsUF: TDataSource
    DataSet = cdsUF
    Left = 137
    Top = 168
  end
end
