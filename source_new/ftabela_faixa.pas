{
Projeto FolhaLivre - Folha de Pagamento Livre

Copyright (C) 2002-2007 Allan Lima

Este programa é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

Autor(es): Allan Lima
E-mail: allan_kardek@yahoo.com.br / folha_livre@yahoo.com.br
}

unit ftabela_faixa;

{$I flivre.inc}

interface

uses
  {$IFDEF CLX}
  Qt, QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QDBCtrls,
  QMask, QGrids, QDBGrids, QComCtrls, QButtons, QMenus,
  {$IFDEF AK_LABEL}QAKLabel,{$ENDIF}
  {$ENDIF}
  {$IFDEF VCL}
  Windows, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, DBCtrls,
  Mask, Grids, DBGrids, ComCtrls, Buttons, Menus,
  {$IFDEF AK_LABEL}AKLabel,{$ENDIF}
  {$ENDIF}
  SysUtils, Classes, DB, DBClient, MidasLib, fbase, Variants, DateUtils;

type
  TFrmTabelaFaixa = class(TFrmBase)
    cdItem: TClientDataSet;
    cdItemIDEMPRESA: TIntegerField;
    cdItemIDTABELA: TIntegerField;
    cdItemCOMPETENCIA: TDateField;
    cdItemITEM: TSmallintField;
    cdItemVALOR: TCurrencyField;
    cdItemNOME: TStringField;
    dsItem: TDataSource;
    dbgFaixa: TDBGrid;
    dbgItem: TDBGrid;
    mtRegistroIDEMPRESA: TIntegerField;
    mtRegistroIDTABELA: TIntegerField;
    mtRegistroIDFAIXA: TIntegerField;
    mtRegistroCOMPETENCIA: TDateField;
    mtRegistroTAXA: TCurrencyField;
    mtRegistroREDUZIR: TCurrencyField;
    mtRegistroACRESCENTAR: TCurrencyField;
    mtRegistroFAIXA: TCurrencyField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdItemBeforeInsert(DataSet: TDataSet);
    procedure mtRegistroBeforePost(DataSet: TDataSet);
    procedure mtRegistroNewRecord(DataSet: TDataSet);
    procedure dbgFaixaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mtRegistroAfterDelete(DataSet: TDataSet);
    procedure mtRegistroAfterPost(DataSet: TDataSet);
  protected
    Panel: TPanel;
  private
    { Private declarations }
    pvID: Integer;
    pvNome: String;
    pvData: TDateTime;
    function ListaCompetencia:Boolean;
    procedure MaxCompetencia;
    procedure NovaCompetencia;
    procedure LerFaixa;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure Iniciar; override;
  end;

procedure CriaTabelaFaixa(Empresa: Integer);

implementation

uses fdb, ftext, fsuporte, ftabela, ffind;

{$R *.dfm}

procedure CriaTabelaFaixa(Empresa: Integer);
begin

  if kCountSQL( 'F_TABELA', 'IDEMPRESA = :EMPRESA', [Empresa]) = 0 then
    kErro('Não há tabelas cadastradas para esta empresa.'+sLineBreak+
          'Utilize a opção <Tabelas> do menu <Cadastro>.');

  with TFrmTabelaFaixa.Create(Application) do
    try
      pvTabela := 'F_TABELA_FAIXA';
      if FindTabela( '*', pvEmpresa, pvID, pvNome) then
      begin
        Iniciar();
        ShowModal;
      end;
    finally
      Free;
    end;

end;  // procedure CriaTabelaFaixa

procedure TFrmTabelaFaixa.Iniciar;
begin
  PnlControle.Visible := False;
  MaxCompetencia();
  LerFaixa();
end;

procedure TFrmTabelaFaixa.MaxCompetencia;
var
  DataSet1: TClientDataSet;
  wYear, wMonth, wDay: Word;
begin

  DataSet1 := TClientDataSet.Create(NIL);

  try

    if kOpenSQL( DataSet1,
                 'SELECT MAX(COMPETENCIA) FROM F_TABELA_FAIXA'#13+
                 'WHERE IDEMPRESA = :EMPRESA AND IDTABELA = :TABELA',
                 [ pvEmpresa, pvID]) then
    begin

      if (YearOf( DataSet1.Fields[0].AsDateTime) = 1899) then
        DecodeDate( Date(), wYear, wMonth, wDay)
      else
        DecodeDate( DataSet1.Fields[0].AsDateTime, wYear, wMonth, wDay);

      pvData := EncodeDate( wYear, wMonth, 1);

    end;

  finally
    DataSet1.Free;
  end;

end;  // MaxCompetencia

procedure TFrmTabelaFaixa.LerFaixa;
begin

  if (pvEmpresa = 0) then
    Caption := 'Tabelas Globais de Cálculos'
  else
    Caption := 'Tabelas de Cálculos';

  Caption := Caption + ' - '+ AnsiUpperCase(FormatDateTime('mmmm/yyyy', pvData));

  RxTitulo.Caption := ' '+IntToStr(pvID)+' - '+pvNome;

  Panel.Caption    := '<F2> Nova Competência - <F3> Lista Competências - <F12> Lista tabelas';

  try

    if not kOpenSQL( pvDataSet,
              'SELECT * FROM F_TABELA_FAIXA'#13+
              'WHERE IDEMPRESA = :EMPRESA AND'#13+
              '      IDTABELA = :TABELA AND'#13+
              '      COMPETENCIA = :COMPETENCIA'#13+
              'ORDER BY FAIXA', [pvEmpresa, pvID, pvData]) then
       raise Exception.Create( kGetErrorLastSQL);

    if not kOpenSQL( cdItem,
      'SELECT I.*, M.NOME'#13+
      'FROM F_TABELA_ITEM I, F_TABELA_MODELO M'#13+
      'WHERE'#13+
      '  I.IDEMPRESA = :EMPRESA AND'#13+
      '  I.IDTABELA = :TABELA AND'#13+
      '  I.COMPETENCIA = :COMPETENCIA  AND'#13+
      '  M.IDEMPRESA = I.IDEMPRESA AND'#13+
      '  M.IDTABELA = I.IDTABELA AND'#13+
      '  M.ITEM = I.ITEM'#13+
      'ORDER BY I.ITEM', [ pvEmpresa, pvID, pvData]) then
      raise Exception.Create(kGetErrorLastSQL);

  except
    on E:Exception do
      kErro( E.Message, 'ftabela_faixa', 'LerFaixa()');
  end;

end;  // procedure LerFaixa

procedure TFrmTabelaFaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Key = VK_F2) then
  begin
    Key := 0;
    NovaCompetencia();
  end else if (Key = VK_F3) then
  begin
    Key := 0;
    if ListaCompetencia() then
      LerFaixa();

  end else if (Key = VK_F12) then
  begin

    Key := 0;

    if FindTabela( '*', pvEmpresa, pvID, pvNome) then
    begin
      MaxCompetencia();
      LerFaixa();
    end;

  end else if (Key = VK_ESCAPE) and (ActiveControl is TDBGrid) and
          (TDBGrid(ActiveControl).DataSource.DataSet.State in [dsInsert,dsEdit]) then
  begin
    Key := 0;
    TDBGrid(ActiveControl).DataSource.DataSet.Cancel;

  end else if (Key = VK_RETURN) and (ActiveControl is TDBGrid) and
          (TDBGrid(ActiveControl).DataSource.DataSet.State in [dsInsert,dsEdit]) then
    Key := 0

  else if (Key = VK_DELETE) and (ActiveControl = dbgFaixa) and (pvDataSet.State = dsBrowse) then
  begin
    pvDataSet.Delete;
    Key := 0;

  end;

end;

procedure TFrmTabelaFaixa.cdItemBeforeInsert(DataSet: TDataSet);
begin
  Beep;
  SysUtils.Abort;
end;

procedure TFrmTabelaFaixa.mtRegistroBeforePost(DataSet: TDataSet);
var
  sTabela: String;
begin

  if (DataSet = pvDataSet) then
    sTabela := pvTabela
  else if (DataSet = cdItem) then
    sTabela := 'F_TABELA_ITEM';

  if not kSQLCache( DataSet, sTabela, DataSet.Fields) then
    SysUtils.Abort;

end;

procedure TFrmTabelaFaixa.mtRegistroNewRecord(DataSet: TDataSet);
begin

  if (DataSet = pvDataSet) then
    kDataSetDefault( DataSet, 'F_TABELA_FAIXA');

  if Assigned(DataSet.FindField('IDEMPRESA')) then
    DataSet.FieldByName('IDEMPRESA').AsInteger := pvEmpresa;

  if Assigned(DataSet.FindField('IDTABELA')) then
    DataSet.FieldByName('IDTABELA').AsInteger := pvID;

  if Assigned(DataSet.FindField('IDFAIXA')) then
    DataSet.FieldByName('IDFAIXA').AsInteger := kMaxCodigo( pvTabela, 'IDFAIXA', pvEmpresa);

  if Assigned(DataSet.FindField('COMPETENCIA')) then
    DataSet.FieldByName('COMPETENCIA').AsDateTime := pvData;

end;

procedure TFrmTabelaFaixa.dbgFaixaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  kDrawColumnCell( Sender, Rect, DataCol, Column, State);
end;

procedure TFrmTabelaFaixa.mtRegistroAfterDelete(DataSet: TDataSet);
begin
  if (DataSet.RecordCount = 0) then
  begin
    MaxCompetencia();
    LerFaixa();
  end;
end;

procedure TFrmTabelaFaixa.mtRegistroAfterPost(DataSet: TDataSet);
begin
  inherited;
  LerFaixa();
end;

function TFrmTabelaFaixa.ListaCompetencia:Boolean;
var
  DataSet: TClientDataSet;
  wYear, wMonth, wDay: Word;
  vData: Variant;
begin

  Result  := False;
  DataSet := TClientDataSet.Create(NIL);

  try

    if not kOpenSQL( DataSet,
                 'SELECT DISTINCT COMPETENCIA FROM F_TABELA_FAIXA'#13+
                 'WHERE IDEMPRESA = :EMPRESA AND IDTABELA = :TABELA',
                 [ pvEmpresa, pvID]) then
      Exit;

    if (DataSet.RecordCount = 0) then
    begin
      kErro( 'Não há competências para esta tabela');
      Exit;
    end;

    Result := kFindDataSet( DataSet, 'Competências',
                   DataSet.Fields[0].FieldName, vData, [foNoPanel, foNoTitle]);

    if Result then
    begin

      DecodeDate( VarToDateTime(vData), wYear, wMonth, wDay);

      if (wMonth = 12) and (wYear = 1899) then
        DecodeDate( Date(), wYear, wMonth, wDay);

      pvData := EncodeDate( wYear, wMonth, 1);

    end;

  finally
    DataSet.Free;
  end;

end;

procedure TFrmTabelaFaixa.NovaCompetencia;
var
  sData: String;
  SQL: TStringList;
  dData: TDateTime;
  i: Integer;
  wDay, wMonth, wYear: Word;
  DataSet1: TClientDataSet;
begin

  if not InputQuery( 'Entrada da Competência', 'Informe o mes/ano', sData) then
    Exit;

  try
    i := Pos( '/', sData);
    wMonth := StrToInt(Copy( sData, 1, i-1));
    wYear  := StrToInt(Copy( sData, i+1, Length(sData)));
    dData  := EncodeDate( wYear, wMonth, 1);
  except
    kErro('A entrada não é uma data válida.');
    Exit;
  end;

  i := kCountSQL( 'SELECT COUNT(*) FROM F_TABELA_FAIXA'+#13+
                  'WHERE IDEMPRESA = :EMPRESA AND IDTABELA = :TABELA AND'+#13+
                  'COMPETENCIA = :COMPETENCIA', [pvEmpresa, pvID, dData]);

  if (i > 0) then
  begin
    kErro('A competência informada já está cadastrada');
    if (pvData <> dData) then
    begin
      pvData := dData;
      LerFaixa();
    end;
    Exit;
  end;

  if kConfirme('Incluir a competência '+FormatDateTime('mmmm/yyyy', dData)+'?') then
  begin

    pvData   := dData;
    SQL      := TStringList.Create;
    DataSet1 := TClientDataSet.Create(NIL);

    try

      // Encontra a competencia imediatamente menor que a competencia informada
      if not kOpenSQL( DataSet1,
                 'SELECT MAX(COMPETENCIA) FROM F_TABELA_FAIXA'#13+
                 'WHERE IDEMPRESA = :EMPRESA AND IDTABELA = :TABELA AND'#13+
                 'COMPETENCIA < :DATA', [pvEmpresa, pvID, dData]) then
        Exit;

      DecodeDate( DataSet1.Fields[0].AsDateTime, wYear, wMonth, wDay);

      // Se encontrou competencia anterior, cria nova baseada nesta.
      // 09/12/2003-Sandro
      // if (wMonth <> 12) and (wYear <> 1899) then // Há competencia anterior
      if not DataSet1.IsEmpty then
      begin

         SQL.BeginUpdate;
         SQL.Add('INSERT INTO F_TABELA_FAIXA');
         SQL.Add('( IDEMPRESA, IDTABELA, COMPETENCIA, FAIXA, TAXA, REDUZIR, ACRESCENTAR)');
         SQL.Add('SELECT IDEMPRESA, IDTABELA, :COMPETENCIA,');
         SQL.Add('       FAIXA, TAXA, REDUZIR, ACRESCENTAR');
         SQL.Add('FROM F_TABELA_FAIXA');
         SQL.Add('WHERE IDEMPRESA = :EMPRESA AND IDTABELA = :TABELA AND COMPETENCIA = :DATA');
         SQL.EndUpdate;

         kExecSQL( SQL.Text, [dData, pvEmpresa, pvID, EncodeDate( wYear, wMonth, wDay)]);

      end;

      LerFaixa();

    finally
      SQL.Free;
      DataSet1.Free;
    end;

  end;

end;

constructor TFrmTabelaFaixa.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  Panel := TPanel.Create(Self);

  with Panel do
  begin
    Parent    := PnlClaro;
    Align     := alBottom;
    Color     := PnlControle.Color;
    Font.Size := Panel.Font.Size + 5;
  end;

  dbgFaixa.Font.Size := dbgFaixa.Font.Size + 2;
  
end;

end.
