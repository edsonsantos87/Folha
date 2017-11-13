object Form1: TForm1
  Left = -2
  Top = 103
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cdFolha: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 112
    Data = {
      6E0000009619E0BD0100000018000000030000000000030000006E0009494445
      4D505245534104000100000000000C454D50524553415F4E4F4D450100490000
      0001000557494454480200020032000C454D50524553415F434E504A01004900
      00000100055749445448020002000E000000}
    object cdFolhaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
    end
    object cdFolhaEMPRESA_NOME: TStringField
      FieldName = 'EMPRESA_NOME'
      Size = 50
    end
    object cdFolhaEMPRESA_CNPJ: TStringField
      FieldName = 'EMPRESA_CNPJ'
      Size = 14
    end
  end
  object dsFolha: TDataSource
    AutoEdit = False
    DataSet = cdFolha
    Left = 176
    Top = 192
  end
end
