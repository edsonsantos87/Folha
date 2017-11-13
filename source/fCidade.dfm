inherited FrmCidade: TFrmCidade
  Left = 150
  Top = 57
  Caption = 'Cadastro de Cidades'
  ClientHeight = 432
  ClientWidth = 569
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Height = 432
    inherited pnlPesquisa: TPanel
      Top = 332
    end
  end
  inherited PnlClaro: TPanel
    Width = 568
    Height = 432
    inherited PnlControle: TPanel
      Top = 392
      Width = 568
    end
    inherited PnlTitulo: TPanel
      Width = 568
      inherited RxTitulo: TLabel
        Width = 76
        Caption = 'Cidades'
      end
      inherited PnlFechar: TPanel
        Left = 528
      end
    end
    inherited Panel: TPanel
      Top = 296
      Width = 568
      Height = 96
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
    inherited imgAguarde: TRxGIFAnimator
      FrameIndex = 24
      Image.Data = {
        C5040000474946383961C3000D00B30D007F7E7DACABA7ACABA67777771B50A6
        10459C62A0FC3E6FBD5D86C990BDFCBEBEBE686868EFEFEFFFFFFFFFFFFF0000
        0021FF0B4E45545343415045322E30030100000021F9040500000D002C000000
        00C3000D000004B7D005B0AABD38EBCDBBFF60288E64590281230C4AEBBE702C
        CF746DDF78AEEF7CEF2B0301A0C5281A8FC8A472C96C3A9FD0A8744AAD565B14
        4591C0ED36BEE0B0784C2E9BCFE8B47ACD6EBBDFE7A2A2A26D20EE78B87ECFEF
        FBFF805F0C730B75078788818A8B8C8D8E6283740C0D0695968F98999A9B6491
        859309A1A29CA4A5A67E9E75A2A3A7ADAEAF9D847505B4B5B0B7B8A6914345B9
        BEBF9B72280356C5C6C7C8C9CACB4E03294226D1D2D3D4D5D6D71C00020E1100
        21F9040500000D002C0B0003000600070000040F90C889AA3D389BCD93FFA057
        8C64040021F9040500000D002C120003000600070000040F90C889AA3D389BCD
        93FFA0578C64040021F9040500000D002C190003000600070000040F90C889AA
        3D389BCD93FFA0578C64040021F9040500000D002C200003000600070000040F
        90C889AA3D389BCD93FFA0578C64040021F9040500000D002C27000300060007
        0000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D002C2E0003
        000600070000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D00
        2C350003000600070000040F90C889AA3D389BCD93FFA0578C64040021F90405
        00000D002C3C0003000600070000040F90C889AA3D389BCD93FFA0578C640400
        21F9040500000D002C430003000600070000040F90C889AA3D389BCD93FFA057
        8C64040021F9040500000D002C4A0003000600070000040F90C889AA3D389BCD
        93FFA0578C64040021F9040500000D002C510003000600070000040F90C889AA
        3D389BCD93FFA0578C64040021F9040500000D002C580003000600070000040F
        90C889AA3D389BCD93FFA0578C64040021F9040500000D002C5F000300060007
        0000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D002C660003
        000600070000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D00
        2C6D0003000600070000040F90C889AA3D389BCD93FFA0578C64040021F90405
        00000D002C740003000600070000040F90C889AA3D389BCD93FFA0578C640400
        21F9040500000D002C7B0003000600070000040F90C889AA3D389BCD93FFA057
        8C64040021F9040500000D002C820003000600070000040F90C889AA3D389BCD
        93FFA0578C64040021F9040500000D002C890003000600070000040F90C889AA
        3D389BCD93FFA0578C64040021F9040500000D002C900003000600070000040F
        90C889AA3D389BCD93FFA0578C64040021F9040500000D002C97000300060007
        0000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D002C9E0003
        000600070000040F90C889AA3D389BCD93FFA0578C64040021F9040500000D00
        2CA50003000600070000040F90C889AA3D389BCD93FFA0578C64040021F90405
        00000D002CAC0003000600070000040F90C889AA3D389BCD93FFA0578C640400
        21F9040500000D002CB30003000600070000040F90C889AA3D389BCD93FFA057
        8C64040021F9040500000D002CBA0003000600070000040F90C889AA3D389BCD
        93FFA0578C6404003B}
    end
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
