{
Projeto FolhaLivre - Folha de Pagamento Livre
Cadastro de Folha de Pagamento

Copyright (c) 2002-2007 Allan Lima, Belém-Pará-Brasil.

Este programa é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

Histórico das modificações

* 19/06/2005 - Folha complementar e lista de folhas-bases;
* 23/08/2006 - Adicionado o campo DIA_DSR para suporte ao calculo;
               do "Descanso Semanal Remunerado";
* 09/09/2006 - Retirado o campo DIA_DSR;
* 20/11/2007 - Adicionado a Previsão de funcionários;
* 22/11/2007 - Adicionado a Sequência de Cálculo;
}

unit ffolha;

{$I flivre.inc}

interface

uses
  SysUtils, Classes,
  {$IFDEF CLX}
  Qt, QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  QGrids, QDBGrids, QComCtrls, QMenus, QButtons, QMask, QDBCtrls,
//  {$IFDEF AK_LABEL}QAKLabel,{$ENDIF}
  {$ENDIF}
  {$IFDEF VCL}
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, Menus, Buttons, Mask, DBCtrls,
//  {$IFDEF AK_LABEL}AKLabel,{$ENDIF}
  {$ENDIF}
  {$IFDEF FL_MIDASLIB}MidasLib,{$ENDIF}
  Types, DB, DBClient, ScktComp, fcadastro, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxLocalization, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, AKLabel;

type
  TFrmFolha = class(TFrmCadastro)
    mtRegistroIDEMPRESA: TIntegerField;
    mtRegistroIDFOLHA: TIntegerField;
    mtRegistroDATA_CREDITO: TDateField;
    mtRegistroPERIODO_INICIO: TDateField;
    mtRegistroPERIODO_FIM: TDateField;
    mtRegistroARQUIVAR_X: TSmallintField;
    mtRegistroDESCRICAO: TStringField;
    mtRegistroOBSERVACAO: TStringField;
    pnlFolha: TPanel;
    lbCodigo: TLabel;
    lblNome: TLabel;
    dbCodigo: TDBEdit;
    dbNome: TDBEdit;
    PageControl2: TPageControl;
    TabGeral: TTabSheet;
    pnlDados: TPanel;
    Bevel2: TBevel;
    lblNascimento: TLabel;
    TabObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    lbInicio: TLabel;
    dbInicio: TDBEdit;
    dbFim: TDBEdit;
    lbFim: TLabel;
    dbCredito: TDBEdit;
    lbCredito: TLabel;
    lbTipo: TLabel;
    dbTipo: TAKDBEdit;
    dbTipo2: TDBEdit;
    mtRegistroFOLHA_TIPO: TStringField;
    mtRegistroCOMPETENCIA: TSmallintField;
    dbCompetencia: TDBEdit;
    mtRegistroIDFOLHA_TIPO: TStringField;
    mtRegistroIDGP: TIntegerField;
    cdGP: TClientDataSet;
    cdGPIDGP: TIntegerField;
    cdGPNOME: TStringField;
    mtRegistroGP: TStringField;
    mtRegistroCOMPLEMENTAR_X: TSmallintField;
    pnlArquivar: TPanel;
    Bevel1: TBevel;
    dbComplementar: TDBCheckBox;
    dbArquivar: TDBCheckBox;
    lbGP: TLabel;
    dbGP: TAKDBEdit;
    dbGP2: TDBEdit;
    procedure mtRegistroBeforeEdit(DataSet: TDataSet);
    procedure mtRegistroBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbTipoButtonClick(Sender: TObject);
    procedure dbGPButtonClick(Sender: TObject);
    procedure mtRegistroAfterCancel(DataSet: TDataSet);
    procedure mtRegistroBeforeDelete(DataSet: TDataSet);
    procedure dbgRegistroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mtRegistroNewRecord(DataSet: TDataSet);
    procedure dtsRegistroStateChange(Sender: TObject);
    procedure mtRegistroBeforeInsert(DataSet: TDataSet);
    procedure PageControl2Change(Sender: TObject);
    procedure mtRegistroAfterPost(DataSet: TDataSet);
  protected
    TabContraPartida: TTabSheet;
    cdContraPartida: TClientDataSet;
    // -------- Folha Complementar x Folhas Bases ----------
    TabFolhaBase: TTabSheet;
    cdFolhaBase: TClientDataSet;
    // -------- Sequência -----------
    TabSequencia: TTabSheet;
    cdSequencia: TClientDataSet;
    // -- Funcionários (Previsão)---
    TabPrevisao: TTabSheet;
    cdPrevisao: TClientDataSet;
    pnlPrevisao: TPanel;
    dbgPrevisao: TDBGrid;
  private
    { Private declarations }
    pvAtivar: Boolean;
    ClientSocket: TClientSocket;
    procedure LerContraPartida();
    procedure AdicionarContraPartida(Sender: TObject);
    procedure RemoverContraPartida(Sender: TObject);
    procedure LerFolhaBase();
    procedure AdicionarFolhaBase(Sender: TObject);
    procedure RemoverFolhaBase(Sender: TObject);
    procedure LerSequencia( Grupo, Competencia: Integer; TipoFolha: String);
    procedure LerPrevisao( Empresa, GrupoPagamento: Integer; Inicio, Fim: TDateTime);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure Iniciar; override;
  end;

procedure CriaFolha();
function FindFolha( Pesquisa: String; Empresa: Integer;
  var Codigo: Integer; var Nome: String; var Tipo: String;
  var Grupo: Integer):Boolean;

implementation

uses ftext, fdb, fsuporte, fevento, ffind, ffolha_tipo, fbase,
  DateUtils, cDateTime, fdata, fusuario, fdeposito;

{$R *.dfm}

function FindFolha( Pesquisa: String; Empresa: Integer;
  var Codigo: Integer; var Nome: String; var Tipo: String;
  var Grupo: Integer):Boolean;
var
  DataSet: TClientDataSet;
  vCodigo: Variant;
  iLen: Integer;
  sWhere: String;
  SQL: TStringList;
begin

  Result := False;

  if (Length(Pesquisa) = 0) then
  begin
    Pesquisa := '*';
    if not InputQuery( 'Pesquisa de Folha de Pagamento',
                       'Informe um texto para pesquisar', Pesquisa) then
      Exit;
  end;

  iLen := Length(Pesquisa);

  if (iLen = 0) then
    Exit;

  Pesquisa := kSubstitui( UpperCase(Pesquisa), '*', '%');

  if kNumerico(Pesquisa) then
    sWhere := 'F.IDFOLHA = '+Pesquisa
  else
    sWhere := 'F.DESCRICAO LIKE '+QuotedStr(Pesquisa+'%');

  sWhere  := 'F.IDEMPRESA = '+IntToStr(Empresa)+' AND '+sWhere;

  DataSet := TClientDataSet.Create(NIL);
  SQL     := TStringList.Create;

  try try

    SQL.BeginUpdate;
    SQL.Add('SELECT');
    SQL.Add('  F.IDFOLHA AS ID, F.DESCRICAO AS NOME, F.IDGP, T.NOME AS TIPO');
    SQL.Add('FROM');
    SQL.Add('  F_FOLHA F, F_FOLHA_TIPO T');
    SQL.Add('WHERE '+sWhere+' AND T.IDFOLHA_TIPO = F.IDFOLHA_TIPO');
    SQL.Add('ORDER BY PERIODO_INICIO DESC');
    SQL.EndUpdate;

    kOpenSQL( DataSet, SQL.Text);

    if (DataSet.RecordCount = 1) or
        kFindDataSet( DataSet, 'Pesquisando Folha de Pagamento', 'NOME',
                      vCodigo, [foNoPanel], 'ID') then
    begin
      Codigo := DataSet.FieldByName('ID').AsInteger;
      Nome := DataSet.FieldByName('NOME').AsString;
      Tipo := DataSet.FieldByName('TIPO').AsString;
      Grupo := DataSet.FieldByName('IDGP').AsInteger;
      Result := True;
    end;

  except
    on E:Exception do
      kErro(E.Message, '', 'FindFolha()');
  end;
  finally
    SQL.Free;
    DataSet.Free;
  end;

end;  // FindFolha

procedure CriaFolha();
var
  i: Integer;
begin

  for i := 0 to (Screen.FormCount - 1) do
    if (Screen.Forms[i] is TFrmFolha) then
    begin
      Screen.Forms[i].Show;
      Exit;
    end;

  with TFrmFolha.Create(Application) do
  begin
    pvTabela := 'F_FOLHA';
    Iniciar();
    Show;
  end;  // with Frm do

end;

{ TFrmFolha }

constructor TFrmFolha.Create(AOwner: TComponent);
var
  Panel1, Panel2: TPanel;
  Button1: TSpeedButton;
  DataSource1: TDataSource;
  DBGrid1: TDBGrid;
begin

  inherited;

  dbNome.Font.Color := clBlue;
  dbNome.Font.Style := [fsBold];
  
  if not kExistField('F_FOLHA', 'COMPLEMENTAR_X') then
  begin
    dbComplementar.Enabled    := False;
    dbComplementar.DataField  := '';
    dbComplementar.DataSource := NIL;
    mtRegistro.FieldByName('COMPLEMENTAR_X').Free;
  end;

  if kExistTable('F_FOLHA_CP') then
  begin

    cdContraPartida := TClientDataSet.Create(Self);

    with cdContraPartida do
    begin
      FieldDefs.Add( 'IDFOLHA', ftInteger);
      FieldDefs.Add( 'IDFOLHA_CP', ftInteger);
      FieldDefs.Add( 'DESCRICAO', ftString, 30);
      FieldDefs.Add( 'PERIODO_INICIO', ftDate);
      FieldDefs.Add( 'PERIODO_FIM', ftDate);
      FieldDefs.Add( 'FOLHA_TIPO', ftString, 30);
      FieldDefs.Add( 'ARQUIVAR_X', ftSmallint);
      CreateDataSet;
    end;

    DataSource1         := TDataSource.Create(Self);
    DataSource1.DataSet := cdContraPartida;

    TabContraPartida := TTabSheet.Create(Self);

    with TabContraPartida do
    begin
      PageControl := PageControl2;
      Caption := 'Contra &Partida';
    end;

    Panel1 := TPanel.Create(Self);

    with Panel1 do
    begin
      Parent      := TabContraPartida;
      Align       := alTop;
      Alignment   := taLeftJustify;
      Caption     := ' · Relação de Folhas de Contra Partida';
      Color       := RxTitulo.Color;
      Font.Assign(RxTitulo.Font);
      Height      := RxTitulo.Height;
      BevelInner  := bvNone;
      BevelOuter  := bvNone;
      BorderStyle := bsNone;
    end;

    Panel2 := TPanel.Create(Self);

    with Panel2 do
    begin
      Parent      := Panel1;
      Align       := alRight;
      Caption     := '';
      ParentColor := True;
      BevelInner  := bvNone;
      BevelOuter  := bvNone;
      BorderStyle := bsNone;
    end;

    Button1 := TSpeedButton.Create(Self);

    with Button1 do
    begin
      Parent       := Panel2;
      Caption      := '&Adicionar...';
      ShowHint     := True;
      Hint         := 'Inclui uma folha na lista de contra-partidas';
      Font.Assign(btnDetalhar.Font);
      ParentColor  := True;
      Width        := btnDetalhar.Width;
      Flat         := btnDetalhar.Flat;
      Top          := btnDetalhar.Top;
      Left         := 8;
      OnClick      := AdicionarContraPartida;
    end;

    with TSpeedButton.Create(Self) do
    begin
      Parent       := Panel2;
      Caption      := '&Remover...';
      ShowHint     := True;
      Hint         := 'Retira a folha da lista de contra-partidas';
      Font.Assign(btnDetalhar.Font);
      ParentColor  := True;
      Width        := btnDetalhar.Width;
      Flat         := btnDetalhar.Flat;
      Top          := btnDetalhar.Top;
      Left         := Button1.Left + Button1.Width + 5 ;
      OnClick      := RemoverContraPartida;
      Panel2.Width := Left + Width + 10;
    end;

    with TDBGrid.Create(Self) do
    begin

      Parent      := TabContraPartida;
      Align       := alClient;
      ParentColor := True;
      DataSource  := DataSource1;
      Options     := Options + [dgIndicator, dgEditing, dgRowSelect, dgAlwaysShowSelection];
      Options     := Options - [dgColumnResize];
      ReadOnly    := True;
//      OnDrawColumnCell := dbgRegistro.OnDrawColumnCell;
//      OnTitleClick     := dbgRegistro.OnTitleClick;

      with Columns.Add do
      begin
        FieldName := 'IDFOLHA_CP';
        Title.Caption := 'ID Folha';
        Width := 60;
      end;

      with Columns.Add do
      begin
        FieldName := 'DESCRICAO';
        Title.Caption := 'Descrição';
        Width := 300;
      end;

      with Columns.Add do
      begin
        FieldName := 'PERIODO_INICIO';
        Title.Caption := 'Início';
        Width := 75;
      end;

      with Columns.Add do
      begin
        FieldName := 'PERIODO_FIM';
        Title.Caption := 'Fim';
        Width := 75;
      end;

      with Columns.Add do
      begin
        FieldName := 'FOLHA_TIPO';
        Title.Caption := 'Tipo';
        Width := 80;
      end;

    end;

  end;  // F_FOLHA_CP

  if kExistTable('F_FOLHA_BASE') then
  begin

    cdFolhaBase := TClientDataSet.Create(Self);

    with cdFolhaBase do
    begin
      FieldDefs.Add( 'IDFOLHA', ftInteger);
      FieldDefs.Add( 'IDFOLHA_BASE', ftInteger);
      FieldDefs.Add( 'DESCRICAO', ftString, 30);
      FieldDefs.Add( 'PERIODO_INICIO', ftDate);
      FieldDefs.Add( 'PERIODO_FIM', ftDate);
      FieldDefs.Add( 'FOLHA_TIPO', ftString, 30);
      FieldDefs.Add( 'ARQUIVAR_X', ftSmallint);
      CreateDataSet;
    end;

    DataSource1         := TDataSource.Create(Self);
    DataSource1.DataSet := cdFolhaBase;

    TabFolhaBase := TTabSheet.Create(Self);

    with TabFolhaBase do
    begin
      PageControl := PageControl2;
      Caption := 'Folhas &Bases';
    end;

    Panel1 := TPanel.Create(Self);

    with Panel1 do
    begin
      Parent      := TabFolhaBase;
      Align       := alTop;
      Alignment   := taLeftJustify;
      Caption     := ' · Relação de Folhas Bases para Complementar';
      Color       := RxTitulo.Color;
      Font.Assign(RxTitulo.Font);
      Height      := RxTitulo.Height;
      BevelInner  := bvNone;
      BevelOuter  := bvNone;
      BorderStyle := bsNone;
    end;

    Panel2 := TPanel.Create(Self);

    with Panel2 do
    begin
      Parent      := Panel1;
      Align       := alRight;
      Caption     := '';
      ParentColor := True;
      BevelInner  := bvNone;
      BevelOuter  := bvNone;
      BorderStyle := bsNone;
    end;

    Button1 := TSpeedButton.Create(Self);

    with Button1 do
    begin
      Parent       := Panel2;
      Caption      := '&Adicionar...';
      ShowHint     := True;
      Hint         := 'Inclui uma folha na lista de folhas-bases';
      Font.Assign(btnDetalhar.Font);
      ParentColor  := True;
      Width        := btnDetalhar.Width;
      Flat         := btnDetalhar.Flat;
      Top          := btnDetalhar.Top;
      Left         := 8;
      OnClick      := AdicionarFolhaBase;
    end;

    with TSpeedButton.Create(Self) do
    begin
      Parent       := Panel2;
      Caption      := '&Remover...';
      ShowHint     := True;
      Hint         := 'Retira a folha da lista de folhas-bases';
      Font.Assign(btnDetalhar.Font);
      ParentColor  := True;
      Width        := btnDetalhar.Width;
      Flat         := btnDetalhar.Flat;
      Top          := btnDetalhar.Top;
      Left         := Button1.Left + Button1.Width + 5 ;
      OnClick      := RemoverFolhaBase;
      Panel2.Width := Left + Width + 10;
    end;

    with TDBGrid.Create(Self) do
    begin

      Parent      := TabFolhaBase;
      Align       := alClient;
      ParentColor := True;
      DataSource  := DataSource1;
      Options     := Options + [dgIndicator, dgEditing, dgRowSelect, dgAlwaysShowSelection];
      Options     := Options - [dgColumnResize];
      ReadOnly    := True;
//      OnDrawColumnCell := dbgRegistro.OnDrawColumnCell;
//      OnTitleClick     := dbgRegistro.OnTitleClick;

      with Columns.Add do
      begin
        FieldName := 'IDFOLHA_BASE';
        Title.Caption := 'ID Folha';
        Width := 60;
      end;

      with Columns.Add do
      begin
        FieldName := 'DESCRICAO';
        Title.Caption := 'Descrição';
        Width := 300;
      end;

      with Columns.Add do
      begin
        FieldName := 'PERIODO_INICIO';
        Title.Caption := 'Início';
        Width := 75;
      end;

      with Columns.Add do
      begin
        FieldName := 'PERIODO_FIM';
        Title.Caption := 'Fim';
        Width := 75;
      end;

      with Columns.Add do
      begin
        FieldName := 'FOLHA_TIPO';
        Title.Caption := 'Tipo';
        Width := 80;
      end;

    end;

  end;  // F_FOLHA_BASE

  cdSequencia := TClientDataSet.Create(Self);

  with cdSequencia do
  begin
    FieldDefs.Add('SEQUENCIA', ftInteger);
    FieldDefs.Add('IDEVENTO', ftInteger);
    FieldDefs.Add('FORMULA', ftString, 50);
    FieldDefs.Add('NOME', ftString, 50);
    FieldDefs.Add('TIPO_EVENTO', ftString, 1);
    FieldDefs.Add('ATIVO_X', ftSmallint);    
    FieldDefs.Add('IDTIPO', ftString, 2);
    FieldDefs.Add('IDSITUACAO', ftString, 2);
    FieldDefs.Add('IDVINCULO', ftString, 2);
    FieldDefs.Add('IDSALARIO', ftString, 2);
    FieldDefs.Add('INFORMADO', ftFloat);
    CreateDataSet;
  end;

  DataSource1 := TDataSource.Create(Self);
  DataSource1.DataSet := cdSequencia;

  TabSequencia := TTabSheet.Create(Self);

  with TabSequencia do
  begin
    PageControl := PageControl2;
    Caption := '&Sequência de Cálculo';
  end;

  with TPanel.Create(Self) do
  begin
    Parent      := TabSequencia;
    Align       := alTop;
    Alignment   := taLeftJustify;
    Caption     := ' · Relação de Eventos da Sequência';
    Color       := RxTitulo.Color;
    Font.Assign(RxTitulo.Font);
    Height      := RxTitulo.Height;
    BevelInner  := bvNone;
    BevelOuter  := bvNone;
    BorderStyle := bsNone;
  end;

  with TDBGrid.Create(Self) do
  begin

    Parent := TabSequencia;
    Align  := alClient;
    ParentColor := True;
    DataSource := DataSource1;
    Options := Options + [dgIndicator, dgEditing, dgRowSelect, dgAlwaysShowSelection];
    Options := Options - [dgColumnResize];
    ReadOnly := True;
//    OnDrawColumnCell := dbgRegistro.OnDrawColumnCell;

    with Columns.Add do
    begin
      FieldName := 'SEQUENCIA';
      Title.Caption := 'Ordem';
      Width := 50;
    end;

    with Columns.Add do
    begin
      FieldName := 'IDEVENTO';
      Title.Caption := 'Evento';
      Width := 60;
    end;

    with Columns.Add do
    begin
      FieldName := 'NOME';
      Title.Caption := 'Descrição do Evento';
      Width := 300;
    end;

    with Columns.Add do
    begin
      FieldName := 'FORMULA';
      Title.Caption := 'Fórmula';
      Width := 135;
    end;

    with Columns.Add do
    begin
      FieldName := 'IDTIPO';
      Title.Caption := 'Tipo';
      Width := 50;
    end;

    with Columns.Add do
    begin
      FieldName := 'IDSITUACAO';
      Title.Caption := 'Situação';
      Width := 50;
    end;

    with Columns.Add do
    begin
      FieldName := 'IDVINCULO';
      Title.Caption := 'Vínculo';
      Width := 50;
    end;

    with Columns.Add do
    begin
      FieldName := 'IDSALARIO';
      Title.Caption := 'Salário';
      Width := 50;
    end;

    with Columns.Add do
    begin
      FieldName := 'INFORMADO';
      Title.Caption := 'Valor Inf.';
      Width := 60;
    end;

  end;

  cdPrevisao := TClientDataSet.Create(Self);

  with cdPrevisao do
  begin
    FieldDefs.Add( 'IDFUNCIONARIO', ftInteger);
    FieldDefs.Add( 'NOME', ftString, 50);
    FieldDefs.Add( 'ADMISSAO', ftDate);
    FieldDefs.Add( 'SALARIO', ftString, 30);
    FieldDefs.Add( 'LOTACAO', ftString, 50);
    CreateDataSet;
  end;

  DataSource1 := TDataSource.Create(Self);
  DataSource1.DataSet := cdPrevisao;

  TabPrevisao := TTabSheet.Create(Self);

  with TabPrevisao do
  begin
    PageControl := PageControl2;
    Caption := 'Funcionários (Previsão)';
  end;

  pnlPrevisao := TPanel.Create(Self);

  with pnlPrevisao do
  begin
    Parent      := TabPrevisao;
    Align       := alTop;
    Alignment   := taLeftJustify;
    Color       := RxTitulo.Color;
    Font.Assign(RxTitulo.Font);
    Font.Size := Font.Size - 2;
    Height      := RxTitulo.Height;
    BevelInner  := bvNone;
    BevelOuter  := bvNone;
    BorderStyle := bsNone;
  end;

  dbgPrevisao := TDBGrid.Create(Self);

  with dbgPrevisao do
  begin

    Parent := TabPrevisao;
    Align  := alClient;
    ParentColor := True;
    DataSource := DataSource1;
    Options := Options + [dgIndicator, dgEditing, dgRowSelect, dgAlwaysShowSelection];
    Options := Options - [dgColumnResize];
    ReadOnly := True;
//    OnDrawColumnCell := dbgRegistro.OnDrawColumnCell;
//    OnTitleClick     := dbgRegistro.OnTitleClick;

    with Columns.Add do
    begin
      FieldName := 'IDFUNCIONARIO';
      Title.Caption := 'Código';
      Width := 50;
    end;

    with Columns.Add do
    begin
      FieldName := 'NOME';
      Title.Caption := 'Nome do Funcionário';
      Width := 400;
    end;

    with Columns.Add do
    begin
      FieldName := 'ADMISSAO';
      Title.Caption := 'Admissão';
      Width := 70;
    end;

    with Columns.Add do
    begin
      FieldName := 'SALARIO';
      Title.Caption := 'Tipo Salário';
      Width := 60;
    end;

    with Columns.Add do
    begin
      FieldName := 'LOTACAO';
      Title.Caption := 'Lotação';
      Width := 150;
    end;

  end;

  ClientSocket := TClientSocket.Create(Self);

  with ClientSocket do
  begin
    Host := 'localhost';
    Port := 1221;
    Active := True;
  end;

end;

procedure TFrmFolha.Iniciar;
begin

  pvSELECT := 'SELECT F.IDFOLHA, F.DESCRICAO, F.PERIODO_INICIO,'#13#10+
              'T.NOME FOLHA_TIPO, F.IDGP, F.IDEMPRESA, F.ARQUIVAR_X'#13#10+
              'FROM F_FOLHA F'#13#10+
              'LEFT OUTER JOIN F_FOLHA_TIPO T ON (T.IDFOLHA_TIPO = F.IDFOLHA_TIPO)';

  pvSELECT_NULL := 'WHERE (F.IDEMPRESA = #EMPRESA) ORDER BY F.PERIODO_INICIO, F.IDFOLHA';

  // kNovaPesquisa( mtPesquisa, 'CODIGO', pvSELECT_NULL + ' AND F.IDFOLHA = #');
  // kNovaPesquisa( mtPesquisa, 'DESCRICAO', pvSELECT_NULL + ' F.DESCRICAO LIKE '+QuotedStr('#%'));

  kNovaColuna( mtColuna, 0,  60,  6, 'ID', '');
  kNovaColuna( mtColuna, 1, 320, 30, 'Descrição', '');
  kNovaColuna( mtColuna, 2,  90, 10, 'Início', '');
  kNovaColuna( mtColuna, 3, 100, 10, 'Tipo', '');
  kNovaColuna( mtColuna, 4,  50,  5, 'GP', '');

  inherited Iniciar;

  kSQLSelectFrom( cdGP, 'F_GRUPO_PAGAMENTO', 'IDGE = '+IntToStr(pvGE));

  if (cdGP.RecordCount = 1) then
  begin
    lbGP.Enabled  := False;
    dbGP.Enabled  := False;
    dbGP2.Enabled := False;
  end;

end;

procedure TFrmFolha.mtRegistroBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  dbNome.SetFocus;
  lbCodigo.Enabled := False;
  dbCodigo.Enabled := False;
end;

procedure TFrmFolha.mtRegistroBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if (FieldByName('IDFOLHA').AsInteger = 0) then
      FieldByName('IDFOLHA').AsInteger := kMaxCodigo( 'F_FOLHA', 'IDFOLHA', pvEmpresa);
    pvAtivar := (State in [dsInsert]);
  end;
  inherited;
end;

procedure TFrmFolha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
  wYear, wMonth, wDay: Word;
  vValue: Variant;
  bEditando: Boolean;
begin

  bEditando := (pvDataSet.State in [dsInsert, dsEdit]);

  if (Key = VK_RETURN) and (ActiveControl = dbArquivar) then
  begin
    PageControl2.SelectNextPage(True);
    Key := 0;

  end else if (Key = VK_RETURN) and (ActiveControl = dbTipo) and bEditando then
    PesquisaTipoFolha( dbTipo.Text, pvDataSet, Key)

  else if (Key = VK_RETURN) and (ActiveControl = dbGP) and bEditando then
  begin

    if kFindDataSet( cdGP, dbGP.Text, 'IDGP', vValue, '', True) then
      pvDataSet.FieldByName('IDGP').Value := vValue
    else Key := 0;

  end else if (Key = VK_RETURN) and (ActiveControl = dbInicio) and bEditando then
  begin

    ActiveControl := NIL;

    if pvDataSet.FieldByName('PERIODO_FIM').IsNull then
      pvDataSet.FieldByName('PERIODO_FIM').AsDateTime :=
            LastDayOfMonth(pvDataSet.FieldByName('PERIODO_INICIO').AsDateTime);

    ActiveControl := dbInicio;

  end else if (Key = VK_RETURN) and (ActiveControl = dbFim) and bEditando then
  begin

    ActiveControl := NIL;

    if pvDataSet.FieldByName('DATA_CREDITO').IsNull then
    begin
      DecodeDate( pvDataSet.FieldByName('PERIODO_FIM').AsDateTime, wYear, wMonth, wDay);
      pvDataSet.FieldByName('DATA_CREDITO').AsDateTime := AddMonths( EncodeDate( wYear, wMonth, 5), 1);
    end;

    if (pvDataSet.FieldByName('COMPETENCIA').AsInteger in [0,1]) then
    begin
      i := Month(pvDataSet.FieldByName('PERIODO_INICIO').AsDateTime);
      pvDataSet.FieldByName('COMPETENCIA').AsInteger := i;
    end;

    ActiveControl := dbFim;

  end else if (Key = VK_RETURN) and bEditando and (ActiveControl = dbArquivar) then
    Key := VK_F3;

  inherited;

end;

procedure TFrmFolha.dbTipoButtonClick(Sender: TObject);
var
  Key: Word;
begin
  PesquisaTipoFolha( '', pvDataSet, Key);
end;

procedure TFrmFolha.dbGPButtonClick(Sender: TObject);
var
  vValue: Variant;
begin
  if kFindDataSet( cdGP, 'Pesquisando Grupos de Pagamentos', 'IDGP',
                   vValue, [foNoPanel, foNoTitle] ) and
     (pvDataSet.State in [dsInsert,dsEdit]) then
    pvDataSet.FieldByName('IDGP').Value := vValue;
end;

procedure TFrmFolha.mtRegistroAfterCancel(DataSet: TDataSet);
begin
  inherited;
  lbCodigo.Enabled := True;
  dbCodigo.Enabled := True;
end;

procedure TFrmFolha.mtRegistroBeforeDelete(DataSet: TDataSet);
var
  sNome: String;
begin
  sNome := DataSet.FieldByName('DESCRICAO').AsString;
  if not kConfirme('Deseja excluir a folha '+sNome+' ?') then
    SysUtils.Abort
  else
    inherited;
end;

procedure TFrmFolha.dbgRegistroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Assigned(Column.Field.DataSet.FindField('ATIVO_X')) then
  begin
    kEventoDrawColumnCell(Sender, Rect, DataCol, Column, State);
    if Assigned(Column.Field.DataSet.FindField('SEQUENCIA')) and
       (Column.Field.DataSet.FieldByName('IDTIPO').AsString = EmptyStr) then
    begin
      if (gdSelected in State) and TWinControl(Sender).Focused then
        TDBGrid(Sender).Canvas.Brush.Color := clGray
      else
        TDBGrid(Sender).Canvas.Brush.Color := clMedGray;      
      TDBGrid(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, State);
    end;
  end else if Assigned(Column.Field.DataSet.FindField('ARQUIVAR_X')) and
     (Column.Field.DataSet.FieldByName('ARQUIVAR_X').AsInteger = 1) then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlue;
    TDBGrid(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, State);
  end;
end;

procedure TFrmFolha.mtRegistroNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('IDGP').AsInteger := cdGP.FieldByName('IDGP').AsInteger;
end;

procedure TFrmFolha.dtsRegistroStateChange(Sender: TObject);
var
  i: Integer;
  bEditando: Boolean;
begin
  inherited;
  bEditando := TDataSource(Sender).State in [dsInsert,dsEdit];
  for i := 2 to PageControl2.PageCount - 1 do
    PageControl2.Pages[i].TabVisible := not bEditando;
end;

procedure TFrmFolha.mtRegistroBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if dbCodigo.Enabled and dbCodigo.Visible and not dbCodigo.ReadOnly then
    dbCodigo.SetFocus
  else
    dbNome.SetFocus;
  PageControl2.ActivePageIndex := 0;
end;

procedure TFrmFolha.PageControl2Change(Sender: TObject);
var
  i: Integer;
begin

  if Assigned(TabContraPartida) and (TPageControl(Sender).ActivePage = TabContraPartida) then
    LerContraPartida()

  else if Assigned(TabFolhaBase) and (TPageControl(Sender).ActivePage = TabFolhaBase) then
    LerFolhaBase()

  else if Assigned(TabSequencia) and (TPageControl(Sender).ActivePage = TabSequencia) then
    LerSequencia( pvDataSet.FieldByName('IDGP').AsInteger,
                  pvDataSet.FieldByName('COMPETENCIA').AsInteger,
                  pvDataSet.FieldByName('IDFOLHA_TIPO').AsString)

  else if (TPageControl(Sender).ActivePage = TabPrevisao) then
  begin

    if (TabPrevisao.Tag <> pvDataSet.FieldByName('IDFOLHA').AsInteger) then
    begin

      if (TabPrevisao.Tag = 0) then
      begin
        i := kMaxWidthColumn(dbgPrevisao.Columns, Rate);
        if (dbgPrevisao.Width > i) then
          dbgPrevisao.Columns[1].Width := dbgPrevisao.Columns[1].Width + (dbgPrevisao.Width-i)
        else if (i > dbgPrevisao.Width) then
          dbgPrevisao.Columns[1].Width := dbgPrevisao.Columns[1].Width - (i-dbgPrevisao.Width);
      end;

      TabPrevisao.Tag := pvDataSet.FieldByName('IDFOLHA').AsInteger;
      LerPrevisao( pvEmpresa,
                   pvDataSet.FieldByName('IDGP').AsInteger,
                   pvDataSet.FieldByName('PERIODO_INICIO').AsDateTime,
                   pvDataSet.FieldByName('PERIODO_FIM').AsDateTime);

      pnlPrevisao.Caption := ' · Previsão de '+IntToStr(cdPrevisao.RecordCount)+
                             ' funcionário(s) para a folha '+
                             QuotedStr(pvDataSet.FieldByName('DESCRICAO').AsString);

    end;

  end;

end;

// Contra-Partida

procedure TFrmFolha.LerContraPartida;
begin

  with TStringList.Create do
  try

    BeginUpdate;
    Add('SELECT');
    Add('  CP.*, F.DESCRICAO, F.PERIODO_INICIO, F.PERIODO_FIM,');
    Add('  F.ARQUIVAR_X, T.NOME AS FOLHA_TIPO');
    Add('FROM');
    Add('  F_FOLHA_CP CP, F_FOLHA F, F_FOLHA_TIPO T');
    Add('WHERE');
    Add('  CP.IDEMPRESA = :EMPRESA AND CP.IDFOLHA = :FOLHA AND');
    Add('  F.IDEMPRESA = CP.IDEMPRESA AND F.IDFOLHA = CP.IDFOLHA_CP AND');
    Add('  T.IDFOLHA_TIPO = F.IDFOLHA_TIPO');
    Add('ORDER BY CP.IDFOLHA_CP');
    EndUpdate;

    kOpenSQL( cdContraPartida, Text,
              [pvEmpresa, pvDataSet.FieldByName('IDFOLHA').AsInteger]);

  finally
    Free;
  end;

end;

procedure TFrmFolha.AdicionarContraPartida(Sender: TObject);
var
  iFolha, iCodigo, iGrupo: Integer;
  sNome, sTipo: String;
begin
  if FindFolha('', pvEmpresa, iCodigo, sNome, sTipo, iGrupo) then
  begin
    iFolha := pvDataSet.FieldByName('IDFOLHA').AsInteger;
    if kExecSQL('INSERT INTO F_FOLHA_CP'#13+
                '( IDEMPRESA, IDFOLHA, IDFOLHA_CP)'#13+
                'VALUES ( :EMPRESA, :FOLHA, :CP)', [pvEmpresa, iFolha, iCodigo]) then
       LerContraPartida();
  end;
end;

procedure TFrmFolha.RemoverContraPartida(Sender: TObject);
var
  iFolha, iCodigo: Integer;
  sNome: String;
begin

  iFolha  := pvDataSet.FieldByName('IDFOLHA').AsInteger;
  iCodigo := cdContraPartida.FieldByName('IDFOLHA_CP').AsInteger;
  sNome   := cdContraPartida.FieldByName('DESCRICAO').AsString;

  if kConfirme('Confirme para retirar a folha "'+sNome+'" da lista ?')
    and kExecSQL('DELETE FROM F_FOLHA_CP'#13+
                 'WHERE IDEMPRESA = :EMPRESA AND IDFOLHA = :FOLHA'#13+
                 'AND IDFOLHA_CP = :CP', [pvEmpresa, iFolha, iCodigo]) then
       LerContraPartida();

end;

// Folhas Bases para Folha Complementar

procedure TFrmFolha.LerFolhaBase;
begin

  with TStringList.Create do
  try

    BeginUpdate;
    Add('SELECT');
    Add('  B.*, F.DESCRICAO, F.PERIODO_INICIO, F.PERIODO_FIM,');
    Add('  F.ARQUIVAR_X, T.NOME AS FOLHA_TIPO');
    Add('FROM');
    Add('  F_FOLHA_BASE B, F_FOLHA F, F_FOLHA_TIPO T');
    Add('WHERE');
    Add('  B.IDEMPRESA = :EMPRESA');
    Add('  AND B.IDFOLHA = :FOLHA');
    Add('  AND F.IDEMPRESA = B.IDEMPRESA');
    Add('  AND F.IDFOLHA = B.IDFOLHA_BASE');
    Add('  AND T.IDFOLHA_TIPO = F.IDFOLHA_TIPO');
    Add('ORDER BY');
    Add('  B.IDFOLHA_BASE');
    EndUpdate;

    kOpenSQL( cdFolhaBase, Text,
              [pvEmpresa, pvDataSet.FieldByName('IDFOLHA').AsInteger]);

  finally
    Free;
  end;

end;

procedure TFrmFolha.AdicionarFolhaBase(Sender: TObject);
var
  iFolha, iCodigo, iGrupo: Integer;
  sNome, sTipo: String;
begin
  if FindFolha( '', pvEmpresa, iCodigo, sNome, sTipo, iGrupo) then
  begin
    iFolha := pvDataSet.FieldByName('IDFOLHA').AsInteger;
    if kExecSQL('INSERT INTO F_FOLHA_BASE'#13+
                '( IDEMPRESA, IDFOLHA, IDFOLHA_BASE)'#13+
                'VALUES ( :EMPRESA, :FOLHA, :BASE)',
                [pvEmpresa, iFolha, iCodigo]) then
       LerFolhaBase();
  end;
end;

procedure TFrmFolha.RemoverFolhaBase(Sender: TObject);
var
  iFolha, iCodigo: Integer;
  sNome: String;
begin

  iFolha  := pvDataSet.FieldByName('IDFOLHA').AsInteger;
  iCodigo := cdFolhaBase.FieldByName('IDFOLHA_BASE').AsInteger;
  sNome   := cdFolhaBase.FieldByName('DESCRICAO').AsString;

  if kConfirme('Confirme para retirar a folha "'+sNome+'" da lista ?')
    and kExecSQL('DELETE FROM F_FOLHA_BASE'#13+
                 'WHERE IDEMPRESA = :EMPRESA AND IDFOLHA = :FOLHA'#13+
                 'AND IDFOLHA_BASE = :BASE', [pvEmpresa, iFolha, iCodigo]) then
       LerFolhaBase();

end;


// Sequencia de Calculo

procedure TFrmFolha.LerSequencia( Grupo, Competencia: Integer; TipoFolha: String);
begin

  with TStringList.Create do
  try try

    BeginUpdate;
    Add('SELECT');
    Add('  S.SEQUENCIA, S.IDEVENTO, E.NOME, E.TIPO_EVENTO, E.ATIVO_X, F.FORMULA,');
    Add('  P.IDTIPO, P.IDSITUACAO, P.IDVINCULO, P.IDSALARIO, P.INFORMADO');
    Add('FROM');
    Add('  F_SEQUENCIA S');
    Add('  LEFT JOIN F_PADRAO P ON');
    Add('        (P.IDGP = S.IDGP AND P.IDEVENTO = S.IDEVENTO');
    Add('         AND P.IDFOLHA_TIPO = :TIPO');
    Add('         AND SUBSTRING(P.COMPETENCIAS FROM '+IntToStr(Competencia)+' FOR 1) = '+QuotedStr('X')+')');
    Add('  LEFT JOIN F_FORMULA F ON (F.IDFORMULA = S.IDFORMULA),');
    Add('  F_EVENTO E');
    Add('WHERE');
    Add('  S.IDGP = :GP AND E.IDEVENTO = S.IDEVENTO');
    Add('ORDER BY');
    Add('  S.SEQUENCIA, S.IDEVENTO');
    EndUpdate;

    if not kOpenSQL( cdSequencia, Text, [TipoFolha, Grupo]) then
      Exception.Create(kGetErrorLastSQL);

  except
    on E:Exception do kErro( E.Message, 'ffolha.pas', 'LerSequencia()');
  end;
  finally
    Free;
  end;

end;

procedure TFrmFolha.LerPrevisao( Empresa, GrupoPagamento: Integer; Inicio, Fim: TDateTime);
begin


  with TStringList.Create do
  try try

    BeginUpdate;
    Add('SELECT');
    Add('  F.IDFUNCIONARIO, P.NOME, F.ADMISSAO, S.NOME AS SALARIO, L.NOME AS LOTACAO');
    Add('FROM');
    Add('  FUNCIONARIO F');
    Add('  LEFT JOIN PESSOA P ON (P.IDPESSOA = F.IDPESSOA)');
    Add('  LEFT JOIN F_SALARIO S ON (S.IDSALARIO = F.IDSALARIO)');
    Add('  LEFT JOIN F_LOTACAO L ON (L.IDEMPRESA = F.IDEMPRESA AND L.IDLOTACAO = F.IDLOTACAO)');
    Add('WHERE');
    Add('  F.IDEMPRESA = :EMPRESA AND F.IDGP = :GP');
    Add('  AND ( (F.DEMISSAO IS NULL) OR (F.DEMISSAO > :INICIO) )');
    Add('  AND (F.ADMISSAO <= :FIM)');
    Add('ORDER BY P.NOME');
    EndUpdate;

    if not kOpenSQL( cdPrevisao, Text, [Empresa, GrupoPagamento, Inicio, Fim]) then
      Exception.Create(kGetErrorLastSQL);

  except
    on E:Exception do
      kErro( E.Message, 'ffolha', 'LerPrevisao()');
  end;
  finally
    Free;
  end;

end;  // procedure LerPrevisao

procedure TFrmFolha.mtRegistroAfterPost(DataSet: TDataSet);
begin
  inherited;
  if pvAtivar and kConfirme('Deseja ativar esta folha?') then
    if kSetUsuario( kGetUser(),
                    'FOLHA_'+IntToStr(pvEmpresa),
                    DataSet.FieldByName('IDFOLHA').AsString) then
      ClientSocket.Socket.SendText('FOLHA');
end;

end.
