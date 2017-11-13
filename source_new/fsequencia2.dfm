inherited FrmSequencia2: TFrmSequencia2
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Sequ'#234'ncia'
  ClientWidth = 733
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlEscuro: TPanel
    Width = 135
    Visible = True
    inherited lblSeparador: TLabel
      Width = 135
    end
    inherited lblPrograma: TPanel
      Width = 135
    end
    inherited pnlPesquisa: TPanel
      Width = 135
      inherited lblPesquisa: TLabel
        Width = 135
      end
    end
  end
  inherited PnlClaro: TPanel
    Left = 135
    Width = 598
    inherited PnlControle: TPanel
      Width = 598
    end
    inherited PnlTitulo: TPanel
      Width = 598
      inherited PnlFechar: TPanel
        Left = 558
      end
    end
    inherited dbgRegistro: TDBGrid
      Width = 598
      Height = 258
    end
    inherited Panel: TPanel
      Top = 288
      Width = 598
      Height = 45
    end
  end
  inherited dtsRegistro: TDataSource
    Left = 240
  end
  inherited mtRegistro: TClientDataSet
    Left = 242
    Top = 160
  end
end
