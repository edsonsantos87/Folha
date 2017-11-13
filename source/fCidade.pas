unit fCidade;

interface

uses
  Graphics, Controls, Forms, StdCtrls, DBGrids, DBCtrls,
  Dialogs, Grids, Mask, Buttons, ExtCtrls,

  MidasLib,
  SysUtils, Classes, DB, DBClient, Types, fdialogo, cxLocalization,
  cxStyles, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxNavigator,
  Vcl.ComCtrls;

type
  TFrmCidade = class(TFrmDialogo)
    mtRegistroCOD_MUNICIPIO: TFloatField;
    mtRegistroUF: TStringField;
    mtRegistroNOME: TStringField;
    edtCodigo: TDBEdit;
    Label2: TLabel;
    edtCodMunicipio: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtNome: TDBEdit;
    tvID: TcxGridDBColumn;
    tvCOD_MUNICIPIO: TcxGridDBColumn;
    tvUF: TcxGridDBColumn;
    tvNOME: TcxGridDBColumn;
    cboUF: TcxDBLookupComboBox;
    cdsUF: TClientDataSet;
    dtsUF: TDataSource;
    cdsUFiduf: TStringField;
    cdsUFnome: TStringField;
    cdsUFid: TIntegerField;
    mtRegistroID: TIntegerField;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCidade: TFrmCidade;

procedure CriarCidade();

implementation

uses fdb, ftext, fsuporte, ffind, fbase;

{$R *.dfm}

procedure CriarCidade();
begin
  with TFrmCidade.Create(Application) do
    try
      pvTabela := 'CIDADE';
      pvOrder:= 'UF';
      Iniciar();
      kSQLSelectFrom( cdsUF, 'UF', pvEmpresa, pvWhere, 'IDUF');
      ShowModal;
    finally
      Free;
    end;
end;

procedure TFrmCidade.FormShow(Sender: TObject);
begin
  inherited;

  if tv.ViewData.RecordCount > 0 then
    tv.ViewData.Records[0].Expanded:= True;
end;

procedure TFrmCidade.btnImprimirClick(Sender: TObject);
begin
  pnlProgress.Visible :=  True;
  Application.ProcessMessages;
  inherited;
  pnlProgress.Visible :=  False;
end;

end.
