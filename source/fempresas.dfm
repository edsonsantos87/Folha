inherited FrmEmpresa: TFrmEmpresa
  Left = 16
  Top = 44
  Caption = 'Cadastro de Empresas'
  ClientWidth = 836
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    inherited lblPrograma: TPanel
      Caption = 'Empresas'
    end
  end
  inherited PnlClaro: TPanel
    Width = 674
    inherited PnlControle: TPanel
      Width = 674
    end
    inherited PnlTitulo: TPanel
      Width = 674
      inherited PnlFechar: TPanel
        Left = 545
      end
    end
    inherited PageControl1: TPageControl
      Width = 674
      ActivePage = TabDetalhe
      inherited TabListagem: TTabSheet
        Caption = 'Lista de Empresas'
        inherited grdCadastro: TcxGrid
          Width = 666
          inherited tv: TcxGridDBTableView
            object tvIDEMPRESA: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'IDEMPRESA'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
              Width = 60
            end
            object tvNOME: TcxGridDBColumn
              Caption = 'Nome da Empresa'
              DataBinding.FieldName = 'NOME'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
              Width = 300
            end
            object tvAPELIDO: TcxGridDBColumn
              Caption = 'Fantasia/Apelido'
              DataBinding.FieldName = 'APELIDO'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
              Width = 140
            end
            object tvCPF_CGC: TcxGridDBColumn
              Caption = 'CPF/CGC'
              DataBinding.FieldName = 'CPF_CGC'
              OnGetDisplayText = tvCPF_CGCGetDisplayText
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
              Width = 150
            end
            object tvIDGE: TcxGridDBColumn
              Caption = 'Grupo'
              DataBinding.FieldName = 'IDGE'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
              Width = 50
            end
          end
        end
      end
      inherited TabDetalhe: TTabSheet
        Caption = 'Detalhes da Empresa'
        object pnlDados: TPanel
          Left = 0
          Top = 0
          Width = 666
          Height = 59
          Align = alTop
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object lbCodigo: TLabel
            Left = 9
            Top = 9
            Width = 33
            Height = 14
            Caption = 'C'#243'digo'
            FocusControl = dbCodigo
          end
          object lbNome: TLabel
            Left = 68
            Top = 9
            Width = 123
            Height = 14
            Caption = 'Raz'#227'o Social da Empresa'
            FocusControl = dbNome
          end
          object Bevel2: TBevel
            Left = 0
            Top = 57
            Width = 666
            Height = 2
            Align = alBottom
            Shape = bsBottomLine
          end
          object lbApelido: TLabel
            Left = 439
            Top = 9
            Width = 85
            Height = 14
            Caption = 'Fantasia / Apelido'
            FocusControl = dbApelido
          end
          object dbCodigo: TDBEdit
            Left = 9
            Top = 26
            Width = 53
            Height = 20
            AutoSize = False
            DataField = 'IDEMPRESA'
            DataSource = dtsRegistro
            TabOrder = 0
          end
          object dbNome: TDBEdit
            Left = 68
            Top = 26
            Width = 366
            Height = 20
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = dtsRegistro
            TabOrder = 1
          end
          object dbApelido: TDBEdit
            Left = 439
            Top = 26
            Width = 210
            Height = 22
            CharCase = ecUpperCase
            DataField = 'APELIDO'
            DataSource = dtsRegistro
            TabOrder = 2
          end
        end
        object PageControl2: TPageControl
          Left = 0
          Top = 59
          Width = 666
          Height = 360
          ActivePage = TabGeral
          Align = alClient
          Style = tsButtons
          TabOrder = 1
          object TabGeral: TTabSheet
            Caption = 'Dados Gerais'
            object pnlDoc: TPanel
              Left = 0
              Top = 0
              Width = 658
              Height = 59
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object Bevel4: TBevel
                Left = 0
                Top = 57
                Width = 658
                Height = 2
                Align = alBottom
                Shape = bsBottomLine
              end
              object lblCPF: TLabel
                Left = 100
                Top = 9
                Width = 44
                Height = 14
                Caption = 'CPF/CGC'
                FocusControl = dbCPF
              end
              object lblPessoa: TLabel
                Left = 9
                Top = 9
                Width = 68
                Height = 14
                Caption = '&F'#237'sica/Jur'#237'dica'
                FocusControl = dbPessoa
              end
              object lbTelefone: TLabel
                Left = 439
                Top = 9
                Width = 55
                Height = 14
                Caption = 'Telefone(s)'
                FocusControl = dbTelefone
              end
              object lbGrupoEmpresa: TLabel
                Left = 224
                Top = 9
                Width = 96
                Height = 14
                Caption = 'Grupo de Empresas'
                FocusControl = dbGrupoEmpresa
              end
              object dbCPF: TDBEdit
                Left = 100
                Top = 26
                Width = 119
                Height = 22
                Hint = 'efsFrameBump'
                DataField = 'CPF_CGC'
                DataSource = dtsRegistro
                TabOrder = 1
                OnExit = dbCPFExit
              end
              object dbPessoa: TDBLookupComboBox
                Left = 9
                Top = 26
                Width = 86
                Height = 22
                DataField = 'PESSOA'
                DataSource = dtsRegistro
                DropDownRows = 2
                DropDownWidth = 85
                TabOrder = 0
              end
              object dbTelefone: TDBEdit
                Left = 439
                Top = 26
                Width = 210
                Height = 22
                CharCase = ecUpperCase
                DataField = 'TELEFONE'
                DataSource = dtsRegistro
                TabOrder = 3
              end
              object dbGrupoEmpresa: TDBLookupComboBox
                Left = 224
                Top = 26
                Width = 210
                Height = 22
                DataField = 'IDGE'
                DataSource = dtsRegistro
                TabOrder = 2
              end
            end
            object pnlEndereco1: TPanel
              Left = 0
              Top = 59
              Width = 658
              Height = 96
              Align = alTop
              BevelOuter = bvNone
              Locked = True
              ParentColor = True
              TabOrder = 1
              object Bevel1: TBevel
                Left = 0
                Top = 94
                Width = 658
                Height = 2
                Align = alBottom
                Shape = bsBottomLine
              end
              object LblEndereco1: TLabel
                Left = 9
                Top = 9
                Width = 341
                Height = 14
                Caption = 
                  'Endere'#231'o Principal - Logradouro, rua, no., andar, apto. / Bairro' +
                  ' / Cidade'
              end
              object lblComplemento1: TLabel
                Left = 434
                Top = 9
                Width = 145
                Height = 14
                Caption = 'Complemento / PAIS / UF / CEP'
                FocusControl = dbComplemento
              end
              object Label1: TLabel
                Left = 434
                Top = 50
                Width = 22
                Height = 14
                Caption = 'PAIS'
                FocusControl = dbComplemento
              end
              object Label2: TLabel
                Left = 504
                Top = 50
                Width = 13
                Height = 14
                Caption = 'UF'
                FocusControl = dbComplemento
              end
              object Label3: TLabel
                Left = 563
                Top = 50
                Width = 19
                Height = 14
                Caption = 'CEP'
                FocusControl = dbComplemento
              end
              object dbEndereco: TDBEdit
                Left = 9
                Top = 26
                Width = 420
                Height = 22
                CharCase = ecUpperCase
                DataField = 'ENDERECO'
                DataSource = dtsRegistro
                TabOrder = 0
              end
              object dbComplemento: TDBEdit
                Left = 434
                Top = 26
                Width = 215
                Height = 22
                CharCase = ecUpperCase
                DataField = 'COMPLEMENTO'
                DataSource = dtsRegistro
                TabOrder = 1
              end
              object dbBairro: TDBEdit
                Left = 9
                Top = 67
                Width = 210
                Height = 22
                AutoSelect = False
                CharCase = ecUpperCase
                DataField = 'BAIRRO'
                DataSource = dtsRegistro
                TabOrder = 2
              end
              object dbCidade: TDBEdit
                Left = 224
                Top = 67
                Width = 201
                Height = 22
                AutoSelect = False
                CharCase = ecUpperCase
                DataField = 'CIDADE'
                DataSource = dtsRegistro
                TabOrder = 3
              end
              object dbPais: TDBLookupComboBox
                Left = 434
                Top = 67
                Width = 65
                Height = 22
                DataField = 'IDPAIS'
                DataSource = dtsRegistro
                TabOrder = 4
              end
              object dbUF: TDBLookupComboBox
                Left = 504
                Top = 67
                Width = 54
                Height = 22
                DataField = 'IDUF'
                DataSource = dtsRegistro
                TabOrder = 5
              end
              object dbCEP: TDBEdit
                Left = 563
                Top = 67
                Width = 86
                Height = 22
                CharCase = ecUpperCase
                DataField = 'CEP'
                DataSource = dtsRegistro
                TabOrder = 6
              end
            end
          end
          object TabFolha: TTabSheet
            Caption = 'Folha'
            ImageIndex = 2
          end
          object TabEscrita: TTabSheet
            Caption = 'Escrita'
            ImageIndex = 3
          end
          object TabContabilidade: TTabSheet
            Caption = 'Contabilidade'
            ImageIndex = 4
          end
          object TabSheet2: TTabSheet
            Caption = '&Observa'#231#245'es'
            ImageIndex = 1
            object dbObservacao: TDBMemo
              Left = 0
              Top = 0
              Width = 658
              Height = 328
              Align = alClient
              DataField = 'OBSERVACAO'
              DataSource = dtsRegistro
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 40
    Top = 312
  end
  inherited mtRegistro: TClientDataSet
    AfterPost = mtRegistroAfterCancel
    Left = 42
    Top = 368
    object mtRegistroIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object mtRegistroCPF_CGC: TStringField
      FieldName = 'CPF_CGC'
      Size = 14
    end
    object mtRegistroAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 30
    end
    object mtRegistroENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object mtRegistroCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object mtRegistroBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object mtRegistroCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object mtRegistroIDPAIS: TStringField
      FieldName = 'IDPAIS'
      Size = 3
    end
    object mtRegistroIDUF: TStringField
      FieldName = 'IDUF'
      Size = 2
    end
    object mtRegistroCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object mtRegistroTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
    object mtRegistroOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 250
    end
    object mtRegistroPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 1
    end
    object mtRegistroIDGE: TIntegerField
      FieldName = 'IDGE'
    end
  end
  inherited mtListagem: TClientDataSet
    StoreDefs = True
    Left = 34
    Top = 200
    object mtListagemIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
    end
    object mtListagemNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object mtListagemAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 30
    end
    object mtListagemCPF_CGC: TStringField
      FieldName = 'CPF_CGC'
      Size = 14
    end
    object mtListagemIDGE: TIntegerField
      FieldName = 'IDGE'
    end
  end
  inherited dtsListagem: TDataSource
    Left = 32
    Top = 256
  end
  inherited mtPesquisa: TClientDataSet
    Left = 114
    Top = 368
  end
  inherited mtColuna: TClientDataSet
    Left = 114
    Top = 312
  end
  inherited dtsPesquisa: TDataSource
    Left = 120
    Top = 256
  end
end
