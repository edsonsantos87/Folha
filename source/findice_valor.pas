{
Projeto FolhaLivre - Folha de Pagamento Livre

Copyright (c) 2002 Allan Lima

Este programa é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

Autor: Allan Kardek Lima
E-mail: allan_kardek@yahoo.com.br ; folha_livre@yahoo.com.br
}

unit findice_valor;

{$I flivre.inc}

interface

uses
  {$IFDEF LINUX}Midas,{$ENDIF}
  {$IFDEF MSWINDOWS}MidasLib,{$ENDIF}
  {$IFDEF CLX}
  Qt, QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  QDBCtrls, QMask, QGrids, QDBGrids, QComCtrls, QButtons, QMenus, QAKLabel,
  {$ENDIF}
  {$IFDEF VCL}
  Windows, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, Mask, Grids, DBGrids, ComCtrls, Buttons, Menus, AKLabel,
  {$ENDIF}
  SysUtils, Classes, DB, fdialogo, DBClient, Types, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxLocalization, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TFrmIndiceValor = class(TFrmDialogo)
    mtRegistroIDEMPRESA: TIntegerField;
    mtRegistroIDINDICE: TIntegerField;
    mtRegistroCOMPETENCIA: TDateField;
    mtRegistroVALOR: TCurrencyField;
    lbCodigo: TLabel;
    dbCodigo: TDBEdit;
    dbNome: TDBEdit;
    Label3: TLabel;
    lbCompetencia: TLabel;
    dbCompetencia: TDBEdit;
    lbValor: TLabel;
    dbValor: TDBEdit;
    mtRegistroNOME: TStringField;
    tvIDINDICE: TcxGridDBColumn;
    tvCOMPETENCIA: TcxGridDBColumn;
    tvVALOR: TcxGridDBColumn;
    tvNOME: TcxGridDBColumn;
    procedure mtRegistroNewRecord(DataSet: TDataSet);
    procedure mtRegistroBeforeDelete(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mtRegistroAfterCancel(DataSet: TDataSet);
    procedure mtRegistroBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
    pvID: Integer;
    pvNome: String;
    procedure GetValores;
  public
    { Public declarations }
    procedure Iniciar; override;
  end;

procedure CriaIndiceValor;

implementation

uses fdb, ftext, fsuporte, ffind, fbase, findice;

{$R *.dfm}

procedure CriaIndiceValor;
var
  iCount: Integer;
begin

  with TFrmIndiceValor.Create(Application) do
    try
      pvTabela := 'F_INDICE_VALOR';
      iCount   := kCountSQL( 'F_INDICE', 'IDEMPRESA = :EMPRESA', [pvEmpresa]);
      if (iCount > 0) then
      begin
        if FindIndice( '*', pvEmpresa, pvID, pvNome) then
        begin
          Iniciar();
          ShowModal;
        end;
      end else
        kErro('Não há índices cadastrados para a empresa');
    finally
      Free;
    end;

end;  // CriaIndiceValor

procedure TFrmIndiceValor.Iniciar;
begin

  if (pvEmpresa = 0) then
    Caption := 'Indices Globais';

  RxTitulo.Caption := ' · '+Caption;

  dbCodigo.Font.Style := dbCodigo.Font.Style + [fsBold];
  dbNome.Font.Style   := dbCodigo.Font.Style;

  GetValores();

end;

procedure TFrmIndiceValor.GetValores;
var
  SQL: TStringList;
begin

  SQL := TStringList.Create;

  try try

    SQL.BeginUpdate;
    SQL.Add('SELECT V.*, I.NOME');
    SQL.Add('FROM F_INDICE_VALOR V, F_INDICE I');
    SQL.Add('WHERE');
    SQL.Add('  V.IDEMPRESA = :EMPRESA AND V.IDINDICE = :INDICE AND');
    SQL.Add('  I.IDEMPRESA = V.IDEMPRESA AND I.IDINDICE = V.IDINDICE');
    SQL.Add('ORDER BY');
    SQL.Add('  V.COMPETENCIA DESC');
    SQL.EndUpdate;

    if not kOpenSQL( mtRegistro, SQL.Text, [pvEmpresa, pvID]) then
      raise Exception.Create( kGetErrorLastSQL);

  except
    on E:Exception do
      kErro( E.Message, 'findice_valor', 'GetValores()');
  end;
  finally
    SQL.Free;
  end;

  mtRegistro.First;

end;  // procedure GetValores

procedure TFrmIndiceValor.mtRegistroNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('IDINDICE').AsInteger := pvID;
  DataSet.FieldByName('NOME').AsString      := pvNome;
end;

procedure TFrmIndiceValor.mtRegistroBeforeDelete(DataSet: TDataSet);
begin
  if not kConfirme( 'Excluir o valor?') then
    SysUtils.Abort
  else
    inherited;
end;

procedure TFrmIndiceValor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F12) then
  begin
    if FindIndice( '*', pvEmpresa, pvID, pvNome) then
      GetValores();
  end else
    inherited;
end;

procedure TFrmIndiceValor.mtRegistroAfterCancel(DataSet: TDataSet);
begin
  inherited;
  dbCompetencia.Enabled := True;
end;

procedure TFrmIndiceValor.mtRegistroBeforeEdit(DataSet: TDataSet);
begin
  dbCompetencia.Enabled := False;
  inherited;
end;

end.


