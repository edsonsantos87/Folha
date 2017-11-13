unit r_contra_cheque_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLFilters, RLPDFFilter, RLReport, DB, DBClient, RLDraftFilter;

type
  TForm1 = class(TForm)
    cdFolha: TClientDataSet;
    dsFolha: TDataSource;
    cdFolhaIDEMPRESA: TIntegerField;
    cdFolhaEMPRESA_NOME: TStringField;
    cdFolhaEMPRESA_CNPJ: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
