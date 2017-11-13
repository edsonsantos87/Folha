{
Projeto FolhaLivre - Folha de Pagamento Livre
Copyright (C) 2002-2007, Allan Lima

Este programa é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

Autor(es): Allan Kardek Lima
E-mail: allan_kardek@yahoo.com.br / folha_livre@yahoo.com.br
}

{$IFNDEF QFLIVRE}
unit fpadrao;
{$ENDIF}

{$I flivre.inc}

interface

uses
  SysUtils, Classes,
  {$IFDEF CLX}
  Qt, QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  QDBCtrls, QMask, QGrids, QDBGrids, QComCtrls, QButtons, QMenus,
  {$IFDEF AK_LABEL}QAKLabel,{$ENDIF}
  {$ENDIF}
  {$IFDEF VCL}
  Windows, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, Mask, Grids, DBGrids, ComCtrls, Buttons, Menus,
  {$IFDEF AK_LABEL}AKLabel,{$ENDIF}
  {$ENDIF}
  {$IFDEF FL_MIDASLIB}MidasLib,{$ENDIF}
  fbase, DBClient, StrUtils, DB, Types;

type
  TFrmPadrao = class(TFrmBase)
    mtRegistroIDGP: TIntegerField;
    mtRegistroIDEVENTO: TIntegerField;
    mtRegistroEVENTO: TStringField;
    cdGP: TClientDataSet;
    cdGPIDGE: TIntegerField;
    cdGPIDGP: TIntegerField;
    dsGP: TDataSource;
    dbgRegistro: TDBGrid;
    Panel: TPanel;
    lbEvento: TLabel;
    lbEvento2: TLabel;
    lbTipo: TLabel;
    dbEvento: TAKDBEdit;
    dbEvento2: TDBEdit;
    dbTipo: TAKDBEdit;
    mtRegistroIDVINCULO: TStringField;
    mtRegistroIDTIPO: TStringField;
    mtRegistroIDSITUACAO: TStringField;
    mtRegistroIDSALARIO: TStringField;
    mtRegistroINFORMADO: TCurrencyField;
    lbSituacao: TLabel;
    dbSituacao: TAKDBEdit;
    lbVinculo: TLabel;
    dbVinculo: TAKDBEdit;
    lbSalario: TLabel;
    dbSalario: TAKDBEdit;
    dbCompetencias: TGroupBox;
    dbJaneiro: TDBCheckBox;
    dbFevereiro: TDBCheckBox;
    dbMarco: TDBCheckBox;
    dbAbril: TDBCheckBox;
    dbMaio: TDBCheckBox;
    dbJunho: TDBCheckBox;
    dbJulho: TDBCheckBox;
    dbAgosto: TDBCheckBox;
    dbSetembro: TDBCheckBox;
    dbOutubro: TDBCheckBox;
    dbNovembro: TDBCheckBox;
    dbDezembro: TDBCheckBox;
    db13salario: TDBCheckBox;
    cdTipo: TClientDataSet;
    cdTipoIDTIPO: TStringField;
    cdTipoNOME: TStringField;
    mtRegistroTIPO: TStringField;
    dbTipo2: TDBEdit;
    cdSituacao: TClientDataSet;
    cdSituacaoIDSITUACAO: TStringField;
    cdSituacaoNOME: TStringField;
    mtRegistroSITUACAO: TStringField;
    dbSituacao2: TDBEdit;
    cdVinculo: TClientDataSet;
    cdSalario: TClientDataSet;
    cdVinculoIDVINCULO: TStringField;
    cdVinculoNOME: TStringField;
    cdSalarioIDSALARIO: TStringField;
    cdSalarioNOME: TStringField;
    dbVinculo2: TDBEdit;
    dbSalario2: TDBEdit;
    mtRegistroVINCULO: TStringField;
    mtRegistroSALARIO: TStringField;
    mtRegistroJANEIRO_X: TSmallIntField;
    mtRegistroFEVEREIRO_X: TSmallIntField;
    mtRegistroMARCO_X: TSmallIntField;
    mtRegistroABRIL_X: TSmallIntField;
    mtRegistroMAIO_X: TSmallIntField;
    mtRegistroJUNHO_X: TSmallIntField;
    mtRegistroJULHO_X: TSmallIntField;
    mtRegistroAGOSTO_X: TSmallIntField;
    mtRegistroSETEMBRO_X: TSmallIntField;
    mtRegistroOUTUBRO_X: TSmallIntField;
    mtRegistroNOVEMBRO_X: TSmallIntField;
    mtRegistroDEZEMBRO_X: TSmallIntField;
    mtRegistroSALARIO13_X: TSmallIntField;
    mtRegistroIDFOLHA_TIPO: TStringField;
    mtRegistroIDPADRAO: TIntegerField;
    lbInformado: TLabel;
    dbInformado: TDBEdit;
    Panel1: TPanel;
    dbGE: TAKDBEdit;
    dbGE2: TDBEdit;
    dbGP: TAKDBEdit;
    dbGP2: TDBEdit;
    cdGPGE: TStringField;
    cdGPGP: TStringField;
    cdGPIDFOLHA_TIPO: TStringField;
    cdGPFOLHA_TIPO: TStringField;
    dbFolha: TAKDBEdit;
    dbFolha2: TDBEdit;
    mtRegistroTIPO_EVENTO: TStringField;
    mtRegistroATIVO_X: TSmallintField;
    dbMarcar: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mtRegistroNewRecord(DataSet: TDataSet);
    procedure mtRegistroBeforeDelete(DataSet: TDataSet);
    procedure mtRegistroBeforeEdit(DataSet: TDataSet);
    procedure mtRegistroBeforeInsert(DataSet: TDataSet);
    procedure dbEventoButtonClick(Sender: TObject);
    procedure mtRegistroBeforePost(DataSet: TDataSet);
    procedure dbGEButtonClick(Sender: TObject);
    procedure dbFolhaButtonClick(Sender: TObject);
    procedure dbTipoButtonClick(Sender: TObject);
    procedure dbgRegistroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgRegistroTitleClick(Column: TColumn);
    procedure dbMarcarClick(Sender: TObject);
    procedure dtsRegistroStateChange(Sender: TObject);
  protected
    procedure GetData; override;
  private
    { Private declarations }
    pvGrupoPagamento: Integer;
    pvTipoFolha: String;
  public
    { Public declarations }
    procedure Iniciar; override;
    procedure Pesquisar; override;
  end;

procedure CriaPadrao;

implementation

uses Variants, fdb, ftext, fsuporte, fevento, fformula,
  fgrupo_empresa, fgrupo_pagamento, ffolha_tipo, ffind, futil;

{$R *.dfm}

procedure CriaPadrao;
begin

  with TFrmPadrao.Create(Application) do
  try
    pvTabela := 'F_PADRAO';
    Iniciar();
    ShowModal;
  finally
    Free;
  end;

end;  // procedure CriaPadrao

procedure TFrmPadrao.Iniciar;
begin

  pvGrupoPagamento := kGrupoPagamentoFolhaAtiva();
  pvTipoFolha := kTipoFolhaAtiva();

  db13salario.Font.Color := clRed;

  kSQLSelectFrom( cdTipo, 'F_TIPO');
  cdTipo.AppendRecord(['00', 'TODOS']);

  kSQLSelectFrom( cdSituacao, 'F_SITUACAO');
  cdSituacao.AppendRecord(['00', 'TODAS']);

  kSQLSelectFrom( cdVinculo, 'F_VINCULO');
  cdVinculo.AppendRecord(['00', 'TODOS']);

  kSQLSelectFrom( cdSalario, 'F_SALARIO');
  cdSalario.AppendRecord(['00', 'TODOS']);

  inherited;

end;

procedure TFrmPadrao.Pesquisar;
var
  SQL: TStringList;
begin

  SQL := TStringList.Create;

  try try

    SQL.BeginUpdate;
    SQL.Add('SELECT');
    SQL.Add('  GP.IDGP, GP.NOME GP, GP.IDGE, GE.NOME GE, FT.IDFOLHA_TIPO, FT.NOME FOLHA_TIPO');
    SQL.Add('FROM');
    SQL.Add('  F_GRUPO_PAGAMENTO GP, F_GRUPO_EMPRESA GE, F_FOLHA_TIPO FT');
    SQL.Add('WHERE');
    SQL.Add('  GE.IDGE = GP.IDGE');
    SQL.EndUpdate;

    if not kOpenSQL( cdGP, SQL.Text) then
      raise Exception.Create(kGetErrorLastSQL);

    cdGP.Locate('IDGP;IDFOLHA_TIPO',
                VarArrayOf([pvGrupoPagamento,pvTipoFolha]), []);

  except
    on E:Exception do
      kErro( E.Message, 'fpadrao', 'Pesquisar()');
  end;
  finally
    SQL.Free;
  end;

  GetData();

end;  // Pesquisar

procedure TFrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vValue, vResult: Variant;
  cdTemp: TDataSet;
  sField: String;
begin

  if (Key = VK_RETURN) and (ActiveControl = dbGE) then
  begin
    if FindGrupoEmpresa( dbGE.Text, dbGE.DataSource.DataSet, Key, True) then
      GetData();

  end else if (Key = VK_RETURN) and (ActiveControl = dbGP) then
  begin
    if FindGrupoPagamento( dbGP.Text,
                           dbGP.DataSource.DataSet.FieldByName('IDGE').AsInteger,
                           dbGP.DataSource.DataSet, Key, True) then
      GetData();

  end else if (Key = VK_SPACE) and (ActiveControl is TDBGrid) then
  begin
    if Assigned(TDBGrid(ActiveControl).OnDblClick) then
      TDBGrid(ActiveControl).OnDblClick(ActiveControl);

  end else if (Key = VK_RETURN) and (ActiveControl = dbEvento) and
              (pvDataSet.State in [dsInsert,dsEdit]) then
    FindEvento( dbEvento.Text, pvDataSet, Key)

  else if (Key = VK_RETURN) and  (ActiveControl.Parent = Panel) and
    (ActiveControl is TAKDBEdit) and (pvDataSet.State in [dsInsert,dsEdit]) then
  begin

    vValue := TAKDBEdit(ActiveControl).Text;

    if (ActiveControl = dbTipo) then cdTemp := cdTipo
    else if (ActiveControl = dbSituacao) then cdTemp := cdSituacao
    else if (ActiveControl = dbVinculo) then cdTemp := cdVinculo
    else if (ActiveControl = dbSalario) then cdTemp := cdSalario
    else cdTemp := NIL;

    if Assigned(cdTemp) then
    begin
      sField := cdTemp.Fields[0].FieldName;
      if kFindDataSet( cdTemp, vValue, sField, vResult, sField, False) then
        TAKDBEdit(ActiveControl).Text := vResult
      else
        Key := 0;
    end;

  end else if (Key = VK_RETURN) and (pvDataSet.State in [dsInsert,dsEdit]) and
         (ActiveControl = db13salario) then
     Key := VK_F3;

  inherited;

end;

procedure TFrmPadrao.mtRegistroNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    FieldByName('IDGP').AsInteger := cdGP.FieldByName('IDGP').AsInteger;
    FieldByName('IDFOLHA_TIPO').AsString := cdGP.FieldByName('IDFOLHA_TIPO').AsString;
    FieldByName('IDTIPO').AsString := '00';
    FieldByName('IDSITUACAO').AsString := '00';
    FieldByName('IDVINCULO').AsString := '00';
    FieldByName('IDSALARIO').AsString := '00';
    FieldByName('JANEIRO_X').AsInteger := 1;
    FieldByName('FEVEREIRO_X').AsInteger := 1;
    FieldByName('MARCO_X').AsInteger := 1;
    FieldByName('ABRIL_X').AsInteger := 1;
    FieldByName('MAIO_X').AsInteger := 1;
    FieldByName('JUNHO_X').AsInteger := 1;
    FieldByName('JULHO_X').AsInteger := 1;
    FieldByName('AGOSTO_X').AsInteger := 1;
    FieldByName('SETEMBRO_X').AsInteger := 1;
    FieldByName('OUTUBRO_X').AsInteger := 1;
    FieldByName('NOVEMBRO_X').AsInteger := 1;
    FieldByName('DEZEMBRO_X').AsInteger := 1;
  end;
end;

procedure TFrmPadrao.mtRegistroBeforeDelete(DataSet: TDataSet);
begin
  if not kConfirme('Retirar o Evento "'+
              DataSet.FieldByName('EVENTO').AsString+'" dos padrões ?') then
    SysUtils.Abort
  else
    inherited;
end;

procedure TFrmPadrao.mtRegistroBeforeEdit(DataSet: TDataSet);
begin
  dbEvento.SetFocus;
end;

procedure TFrmPadrao.mtRegistroBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  dbEvento.SetFocus;
end;

procedure TFrmPadrao.dbEventoButtonClick(Sender: TObject);
var Key: Word;
begin
  FindEvento( '', TAKDBEdit(Sender).DataSource.DataSet, Key);
end;

procedure TFrmPadrao.mtRegistroBeforePost(DataSet: TDataSet);
var
  iCodigo: Integer;
  sGP: String;
begin

  with DataSet do
  begin
    if (FieldByName('IDPADRAO').AsInteger = 0) then
    begin
      sGP := FieldByName('IDGP').AsString;
      iCodigo :=  kMaxCodigo( 'F_PADRAO', 'IDPADRAO', -1, 'IDGP = '+sGP);
      FieldByName('IDPADRAO').AsInteger := iCodigo;
    end;
  end;

  inherited;

end;

procedure TFrmPadrao.dbGEButtonClick(Sender: TObject);
var
  Key: Word;
  bResult: Boolean;
begin

  bResult := False;

  with TAKDBEdit(Sender).DataSource do
    if (Sender = dbGE) then
       bResult := FindGrupoEmpresa( '*', DataSet, Key, True)
    else if (Sender = dbGP) then
      bResult := FindGrupoPagamento( '*', DataSet.FieldByName('IDGE').AsInteger, DataSet, Key);

  if bResult then
    GetData()
    
end;

procedure TFrmPadrao.dbFolhaButtonClick(Sender: TObject);
var
  Key: Word;
begin
  if PesquisaTipoFolha( '*', TDBEdit(Sender).Field.DataSet, Key, True) then
    GetData();
end;

procedure TFrmPadrao.GetData;
var
  iGrupoPagamento: Integer;
  sTipoFolha: String;
  SQL: TStringList;
begin

  SQL := TStringList.Create;

  try

    iGrupoPagamento := cdGP.FieldByName('IDGP').AsInteger;
    sTipoFolha := cdGP.FieldByName('IDFOLHA_TIPO').AsString;

    SQL.BeginUpdate;
    SQL.Add('SELECT');
    SQL.Add('  P.*, E.NOME EVENTO, E.TIPO_EVENTO, E.ATIVO_X');
    SQL.Add('FROM');
    SQL.Add('  F_PADRAO P, F_EVENTO E');
    SQL.Add('WHERE');
    SQL.Add('  P.IDGP = :GP AND P.IDFOLHA_TIPO = :TIPO');
    SQL.Add('  AND E.IDEVENTO = P.IDEVENTO');
    SQL.EndUpdate;

    if not kOpenSQL( pvDataSet, SQL.Text, [iGrupoPagamento, sTipoFolha]) then
      Exception.Create(kGetErrorLastSQL);

    pvDataSet.Last;
    pvDataSet.First;

  except
    on E:Exception do
      kErro( E.Message, 'fpadrao', 'GetData()');
  end;

end;  // procedure GetData

procedure TFrmPadrao.dbTipoButtonClick(Sender: TObject);
var
  vValue: Variant;
  cdTemp: TDataSet;
  sField: String;
begin

  if (Sender = dbTipo)          then cdTemp := cdTipo
  else if (Sender = dbSituacao) then cdTemp := cdSituacao
  else if (Sender = dbVinculo)  then cdTemp := cdVinculo
  else if (Sender = dbSalario)  then cdTemp := cdSalario
  else cdTemp := NIL;

  if Assigned(cdTemp) then
  begin
    sField := cdTemp.Fields[0].FieldName;
    if kFindDataSet( cdTemp, kRetira( cdTemp.Name, 'cd'), sField, vValue, [foNoPanel,foNoTitle]) and
                     (pvDataSet.State in [dsInsert,dsEdit]) then
      pvDataSet.FieldByName(sField).AsString := cdTemp.Fields[0].AsString;
  end;

end;

procedure TFrmPadrao.dbgRegistroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  kEventoDrawColumnCell( Sender, Rect, DataCol, Column, State);
end;

procedure TFrmPadrao.dbgRegistroTitleClick(Column: TColumn);
begin
  kTitleClick( Column.Grid, Column, NIL);
end;

procedure TFrmPadrao.dbMarcarClick(Sender: TObject);
var
  iMarcar: Integer;
begin

  if TCheckBox(Sender).Checked then
    iMarcar := 1
  else
    iMarcar := 0;

  with mtRegistro do
    if State in [dsInsert,dsEdit] then
    begin
      FieldByName('JANEIRO_X').AsInteger := iMarcar;
      FieldByName('FEVEREIRO_X').AsInteger := iMarcar;
      FieldByName('MARCO_X').AsInteger := iMarcar;
      FieldByName('ABRIL_X').AsInteger := iMarcar;
      FieldByName('MAIO_X').AsInteger := iMarcar;
      FieldByName('JUNHO_X').AsInteger := iMarcar;
      FieldByName('JULHO_X').AsInteger := iMarcar;
      FieldByName('AGOSTO_X').AsInteger := iMarcar;
      FieldByName('SETEMBRO_X').AsInteger := iMarcar;
      FieldByName('OUTUBRO_X').AsInteger := iMarcar;
      FieldByName('NOVEMBRO_X').AsInteger := iMarcar;
      FieldByName('DEZEMBRO_X').AsInteger := iMarcar;
      FieldByName('SALARIO13_X').AsInteger := iMarcar;      
    end;

end;

procedure TFrmPadrao.dtsRegistroStateChange(Sender: TObject);
begin
  inherited;
  dbMarcar.Enabled := (TDataSource(Sender).DataSet.State in [dsInsert,dsEdit]);
end;

end.
