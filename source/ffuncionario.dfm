inherited FrmFuncionario: TFrmFuncionario
  Left = 1
  Top = 1
  Caption = 'Funcion'#225'rios'
  ClientHeight = 534
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Height = 534
    inherited lblPrograma: TPanel
      Caption = 'Funcion'#225'rio'
    end
    inherited pnlPesquisa: TPanel
      Top = 434
    end
  end
  inherited PnlClaro: TPanel
    Height = 534
    inherited PnlControle: TPanel
      Top = 494
    end
    inherited PageControl1: TPageControl
      Height = 464
      ActivePage = TabDetalhe
      inherited TabListagem: TTabSheet
        Caption = 'Listagem de Funcion'#225'rios'
        inherited grdCadastro: TcxGrid
          Height = 432
        end
      end
      inherited TabDetalhe: TTabSheet
        Caption = 'Registro do Funcion'#225'rio'
        object pnlPessoa: TPanel
          Left = 0
          Top = 0
          Width = 552
          Height = 59
          Align = alTop
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object lbCodigo: TLabel
            Left = 8
            Top = 9
            Width = 48
            Height = 14
            Caption = 'ID. C'#243'digo'
            FocusControl = dbCodigo
          end
          object lblNome: TLabel
            Left = 78
            Top = 9
            Width = 153
            Height = 14
            Caption = '&Nome da Pessoa / Raz'#227'o Social'
            FocusControl = dbNome
          end
          object lblApelido: TLabel
            Left = 433
            Top = 9
            Width = 86
            Height = 14
            Caption = 'Apelido / Fantasia'
            FocusControl = dbApelido
          end
          object dbCodigo: TDBEdit
            Left = 8
            Top = 26
            Width = 64
            Height = 22
            Hint = 'efsFrameBox'
            DataField = 'IDFUNCIONARIO'
            DataSource = dtsRegistro
            TabOrder = 0
          end
          object dbApelido: TDBEdit
            Left = 433
            Top = 26
            Width = 150
            Height = 22
            Hint = 'efsFrameBump'
            CharCase = ecUpperCase
            DataField = 'APELIDO'
            DataSource = dtsRegistro
            TabOrder = 2
          end
          object dbNome: TDBEdit
            Left = 78
            Top = 26
            Width = 350
            Height = 22
            Hint = 'efsFrameSingle'
            CharCase = ecUpperCase
            DataField = 'NOME'
            DataSource = dtsRegistro
            TabOrder = 1
          end
        end
        object pgFuncionario: TPageControl
          Left = 0
          Top = 59
          Width = 552
          Height = 373
          ActivePage = TabFuncional
          Align = alClient
          HotTrack = True
          MultiLine = True
          Style = tsButtons
          TabOrder = 1
          OnChange = pgFuncionarioChange
          object TabPessoal: TTabSheet
            Caption = '&Dados Pessoais'
            ImageIndex = -1
            object pnlNascimento: TPanel
              Left = 0
              Top = 108
              Width = 544
              Height = 59
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 1
              object Bevel2: TBevel
                Left = 0
                Top = 57
                Width = 544
                Height = 2
                Align = alBottom
                Shape = bsBottomLine
              end
              object lblNascimento: TLabel
                Left = 9
                Top = 9
                Width = 56
                Height = 14
                Caption = 'Nascimento'
                FocusControl = dbNascimento
              end
              object lblNacionalidade: TLabel
                Left = 332
                Top = 9
                Width = 67
                Height = 14
                Caption = 'Nacionalidade'
              end
              object lblNaturalidade: TLabel
                Left = 111
                Top = 9
                Width = 60
                Height = 14
                Caption = 'Naturalidade'
              end
              object lbChegada: TLabel
                Left = 499
                Top = 8
                Width = 66
                Height = 14
                Caption = 'Ano Chegada'
                FocusControl = dbChegada
              end
              object dbNascimento: TDBEdit
                Left = 9
                Top = 26
                Width = 97
                Height = 22
                DataField = 'NASCIMENTO'
                DataSource = dtsRegistro
                TabOrder = 0
              end
              object dbChegada: TDBEdit
                Left = 499
                Top = 26
                Width = 70
                Height = 22
                DataField = 'ANO_CHEGADA'
                DataSource = dtsRegistro
                TabOrder = 3
              end
              object dbNaturalidade: TDBLookupComboBox
                Left = 111
                Top = 26
                Width = 215
                Height = 22
                DataField = 'IDNATURALIDADE'
                DataSource = dtsRegistro
                TabOrder = 1
              end
              object dbNacionalidade: TDBLookupComboBox
                Left = 332
                Top = 26
                Width = 161
                Height = 22
                DataField = 'IDNACIONALIDADE'
                DataSource = dtsRegistro
                TabOrder = 2
              end
            end
            object pnlFiliacao: TPanel
              Left = 0
              Top = 232
              Width = 544
              Height = 67
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 3
              object Bevel3: TBevel
                Left = 0
                Top = 65
                Width = 544
                Height = 2
                Align = alBottom
                Shape = bsBottomLine
              end
              object lblPai: TLabel
                Left = 9
                Top = 12
                Width = 128
                Height = 14
                Caption = 'FILIA'#199#195'O  -   Nome do Pai:'
                FocusControl = dbPai
              end
              object lblMae: TLabel
                Left = 75
                Top = 38
                Width = 68
                Height = 14
                Caption = 'Nome da M'#227'e:'
                FocusControl = dbMae
              end
              object dbMae: TDBEdit
                Left = 148
                Top = 34
                Width = 450
                Height = 22
                Hint = 'efsFrameSingle'
                CharCase = ecUpperCase
                DataField = 'MAE'
                DataSource = dtsRegistro
                TabOrder = 1
              end
              object dbPai: TDBEdit
                Left = 148
                Top = 9
                Width = 450
                Height = 22
                Hint = 'efsFrameSingle'
                CharCase = ecUpperCase
                DataField = 'PAI'
                DataSource = dtsRegistro
                TabOrder = 0
              end
            end
            object pnlCivil: TPanel
              Left = 0
              Top = 167
              Width = 544
              Height = 65
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 2
              object Bevel6: TBevel
                Left = 0
                Top = 62
                Width = 544
                Height = 3
                Align = alBottom
                Shape = bsBottomLine
              end
              object lbInstrucao: TLabel
                Left = 111
                Top = 9
                Width = 122
                Height = 14
                Caption = 'Grau de Instru'#231#227'o (RAIS)'
              end
              object lblEstadoCivil: TLabel
                Left = 9
                Top = 9
                Width = 55
                Height = 14
                Caption = 'Estado Civil'
              end
              object lblSexo: TLabel
                Left = 417
                Top = 9
                Width = 25
                Height = 14
                Caption = '&Sexo'
              end
              object dbDeficiente: TDBCheckBox
                Left = 535
                Top = 26
                Width = 107
                Height = 22
                Caption = 'Deficiente?'
                DataField = 'DEFICIENTE_X'
                DataSource = dtsRegistro
                TabOrder = 3
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbSexo: TDBLookupComboBox
                Left = 417
                Top = 26
                Width = 108
                Height = 22
                DataField = 'SEXO'
                DataSource = dtsRegistro
                TabOrder = 2
              end
              object dbEstadoCivil: TDBLookupComboBox
                Left = 9
                Top = 26
                Width = 98
                Height = 22
                DataField = 'IDESTADO_CIVIL'
                DataSource = dtsRegistro
                TabOrder = 0
              end
              object dbInstrucao: TDBLookupComboBox
                Left = 111
                Top = 26
                Width = 300
                Height = 22
                DataField = 'IDINSTRUCAO'
                DataSource = dtsRegistro
                TabOrder = 1
              end
            end
            object pnlDoc: TPanel
              Left = 0
              Top = 0
              Width = 544
              Height = 108
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object Bevel4: TBevel
                Left = 0
                Top = 106
                Width = 544
                Height = 2
                Align = alBottom
                Shape = bsBottomLine
              end
              object lblCPF: TLabel
                Left = 9
                Top = 9
                Width = 19
                Height = 14
                Caption = 'CPF'
                FocusControl = dbCPF
              end
              object lbPIS: TLabel
                Left = 132
                Top = 9
                Width = 50
                Height = 14
                Caption = 'PIS/PASEP'
                FocusControl = dbPIS
              end
              object lbCTPS: TLabel
                Left = 9
                Top = 54
                Width = 26
                Height = 14
                Caption = 'CTPS'
                FocusControl = dbCTPS
              end
              object lbRG: TLabel
                Left = 246
                Top = 9
                Width = 62
                Height = 14
                Caption = 'RG - N'#250'mero'
                FocusControl = dbRG
              end
              object lblRGOrgao: TLabel
                Left = 359
                Top = 9
                Width = 55
                Height = 14
                Caption = 'RG - '#211'rg'#227'o'
                FocusControl = dbRGOrgao
              end
              object lbRGEmissao: TLabel
                Left = 472
                Top = 9
                Width = 65
                Height = 14
                Caption = 'RG - Emiss'#227'o'
                FocusControl = dbRGEmissao
              end
              object lblCTPSSerie: TLabel
                Left = 132
                Top = 54
                Width = 55
                Height = 14
                Caption = 'CTPS-S'#233'rie'
                FocusControl = dbCTPSSerie
              end
              object Label3: TLabel
                Left = 246
                Top = 54
                Width = 60
                Height = 14
                Caption = 'CTPS-'#211'rg'#227'o'
                FocusControl = dbCTPSOrgao
              end
              object lblCTPSEmissao: TLabel
                Left = 359
                Top = 54
                Width = 70
                Height = 14
                Caption = 'CTPS-Emiss'#227'o'
                FocusControl = dbCTPSEmissao
              end
              object dbCPF: TDBEdit
                Left = 9
                Top = 26
                Width = 118
                Height = 22
                Hint = 'efsFrameBump'
                CharCase = ecUpperCase
                DataField = 'CPF_CGC'
                DataSource = dtsRegistro
                TabOrder = 0
                OnExit = dbCPFExit
              end
              object dbPIS: TDBEdit
                Left = 132
                Top = 26
                Width = 108
                Height = 22
                Hint = 'efsFrameBump'
                CharCase = ecUpperCase
                DataField = 'PIS_IPASEP'
                DataSource = dtsRegistro
                TabOrder = 1
              end
              object dbCTPS: TDBEdit
                Left = 9
                Top = 71
                Width = 118
                Height = 22
                Hint = 'efsFrameBump'
                CharCase = ecUpperCase
                DataField = 'CTPS'
                DataSource = dtsRegistro
                TabOrder = 5
              end
              object dbRG: TDBEdit
                Left = 246
                Top = 26
                Width = 107
                Height = 22
                Hint = 'efsFrameBump'
                CharCase = ecUpperCase
                DataField = 'RG'
                DataSource = dtsRegistro
                TabOrder = 2
              end
              object dbRGOrgao: TDBEdit
                Left = 359
                Top = 26
                Width = 107
                Height = 22
                Hint = 'efsFrameBump'
                CharCase = ecUpperCase
                DataField = 'RG_ORGAO'
                DataSource = dtsRegistro
                TabOrder = 3
              end
              object dbRGEmissao: TDBEdit
                Left = 472
                Top = 26
                Width = 107
                Height = 22
                Hint = 'efsFrameBump'
                DataField = 'RG_EMISSAO'
                DataSource = dtsRegistro
                TabOrder = 4
              end
              object dbCTPSSerie: TDBEdit
                Left = 132
                Top = 71
                Width = 108
                Height = 22
                Hint = 'efsFrameBump'
                CharCase = ecUpperCase
                DataField = 'CTPS_SERIE'
                DataSource = dtsRegistro
                TabOrder = 6
              end
              object dbCTPSOrgao: TDBEdit
                Left = 246
                Top = 71
                Width = 107
                Height = 22
                Hint = 'efsFrameBump'
                CharCase = ecUpperCase
                DataField = 'CTPS_ORGAO'
                DataSource = dtsRegistro
                TabOrder = 7
              end
              object dbCTPSEmissao: TDBEdit
                Left = 359
                Top = 71
                Width = 107
                Height = 22
                Hint = 'efsFrameBump'
                CharCase = ecUpperCase
                DataField = 'CTPS_EMISSAO'
                DataSource = dtsRegistro
                TabOrder = 8
              end
            end
          end
          object TabFuncional: TTabSheet
            Caption = 'Dados Funcionais'
            ImageIndex = 3
            object Bevel7: TBevel
              Left = 0
              Top = 181
              Width = 544
              Height = 2
              Align = alTop
              Shape = bsBottomLine
            end
            object Bevel8: TBevel
              Left = 0
              Top = 119
              Width = 544
              Height = 2
              Align = alTop
              Shape = bsBottomLine
            end
            object Bevel15: TBevel
              Left = 0
              Top = 243
              Width = 544
              Height = 2
              Align = alTop
              Shape = bsBottomLine
            end
            object pnlSalario: TPanel
              Left = 0
              Top = 0
              Width = 544
              Height = 60
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object Bevel5: TBevel
                Left = 0
                Top = 58
                Width = 544
                Height = 2
                Align = alBottom
                Shape = bsBottomLine
              end
              object lbAdmissao: TLabel
                Left = 8
                Top = 8
                Width = 48
                Height = 14
                Caption = 'Admiss'#227'o'
              end
              object lbSalario: TLabel
                Left = 100
                Top = 8
                Width = 33
                Height = 14
                Caption = 'Sal'#225'rio'
              end
              object Label1: TLabel
                Left = 192
                Top = 8
                Width = 45
                Height = 14
                Caption = 'C Hor'#225'ria'
                FocusControl = dbCarga
              end
              object lbTipoSalario: TLabel
                Left = 251
                Top = 8
                Width = 71
                Height = 14
                Caption = 'Tipo de Sal'#225'rio'
                FocusControl = dbCarga
              end
              object lblSalarioMensal: TLabel
                Left = 508
                Top = 8
                Width = 70
                Height = 14
                Caption = 'Sal'#225'rio Mensal'
                Enabled = False
                FocusControl = dbSalarioMensal
              end
              object dbCarga: TDBEdit
                Left = 192
                Top = 26
                Width = 54
                Height = 22
                DataField = 'CARGA_HORARIA'
                DataSource = dtsRegistro
                TabOrder = 2
              end
              object dbAdmissao: TDBEdit
                Left = 8
                Top = 26
                Width = 86
                Height = 22
                DataField = 'ADMISSAO'
                DataSource = dtsRegistro
                TabOrder = 0
              end
              object dbSalario: TDBEdit
                Left = 100
                Top = 26
                Width = 86
                Height = 22
                DataField = 'SALARIO'
                DataSource = dtsRegistro
                TabOrder = 1
              end
              object dbTipoSalario: TDBLookupComboBox
                Left = 251
                Top = 26
                Width = 250
                Height = 22
                DataField = 'IDSALARIO'
                DataSource = dtsRegistro
                DropDownRows = 6
                TabOrder = 3
              end
              object dbSalarioMensal: TDBEdit
                Left = 508
                Top = 26
                Width = 86
                Height = 22
                TabStop = False
                DataField = 'SALARIO_MENSAL'
                DataSource = dtsRegistro
                ParentColor = True
                ReadOnly = True
                TabOrder = 4
              end
            end
            object pnlRecurso: TPanel
              Left = 0
              Top = 121
              Width = 544
              Height = 60
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 2
              object lbLotacao: TLabel
                Left = 329
                Top = 8
                Width = 115
                Height = 14
                Caption = 'Lota'#231#227'o / Departamento'
              end
              object lbCargo: TLabel
                Left = 8
                Top = 9
                Width = 74
                Height = 14
                Caption = 'Cargo / Fun'#231#227'o'
              end
              object lbNivel: TLabel
                Left = 253
                Top = 8
                Width = 70
                Height = 14
                Caption = 'N'#237'vel do Cargo'
                FocusControl = dbNivel
              end
              object dbLotacao2: TDBEdit
                Left = 392
                Top = 26
                Width = 210
                Height = 22
                CharCase = ecUpperCase
                DataField = 'LOTACAO'
                DataSource = dtsRegistro
                Enabled = False
                ParentColor = True
                TabOrder = 4
              end
              object dbLotacao: TAKDBEdit
                Left = 328
                Top = 26
                Width = 35
                Height = 22
                DataField = 'IDLOTACAO'
                DataSource = dtsRegistro
                TabOrder = 3
                ButtonSpacing = 2
                OnButtonClick = dbLotacaoButtonClick
              end
              object dbCargo: TAKDBEdit
                Left = 8
                Top = 26
                Width = 35
                Height = 22
                CharCase = ecUpperCase
                DataField = 'IDCARGO'
                DataSource = dtsRegistro
                TabOrder = 0
                ButtonSpacing = 3
                OnButtonClick = dbLotacaoButtonClick
              end
              object dbCargo2: TDBEdit
                Left = 73
                Top = 26
                Width = 210
                Height = 22
                CharCase = ecUpperCase
                DataField = 'CARGO'
                DataSource = dtsRegistro
                Enabled = False
                ParentColor = True
                TabOrder = 1
              end
              object dbNivel: TDBEdit
                Left = 288
                Top = 26
                Width = 35
                Height = 22
                DataField = 'CARGO_NIVEL'
                DataSource = dtsRegistro
                TabOrder = 2
              end
            end
            object pnlFGTS: TPanel
              Left = 0
              Top = 60
              Width = 544
              Height = 59
              Align = alTop
              BevelOuter = bvNone
              BorderWidth = 1
              ParentColor = True
              TabOrder = 1
              object lbOpcao: TLabel
                Left = 9
                Top = 9
                Width = 69
                Height = 14
                Caption = 'FGTS - Op'#231#227'o'
              end
              object lbRetratacao: TLabel
                Left = 111
                Top = 9
                Width = 90
                Height = 14
                Caption = 'FGTS - Retrata'#231#227'o'
              end
              object dbOpcao: TDBEdit
                Left = 9
                Top = 27
                Width = 97
                Height = 22
                DataField = 'FGTS_OPCAO'
                DataSource = dtsRegistro
                TabOrder = 0
              end
              object dbRetratacao: TDBEdit
                Left = 111
                Top = 27
                Width = 97
                Height = 22
                DataField = 'FGTS_RETRATACAO'
                DataSource = dtsRegistro
                TabOrder = 1
              end
              object dbFGTS: TDBCheckBox
                Left = 213
                Top = 27
                Width = 108
                Height = 20
                Caption = 'Recolhe FGTS?'
                DataField = 'FGTS_X'
                DataSource = dtsRegistro
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbOptante: TDBCheckBox
                Left = 325
                Top = 27
                Width = 76
                Height = 20
                Caption = 'Optante?'
                DataField = 'OPTANTE_X'
                DataSource = dtsRegistro
                TabOrder = 3
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object pnlPagamento: TPanel
              Left = 0
              Top = 183
              Width = 544
              Height = 60
              Align = alTop
              BevelOuter = bvNone
              BorderWidth = 1
              ParentColor = True
              TabOrder = 3
              object lbGP: TLabel
                Left = 8
                Top = 9
                Width = 101
                Height = 14
                Caption = 'Grupo de Pagamento'
                FocusControl = dbGP
              end
              object lbRecurso: TLabel
                Left = 203
                Top = 9
                Width = 122
                Height = 14
                Caption = 'Recurso para Pagamento'
              end
              object lbNaturezaRendimento: TLabel
                Left = 398
                Top = 9
                Width = 118
                Height = 14
                Caption = 'Natureza do Rendimento'
                FocusControl = dbNaturezaRendimento
              end
              object dbGP: TDBLookupComboBox
                Left = 8
                Top = 26
                Width = 190
                Height = 22
                DataField = 'IDGP'
                DataSource = dtsRegistro
                TabOrder = 0
              end
              object dbRecurso: TDBLookupComboBox
                Left = 203
                Top = 26
                Width = 190
                Height = 22
                DataField = 'IDRECURSO'
                DataSource = dtsRegistro
                TabOrder = 1
              end
              object dbNaturezaRendimento: TDBLookupComboBox
                Left = 398
                Top = 26
                Width = 200
                Height = 22
                DataField = 'IDNATUREZA'
                DataSource = dtsRegistro
                TabOrder = 2
              end
            end
          end
          object TabAdicional: TTabSheet
            Caption = 'Dados Adicionais'
            ImageIndex = 5
            object Bevel9: TBevel
              Left = 0
              Top = 99
              Width = 544
              Height = 2
              Align = alTop
              Shape = bsBottomLine
            end
            object Bevel1: TBevel
              Left = 0
              Top = 43
              Width = 544
              Height = 2
              Align = alTop
              Shape = bsBottomLine
            end
            object Bevel10: TBevel
              Left = 0
              Top = 160
              Width = 544
              Height = 3
              Align = alTop
              Shape = bsBottomLine
            end
            object pnlBanco: TPanel
              Left = 0
              Top = 101
              Width = 544
              Height = 59
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 2
              object lbAgencia: TLabel
                Left = 252
                Top = 9
                Width = 40
                Height = 14
                Caption = 'Ag'#234'ncia'
                FocusControl = dbAgencia
              end
              object lbBanco: TLabel
                Left = 8
                Top = 9
                Width = 31
                Height = 14
                Caption = '&Banco'
                FocusControl = dbBanco
              end
              object lbContaBancaria: TLabel
                Left = 497
                Top = 9
                Width = 74
                Height = 14
                Caption = 'Conta Banc'#225'ria'
                FocusControl = dbAgencia
              end
              object dbBanco2: TDBEdit
                Left = 67
                Top = 26
                Width = 180
                Height = 22
                CharCase = ecUpperCase
                DataField = 'BANCO'
                DataSource = dtsRegistro
                Enabled = False
                ParentColor = True
                TabOrder = 1
              end
              object dbAgencia2: TDBEdit
                Left = 311
                Top = 26
                Width = 180
                Height = 22
                CharCase = ecUpperCase
                DataField = 'AGENCIA'
                DataSource = dtsRegistro
                Enabled = False
                ParentColor = True
                TabOrder = 3
              end
              object dbBanco: TDBEdit
                Left = 8
                Top = 26
                Width = 53
                Height = 22
                DataField = 'IDBANCO'
                DataSource = dtsRegistro
                TabOrder = 0
              end
              object dbAgencia: TDBEdit
                Left = 252
                Top = 26
                Width = 54
                Height = 22
                DataField = 'IDAGENCIA'
                DataSource = dtsRegistro
                TabOrder = 2
              end
              object dbContaBancaria: TDBEdit
                Left = 497
                Top = 26
                Width = 100
                Height = 22
                CharCase = ecUpperCase
                DataField = 'CONTA_BANCARIA'
                DataSource = dtsRegistro
                TabOrder = 4
              end
            end
            object pnlAdiantamento: TPanel
              Left = 0
              Top = 0
              Width = 544
              Height = 43
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object dbAdiantamento_x: TDBCheckBox
                Left = 8
                Top = 9
                Width = 207
                Height = 18
                Caption = 'Receber adiantamento salarial ?'
                DataField = 'ADIANTAMENTO_X'
                DataSource = dtsRegistro
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbAdiantamento: TDBEdit
                Left = 223
                Top = 9
                Width = 86
                Height = 22
                DataField = 'ADIANTAMENTO'
                DataSource = dtsRegistro
                TabOrder = 1
              end
            end
            object pnlSindicato: TPanel
              Left = 0
              Top = 45
              Width = 544
              Height = 54
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 1
              object lbSindicato: TLabel
                Left = 7
                Top = 3
                Width = 44
                Height = 14
                Caption = 'Sindicato'
              end
              object dbSindicato: TDBLookupComboBox
                Left = 7
                Top = 20
                Width = 320
                Height = 22
                DataField = 'IDSINDICATO'
                DataSource = dtsRegistro
                TabOrder = 0
              end
              object dbAssociado: TDBCheckBox
                Left = 339
                Top = 7
                Width = 183
                Height = 18
                Caption = #201' associado neste sindicato?'
                DataField = 'ADIANTAMENTO_X'
                DataSource = dtsRegistro
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbImpostoSindical: TDBCheckBox
                Left = 339
                Top = 31
                Width = 210
                Height = 18
                Hint = 'Obrigat'#243'rio apenas aos admitidos ap'#243's o m'#234's de mar'#231'o'
                Caption = 'J'#225' pagou o imposto sindical este ano?'
                DataField = 'IMPOSTO_SINDICAL_X'
                DataSource = dtsRegistro
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object pnlStatus: TPanel
              Left = 0
              Top = 292
              Width = 544
              Height = 49
              Align = alBottom
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 3
              object lblCadastro: TLabel
                Left = 330
                Top = 9
                Width = 44
                Height = 14
                Caption = 'Cadastro'
                FocusControl = dbCadastro
              end
              object lblAtualizacao: TLabel
                Left = 470
                Top = 9
                Width = 57
                Height = 14
                Caption = 'Atualiza'#231#227'o'
                FocusControl = dbAtualizacao
              end
              object dbCadastro: TDBEdit
                Tag = 1
                Left = 330
                Top = 26
                Width = 129
                Height = 22
                Hint = 'efsFrameBox'
                DataField = 'CADASTRO'
                DataSource = dtsRegistro
                Enabled = False
                MaxLength = 10
                ParentColor = True
                TabOrder = 0
              end
              object dbAtualizacao: TDBEdit
                Tag = 1
                Left = 470
                Top = 26
                Width = 129
                Height = 22
                Hint = 'efsFrameSingle'
                DataField = 'ATUALIZACAO'
                DataSource = dtsRegistro
                Enabled = False
                MaxLength = 13
                ParentColor = True
                TabOrder = 1
              end
            end
          end
          object TabEndereco: TTabSheet
            Hint = 'Endere'#231'os, Telefones e Internet'
            Caption = 'Endere'#231'os'
            ImageIndex = -1
            ParentShowHint = False
            ShowHint = True
            object pnlEndereco1: TPanel
              Left = 0
              Top = 0
              Width = 544
              Height = 86
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object Bevel11: TBevel
                Left = 0
                Top = 84
                Width = 544
                Height = 2
                Align = alBottom
                Shape = bsBottomLine
              end
              object LblEndereco1: TLabel
                Left = 8
                Top = 9
                Width = 357
                Height = 14
                Caption = 
                  '1 - Endere'#231'o Principal - Logradouro, rua, no., andar, apto. / Ba' +
                  'irro / Cidade'
              end
              object lblComplemento1: TLabel
                Left = 413
                Top = 9
                Width = 145
                Height = 14
                Caption = 'Complemento / PAIS / UF / CEP'
                FocusControl = dbComplemento1
              end
              object dbEndereco1: TDBEdit
                Left = 8
                Top = 26
                Width = 400
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 0
              end
              object dbComplemento1: TDBEdit
                Left = 413
                Top = 26
                Width = 200
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object dbBairro1: TDBEdit
                Left = 8
                Top = 52
                Width = 200
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 2
              end
              object dbCidade1: TDBEdit
                Left = 213
                Top = 52
                Width = 195
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 3
              end
              object dbPais1: TDBLookupComboBox
                Left = 413
                Top = 52
                Width = 60
                Height = 22
                TabOrder = 4
              end
              object dbUF1: TDBLookupComboBox
                Left = 478
                Top = 52
                Width = 54
                Height = 22
                TabOrder = 5
              end
              object dbCEP1: TDBEdit
                Left = 538
                Top = 52
                Width = 75
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 6
              end
            end
            object pnlTelefone: TPanel
              Left = 0
              Top = 172
              Width = 544
              Height = 60
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 2
              object Bevel13: TBevel
                Left = 0
                Top = 58
                Width = 612
                Height = 2
                Align = alBottom
                Shape = bsBottomLine
              end
              object lblTelefone1: TLabel
                Left = 8
                Top = 9
                Width = 84
                Height = 14
                Caption = 'Telefone Principal'
                FocusControl = dbTelefone1
              end
              object lblTelefone2: TLabel
                Left = 108
                Top = 9
                Width = 74
                Height = 14
                Caption = 'Telefone Comp.'
                FocusControl = dbTelefone2
              end
              object lblFax: TLabel
                Left = 209
                Top = 9
                Width = 18
                Height = 14
                Caption = 'Fax'
                FocusControl = dbFax
              end
              object lblCelular: TLabel
                Left = 410
                Top = 9
                Width = 33
                Height = 14
                Caption = 'Celular'
                FocusControl = dbCelular
              end
              object lblBIP: TLabel
                Left = 511
                Top = 9
                Width = 84
                Height = 14
                Caption = '2o. Celular ou BIP'
                FocusControl = dbBIP
              end
              object lblFoneFax: TLabel
                Left = 310
                Top = 9
                Width = 45
                Height = 14
                Caption = 'Fone/Fax'
              end
              object dbTelefone1: TDBEdit
                Left = 8
                Top = 26
                Width = 95
                Height = 22
                CharCase = ecLowerCase
                TabOrder = 0
              end
              object dbTelefone2: TDBEdit
                Left = 108
                Top = 26
                Width = 95
                Height = 22
                CharCase = ecLowerCase
                TabOrder = 1
              end
              object dbFax: TDBEdit
                Left = 209
                Top = 26
                Width = 95
                Height = 22
                CharCase = ecLowerCase
                TabOrder = 2
              end
              object dbCelular: TDBEdit
                Left = 410
                Top = 26
                Width = 95
                Height = 22
                CharCase = ecLowerCase
                TabOrder = 4
              end
              object dbBIP: TDBEdit
                Left = 511
                Top = 26
                Width = 95
                Height = 22
                CharCase = ecLowerCase
                TabOrder = 5
              end
              object dbFoneFax: TDBEdit
                Left = 310
                Top = 26
                Width = 95
                Height = 22
                CharCase = ecLowerCase
                TabOrder = 3
              end
            end
            object pnlInternet: TPanel
              Left = 0
              Top = 232
              Width = 544
              Height = 64
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 3
              object Bevel14: TBevel
                Left = 0
                Top = 61
                Width = 612
                Height = 3
                Align = alBottom
                Shape = bsBottomLine
              end
              object lblEmail: TLabel
                Left = 8
                Top = 13
                Width = 58
                Height = 14
                Caption = 'E-Mail (lista)'
                FocusControl = dbEmail
              end
              object lblHP: TLabel
                Left = 8
                Top = 39
                Width = 85
                Height = 14
                Caption = 'Home-Page (lista)'
                FocusControl = dbHomePage
              end
              object dbHomePage: TDBEdit
                Left = 115
                Top = 34
                Width = 323
                Height = 22
                CharCase = ecLowerCase
                TabOrder = 1
              end
              object dbEmail: TDBEdit
                Left = 115
                Top = 9
                Width = 323
                Height = 22
                CharCase = ecLowerCase
                TabOrder = 0
              end
            end
            object pnlEndereco2: TPanel
              Left = 0
              Top = 86
              Width = 544
              Height = 86
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 1
              object Bevel12: TBevel
                Left = 0
                Top = 84
                Width = 544
                Height = 2
                Align = alBottom
                Shape = bsBottomLine
              end
              object lblEndereco2: TLabel
                Left = 8
                Top = 9
                Width = 385
                Height = 14
                Caption = 
                  '2 - Endere'#231'o Complementar - Logradouro, rua, no., andar, apto. /' +
                  ' Bairro / Cidade'
                FocusControl = dbEndereco2
              end
              object lblComplemento2: TLabel
                Left = 413
                Top = 9
                Width = 145
                Height = 14
                Caption = 'Complemento / PAIS / UF / CEP'
                FocusControl = dbComplemento2
              end
              object dbEndereco2: TDBEdit
                Left = 8
                Top = 26
                Width = 400
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 0
              end
              object dbBairro2: TDBEdit
                Left = 8
                Top = 52
                Width = 200
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 2
              end
              object dbCidade2: TDBEdit
                Left = 213
                Top = 52
                Width = 195
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 3
              end
              object dbPais2: TDBLookupComboBox
                Left = 413
                Top = 52
                Width = 60
                Height = 22
                TabOrder = 4
              end
              object dbComplemento2: TDBEdit
                Left = 413
                Top = 26
                Width = 200
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object dbUF2: TDBLookupComboBox
                Left = 478
                Top = 52
                Width = 54
                Height = 22
                TabOrder = 5
              end
              object dbCEP2: TDBEdit
                Left = 538
                Top = 52
                Width = 75
                Height = 22
                CharCase = ecUpperCase
                TabOrder = 6
              end
            end
          end
          object TabRAIS: TTabSheet
            Caption = 'RAIS'
            ImageIndex = 4
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 544
              Height = 253
              Align = alTop
              BevelOuter = bvNone
              ParentColor = True
              TabOrder = 0
              object lbIDAdmissao: TLabel
                Left = 8
                Top = 12
                Width = 88
                Height = 14
                Caption = 'Tipo de Admiss'#227'o:'
                FocusControl = dbIDAdmissao
              end
              object lbRaca: TLabel
                Left = 8
                Top = 38
                Width = 28
                Height = 14
                Caption = 'Ra'#231'a:'
                FocusControl = dbRaca
              end
              object lbSabado: TLabel
                Left = 8
                Top = 64
                Width = 40
                Height = 14
                Caption = 'S'#225'bado:'
                FocusControl = dbSabado
              end
              object lbSituacao: TLabel
                Left = 8
                Top = 98
                Width = 45
                Height = 14
                Caption = 'Situa'#231#227'o:'
                FocusControl = dbSituacao
              end
              object lbTipo: TLabel
                Left = 8
                Top = 124
                Width = 23
                Height = 14
                Caption = 'Tipo:'
                FocusControl = dbTipo
              end
              object lbVinculo: TLabel
                Left = 8
                Top = 158
                Width = 87
                Height = 14
                Caption = 'V'#237'nculo Empregat.'
                FocusControl = dbVinculo
              end
              object lbIDFGTS: TLabel
                Left = 8
                Top = 193
                Width = 68
                Height = 14
                Caption = 'Tipo de FGTS:'
                FocusControl = dbIDFGTS
              end
              object lbCAGED: TLabel
                Left = 8
                Top = 219
                Width = 89
                Height = 14
                Caption = 'CAGED Admiss'#227'o:'
                FocusControl = dbCAGED
              end
              object dbIDAdmissao: TDBLookupComboBox
                Left = 111
                Top = 9
                Width = 54
                Height = 22
                DataField = 'IDADMISSAO'
                DataSource = dtsRegistro
                DropDownRows = 5
                DropDownWidth = 350
                TabOrder = 0
              end
              object dbIDAdmissao2: TDBLookupComboBox
                Left = 170
                Top = 9
                Width = 323
                Height = 22
                BevelEdges = [beLeft, beTop, beRight]
                BevelInner = bvLowered
                BevelOuter = bvRaised
                DataField = 'IDADMISSAO'
                DataSource = dtsRegistro
                DropDownRows = 6
                Enabled = False
                ParentColor = True
                TabOrder = 1
              end
              object dbRaca: TDBLookupComboBox
                Left = 111
                Top = 34
                Width = 54
                Height = 22
                DataField = 'IDRACA'
                DataSource = dtsRegistro
                DropDownRows = 5
                DropDownWidth = 350
                TabOrder = 2
              end
              object dbRaca2: TDBLookupComboBox
                Left = 170
                Top = 34
                Width = 323
                Height = 22
                DataField = 'IDRACA'
                DataSource = dtsRegistro
                DropDownRows = 6
                Enabled = False
                ParentColor = True
                TabOrder = 3
              end
              object dbSabado: TDBLookupComboBox
                Left = 111
                Top = 60
                Width = 54
                Height = 22
                DataField = 'IDSABADO'
                DataSource = dtsRegistro
                DropDownRows = 5
                DropDownWidth = 350
                TabOrder = 4
              end
              object dbSabado2: TDBLookupComboBox
                Left = 170
                Top = 60
                Width = 323
                Height = 22
                DataField = 'IDSABADO'
                DataSource = dtsRegistro
                DropDownRows = 6
                Enabled = False
                ParentColor = True
                TabOrder = 5
              end
              object dbSituacao: TDBLookupComboBox
                Left = 111
                Top = 95
                Width = 54
                Height = 22
                DataField = 'IDSITUACAO'
                DataSource = dtsRegistro
                DropDownRows = 5
                DropDownWidth = 350
                TabOrder = 6
              end
              object dbSituacao2: TDBLookupComboBox
                Left = 170
                Top = 95
                Width = 323
                Height = 22
                DataField = 'IDSITUACAO'
                DataSource = dtsRegistro
                DropDownRows = 6
                Enabled = False
                ParentColor = True
                TabOrder = 7
              end
              object dbTipo: TDBLookupComboBox
                Left = 111
                Top = 121
                Width = 54
                Height = 22
                DataField = 'IDTIPO'
                DataSource = dtsRegistro
                DropDownRows = 5
                DropDownWidth = 350
                TabOrder = 8
              end
              object dbTipo2: TDBLookupComboBox
                Left = 170
                Top = 121
                Width = 323
                Height = 22
                DataField = 'IDTIPO'
                DataSource = dtsRegistro
                DropDownRows = 6
                Enabled = False
                ParentColor = True
                TabOrder = 9
              end
              object dbVinculo: TDBLookupComboBox
                Left = 111
                Top = 155
                Width = 54
                Height = 22
                DataField = 'IDVINCULO'
                DataSource = dtsRegistro
                DropDownRows = 5
                DropDownWidth = 350
                TabOrder = 10
              end
              object dbVinculo2: TDBLookupComboBox
                Left = 170
                Top = 155
                Width = 323
                Height = 22
                DataField = 'IDVINCULO'
                DataSource = dtsRegistro
                DropDownRows = 6
                Enabled = False
                ParentColor = True
                TabOrder = 11
              end
              object dbIDFGTS: TDBLookupComboBox
                Left = 111
                Top = 181
                Width = 54
                Height = 22
                DataField = 'IDFGTS'
                DataSource = dtsRegistro
                DropDownRows = 5
                DropDownWidth = 350
                TabOrder = 12
              end
              object dbIDFGTS2: TDBLookupComboBox
                Left = 170
                Top = 181
                Width = 323
                Height = 22
                DataField = 'IDFGTS'
                DataSource = dtsRegistro
                DropDownRows = 6
                Enabled = False
                ParentColor = True
                TabOrder = 13
              end
              object dbCAGED: TDBLookupComboBox
                Left = 111
                Top = 215
                Width = 54
                Height = 22
                DataField = 'IDCAGED_ADMISSAO'
                DataSource = dtsRegistro
                DropDownRows = 5
                DropDownWidth = 350
                TabOrder = 14
              end
              object dbCAGED2: TDBLookupComboBox
                Left = 170
                Top = 215
                Width = 323
                Height = 22
                DataField = 'IDCAGED_ADMISSAO'
                DataSource = dtsRegistro
                DropDownRows = 6
                Enabled = False
                ParentColor = True
                TabOrder = 15
              end
            end
          end
          object TabObservacao: TTabSheet
            Caption = 'Observa'#231#227'o'
            ImageIndex = 2
            object dbObservacao: TDBMemo
              Left = 0
              Top = 0
              Width = 612
              Height = 341
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
  inherited pnlProgress: TPanel
    inherited imgAguarde: TRxGIFAnimator
      Width = 195
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
    Left = 32
    Top = 392
  end
  inherited mtRegistro: TClientDataSet
    BeforeInsert = mtRegistroBeforeInsert
    OnCalcFields = mtRegistroCalcFields
    Left = 98
    Top = 392
    object mtRegistroIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object mtRegistroIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object mtRegistroIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
    end
    object mtRegistroIDADMISSAO: TStringField
      FieldName = 'IDADMISSAO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDRACA: TStringField
      FieldName = 'IDRACA'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDSABADO: TStringField
      FieldName = 'IDSABADO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDSALARIO: TStringField
      FieldName = 'IDSALARIO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDSITUACAO: TStringField
      FieldName = 'IDSITUACAO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDTIPO: TStringField
      FieldName = 'IDTIPO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDVINCULO: TStringField
      FieldName = 'IDVINCULO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDFGTS: TStringField
      FieldName = 'IDFGTS'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDCAGED_ADMISSAO: TStringField
      FieldName = 'IDCAGED_ADMISSAO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDCAGED_DEMISSAO: TStringField
      FieldName = 'IDCAGED_DEMISSAO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroADMISSAO: TDateField
      FieldName = 'ADMISSAO'
    end
    object mtRegistroCARGA_HORARIA: TSmallintField
      FieldName = 'CARGA_HORARIA'
    end
    object mtRegistroSALARIO: TCurrencyField
      FieldName = 'SALARIO'
      DisplayFormat = ',0.000'
    end
    object mtRegistroIDRESCISAO: TStringField
      FieldName = 'IDRESCISAO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDINSTRUCAO: TStringField
      FieldName = 'IDINSTRUCAO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroCARGO_NIVEL: TSmallintField
      FieldName = 'CARGO_NIVEL'
    end
    object mtRegistroPIS_IPASEP: TStringField
      FieldName = 'PIS_IPASEP'
      OnGetText = mtRegistroPIS_IPASEPGetText
      FixedChar = True
      Size = 11
    end
    object mtRegistroCTPS: TStringField
      DisplayWidth = 20
      FieldName = 'CTPS'
      FixedChar = True
    end
    object mtRegistroCTPS_SERIE: TStringField
      FieldName = 'CTPS_SERIE'
      Size = 10
    end
    object mtRegistroCTPS_ORGAO: TStringField
      FieldName = 'CTPS_ORGAO'
      Size = 10
    end
    object mtRegistroCTPS_EMISSAO: TDateField
      FieldName = 'CTPS_EMISSAO'
    end
    object mtRegistroDEMISSAO: TDateField
      FieldName = 'DEMISSAO'
    end
    object mtRegistroANO_CHEGADA: TSmallintField
      FieldName = 'ANO_CHEGADA'
    end
    object mtRegistroOPTANTE_X: TSmallintField
      FieldName = 'OPTANTE_X'
    end
    object mtRegistroFGTS_X: TSmallintField
      FieldName = 'FGTS_X'
    end
    object mtRegistroFGTS_OPCAO: TDateField
      FieldName = 'FGTS_OPCAO'
    end
    object mtRegistroFGTS_RETRATACAO: TDateField
      FieldName = 'FGTS_RETRATACAO'
    end
    object mtRegistroDEFICIENTE_X: TSmallintField
      FieldName = 'DEFICIENTE_X'
    end
    object mtRegistroIDRECURSO: TStringField
      FieldName = 'IDRECURSO'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDSINDICATO: TIntegerField
      FieldName = 'IDSINDICATO'
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object mtRegistroAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 38
    end
    object mtRegistroCODIGO: TStringField
      FieldName = 'CODIGO'
      FixedChar = True
      Size = 10
    end
    object mtRegistroPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object mtRegistroCPF_CGC: TStringField
      FieldName = 'CPF_CGC'
      OnGetText = mtRegistroCPF_CGCGetText
      Size = 22
    end
    object mtRegistroRG: TStringField
      FieldName = 'RG'
    end
    object mtRegistroRG_ORGAO: TStringField
      FieldName = 'RG_ORGAO'
      Size = 10
    end
    object mtRegistroRG_EMISSAO: TDateField
      FieldName = 'RG_EMISSAO'
    end
    object mtRegistroSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object mtRegistroPAI: TStringField
      FieldName = 'PAI'
      Size = 58
    end
    object mtRegistroMAE: TStringField
      FieldName = 'MAE'
      Size = 58
    end
    object mtRegistroIDNACIONALIDADE: TStringField
      FieldName = 'IDNACIONALIDADE'
      FixedChar = True
      Size = 3
    end
    object mtRegistroIDNATURALIDADE: TStringField
      FieldName = 'IDNATURALIDADE'
      FixedChar = True
      Size = 2
    end
    object mtRegistroIDESTADO_CIVIL: TStringField
      FieldName = 'IDESTADO_CIVIL'
      FixedChar = True
      Size = 2
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
      FixedChar = True
      Size = 3
    end
    object mtRegistroIDUF: TStringField
      FieldName = 'IDUF'
      FixedChar = True
      Size = 2
    end
    object mtRegistroCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object mtRegistroENDERECO2: TStringField
      FieldName = 'ENDERECO2'
      Size = 50
    end
    object mtRegistroCOMPLEMENTO2: TStringField
      FieldName = 'COMPLEMENTO2'
      Size = 30
    end
    object mtRegistroBAIRRO2: TStringField
      FieldName = 'BAIRRO2'
      Size = 30
    end
    object mtRegistroCIDADE2: TStringField
      FieldName = 'CIDADE2'
      Size = 30
    end
    object mtRegistroIDPAIS2: TStringField
      FieldName = 'IDPAIS2'
      FixedChar = True
      Size = 3
    end
    object mtRegistroIDUF2: TStringField
      FieldName = 'IDUF2'
      FixedChar = True
      Size = 2
    end
    object mtRegistroCEP2: TStringField
      FieldName = 'CEP2'
      Size = 16
    end
    object mtRegistroCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 23
    end
    object mtRegistroBIP: TStringField
      FieldName = 'BIP'
      Size = 23
    end
    object mtRegistroFAX: TStringField
      FieldName = 'FAX'
      Size = 23
    end
    object mtRegistroPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 23
    end
    object mtRegistroCOMPLEMENTAR: TStringField
      FieldName = 'COMPLEMENTAR'
      Size = 23
    end
    object mtRegistroFONEFAX: TStringField
      FieldName = 'FONEFAX'
      Size = 23
    end
    object mtRegistroEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 258
    end
    object mtRegistroHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 258
    end
    object mtRegistroOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 258
    end
    object mtRegistroCADASTRO: TSQLTimeStampField
      FieldName = 'CADASTRO'
      ProviderFlags = [pfInWhere]
    end
    object mtRegistroATUALIZACAO: TSQLTimeStampField
      FieldName = 'ATUALIZACAO'
      ProviderFlags = [pfInWhere]
    end
    object mtRegistroNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
    end
    object mtRegistroIDLOTACAO: TStringField
      FieldName = 'IDLOTACAO'
      Size = 10
    end
    object mtRegistroIDGP: TStringField
      FieldName = 'IDGP'
      Size = 10
    end
    object mtRegistroLOTACAO: TStringField
      FieldName = 'LOTACAO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object mtRegistroIDCARGO: TStringField
      FieldName = 'IDCARGO'
      Size = 10
    end
    object mtRegistroCARGO: TStringField
      FieldName = 'CARGO'
      ProviderFlags = [pfInWhere]
      Size = 50
    end
    object mtRegistroIDBANCO: TStringField
      FieldName = 'IDBANCO'
      Size = 3
    end
    object mtRegistroBANCO: TStringField
      FieldName = 'BANCO'
      Size = 50
    end
    object mtRegistroIDAGENCIA: TStringField
      FieldName = 'IDAGENCIA'
      OnGetText = mtRegistroIDAGENCIAGetText
      Size = 5
    end
    object mtRegistroAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 50
    end
    object mtRegistroCONTA_BANCARIA: TStringField
      FieldName = 'CONTA_BANCARIA'
      OnGetText = mtRegistroCONTA_BANCARIAGetText
      Size = 10
    end
    object mtRegistroIMPOSTO_SINDICAL_X: TSmallintField
      FieldName = 'IMPOSTO_SINDICAL_X'
    end
    object mtRegistroADIANTAMENTO_X: TSmallintField
      FieldName = 'ADIANTAMENTO_X'
    end
    object mtRegistroADIANTAMENTO: TFloatField
      FieldName = 'ADIANTAMENTO'
      DisplayFormat = ',0.00 %'
    end
    object mtRegistroSALARIO_MENSAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SALARIO_MENSAL'
      DisplayFormat = ',0.00'
      Calculated = True
    end
    object mtRegistroASSOCIADO_X: TSmallintField
      FieldName = 'ASSOCIADO_X'
    end
    object mtRegistroIDNATUREZA: TStringField
      FieldName = 'IDNATUREZA'
      Size = 4
    end
  end
  inherited mtListagem: TClientDataSet
    Left = 34
    Top = 168
  end
  inherited dtsListagem: TDataSource
    Left = 32
    Top = 312
  end
  inherited mtPesquisa: TClientDataSet
    StoreDefs = True
    Left = 98
    Top = 312
  end
  inherited mtColuna: TClientDataSet
    Left = 98
    Top = 168
  end
  inherited dtsPesquisa: TDataSource
    Left = 408
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
  object cdFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 106
    Top = 240
    object cdFuncionarioIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdFuncionarioIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdFuncionarioIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
    end
    object cdFuncionarioIDADMISSAO: TStringField
      FieldName = 'IDADMISSAO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDRACA: TStringField
      FieldName = 'IDRACA'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDSABADO: TStringField
      FieldName = 'IDSABADO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDSALARIO: TStringField
      FieldName = 'IDSALARIO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDSITUACAO: TStringField
      FieldName = 'IDSITUACAO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDTIPO: TStringField
      FieldName = 'IDTIPO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDVINCULO: TStringField
      FieldName = 'IDVINCULO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDFGTS: TStringField
      FieldName = 'IDFGTS'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDCAGED_ADMISSAO: TStringField
      FieldName = 'IDCAGED_ADMISSAO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioADMISSAO: TDateField
      FieldName = 'ADMISSAO'
    end
    object cdFuncionarioCARGA_HORARIA: TSmallintField
      FieldName = 'CARGA_HORARIA'
    end
    object cdFuncionarioSALARIO: TCurrencyField
      FieldName = 'SALARIO'
    end
    object cdFuncionarioIDRESCISAO: TStringField
      FieldName = 'IDRESCISAO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDINSTRUCAO: TStringField
      FieldName = 'IDINSTRUCAO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDCARGO: TIntegerField
      FieldName = 'IDCARGO'
    end
    object cdFuncionarioCARGO_NIVEL: TSmallintField
      FieldName = 'CARGO_NIVEL'
    end
    object cdFuncionarioCTPS: TStringField
      FieldName = 'CTPS'
      FixedChar = True
      Size = 6
    end
    object cdFuncionarioCTPS_SERIE: TStringField
      FieldName = 'CTPS_SERIE'
      FixedChar = True
      Size = 6
    end
    object cdFuncionarioCTPS_ORGAO: TStringField
      FieldName = 'CTPS_ORGAO'
      Size = 10
    end
    object cdFuncionarioCTPS_EMISSAO: TDateField
      FieldName = 'CTPS_EMISSAO'
    end
    object cdFuncionarioPIS_IPASEP: TStringField
      FieldName = 'PIS_IPASEP'
      FixedChar = True
      Size = 11
    end
    object cdFuncionarioDEMISSAO: TDateField
      FieldName = 'DEMISSAO'
    end
    object cdFuncionarioANO_CHEGADA: TSmallintField
      FieldName = 'ANO_CHEGADA'
    end
    object cdFuncionarioOPTANTE: TSmallintField
      FieldName = 'OPTANTE'
    end
    object cdFuncionarioFGTS_X: TSmallintField
      FieldName = 'FGTS_X'
    end
    object cdFuncionarioFGTS_OPCAO: TDateField
      FieldName = 'FGTS_OPCAO'
    end
    object cdFuncionarioFGTS_RETRATACAO: TDateField
      FieldName = 'FGTS_RETRATACAO'
    end
    object cdFuncionarioDEFICIENTE_X: TSmallintField
      FieldName = 'DEFICIENTE_X'
    end
    object cdFuncionarioIDRECURSO: TStringField
      FieldName = 'IDRECURSO'
      FixedChar = True
      Size = 2
    end
    object cdFuncionarioIDSINDICATO: TIntegerField
      FieldName = 'IDSINDICATO'
    end
    object cdFuncionarioIDLOTACAO: TIntegerField
      FieldName = 'IDLOTACAO'
    end
    object cdFuncionarioIDGP: TIntegerField
      FieldName = 'IDGP'
    end
    object cdFuncionarioIDBANCO: TStringField
      FieldName = 'IDBANCO'
      Size = 3
    end
    object cdFuncionarioIDAGENCIA: TStringField
      FieldName = 'IDAGENCIA'
      Size = 4
    end
    object cdFuncionarioCONTA_BANCARIA: TStringField
      FieldName = 'CONTA_BANCARIA'
      Size = 10
    end
    object cdFuncionarioIMPOSTO_SINDICAL_X: TSmallintField
      FieldName = 'IMPOSTO_SINDICAL_X'
    end
    object cdFuncionarioADIANTAMENTO_X: TSmallintField
      FieldName = 'ADIANTAMENTO_X'
    end
    object cdFuncionarioADIANTAMENTO: TCurrencyField
      FieldName = 'ADIANTAMENTO'
    end
    object cdFuncionarioIDNATUREZA: TStringField
      FieldName = 'IDNATUREZA'
      Size = 4
    end
  end
  object cdPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 34
    Top = 240
    object cdPessoaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdPessoaIDPESSOA: TIntegerField
      FieldName = 'IDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 58
    end
    object cdPessoaAPELIDO: TStringField
      FieldName = 'APELIDO'
      Size = 38
    end
    object cdPessoaPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object cdPessoaCPF_CGC: TStringField
      FieldName = 'CPF_CGC'
      Size = 22
    end
    object cdPessoaRG: TStringField
      FieldName = 'RG'
      Size = 28
    end
    object cdPessoaRG_ORGAO: TStringField
      FieldName = 'RG_ORGAO'
      Size = 10
    end
    object cdPessoaRG_EMISSAO: TDateField
      FieldName = 'RG_EMISSAO'
    end
    object cdPessoaSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object cdPessoaPAI: TStringField
      FieldName = 'PAI'
      Size = 58
    end
    object cdPessoaMAE: TStringField
      FieldName = 'MAE'
      Size = 58
    end
    object cdPessoaIDNACIONALIDADE: TStringField
      FieldName = 'IDNACIONALIDADE'
      FixedChar = True
      Size = 3
    end
    object cdPessoaIDNATURALIDADE: TStringField
      FieldName = 'IDNATURALIDADE'
      FixedChar = True
      Size = 2
    end
    object cdPessoaIDESTADO_CIVIL: TStringField
      FieldName = 'IDESTADO_CIVIL'
      FixedChar = True
      Size = 2
    end
    object cdPessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 58
    end
    object cdPessoaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 38
    end
    object cdPessoaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 38
    end
    object cdPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 38
    end
    object cdPessoaIDPAIS: TStringField
      FieldName = 'IDPAIS'
      FixedChar = True
      Size = 3
    end
    object cdPessoaIDUF: TStringField
      FieldName = 'IDUF'
      FixedChar = True
      Size = 2
    end
    object cdPessoaCEP: TStringField
      FieldName = 'CEP'
      Size = 16
    end
    object cdPessoaENDERECO2: TStringField
      FieldName = 'ENDERECO2'
      Size = 58
    end
    object cdPessoaCOMPLEMENTO2: TStringField
      FieldName = 'COMPLEMENTO2'
      Size = 38
    end
    object cdPessoaBAIRRO2: TStringField
      FieldName = 'BAIRRO2'
      Size = 38
    end
    object cdPessoaCIDADE2: TStringField
      FieldName = 'CIDADE2'
      Size = 38
    end
    object cdPessoaIDPAIS2: TStringField
      FieldName = 'IDPAIS2'
      FixedChar = True
      Size = 3
    end
    object cdPessoaIDUF2: TStringField
      FieldName = 'IDUF2'
      FixedChar = True
      Size = 2
    end
    object cdPessoaCEP2: TStringField
      FieldName = 'CEP2'
      Size = 16
    end
    object cdPessoaCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 23
    end
    object cdPessoaBIP: TStringField
      FieldName = 'BIP'
      Size = 23
    end
    object cdPessoaFAX: TStringField
      FieldName = 'FAX'
      Size = 23
    end
    object cdPessoaPRINCIPAL: TStringField
      FieldName = 'PRINCIPAL'
      Size = 23
    end
    object cdPessoaCOMPLEMENTAR: TStringField
      FieldName = 'COMPLEMENTAR'
      Size = 23
    end
    object cdPessoaFONEFAX: TStringField
      FieldName = 'FONEFAX'
      Size = 23
    end
    object cdPessoaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 258
    end
    object cdPessoaHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 258
    end
    object cdPessoaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 258
    end
    object cdPessoaCADASTRO: TSQLTimeStampField
      FieldName = 'CADASTRO'
      ProviderFlags = [pfInWhere]
    end
    object cdPessoaATUALIZACAO: TSQLTimeStampField
      FieldName = 'ATUALIZACAO'
      ProviderFlags = [pfInWhere]
    end
    object cdPessoaNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
    end
  end
end