inherited FrmFormula: TFrmFormula
  Top = 19
  Caption = 'F'#243'rmulas Globais'
  ClientHeight = 579
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlEscuro: TPanel
    Height = 579
    inherited lblPrograma: TPanel
      Caption = 'F'#243'rmulas'
    end
    inherited pnlPesquisa: TPanel
      Top = 479
    end
  end
  inherited PnlClaro: TPanel
    Height = 579
    inherited PnlControle: TPanel
      Top = 539
    end
    inherited PageControl1: TPageControl
      Height = 509
      inherited TabListagem: TTabSheet
        Caption = 'Lista de F'#243'rmulas'
        inherited grdCadastro: TcxGrid
          Height = 477
          inherited tv: TcxGridDBTableView
            object tvIDFORMULA: TcxGridDBColumn
              Caption = 'ID'
              DataBinding.FieldName = 'IDFORMULA'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
            end
            object tvNOME: TcxGridDBColumn
              DataBinding.FieldName = 'NOME'
              HeaderAlignmentHorz = taCenter
              Styles.Header = StyloHeader
              Width = 400
            end
          end
        end
      end
      inherited TabDetalhe: TTabSheet
        Caption = 'Detalhes da F'#243'rmula'
      end
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 40
    Top = 312
  end
  inherited mtRegistro: TClientDataSet
    BeforeInsert = mtRegistroBeforeInsert
    AfterPost = mtRegistroAfterCancel
    Left = 42
    Top = 368
    object mtRegistroIDFORMULA: TIntegerField
      FieldName = 'IDFORMULA'
      ProviderFlags = [pfInUpdate, pfInKey]
    end
    object mtRegistroNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object mtRegistroFORMULA: TBlobField
      FieldName = 'FORMULA'
    end
  end
  inherited mtListagem: TClientDataSet
    StoreDefs = True
    Left = 34
    Top = 200
    object mtListagemIDFORMULA: TIntegerField
      FieldName = 'IDFORMULA'
    end
    object cdListaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object mtListagemFORMULA: TStringField
      FieldName = 'FORMULA'
      Size = 250
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
  object PopupMenu1: TPopupMenu
    OnPopup = mExportClick
    Left = 176
    Top = 104
    object miExportAsHTML: TMenuItem
      Caption = 'Exportar como HTML'
      OnClick = miExportAsClicked
    end
    object miExportAsRTF: TMenuItem
      Caption = 'Exportar como RTF'
      OnClick = miExportAsClicked
    end
    object miExportAllFormats: TMenuItem
      Caption = 'Todos os Formatos'
      OnClick = miExportAsClicked
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miExportToFile: TMenuItem
      Caption = 'Gravar para arquivo...'
      OnClick = miExportToFileClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object miExportClipboardNative: TMenuItem
      Caption = 'Copiar Formato Nativo para '#193'rea de Transfer'#234'ncia'
      OnClick = miExportClipboardNativeClick
    end
    object miExportClipboardText: TMenuItem
      Caption = 'Copiar como Texto para '#193'rea de Transfer'#234'ncia'
      OnClick = miExportClipboardTextClick
    end
  end
end
