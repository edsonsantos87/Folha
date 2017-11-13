{
Projeto FolhaLivre - Folha de Pagamento Livre

Copyright (c) 2002-2007, Allan Lima

Este programa � um software de livre distribui��o, que pode ser copiado e
distribu�do sob os termos da Licen�a P�blica Geral GNU, conforme publicada
pela Free Software Foundation, vers�o 2 da licen�a ou qualquer vers�o posterior.

Este programa � distribu�do na expectativa de ser �til aos seus usu�rios,
por�m  N�O TEM NENHUMA GARANTIA, EXPL�CITAS OU IMPL�CITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licen�a P�blica Geral GNU para maiores detalhes.

@autor-name: Allan Lima
@autor-email: allan_kardek@yahoo.com.br
@project-name: Folhalivre
@project-email: folha_livre@yahoo.com.br

Historico das modifica��es

* 01/04/2007 - Adicionada a fun��o "kSalarioNormal()"
* 19/08/2006 - Adicionada a fun��o "kAddListFiles()"
* 02/09/2006 - Adicionado o argumento CopyProperty para a fun��o "kDataSetToData()";
* 07/10/2006 - Adicionado "kGetLocalHostAddr" e "kGetLocalHostName";
}

{$IFNDEF NO_FSUPORTE}
unit fsuporte;
{$ENDIF}

{$IFNDEF NO_FLIVRE}
  {$I flivre.inc}
{$ENDIF}

interface

uses
  {$IFDEF MSWINDOWS}Windows, ShellAPI,{$ENDIF}
  {$IFDEF LINUX}Libc,{$ENDIF}
  {$IFDEF VCL}
  Messages, Forms, Graphics, StdCtrls, dbctrls, Controls,
  Dialogs, DBGrids, Buttons, ComCtrls, Menus, Grids, Jpeg,
  {$IFDEF AK_LABEL}AKLabel,{$ENDIF}
//  {$IFDEF AK_USER}{$ENDIF}
  AKUser,
  {$ENDIF}
  {$IFDEF CLX}
  Qt, QForms, QGraphics, QStdCtrls, QDBCtrls, QControls,
  QDialogs, QDBGrids, QButtons, QComCtrls, QMenus, QGrids,
  {$IFDEF AK_LABEL}QAKLabel,{$ENDIF}
//  {$IFDEF AK_USER}{$ENDIF}
  QAKUser,
  {$ENDIF}
  {$IFDEF RX_LIB}RXCtrls, RXDBCtrl, ToolEdit, RxCalc,{$ENDIF}
//  {$IFDEF MDI_WALLPAPER}MDIWallp,{$ENDIF}
  {$IFNDEF FL_D6}FileCtrl,{$ENDIF}
  {$IFDEF FL_D6}Variants, Types,{$ENDIF} {Implementados a partir do Delphi 6}
  {$IFDEF FL_MIDASLIB}MidasLib,{$ENDIF}
  Classes, SysUtils,
  Math, DB, DBClient, TypInfo, Sockets, System.Variants,

  //DevExpres
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxLocalization,

  //Firedac
  uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, uADCompClient;
  
const
  {$IFDEF CLX}
  VK_RETURN = Key_Return;
  VK_INSERT = Key_Insert;
  VK_F2 = Key_f2;
  VK_F3 = Key_f3;
  VK_ESCAPE = Key_Escape;
  VK_DELETE = Key_Delete;
  VK_SPACE = Key_Space;
  VK_DOWN = Key_Down;
  VK_UP = Key_Up;
  VK_F12 = Key_F12;
  {$ENDIF}
  W_SEPARATOR = 5;
  H_SEPARATOR = 5;

function kGetTabOrder( Container: TWinControl; Order: Integer):TControl;
function kGetLastTabOrder( Container: TWinControl):TControl;
function kGetFirstTabOrder( Container: TWinControl):TControl;

function kWinControlParent( Win, WinParent: TWinControl):Boolean;
procedure kWinControlDataSet( Win: TWinControl; DataSet: TDataSet);

procedure kGetCellParams( Field: TField; AFont: TFont;
  var Background: TColor; Highlight, Focus: Boolean);

{$IFDEF RX_LIB}
procedure kGetBtnParams( Field: TField; AFont: TFont;
  var Background: TColor; var SortMarker: TSortMarker; IsDown: Boolean);

function kCalculadora:Double;
{$ENDIF}

procedure kDrawColumnCell( Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState; Focused: Boolean = False);

procedure kTitleBtnClick( Field: TField);
procedure kTitleClick( Sender: TObject; Column: TColumn; Field: TField = NIL);
procedure kGridTitleClick( Sender: TcxGridTableView; Column: TcxGridColumn; Field: TField = NIL);

procedure kDataSourceToData( Origem: TDataSet; Destino: TDataSource;
  Manter: Boolean = False; Arredondar: Boolean = False);

procedure kDataSetToData( Origem, Destino: TDataSet;
  Manter: Boolean = False; Arredondar: Boolean = False;
  CopyProperty: Boolean = True);

function kDataSetPadrao( DataSet: TDataSet; Campo: String;
   Padrao: String = 'PADRAO'):Variant;

procedure kLabelQtdeTotal( LabelQtde, LabelTotal: TControl;
  DataSet: TDataSet; Campo: String = '';
  const Propriedade: String = 'Caption');

{$IFDEF VCL}
function kLoadJPEG( const psFileIN: PChar): TPicture;
{$ENDIF}
procedure kSexo( Sexo: TClientDataSet);
procedure kGrid( Frm: TForm; dsColuna: TDataSet; SelectFrom, SelectNull: String);
procedure kcxGrid( Frm: TForm; dsColuna: TDataSet; SelectFrom, SelectNull: String);

procedure kMenuCopy( MenuOrigem, MenuDestino: TMenu; Sufixo: String);

procedure kNovaPesquisa( DataSet: TDataSet;
  Titulo, Instrucao: String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False);

// ************************************

//{$IFDEF AK_USER}
procedure kSetAcesso( Value: TAKIBUser);
//{$ENDIF}
function kGetAcesso( const MenuName: String):Integer;
function kGetUser:String;
function kGetUserName:String;
function kGetGroupName:String;
function kGetUserID:Integer;

procedure kControlDataSet( Frm: TForm; DataSet: TDataSet);

function kKeyDown( Frm: TForm; var Key: Word; Shift: TShiftState):Boolean;

procedure kOperationDefault( Self: TForm; DataSet: TDataSet;
  Operacao: String; Descricao: String = 'registro'; Perguntar: Boolean = True);

function kFormataPesquisa( DataSet: TDataSet; Pesquisa, SelectFrom, Where: String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False):String;

procedure kEnabledControl( Frm: TForm);

procedure kDataSetDefault( DataSet: TDataSet; Tabela: String);

procedure kIniciaPesquisa( Frm: TForm;
  dsPesquisa: TDataSet; var SelectFrom, SelectNull: String);

procedure kProcessaPesquisa( Frm: TForm; Listagem: TDataSet;
  Pesquisa, SelectFrom, Where: String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False;
  const LimpaPesquisa: Boolean = True);

procedure kAtualizaPesquisa( Frm: TForm; Listagem: TDataSet;
  TextoInformado, SelectFrom, SelectWhere: String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False;
  const LimpaPesquisa: Boolean = True);

procedure kDetalhar( Frm: TForm; Listagem, Dados, SP: TDataSet;
  ProcuraTexto, SelectFrom, SelectWhere:String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False;
  const TableName: String = ''; FieldDS: TFields = NIL);

procedure kFreeMenu( MenuItem: TMenuItem);

procedure kProcessarScript( const Directory: String = '';
  const Extension: String = '.txt');

procedure kProcessarSQL( const Directory: String = '');

procedure kListFiles( ListFiles: TStringList;
  const Extension: String = '*.*';
  const Directory: String = '');

function kGetLojaName( const Empresa, Loja: Integer):String;
function kGetLojaField( const Empresa, Loja: Integer; const FieldName: String;
 var Value: Variant):Boolean;

function kFindMenuCaption( Menu: TMenuItem; ACaption: String): TMenuItem;
function kFindMenuName( Menu: TMenuItem; AName: String;
  StartName: Boolean = False): TMenuItem;

{$IFDEF VCL}
function kExecCommand( Command: String; ShowCmd: Integer): LongWord;
function kExecFile( const FileName, Parameters: String; ShowCmd: Integer):String;
{$ENDIF}
procedure kDelay(Tempo: Word);

function kDeleteFiles( FileName: String):Boolean;
{$IFDEF MSWINDOWS}
function kCopyFiles( FileName, PathDest: String):Boolean;
{$ENDIF}
function kFirstFile( const FileName: String):String;

function kAddListFiles( List: TStringList; Path: String):Boolean;

procedure kListWallPaper( ListWallPaper: TStringList);
{$IFDEF MDI_WALLPAPER}
//procedure kDisplayWallPaper( WallPaper: TMDIWallPaper; ListPaper: TStringList);
{$ENDIF}

function EditColor(AOwner:TComponent; AColor:TColor):TColor;

procedure kBtnControle( Frm: TForm; Operacao: String;
  Listagem, DataSet, SP: TDataSet;
  TableName: String = ''; FieldDS: TFields = NIL);

procedure kControlAssigned( WinFrom, WinTo: TWinControl);
function kMaxWidthColumn( Columns: TDBGridColumns; Rate: Double): Integer;
function kMaxWidthcxGridColumn( tv: TcxGridTableView; Rate: Double): Integer;
function kGetPropInfo(Instance: TWinControl; PropName: String = 'Text'):String;
function kGetOrdProp(Instance: TObject; PropName: String):Longint;
function kSetOrdProp(Instance: TObject; PropName: String; Value: Longint):Boolean;

function kGetLocalHostAddr: String;
function kGetLocalHostName: String;
function kIsHost:Boolean;
function kGetServer:String;

function kSalarioNormal( Salario: Currency; TipoSalario: String;
                         CargaHoraria: Integer):Double;

procedure kControlEnabled( Frm: TForm; MenuName: String; DataSet: TDataSet);
procedure kControlEnabled2( Frm: TForm; MenuName: String; DataSet: TDataSet);

procedure TraduzirDevExpress(Localizer: TcxLocalizer);
procedure CriarColuna(Sender: TcxGridDBTableView; AFieldName, ACaption: string; AWidth: Integer; StyloHeader: TcxStyle);

implementation

uses
  fsystem, fdb, ftext, foption, fdeposito, cDateTime;

//{$IFDEF AK_USER}
var
 akUsuario: TAKIBUser;
//{$ENDIF}

{$IFNDEF FL_D6}
const
  PathDelim = '\';
{$ENDIF}

function kGetTabOrder( Container: TWinControl; Order: Integer):TControl;
var
  i, a, iTabOrder: Integer;
  pTabOrder: PPropInfo;
begin

  a := -1;

  for i := 0 to Container.ControlCount - 1 do
  begin

    pTabOrder := GetPropInfo( Container.Controls[i].ClassInfo, 'TabOrder');

    if Assigned(pTabOrder) then
    begin

      iTabOrder := GetOrdProp( Container.Controls[i], pTabOrder);

      if (iTabOrder = Order) then
      begin
        a := i;
        Break;
      end;

    end;

  end;

  if (a = -1) then
    Result := NIL
  else
    Result := Container.Controls[a];

end;  // function kGetTabOrder;

function kGetLastTabOrder( Container: TwinControl):TControl;
var
  i, a, iTabOrder, iMaxTabOrder, iEnabled, iVisible: Integer;
  pTabOrder, pEnabled, pVisible: PPropInfo;
begin

  iMaxTabOrder := 0;
  a            := -1;

  for i := 0 to Container.ControlCount - 1 do
  begin

    pTabOrder := GetPropInfo( Container.Controls[i].ClassInfo, 'TabOrder');
    pEnabled  := GetPropInfo( Container.Controls[i].ClassInfo, 'Enabled');
    pVisible  := GetPropInfo( Container.Controls[i].ClassInfo, 'Visible');

    if Assigned(pTabOrder) and Assigned(pEnabled) and Assigned(pVisible) then
    begin

      iTabOrder := GetOrdProp( Container.Controls[i], pTabOrder);
      iEnabled  := GetOrdProp( Container.Controls[i], pEnabled);
      iVisible  := GetOrdProp( Container.Controls[i], pvisible);

      if (iEnabled = 1) and (iVisible = 1) and (iTabOrder >= iMaxTabOrder) then
      begin
        iMaxTabOrder := iTabOrder;
        a            := i;
      end;

    end;

  end;

  if (a = -1) then
    Result := NIL
  else
    Result := Container.Controls[a];

end;  // function kGetLastTabOrder;

function kGetFirstTabOrder( Container: TWinControl):TControl;
var
  i, a, iTabOrder, iReadOnly, iMinTabOrder: Integer;
  pTabOrder, pReadOnly: PPropInfo;
begin

  iMinTabOrder := 100;
  a            := -1;

  for i := 0 to Container.ControlCount - 1 do
  begin

    pTabOrder := GetPropInfo( Container.Controls[i].ClassInfo, 'TabOrder');
    pReadOnly := GetPropInfo( Container.Controls[i].ClassInfo, 'ReadOnly');

    if Assigned(pTabOrder) then
    begin
      iTabOrder := GetOrdProp( Container.Controls[i], pTabOrder);
      iReadOnly := 0;
      if Assigned(pReadOnly) then
        iReadOnly := GetOrdProp( Container.Controls[i], pReadOnly);

      if Container.Controls[i].Enabled and Container.Controls[i].Visible and
        (iReadOnly = 0) and (iTabOrder < iMinTabOrder) then
      begin
        iMinTabOrder := iTabOrder;
        a            := i;
      end;
    end;

  end;

  if (a = -1) then
    Result := nil
  else
    Result := Container.Controls[a];

end;  // function kGetFirstTabOrder;

function kWinControlParent( Win, WinParent: TWinControl):Boolean;
begin
  Result := False;
  if Assigned(Win.Parent) then
    if (Win.Parent = WinParent) then
      Result := True
    else
      Result := kWinControlParent( Win.Parent, WinParent);
end;

procedure kWinControlDataSet( Win: TWinControl; DataSet: TDataSet);
var
  i, _Enabled, _Tag, _ReadOnly: Integer;
  bEditando: Boolean;
  _Cor: TColor;
  _DataSource: TObject;
  _Win: TWinControl;
  pColorPropInfo, pEnabledPropInfo, pTagPropInfo,
  pParentColorPropInfo, pDataSourcePropInfo, pReadOnlyPropInfo: PPropInfo;
begin

  if (Win.ComponentCount = 0) then
    Exit;

  bEditando := (DataSet.State in [dsInsert,dsEdit]);
  _Cor      := clWindow;

  if not bEditando then
  begin
    pColorPropInfo := GetPropInfo( Win.ClassInfo, 'Color');
    if Assigned(pColorPropInfo) then
      _Cor := GetOrdProp( Win, 'Color')
    else
      _Cor := $00E0E9EF;
  end;

  for i := 0 to (Win.ComponentCount - 1) do
    if (Win.Components[i] is TWinControl) then
    begin

      if (UpperCase( Win.Components[i].ClassName) = 'TDBCHECKBOX') or
         (UpperCase( Win.Components[i].ClassName) = 'TDBRADIOGROUP') or
         (UpperCase( Win.Components[i].ClassName) = 'TDBCTRLGRID') then
        Continue;

      _Enabled    := 1;
      _Tag        := 0;
      _ReadOnly   := 0;
      _DataSource := NIL;
      _Win        := TWinControl(Win.Components[i]);

      pColorPropInfo       := GetPropInfo( _Win.ClassInfo, 'Color' );
      pEnabledPropInfo     := GetPropInfo( _Win.ClassInfo, 'Enabled');
      pTagPropInfo         := GetPropInfo( _Win.ClassInfo, 'Tag');
      pParentColorPropInfo := GetPropInfo( _Win.ClassInfo, 'ParentColor');
      pDataSourcePropInfo  := GetPropInfo( _Win.ClassInfo, 'DataSource');
      pReadOnlyPropInfo    := GetPropInfo( _Win.ClassInfo, 'ReadOnly');

      if Assigned(pDataSourcePropInfo) then
        _DataSource := GetObjectProp( _Win, pDataSourcePropInfo);

      if Assigned(pTagPropInfo) then
        _Tag := GetOrdProp( _Win, pTagPropInfo);

      if Assigned(pEnabledPropInfo) then
        _Enabled := GetOrdProp( _Win, pEnabledPropInfo);

      if (_Win.ClassName <> 'TVolgaDBEdit') and Assigned(pReadOnlyPropInfo) then
        _ReadOnly := GetOrdProp( _Win, pReadOnlyPropInfo);

      if Assigned(pColorPropInfo) and Assigned(_DataSource) and
         Assigned(TDataSource(_DataSource).DataSet) and
         (TDataSource(_DataSource).DataSet = DataSet) then
      begin
        if (_Tag = 0) and (_ReadOnly = 0) and (_Enabled = 1) then
        begin
          if bEditando then
            SetOrdProp( _Win, 'Color', _Cor)
          else if Assigned(pParentColorPropInfo) then
            SetOrdProp( _Win, 'ParentColor', 1);
        end; // tag = 0
      end;

      kWinControlDataSet( _Win, DataSet);

    end;  // if

end;  // proc kWinControlDataSet

procedure kGetCellParams( Field: TField; AFont: TFont;
  var Background: TColor; Highlight, Focus: Boolean);
begin

  if Field.DataSet.RecNo mod 2 = 0 then
    Background := $00D2DDE1;

  if HighLight then
  begin
    AFont.Color := clBlack;
    if Focus then Background := $0068D9FF
             else Background := $00ABE2FD;
  end;

end;

procedure kTitleBtnClick( Field: TField);
var
  io:TIndexOptions;
  bk: TBookMark;
  i: Integer;
  sIndice: String;
begin

  io      := [];
  bk      := Field.DataSet.GetBookmark;
  sIndice := '';

  if (Field.DataSet is TClientDataSet) then
  begin

    with TClientDataSet(Field.DataSet) do
    begin
      IndexDefs.Update;
      for i := 0 to IndexDefs.Count - 1 do
      begin
        if (IndexDefs.Items[i].Name = Field.FieldName) then
        begin
          if (not (ixDescending in IndexDefs.Items[i].Options) ) then
            io := [ixDescending];
          DeleteIndex( Field.FieldName);
        end
      end;

      if (sIndice = '') then
      begin
        AddIndex( Field.FieldName, Field.FieldName, io);
        sIndice := Field.FieldName;
      end;

      IndexName := sIndice;

      IndexDefs.Update;

    end;  // with

  end;

  Field.DataSet.GotoBookmark(bk);
  Field.DataSet.FreeBookmark(bk);

end;  // kTitleBtnClick

procedure kTitleClick( Sender: TObject; Column: TColumn; Field: TField = NIL);
var
  i: Integer;
begin

  if not (Sender is TDBGrid) then
    Exit;

  // Remove o negrito de todas as colunas do DBGrid
  for i := 0 to TDBGrid(Sender).Columns.Count -1 do
    TDBGrid(Sender).Columns[i].Title.Font.Style := TDBGrid(Sender).Columns[i].Title.Font.Style - [fsBold];

  if Assigned(Field) then
    kTitleBtnClick(Field)
  else if Assigned(Column) and Assigned(Column.Field) then
    kTitleBtnClick(Column.Field);

  // Define o negrito para a coluna ordenada
  Column.Title.Font.Style := Column.Title.Font.Style + [fsBold];

end;

{$IFDEF RX_LIB}
procedure kGetBtnParams( Field: TField;
  AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
  IsDown: Boolean);
var
  i: Integer;
begin
  if (Field.DataSet is TClientDataSet) then
    with TClientDataSet(Field.DataSet) do
      if (IndexName = Field.FieldName) then
        for i := 0 to IndexDefs.Count - 1 do
          if IndexDefs.Items[i].Name = Field.FieldName then
            if (ixDescending in IndexDefs.Items[i].Options) then
              SortMarker := smDown
            else
              SortMarker := smUp;
end;

function kCalculadora:Double;
begin

  Result := 0.00;

  with TRxCalculator.Create(NIL) do
   try
     if Execute then
       Result := Value;
   finally
     Free;
   end;

end;
{$ENDIF}

procedure kDrawColumnCell( Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState; Focused: Boolean = False);
begin

   if ( Column.Field.DataSet.RecNo mod 2 = 0) then
    TDBGrid(Sender).Canvas.Brush.Color := $00D2DDE1;

  if (gdSelected in State) then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.Brush.Color := IfThen( Focused, $0068D9FF, $00ABE2FD);
    if (Focused) then
      TDBGrid(Sender).Canvas.Font.Style := [fsBold];
  end;

  TDBGrid(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, State);
    
end;

procedure kDataSourceToData( Origem: TDataSet; Destino: TDataSource;
  Manter: Boolean = False; Arredondar: Boolean = False);
var
  evStateChange: TNotifyEvent;
begin
  evStateChange := Destino.OnStateChange;
  Destino.onStateChange := NIL;
  try
    kDataSetToData( Origem, Destino.DataSet, Manter, Arredondar);
  finally
    if Assigned(evStateChange) then
    begin
      Destino.OnStateChange := evStateChange;
      evStateChange(Destino);
    end;
  end;
end;  // procedure DataSourceData

procedure kDataSetToData( Origem, Destino: TDataSet;
  Manter: Boolean = False;
  Arredondar: Boolean = False;
  CopyProperty: Boolean = True);
var
  i: Integer; sCampo: String;
  evNewRecord, evBeforePost, evAfterPost,
  evBeforeInsert, evAfterInsert,
  evBeforeEdit, evAfterEdit, evAfterScroll: TDataSetNotifyEvent;
//evCalcFields: TDataSetNotifyEvent;
begin

  // Se o DataSet Destino nao conter campos
  // Adicionar os campos baseados no DataSet Origem

  with Destino do
  begin

    if (Fields.Count = 0) and (FieldDefs.Count = 0) then
    begin
      FieldDefs.BeginUpdate;
      for i := 0 to Origem.Fields.Count - 1 do
        if Origem.Fields[i].DataType = ftBCD then
          FieldDefs.Add( AnsiUpperCase(Origem.Fields[i].FieldName), ftFloat, 0)
        else
          FieldDefs.Add( AnsiUpperCase(Origem.Fields[i].FieldName),
                         Origem.Fields[i].DataType, Origem.Fields[i].Size);
      FieldDefs.EndUpdate;
    end;

    evNewRecord    := OnNewRecord;
    evBeforePost   := BeforePost;
    evAfterPost    := AfterPost;
    evBeforeInsert := BeforeInsert;
    evAfterInsert  := AfterInsert;
    evBeforeEdit   := BeforeEdit;
    evAfterEdit    := AfterEdit;
    evAfterScroll  := AfterScroll;
 // evCalcFields   := OnCalcFields;

    // Se algum evento precisar ser desativado
    // verifique tambem a function dbSQLSelect
    OnNewRecord  := NIL;
    BeforePost   := NIL;
    AfterPost    := NIL;
    BeforeInsert := NIL;
    AfterInsert  := NIL;
    BeforeEdit   := NIL;
    AfterEdit    := NIL;
    AfterScroll  := NIL;
    // OnCalcFields := NIL;

    {$IFNDEF FL_D7}
    DisableControls;
    {$ENDIF}

    try try

      if not Manter then
        Close;

      if not Active then
        if (Destino is TClientDataSet) then
          TClientDataSet(Destino).CreateDataSet
          //Open
        else
          Open;

      Origem.First;

      while not Origem.EOF do
      begin

        Append;

        for i := 0 to (Origem.Fields.Count - 1) do
        begin

          sCampo := Origem.Fields[i].FieldName;

          if Assigned(FindField(sCampo)) then
          begin

            if CopyProperty then {In 02-09-2006 by Allan_Lima}
            begin
//              FieldByName(sCampo).DisplayLabel := Origem.Fields[i].DisplayLabel;
              FieldByName(sCampo).Visible := Origem.Fields[i].Visible;
              FieldByName(sCampo).Tag := Origem.Fields[i].Tag;
            end;

            if (Origem.Fields[i].DataType in [ftString]) then
              FieldByName(sCampo).AsString := Origem.Fields[i].AsString
            else
              FieldByName(sCampo).Value := Origem.Fields[i].Value;

          end;

        end; // for

        Post;
        Origem.Next;

      end;  // while not EOF

    except
      on E:Exception do
        kErro( E, '', 'fkernel/fdb', 'kDataSetToData()');
    end;

    finally
      if Assigned(evNewRecord)    then OnNewRecord  := evNewRecord;
      if Assigned(evBeforePost)   then BeforePost   := evBeforePost;
      if Assigned(evAfterPost)    then AfterPost    := evAfterPost;
      if Assigned(evBeforeInsert) then BeforeInsert := evBeforeInsert;
      if Assigned(evAfterInsert)  then AfterInsert  := evAfterInsert;
      if Assigned(evBeforeEdit)   then BeforeEdit   := evBeforeEdit;
      if Assigned(evAfterEdit)    then AfterEdit    := evAfterEdit;
      if Assigned(evAfterScroll)  then AfterScroll  := evAfterScroll;
      // if Assigned(evCalcFields)   then OnCalcFields := evCalcFields;
      {$IFNDEF FL_D7}
      EnableControls;
      {$ENDIF}
    end;

    First;

  end; // with Destino

end;

function kDataSetPadrao( DataSet: TDataSet; Campo: String;
  Padrao: String = 'PADRAO'):Variant;
var
  bk: TBookMark;
begin

  with DataSet do
  begin
    bk := GetBookmark();
    First;
    Result := FieldByName(Campo).Value;
    while not EOF do
    begin
      if (FieldByName(Padrao).AsInteger = 1) then
      begin
        Result := FieldByName(Campo).Value;
        Break;
      end;
      Next;
    end;
    GotoBookmark(bk);
    FreeBookmark(bk);
  end;
end;  // function kDataSetPadrao

procedure kLabelQtdeTotal( LabelQtde, LabelTotal: TControl;
  DataSet: TDataSet; Campo: String= '';
  const Propriedade: String = 'Caption');
var
  bmk: TBookmark;
  iQtde: Integer;
  cTotal: Currency;
  sQtde, sTotal: String;
  pCaptionPropInfo: PPropInfo;
begin

  iQtde  := 0;
  cTotal := 0;

  with DataSet do
  begin
    DisableControls;
    bmk := GetBookmark;
    if (Campo = '') then Campo := Fields[0].FieldName;
    First;
    while not Eof do
    begin
      iQtde  := iQtde + 1;
      cTotal := cTotal + FieldByName(Campo).AsCurrency;
      Next;
    end;
    GotoBookmark(bmk);
    FreeBookmark(bmk);
    EnableControls;
  end;

  sQtde  := ' Qtde -> '+IntToStr(iQtde);
  sTotal := 'Total -> '+FormatFloat( ',0.00', cTotal)+' ';

  if Assigned( LabelQtde) then
  begin
    pCaptionPropInfo := GetPropInfo( LabelQtde.ClassInfo, Propriedade );
    if Assigned(pCaptionPropInfo) then
      SetStrProp( LabelQtde, pCaptionPropInfo, sQtde);
  end;

  if Assigned(LabelTotal) then
  begin
    pCaptionPropInfo := GetPropInfo( LabelTotal.ClassInfo, Propriedade );
    if Assigned(pCaptionPropInfo) then
      SetStrProp( LabelTotal, pCaptionPropInfo, sTotal);
  end;

end;

//* ***************

//{$IFDEF AK_USER}
procedure kSetAcesso( Value: TAKIBUser);
begin
  akUsuario := Value;
end;
//{$ENDIF}

function kGetAcesso( const MenuName: String):Integer;
begin
//  {$IFDEF AK_USER}
  Result := akUsuario.AcessName(MenuName);
//  {$ELSE}
//  Result := 0;
//  {$ENDIF}
end;

function kGetUser:String;
begin
//  {$IFDEF AK_USER}
  Result := akUsuario.User;
//  {$ELSE}
//  Result := 'SYSDBA';
//  {$ENDIF}
end;

function kGetUserName:String;
begin
  Result := kGetUser;
end;

function kGetGroupName:String;
begin
//  {$IFDEF AK_USER}
  Result := akUsuario.GroupName;
//  {$ELSE}
//  Result := 'ADMINISTRADOR';
//  {$ENDIF}
end;

function kGetUserID:Integer;
begin
//  {$IFDEF AK_USER}
  Result := akUsuario.UserID;
//  {$ELSE}
//  Result := 0;
//  {$ENDIF}
end;

//**********

procedure kControlDataSet( Frm: TForm; DataSet: TDataSet);
var
  bIncluir, bEditar, bExcluir, bEditando, bImprimir: Boolean;
  sNome: String;
  Botao: TComponent;
begin

  if not Assigned(DataSet) then
  begin
    kErro('DataSet n�o definido');
    Exit;
  end;

  sNome := 'MNI'+Copy( Frm.Name, 4, Length(Frm.Name));

  bIncluir  := ( kGetAcesso( sNome+'INCLUIR') = 0 );
  bEditar   := ( kGetAcesso( sNome+'EDITAR') = 0 );
  bExcluir  := ( kGetAcesso( sNome+'EXCLUIR') = 0 );
  bImprimir := ( kGetAcesso( sNome+'IMPRIMIR') = 0 );

  bEditando := (DataSet.State in [dsInsert,dsEdit]);

  Botao := Frm.FindComponent('BTNNOVO');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bIncluir;

  Botao := Frm.FindComponent('BTNEDITAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bEditar;

  Botao := Frm.FindComponent('BTNCANCELAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (bEditando);

  Botao := Frm.FindComponent('BTNGRAVAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (bEditando);

  Botao := Frm.FindComponent('BTNEXCLUIR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bExcluir;

  Botao := Frm.FindComponent('BTNIMPRIMIR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bImprimir;

  Botao := Frm.FindComponent('BTNCONSULTAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando);

  Botao := Frm.FindComponent('NAVEGADOR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando);

  {$IFDEF AK_LABEL}
  Botao := Frm.FindComponent('RXRECORD');
  if Assigned(Botao) and (Botao is TAKStatus) then
  begin
    if bEditando then
      TAKStatus(Botao).Style := kState
    else
      TAKStatus(Botao).Style := kRecordNo;
  end;
  {$ENDIF}

  kWinControlDataSet( Frm, DataSet);

end;  // proc kControlDataSet

function kKeyDown( Frm: TForm; var Key: Word; Shift: TShiftState):Boolean;
var
  Botao: TComponent;
begin

  Botao  := NIL;
  Result := True;

  if (not Assigned(Frm)) or (Key = 0) then
    Exit;

  {$IFDEF RX_LIB}
  if (Key = VK_F12) and (Shift = []) and (Frm.ActiveControl is TRxDBComboEdit) and
     Assigned(TRxDBComboEdit(Frm.ActiveControl).OnButtonClick) then
    TRxDBComboEdit(Frm.ActiveControl).OnButtonClick(Frm.ActiveControl)

  else if (Key = VK_F12) and (Shift = []) and (Frm.ActiveControl is TComboEdit) and
     Assigned(TComboEdit(Frm.ActiveControl).OnButtonClick) then
    TComboEdit(Frm.ActiveControl).OnButtonClick(Frm.ActiveControl)

  else
  {$ENDIF}

  {$IFDEF AK_LIB}
  if (Key = VK_F12) and (Shift = []) and (Frm.ActiveControl is TAKDBEdit) and
     Assigned(TAKDBEdit(Frm.ActiveControl).OnButtonClick) then
    TAKDBEdit(Frm.ActiveControl).OnButtonClick(Frm.ActiveControl)

  else if (Key = VK_F12) and (Shift = []) and (Frm.ActiveControl is TAKEdit) and
     Assigned(TAKEdit(Frm.ActiveControl).OnButtonClick) then
    TAKEdit(Frm.ActiveControl).OnButtonClick(Frm.ActiveControl)

  else
  {$ENDIF}

  if (Key = VK_RETURN) and (Shift = []) then
  begin

    if (Frm.ActiveControl is TDBMemo) then
    begin
      with TDBMemo(Frm.ActiveControl) do
        Result := Assigned(DataSource) and
                  Assigned(DataSource.DataSet) and
                  (not (DataSource.DataSet.State in [dsInsert,dsEdit]));
    end else if (Frm.ActiveControl is TMemo) and TMemo(Frm.ActiveControl).Enabled and
       (not TMemo(Frm.ActiveControl).ReadOnly) then
      Result := False;

    if Result then
    begin
      {$IFDEF VCL}
      Key := 0;
      Frm.Perform( WM_NEXTDLGCTL, 0, 0);
      {$ENDIF}
    end;

  end else if (Key = VK_INSERT) and (Shift = [ssCtrl]) then
    Botao := Frm.FindComponent('BTNNOVO')
  else if (Key = VK_F2) and (Shift = []) then
    Botao := Frm.FindComponent('BTNEDITAR')
  else if (Key = VK_ESCAPE) and (Shift = []) then
    Botao := Frm.FindComponent('BTNCANCELAR')
  else if (Key = VK_F3) and (Shift = []) then
    Botao := Frm.FindComponent('BTNGRAVAR')
  else if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
  begin
    Key   := 0;
    Botao := Frm.FindComponent('BTNEXCLUIR');
  end;

  if Assigned(Botao) and (Botao is TSpeedButton) then
  begin
    Key := 0;
    if Assigned(TSpeedButton(Botao).Parent) and
       TSpeedButton(Botao).Parent.Enabled and
       TSpeedButton(Botao).Parent.Visible and
       TSpeedButton(Botao).Visible and
       TSpeedButton(Botao).Enabled then
      TSpeedButton(Botao).Click;
  end else if Assigned(Botao) and (Botao is TButton) then
  begin
    Key := 0;
    if Assigned(TButton(Botao).Parent) and
       TButton(Botao).Parent.Enabled and
       TButton(Botao).Parent.Visible and
       TButton(Botao).Visible and
       TButton(Botao).Enabled then
      TButton(Botao).Click;
  end;

end;  // proc kKeyDown

procedure kOperationDefault( Self: TForm; DataSet: TDataSet;
  Operacao: String; Descricao: String = 'registro'; Perguntar: Boolean = True);
var
  Wc: TWinControl;
begin

  Wc := Self.ActiveControl;

  Self.ActiveControl := NIL;
  Self.ActiveControl := Wc;

  if (Length(Operacao) > 1) then
    Operacao := Operacao[ Pos('&',Operacao)+1];

  Operacao := UpperCase(Operacao[1]);

  //  A Operacao pode ser: 'O' para Novo, 'E' para Editar, 'C' para cancelar,
  //                       'G' para gravar, 'X' para Excluir, 'D' para detalhar

  if (Operacao = 'X') and (DataSet.RecordCount = 0) then
  begin
    SysUtils.Beep;   // N�o h� registro para excluir
    Exit;
  end;

  if (Operacao = 'O') then
  begin   // Novo Registro

    if not DataSet.Active then
      if (DataSet is TClientDataSet) then
        TClientDataSet(DataSet).CreateDataSet
      else
        DataSet.Open;

    DataSet.Append;

  end else if (Operacao = 'E') then
  begin  // Editar/Modificar Registro

    if not DataSet.Active then
      if DataSet is TClientDataSet then
        TClientDataSet(DataSet).CreateDataSet
      else
        DataSet.Open;

    DataSet.Edit;

  end else if (Operacao = 'G') then
  begin  // Gravar modificacoes

    if not DataSet.Modified then
    begin
      DataSet.Cancel;
      Exit;
    end;

    if Perguntar and (not kConfirme( 'Gravar as altera��es?')) then
      Exit;

    DataSet.Post;

  end else if (Operacao = 'C') then
  begin  // Cancelar modificacoes

    if (DataSet.State in [dsInsert,dsEdit]) then
    begin
      if not Perguntar then
        DataSet.Cancel
      else if (not DataSet.Modified) or kConfirme( 'Cancelar as altera��es?') then
        DataSet.Cancel;
    end;

  end else if (Operacao = 'X') then
  begin  // Excluir Registro

    if (not Perguntar) or kConfirme('Deseja excluir '+Descricao+'?') then
      DataSet.Delete;

  end;

end;  // procedure kOperationDefault

{ Pesquisa - Informacao a ser pesquisada - informado pelo usuario }

function kFormataPesquisa( DataSet: TDataSet; Pesquisa, SelectFrom, Where: String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False):String;
var
  dData: TDateTime;
  sProcura, sWHERE: String;
begin

  Result := '';

  if (Length(SelectFrom) = 0) then
  begin
    kErro('Faltou definir a instru��o SQL (SELECT) para'+#13+
            'efetuar a pesquisa dos dados.');
    Exit;
  end;

  // Efetua a pesquisa baseado no texto informado pelo usuario
  sProcura := kRetira( Pesquisa, '#');

  if (Length(sProcura) = 0) and (not AcceptEmpty) then
    Exit; // Se nao ha nada informado, nao realiza a pesquisa

  if (sProcura = '*') and (not AcceptAll) then
  begin
    kErro('Nesta pesquisa n�o � permitido o uso do caracter "*".'#13+
          'Tente fazer uma nova pesquisa.');
    Exit;
  end;

  if ( (Length(sProcura) = 10) or (Length(sProcura) = 8)) and
     ( (sProcura[3] = '/') and (sProcura[6] = '/')) then
  begin
    // O usuario informou um data
    try
      dData := StrToDate(sProcura);
      sProcura := QuotedStr(FormatDateTime( 'yyyy/mm/dd', dData));
    except
      kErro('A data informada n�o � uma data v�lida');
      Exit;
    end;
  end;

  sWHERE := Where;
  sWHERE := kSubstitui( sWhere, '#DIA', 'EXTRACT( DAY FROM CURRENT_DATE)');
  sWHERE := kSubstitui( sWhere, '#HOJE', 'CURRENT_DATE');
  sWHERE := kSubstitui( sWhere, '#EMPRESA', kGetDeposito('EMPRESA_ID', '1'));
  sWHERE := kSubstitui( sWhere, '#LOJA', kGetDeposito('LOJA_ID', '1'));
  sWHERE := kSubstitui( sWHERE, '#', sProcura);
  sWHERE := kSubstitui( sWHERE, '*', '%');

  Result := SelectFrom + ' WHERE '+sWHERE;

  if Assigned(DataSet) and (DataSet is TClientDataSet) then
  begin

    try
      if not kOpenSQL( DataSet, Result) then
        raise Exception.Create(kGetErrorLastSQL);
    except
      on E:Exception do
        kErro( E, '', 'fkernel.dll', 'kFormataPesquisa()');
    end;

  end;

end;

procedure kEnabledControl( Frm: TForm);
var
  iAutorizacao: Integer;
  DataSet1: TClientDataSet;
  Controle: TComponent;
  SQL: TStringList;
  sName: String;
begin

  if not kExistTable( 'SYS_FORM') then
    Exit;

  DataSet1 := TClientDataSet.Create(NIL);
  SQL      := TStringList.Create;

  try

    sName := Copy( UpperCase(Frm.Name), 1, 15);

    SQL.BeginUpdate;
    SQL.Add('SELECT CONTROLE, VALOR FROM SYS_FORM');
    SQL.Add('WHERE UPPER(FORM) = :FORM AND ATIVO = TRUE');
    SQL.EndUpdate;

    if not kOpenSQL( DataSet1, SQL.Text, [sName]) then
      Exit;

    while not DataSet1.EOF do
    begin

      iAutorizacao := DataSet1.Fields[1].AsInteger;
      Controle     := Frm.FindComponent( DataSet1.Fields[0].AsString);

      if Assigned(Controle) then
        if (Controle is TControl) then
        begin
          if (Controle is TTabSheet) then
            TTabSheet(Controle).TabVisible := (iAutorizacao <> 2)
          else begin
            TControl(Controle).Enabled := (iAutorizacao = 0);
            TControl(Controle).Visible := (iAutorizacao <> 2);
          end;
        end;

      DataSet1.Next;

    end; // while

  finally
    DataSet1.Free;
    SQL.Free;
  end;

end;  // kEnabledControl

// Ler no banco de dados os default dos campo do DataSet
// e inicia-os com esse default - ideal usar no evento onNewRecord()
procedure kDataSetDefault( DataSet: TDataSet; Tabela: String);
var
  tmpDataSet: TClientDataSet;
  SQL: TStringList;
  sCampo, sDefault: String;
  fCampo: TField;
  iPos: Integer;
  Query: TADQuery;
begin

  if (Tabela = '') then
    Exit;

  tmpDataSet := TClientDataSet.Create(NIL);
  SQL := TStringList.Create;
  Query:= TADQuery.Create(nil);
  try
    Query.Connection:= kGetConnection();
    try
      Query.SQL.BeginUpdate;
//      SQL.Add('SELECT');
//      SQL.Add('  R.RDB$FIELD_NAME as R_NAME,');
//      SQL.Add('  R.RDB$DEFAULT_SOURCE as R_DEFAULT,');
//      SQL.Add('  R.RDB$NULL_FLAG as R_NULL,');
//      SQL.Add('  F.RDB$DEFAULT_SOURCE as F_DEFAULT,');
//      SQL.Add('  F.RDB$NULL_FLAG as F_NULL');
//      SQL.Add('FROM');
//      SQL.Add('  RDB$RELATION_FIELDS R,');
//      SQL.Add('  RDB$FIELDS F');
//      SQL.Add('WHERE');
//      SQL.Add('  R.RDB$RELATION_NAME = :TABELA');
//      SQL.Add('  AND F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE');
//      SQL.Add('ORDER BY');
//      SQL.Add('  R.RDB$FIELD_POSITION');
      Query.SQL.Add('SELECT column_name as R_NAME');
      Query.SQL.Add('     , column_default as R_DEFAULT');
      Query.SQL.Add('FROM information_schema.columns');
      Query.SQL.Add('WHERE UPPER(table_name) = UPPER(:TABELA)');
      Query.SQL.Add('order by ordinal_position;');
      Query.SQL.EndUpdate;
      Query.ParamByName('TABELA').AsString:= Tabela;
      Query.Open;
//      kOpenSQL( tmpDataSet, SQL.Text, [Tabela]);

      with Query do
      begin

        First;

        while not EOF do
        begin

          sCampo   := Trim( FieldByName('R_NAME').AsString);
          sDefault := FieldByName('R_DEFAULT').AsString;

//          if (sDefault = '') then
//            sDefault := FieldByName('F_DEFAULT').AsString;

          fCampo := DataSet.FindField(sCampo);

          if Assigned(fCampo) and (sDefault <> '') then
          begin
            iPos := Pos( 'DEFAULT ', sDefault);
            sDefault := Copy( sDefault, iPos+8, Length(sDefault));
            case fCampo.DataType of
              ftString:
                fCampo.AsString := Copy( sDefault, 2, Length(sDefault)-2);
              ftInteger, ftSmallint, ftFloat, ftCurrency, ftBCD:
                if Pos('::regclass', sDefault) = 0 then
//                  fCampo.Value := kMaxCodigo( Tabela, fCampo.FieldName )
//                else
                  fCampo.Value := StrToIntDef(sDefault, 0);
            end;  // case
          end;  // if

          Next;

        end; // while

      end;  //  with DataSet

    except
      on E:Exception do
        kErro( 'Tabela: '+Tabela+#13+'Campo: '+sCampo+#13+
               'Default: '+sDefault+#13+E.Message,
               'fKernel.dll', 'kDataSetDefault()');
    end;  // except
  finally
    FreeAndNil(Query);
    FreeAndNil(SQL);
    tmpDataSet.Free;
  end;  // try

end;

{$IFDEF VCL}
// Carrega uma imagem JPG. Requer Jpeg declarada na clausula uses da unit
function kLoadJPEG( const psFileIN: PChar): TPicture;
var
  imgJPG : TJPEGImage;
  picReturn: TPicture;
begin

  imgJPG := TJPEGImage.Create;
  picReturn := TPicture.Create;

  try
    imgJPG.LoadFromFile(psFileIN);
    picReturn.Bitmap.Assign(imgJPG);
  except
    picReturn.Free;
    picReturn := nil;
  end;

  imgJPG.Free;
  Result := picReturn;

end; // function LoadJPEG
{$ENDIF}

procedure kSexo( Sexo: TClientDataSet);
begin
  with Sexo do
  begin
    FieldDefs.Add('SEXO', ftString, 1);
    FieldDefs.Add('NOME', ftString, 10);
    CreateDataSet;
    AppendRecord( ['', '']);
    AppendRecord( ['F', 'Feminimo']);
    AppendRecord( ['M', 'Masculino']);
  end;
end;

procedure kGrid( Frm: TForm; dsColuna: TDataSet; SelectFrom, SelectNull: String);
var
  i: Integer;
  tmpDataSet: TClientDataSet;
  sName: String;
  Grid: TComponent;
  Coluna: TColumn;
  tmpColuna: TDataSet;
begin

  sName := UpperCase(Frm.Name);
  sName := Copy( sName, 4, Length(sName));

  SelectNull := kSubstitui( SelectNull, '#HOJE',
                            QuotedStr(FormatDateTime( 'yyyy/mm/dd', Date())));

  SelectNull := kSubstitui( SelectNull, '#EMPRESA', kGetDeposito( 'EMPRESA_ID', '1') );
  SelectNull := kSubstitui( SelectNull, '#LOJA', kGetDeposito('LOJA_ID', '1') );
  SelectNull := kSubstitui( SelectNull, '#DIA', IntToStr(Day(Date)));
  SelectNull := kSubstitui( SelectNull, '#MES', IntToStr(Month(Date)));
  SelectNull := kSubstitui( SelectNull, '#ANO', IntToStr(Year(Date)));

  Grid := Frm.FindComponent( 'DBGREGISTRO');

  if Assigned(Grid) and (Grid is TDBGrid) and
     Assigned(TDBGrid(Grid).DataSource) and
     Assigned(TDBGrid(Grid).DataSource.DataSet) and
     (TDBGrid(Grid).DataSource.DataSet.Fields.Count = 0) then
  begin

    // Se o DataSet do Grid nao conter campos
    // Adicionar os campos baseados na pesquisa

    TDBGrid(Grid).DataSource.DataSet.Close;
    tmpDataSet := TClientDataSet.Create(nil);

    try

      if not kOpenSQL( tmpDataSet, SelectFrom + #13#10 + SelectNull) then
        Exit;

      with tmpDataSet do
      begin

        First;

        for i := 0 to (Fields.Count - 1) do
          if (Fields[i].DataType = ftBCD) then
            TDBGrid(Grid).DataSource.DataSet.FieldDefs.Add(
                    Fields[i].FieldName, ftFloat, 0 )
          else
            TDBGrid(Grid).DataSource.DataSet.FieldDefs.Add(
                    Fields[i].FieldName, Fields[i].DataType, Fields[i].Size );

      end;  // with Query

    finally
      tmpDataSet.Free;
    end;  // try

  end;  // if Assigned(

  //*************************************************

  if Assigned(Grid) and (Grid is TDBGrid)
    {and (TDBGrid(Grid).Columns.Count = 1)} then
  begin

    // Se o Grid nao contem Colunas
    // Adicionar as colunas baseados em SYS_DBGRID

    tmpDataSet := TClientDataSet.Create(NIL);

    try

      if kExistTable('SYS_DBGRID') then
      begin

        kOpenSQL( tmpDataSet,
                  'SELECT * FROM SYS_DBGRID'#13+
                  'WHERE'#13+
                  '  (UPPER(DBGRID) = '+QuotedStr(sName)+') AND (ATIVO = 1)'#13+
                  'ORDER BY COLUNA');

        if (tmpDataSet.RecordCount = 0) and Assigned(dsColuna) and (dsColuna.RecordCount > 0) then
          tmpColuna := dsColuna
        else
          tmpColuna := tmpDataSet;

      end else
        tmpColuna := dsColuna;

      with tmpColuna do
      begin

        if (RecordCount > 0) then
        begin

          First;

          TDBGrid(Grid).DataSource.DataSet.Close;

          if (TDBGrid(Grid).DataSource.DataSet is TClientDataSet) then
            TClientDataSet(TDBGrid(Grid).DataSource.DataSet).CreateDataSet
          else
            TDBGrid(Grid).DataSource.DataSet.Open;

          TDBGrid(Grid).Columns.Clear;
            
          while not EOF do
          begin

            Coluna := TDBGrid(Grid).Columns.Add;

            i                     := FieldByName('COLUNA').AsInteger;
            Coluna.Field          := TDBGrid(Grid).DataSource.DataSet.Fields[i];
            Coluna.Title.Caption  := FieldByName('TITULO').AsString;
            Coluna.Width          := FieldByName('TAMANHO').AsInteger;
            Coluna.DropDownRows   := FieldByName('DISPLAY').AsInteger;

            Next;

          end;  // while not eof

        end;

      end;  // with tmpColuna

    finally
      tmpDataSet.Free;
    end;  // try

  end;  // if

end;  // procedure kGrid

procedure kcxGrid( Frm: TForm; dsColuna: TDataSet; SelectFrom, SelectNull: String);
var
  i: Integer;
  tmpDataSet: TClientDataSet;
  sName: String;
  tv: TComponent;
  tmpColuna: TDataSet;
begin

  sName := UpperCase(Frm.Name);
  sName := Copy( sName, 4, Length(sName));

  SelectNull := kSubstitui( SelectNull, '#HOJE',
                            QuotedStr(FormatDateTime( 'yyyy/mm/dd', Date())));

  SelectNull := kSubstitui( SelectNull, '#EMPRESA', kGetDeposito( 'EMPRESA_ID', '1') );
  SelectNull := kSubstitui( SelectNull, '#LOJA', kGetDeposito('LOJA_ID', '1') );
  SelectNull := kSubstitui( SelectNull, '#DIA', IntToStr(Day(Date)));
  SelectNull := kSubstitui( SelectNull, '#MES', IntToStr(Month(Date)));
  SelectNull := kSubstitui( SelectNull, '#ANO', IntToStr(Year(Date)));

  tv := Frm.FindComponent( 'TV');

  if Assigned(tv) and (tv is TcxGridDBTableView) and
     Assigned(TcxGridDBTableView(tv).DataController.DataSource) and
     Assigned(TcxGridDBTableView(tv).DataController.DataSource.DataSet) and
     (TcxGridDBTableView(tv).DataController.DataSource.DataSet.Fields.Count = 0) then
  begin

    // Se o DataSet do Grid nao conter campos
    // Adicionar os campos baseados na pesquisa

    TcxGridDBTableView(tv).DataController.DataSource.DataSet.Close;
    tmpDataSet := TClientDataSet.Create(nil);

    try

      if not kOpenSQL( tmpDataSet, SelectFrom + #13#10 + SelectNull) then
        Exit;

      with tmpDataSet do
      begin

        First;

        for i := 0 to (Fields.Count - 1) do
          if (Fields[i].DataType = ftBCD) then
            TcxGridDBTableView(tv).DataController.DataSource.DataSet.FieldDefs.Add(
                    Fields[i].FieldName, ftFloat, 0 )
          else
            TcxGridDBTableView(tv).DataController.DataSource.DataSet.FieldDefs.Add(
                    Fields[i].FieldName, Fields[i].DataType, Fields[i].Size );

      end;  // with Query

      //TcxGridDBTableView(tv).DataController.CreateAllItems();
    finally
      tmpDataSet.Free;
    end;  // try

  end;  // if Assigned(

  //*************************************************

  if Assigned(tv) and (tv is TcxGridDBTableView)
    {and (TDBGrid(Grid).Columns.Count = 1)} then
  begin

    // Se o Grid nao contem Colunas
    // Adicionar as colunas baseados em SYS_DBGRID

    tmpDataSet := TClientDataSet.Create(NIL);

    try

      if kExistTable('SYS_DBGRID') then
      begin

        kOpenSQL( tmpDataSet,
                  'SELECT * FROM SYS_DBGRID'#13+
                  'WHERE'#13+
                  '  (UPPER(DBGRID) = '+QuotedStr(sName)+') AND (ATIVO = 1)'#13+
                  'ORDER BY COLUNA');

        if (tmpDataSet.RecordCount = 0) and Assigned(dsColuna) and (dsColuna.RecordCount > 0) then
          tmpColuna := dsColuna
        else
          tmpColuna := tmpDataSet;

      end else
        tmpColuna := dsColuna;

      with tmpColuna do
      begin

        if (RecordCount > 0) then
        begin

          First;

          TcxGridDBTableView(tv).DataController.DataSource.DataSet.Close;

          if (TcxGridDBTableView(tv).DataController.DataSource.DataSet is TClientDataSet) then
            TClientDataSet(TcxGridDBTableView(tv).DataController.DataSource.DataSet).CreateDataSet
          else
            TcxGridDBTableView(tv).DataController.DataSource.DataSet.Open;

          TcxGridDBTableView(tv).DataController.GridView.ClearItems;

          while not EOF do
          begin

            //Coluna := TcxGridDBTableView(tv).  ;

            with TcxGridDBTableView(tv).CreateColumn do
            begin
              i                     := FieldByName('COLUNA').AsInteger;
              DataBinding.FieldName := TcxGridDBTableView(tv).DataController.DataSource.DataSet.Fields[i].FieldName;
              Caption               := FieldByName('TITULO').AsString;
              Width                 := FieldByName('TAMANHO').AsInteger;
              HeaderAlignmentHorz   := taCenter;
              //DropDownRows   := FieldByName('DISPLAY').AsInteger;
            end;

            Next;

          end;  // while not eof

        end;

      end;  // with tmpColuna

    finally
      tmpDataSet.Free;
    end;  // try

  end;  // if

end;  // procedure kGrid

procedure kDetalhar( Frm: TForm; Listagem, Dados, SP: TDataSet;
  ProcuraTexto, SelectFrom, SelectWhere:String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False;
  const TableName: String = ''; FieldDS: TFields = NIL);
var
  Notebook, Detalhar: TComponent;
  i: Integer;
  sNomeCampo: String;
  evBeforePost, evAfterPost: TDataSetNotifyEvent;
  pCaptionPropInfo: PPropInfo;
begin

  Notebook := Frm.FindComponent('PageControl1');
  Detalhar := Frm.FindComponent('btnDetalhar');

  if (not Assigned(Notebook)) or (not (Notebook is TPageControl)) then
    Exit;

  with TPageControl(Notebook) do
  begin

   if (ActivePageIndex = 0) then
     ActivePageIndex := 1
   else
     ActivePageIndex := 0;

   if Assigned(Detalhar) then
   begin
    pCaptionPropInfo := GetPropInfo( Detalhar.ClassInfo, 'Caption');
    if Assigned(pCaptionPropInfo) then
      SetPropValue( Detalhar, 'Caption',
                    kIfThenStr( (ActivePageIndex = 0), '&Detalhar...', '&Listar...'));
   end;

   if (ActivePageIndex = 0) then
   begin

     kAtualizaPesquisa( Frm, Listagem, ProcuraTexto, SelectFrom, SelectWhere,
                        AcceptAll, AcceptEmpty);
     Dados.Close;

   end else
   begin

     Dados.Close;

     if (Dados is TClientDataSet) then
       TClientDataSet(Dados).CreateDataSet
     else
       Dados.Open;

     Dados.Append;

     if (Listagem.RecordCount > 0) then
     begin

       for i := 0 to (Listagem.FieldCount - 1) do
       begin
         sNomeCampo := Listagem.Fields[i].FieldName;
         if Assigned(Dados.FindField(sNomeCampo)) then
           Dados.FieldByName(sNomeCampo).Value := Listagem.Fields[i].Value;
       end; // for i

       evBeforePost     := Dados.BeforePost;
       evAfterPost      := Dados.AfterPost;
       Dados.BeforePost := NIL;
       Dados.AfterPost  := NIL;

       try
         Dados.Post;
       finally
         if Assigned(evBeforePost) then Dados.BeforePost := evBeforePost;
         if Assigned(evAfterPost)  then Dados.AfterPost  := evAfterPost;
       end;

       if Assigned(SP) then
         kExecutaProc( Dados, SP, 'C')
       else
       begin
         if Assigned(FieldDS) then
           kSQLSelect( Dados, TableName, FieldDS)
         else
           kSQLSelect( Dados, TableName, Dados.Fields);
       end;

     end;  // if Listagem > 0

   end;

  end;  // with

end; // kDetalhar

{ Preenche dsPesquisa com as informacoes de pesquisa cfe SYS_PESQUISA
  e SelectFrom e SelectNull com a instrucao SQL padrao }

procedure kIniciaPesquisa( Frm: TForm; dsPesquisa: TDataSet;
  var SelectFrom, SelectNull: String);
var
  tmpDataSet: TClientDataSet;
  i: Integer;
  sName: String;
begin

  if not kExistTable('SYS_PESQUISA') then
    Exit;

  tmpDataSet := TClientDataSet.Create(NIL);

  try

    sName := Copy( Frm.Name, 4, Length(Frm.Name) );
    sName := UpperCase(sName);

    kOpenSQL( tmpDataSet,
              'SELECT CHAVE, VALOR FROM SYS_PESQUISA'#13+
              'WHERE LOCAL = '+QuotedStr(sName)+' AND ATIVO = 1');

    with tmpDataSet do
    begin

      if (RecordCount = 0) then
        Exit;

      First;

      dsPesquisa.Close;

      if (dsPesquisa is TClientDataSet) then
        TClientDataSet(dsPesquisa).CreateDataSet
      else
        dsPesquisa.Open;

      while not EOF do
      begin

        if (Fields[0].AsString = 'SELECT') and (SelectFrom = '') then
          SelectFrom := Fields[1].AsString

        else if (Fields[0].AsString = 'SELECT_NULL') and (SelectNull = '') then
          SelectNull := Fields[1].AsString

        else
        begin
          dsPesquisa.Append;
          for i := 0 to Fields.Count - 1 do
            dsPesquisa.Fields[i].Value := Fields[i].Value;
          dsPesquisa.Post;
        end;

        Next;

      end;  // while not EOF

    end;  // with Query

  finally
    tmpDataSet.Free;
  end;

end;  // kIniciaPesquisa

{***********************************************}

{ Pesquisa - Informacao a ser pesquisada - informado pelo usuario }

procedure kProcessaPesquisa( Frm: TForm; Listagem: TDataSet;
  Pesquisa, SelectFrom, Where: String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False;
  const LimpaPesquisa: Boolean = True);
var
  DataSet1: TClientDataSet;
  dData: TDateTime;
  sProcura, sWHERE: String;
  SQL: TStringList;
begin

  // Efetua a pesquisa baseado no texto informado pelo usuario
  sProcura := kRetira( Pesquisa, '#');

  if (Length(sProcura) = 0) and (not AcceptEmpty) then
    Exit; // Se nao ha nada informado, nao realiza a pesquisa

  if (sProcura = '*') and (not AcceptAll) then
  begin
    kErro('Nesta pesquisa n�o � permitido o uso do caracter "*".'#13+
          'Tente fazer uma nova pesquisa.');
    Exit;
  end;

  if ( (Length(sProcura) = 10) or (Length(sProcura) = 8)) and
     ( (sProcura[3] = '/') and (sProcura[6] = '/')) then
  begin
    // O usuario informou um data
    try
      dData := StrToDate(sProcura);
      sProcura := QuotedStr(FormatDateTime( 'yyyy/mm/dd', dData));
    except
      kErro('A data informada n�o � uma data v�lida');
      Exit;
    end;
  end;

  sWHERE := kSubstitui( Where,  '#DIA', IntToStr(Day(Date)));
  sWHERE := kSubstitui( sWhere, '#MES', IntToStr(Month(Date)));
  sWHERE := kSubstitui( sWhere, '#ANO', IntToStr(Year(Date)));
  sWHERE := kSubstitui( sWhere, '#HOJE', 'CURRENT_DATE' );

  sWHERE := kSubstitui( sWhere, '#EMPRESA', kGetDeposito('EMPRESA_ID', '1'));
  sWHERE := kSubstitui( sWhere, '#LOJA', kGetDeposito('LOJA_ID', '1'));
  sWHERE := kSubstitui( sWHERE, '#', sProcura);
  sWHERE := kSubstitui( sWHERE, '*', '%');

  if (Length(SelectFrom) = 0) then
  begin
    kErro('Faltou definir a instru��o SQL (SELECT) para'+#13+
           'efetuar a pesquisa dos dados.');
    Exit;
  end;

  DataSet1 := TClientDataSet.Create(NIL);
  SQL      := TStringList.Create;

  try

    SQL.BeginUpdate;
    SQL.Clear;
    if (Length(sWhere) > 0) and (Copy( sWhere, 1, 6) = 'SELECT') then
      SQL.Add(sWHERE)
    else
    begin
      SQL.Add(SelectFrom);
      if Length(sWHERE) > 0 then
        SQL.Add(sWHERE);
    end;
    SQL.EndUpdate;

    kOpenSQL( DataSet1, SQL.Text);

    if Assigned(Listagem) then
      kDataSetToData( DataSet1, Listagem, not LimpaPesquisa );

  finally
    DataSet1.Free;
    SQL.Free;
  end;  // try

end;

procedure kAtualizaPesquisa( Frm: TForm; Listagem: TDataSet;
  TextoInformado, SelectFrom, SelectWhere: String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False;
  const LimpaPesquisa: Boolean = True);
var
  vKeyValue: Variant;
  bFiltro, bAggregatesActive: Boolean;
begin
  if Listagem.FieldCount = 0 then
    Exit;

  Listagem.DisableControls;

  vKeyValue         := Listagem.Fields[0].AsVariant;
  bFiltro           := Listagem.Filtered;
  bAggregatesActive := False;

  if (Listagem is TClientDataSet) then
  begin
    bAggregatesActive := TClientDataSet(Listagem).AggregatesActive;
    TClientDataSet(Listagem).AggregatesActive := False;
  end;

  Listagem.Filtered := False;

  try
    kProcessaPesquisa( Frm, Listagem,
                       TextoInformado, SelectFrom, SelectWhere,
                       AcceptAll, AcceptEmpty, LimpaPesquisa);
  finally
    Listagem.Filtered := bFiltro;
    Listagem.Locate( Listagem.Fields[0].FieldName, vKeyValue, []);
    Listagem.EnableControls;
    if (Listagem is TClientDataSet) then
      TClientDataSet(Listagem).AggregatesActive := bAggregatesActive;
  end;

end;

// Elimina o MenuItem se possuie somente itens-separador
procedure kFreeMenu( MenuItem: TMenuItem);
var
  bResult: Boolean;
  i: Integer;
begin

  bResult := False;

  for i := 0 to MenuItem.Count - 1 do
    if (MenuItem.Items[i].Caption <> '-') then
    begin
      bResult := True;
      Break;
    end;

  if not bResult then MenuItem.Free;

end;  // procedure kFreeMenu

procedure kProcessarScript( const Directory: String = '';
  const Extension: String = '.txt');
var
  ListFile, ListSQL: TStringList;
  rFile: TSearchRec;
  i, a: Integer;
  sPath: String;
begin

  if (Directory = '') then
    sPath := ExtractFilePath(Application.ExeName)
  else
    sPath := Directory;

  if (sPath[Length(sPath)] <> PathDelim) then
    sPath := sPath + PathDelim;

  ListFile := TStringList.Create;
  ListSQL  := TStringList.Create;

  try try

    a := FindFirst( sPath+'*.script', 0, rFile);

    while (a = 0) do
    begin
      ListFile.Add(sPath+rFile.Name);
      a := FindNext(rFile);
    end;  // while

    FindClose(rFile);

    if (ListFile.Count = 0) then
      kErro('N�o h� arquivos de script (*.script) para selecionar.')
    else
    begin
      for i := 0 to ListFile.Count-1 do
      begin
        ListSQL.LoadFromFile(ListFile[i]);
        if UpperCase(Copy( ListSQL.Text, 1, 6)) = 'SELECT' then
          kExecScript( ListSQL.Text, ChangeFileExt( ListFile[i], Extension))
      end;
      kAviso('Execu��o de Script SQL conclu�da !!!');
    end;

  except
    on E:Exception do
      kErro( E, '', 'kernel/fsuporte', 'kProcessarSQL()');
  end;
  finally
    ListFile.Free;
    ListSQL.Free;
  end;

end;  // kProcessarScript

procedure kProcessarSQL( const Directory: String = '');
var
  ListFile, ListSQL: TStringList;
  rFile: TSearchRec;
  i, a: Integer;
  sPath: String;
begin

  if (Directory = '') then
    sPath := ExtractFilePath(ParamStr(0))
  else
    sPath := Directory;

  if (sPath[Length(sPath)] <> PathDelim) then
    sPath := sPath + PathDelim;

  ListFile := TStringList.Create;
  ListSQL  := TStringList.Create;

  try try

    a := FindFirst(  sPath+'*.sql', 0, rFile);

    while (a = 0) do
    begin
      ListFile.Add(sPath+rFile.Name);
      a := FindNext(rFile);
    end;  // while

    FindClose(rFile);

    if (ListFile.Count > 0) then
    begin

      ListFile.Sort;

      for i := 0 to ListFile.Count-1 do
      begin
        ListSQL.LoadFromFile(ListFile[i]);
        if UpperCase(Copy( ListSQL.Text, 1, 6)) <> 'SELECT' then
        begin
          if not kExecSQL( ListSQL.Text, []) then
            Exit;
          DeleteFile(ListFile[i]);
        end;
      end;

      kAviso( 'Os arquivos SQL foram processados corretamente.');

    end;

  except
    on E:Exception do
      kErro( E, '', 'kernel/fsuporte', 'kProcessarSQL()');
  end;
  finally
    ListFile.Free;
    ListSQL.Free;
  end;

end;

procedure kListFiles( ListFiles: TStringList;
  const Extension: String = '*.*';
  const Directory: String = '');
var
  rFile: TSearchRec;
  a: Integer;
  sPath: String;
begin

  if (Directory = '') then
    sPath := ExtractFilePath(ParamStr(0))
  else
    sPath := Directory;

  if (sPath[Length(sPath)] <> PathDelim) then
    sPath := sPath + PathDelim;

  a := FindFirst( sPath+Extension, 0, rFile);

  try

    while (a = 0) do
    begin
      ListFiles.Add(sPath+rFile.Name);
      a := FindNext(rFile);
    end;  // while

  finally
    FindClose(rFile);
  end;

end;  // kListFiles

function kGetLojaField( const Empresa, Loja: Integer; const FieldName: String;
 var Value: Variant):Boolean;
var
  SQL: TStringList;
begin

  SQL := TStringList.Create;

  try

    SQL.BeginUpdate;
    SQL.Add('SELECT '+FieldName+' FROM LOJA');
    SQL.Add('WHERE IDEMPRESA = '+IntToStr(Empresa));
    SQL.Add(' AND IDLOJA = '+IntToStr(Loja) );
    SQL.EndUpdate;

    Result := kGetFieldSQL( SQL.Text, Value, FieldName);

  finally
    SQL.Free;
  end;

end;

function kGetLojaName( const Empresa, Loja: Integer):String;
var v: Variant;
begin
  if kGetLojaField( Empresa, Loja, 'NOME', v) then
    Result := VarToStr(v) else Result := '';
end;

function kFindMenuCaption( Menu: TMenuItem; ACaption: string): TMenuItem;
var
  i: Integer;
begin

  Result := nil;
  ACaption := StripHotkey(ACaption);

  for i := 0 to Menu.Count - 1 do
    if AnsiSameText(ACaption, StripHotkey(Menu.Items[i].Caption)) then
    begin
      Result := Menu.Items[i];
      System.Break;
    end;

  if not Assigned(Result) then  // O Menu n�o foi encontrado
  begin
    for i := 0 to Menu.Count - 1 do
    begin
      Result := kFindMenuCaption( Menu.Items[i], ACaption);
      if Assigned(Result) then
        System.Break;
    end;
  end;

end;

function kFindMenuName( Menu: TMenuItem; AName: String;
  StartName: Boolean = False): TMenuItem;
var
  i: Integer;
  sName: String;
begin

  Result := nil;

  for i := 0 to Menu.Count - 1 do
  begin

    sName := Menu.Items[i].Name;

    if StartName then
      sName := Copy( sName, 1, Length(AName));

    if AnsiSameText( AName, sName) then
    begin
      Result := Menu.Items[i];
      System.Break;
    end;
    
  end;

  if not Assigned(Result) then  // O Menu n�o foi encontrado
  begin
    for i := 0 to Menu.Count - 1 do
    begin
      Result := kFindMenuName( Menu.Items[i], AName, StartName);
      if Assigned(Result) then
        System.Break;
    end;
  end;

end;  // function kFindMenuName

{$IFDEF VCL}
function kExecCommand( Command: String; ShowCmd: Integer): LongWord;
var
  Programa: array [0..512] of Char;
  CurDir: array [0..255] of Char;
  WorkDir: String;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin

  StrPCopy( Programa, Command);
  GetDir( 0, WorkDir);
  StrPCopy( CurDir, WorkDir);
  FillChar( StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := ShowCmd;

  if CreateProcess( nil, Programa, nil, nil, False, CREATE_NEW_CONSOLE or
               NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then
  begin
    WaitForSingleObject( ProcessInfo.hProcess, Infinite);
    GetExitCodeProcess( ProcessInfo.hProcess, Result);
  end else
    Result := 0;

end;  // function kExecCommand
{$ENDIF}

{$IFDEF VCL}
function kExecFile( const FileName, Parameters: String; ShowCmd: Integer):String;
var
  _Erro: Integer;
begin

  if (Parameters = '') then
    _Erro := ShellExecute( 0, 'open', PChar(FileName), nil, nil, ShowCmd)
  else
    _Erro := ShellExecute( 0, 'open', PChar(FileName), PChar(Parameters), nil, ShowCmd);

  case _Erro of
    ERROR_FILE_NOT_FOUND: Result := 'The specified file was not found.';
    ERROR_PATH_NOT_FOUND: Result := 'The specified path was not found.';
    ERROR_BAD_FORMAT: Result := 'The .EXE file is invalid (non-Win32 .EXE or error in .EXE image).';
    SE_ERR_ACCESSDENIED: Result := 'Windows 95 only: The operating system denied access to the specified file.';
    SE_ERR_ASSOCINCOMPLETE: Result := 'The filename association is incomplete or invalid.';
    SE_ERR_DDEBUSY: Result := 'The DDE transaction could not be completed because other DDE transactions were being processed.';
    SE_ERR_DDEFAIL: Result := 'The DDE transaction failed.';
    SE_ERR_DDETIMEOUT: Result := 'The DDE transaction could not be completed because the request timed out.';
    SE_ERR_DLLNOTFOUND: Result := 'Windows 95 only: The specified dynamic-link library was not found.';
    SE_ERR_NOASSOC: Result := 'There is no application associated with the given filename extension.';
    SE_ERR_OOM: Result := 'Windows 95 only: There was not enough memory to complete the operation.';
    SE_ERR_SHARE: Result := 'A sharing violation occurred.';
  else
    Result := '';
  end;

end;
{$ENDIF}

procedure kDelay(Tempo: Word);
var
x1: Double;
begin
  x1:= now;
  repeat until ((now-x1)*86400) > Tempo;
end;

function kDeleteFiles( FileName: String):Boolean;
var
  rFile: TSearchRec;
  i: Integer;
  _Path: String;
begin

  Result := True;
  _Path  := ExtractFilePath(FileName);

  i := FindFirst( FileName, 0, rFile);

  while (i = 0) do
  begin
    if not DeleteFile( _Path + rFile.Name) then
    begin
      Result := False;
      Break;
    end;
    i := FindNext(rFile);
  end;  // while

  FindClose(rFile);

end;  // function kDeleteFiles

{$IFDEF MSWINDOWS}
function kCopyFiles( FileName, PathDest: String):Boolean;
var
  rFile: TSearchRec;
  i: Integer;
  _Path: String;
begin

  _Path  := ExtractFilePath(FileName);

  if (PathDest = '') then
  begin
    Result := False;
    Exit;
  end;

  Result := True;

  if (PathDest[Length(PathDest)] <> PathDelim) then
    PathDest := PathDest + PathDelim;

  i := FindFirst( FileName, 0, rFile);

  while (i = 0) do
  begin
    if not CopyFile( PChar( _Path + rFile.Name),
                     PChar( PathDest + rFile.Name), False) then
    begin
      Result := False;
      Break;
    end;
    i := FindNext(rFile);
  end;  // while

  FindClose(rFile);

end;  // function kDeleteFiles
{$ENDIF}

function kFirstFile( const FileName: String):String;
var
  rFile: TSearchRec;
begin

  try
    if (FindFirst( FileName, 0, rFile) = 0)
      then Result := ExtractFilePath(FileName) + rFile.Name
      else Result := '';
  finally
    FindClose(rFile);
  end;

end;  // function kFirstFile

// Copia o Menu Origem para o MenuDestino considerando apenas apenas
// os items cuja propriedate Tag seja iqual a 0 (zero)
procedure kMenuCopy( MenuOrigem, MenuDestino: TMenu; Sufixo: String);
var
  i: Integer;
  Item: TMenuItem;

  procedure MenuItemAssign( ItemDestino, ItemOrigem: TMenuItem);
  begin
    {$IFNDEF VER130}    // nao eh Delphi 5.0
    {$IFDEF VCL}
    ItemDestino.AutoCheck   := ItemOrigem.AutoCheck;
    {$ENDIF}
    {$ENDIF}
    ItemDestino.AutoHotkeys := ItemOrigem.AutoHotkeys;
    {$IFDEF VCL}
    ItemDestino.Break       := ItemOrigem.Break;
    ItemDestino.Default     := ItemOrigem.Default;
    {$ENDIF}
    ItemDestino.Caption     := ItemOrigem.Caption;
    ItemDestino.Checked     := ItemOrigem.Checked;
    ItemDestino.Enabled     := ItemOrigem.Enabled;
    ItemDestino.Visible     := ItemOrigem.Visible;
    ItemDestino.RadioItem   := ItemOrigem.RadioItem;
    ItemDestino.Hint     := ItemOrigem.Hint;
    ItemDestino.ShortCut := ItemOrigem.ShortCut;
    if Assigned(ItemOrigem.OnClick) then
      ItemDestino.OnClick := ItemOrigem.OnClick;
  end;

  procedure MenuItemCopy( ItemOrigem, ItemDestino: TMenuItem);
  var
    i: Integer;
    Item: TMenuItem;
  begin

    for i := 0 to ItemOrigem.Count - 1 do
      if (ItemOrigem.Items[i].Tag = 0) then
      begin

        Item := TMenuItem.Create( ItemDestino);
        Item.Name := ItemOrigem.Items[i].Name+Sufixo;
        MenuItemAssign( Item, ItemOrigem.Items[i]);

        ItemDestino.Add(Item);

        MenuItemCopy( ItemOrigem.Items[i], Item);

      end;

  end;  // MenuItemToMenu

begin

  for i := 0 to MenuOrigem.Items.Count - 1 do
    if (MenuOrigem.Items[i].Tag = 0) then
    begin

      Item  := TMenuItem.Create(MenuDestino);
      Item.Name := MenuOrigem.Items[i].Name+Sufixo;
      MenuItemAssign( Item, MenuOrigem.Items[i]);

      MenuDestino.Items.Add(Item);

      MenuItemCopy( MenuOrigem.Items[i], Item );

    end;

end;  // kMenuCopy

procedure kNovaPesquisa( DataSet: TDataSet;
  Titulo, Instrucao: String;
  const AcceptAll: Boolean = True;
  const AcceptEmpty: Boolean = False);
begin

  with DataSet do
  begin

    if (not Active) then
    begin
      if (DataSet is TClientDataSet) then
        TClientDataSet(DataSet).CreateDataSet
      else
        Open;
    end;

    Append;
    Fields[0].AsString  := Titulo;
    Fields[1].AsString  := Instrucao;
    if Fields.Count > 2 then
      Fields[2].AsBoolean := AcceptAll;
    if Fields.Count > 3 then
      Fields[3].AsBoolean := AcceptEmpty;

    Post;

  end;

end;  // proc kNovaPesquisa

function kAddListFiles(List: TStringList; Path: String):Boolean;
var
  rFile: TSearchRec;
  sPath: String;
  iFound: Integer;
begin

  Result := False;

  if (Trim(Path) = '') then
    Exit;

  sPath := ExtractFilePath(Path);
  iFound := FindFirst(Path, 0, rFile);
  Result := (iFound = 0);

  while (iFound = 0) do
  begin
    List.Add(sPath+rFile.Name);
    iFound := FindNext(rFile);
  end;

  FindClose(rFile);

end;  // kAddListFiles()

procedure kListWallPaper( ListWallPaper: TStringList);
var
  sPath, sExeName: String;
begin

  ListWallPaper.Clear;

  sExeName := ExtractFileName(Application.ExeName);
  sPath := ExtractFilePath(Application.ExeName);

  if DirectoryExists(sPath+'wallpaper'+PathDelim) then
    sPath := sPath+'wallpaper'+PathDelim
  else if DirectoryExists(sPath+'papelparede'+PathDelim) then
    sPath := sPath+'papelparede'+PathDelim;

  // Uma(s) imagem(ns) para o dia
  kAddListFiles( ListWallPaper, sPath+'*'+kStrZero( Day(Now), 2)+'.bmp');
  kAddListFiles( ListWallPaper, sPath+'*'+kStrZero( Day(Now), 2)+'.jpg');
  kAddListFiles( ListWallPaper, sPath+'*'+kStrZero( Day(Now), 2)+'.jpeg');

  if (ListWallPaper.Count = 0) then
  begin
    kAddListFiles( ListWallPaper, sPath+ChangeFileExt( sExeName, '.bmp'));
    kAddListFiles( ListWallPaper, sPath+ChangeFileExt( sExeName, '.jpg'));
    kAddListFiles( ListWallPaper, sPath+ChangeFileExt( sExeName, '.jpeg'));
  end;

  if (ListWallPaper.Count = 0) then
  begin
    kAddListFiles( ListWallPaper, sPath+'*.bmp');
    kAddListFiles( ListWallPaper, sPath+'*.jpg');
    kAddListFiles( ListWallPaper, sPath+'*.jpeg');

  end;

end;  // kListWallPaper

{$IFDEF MDI_WALLPAPER}
//procedure kDisplayWallPaper( WallPaper: TMDIWallpaper; ListPaper: TStringList);
//var
//  sPapelParede, sExt: String;
//  iFound: Integer;
//begin
//
//  if not Assigned(WallPaper) or
//     not Assigned(ListPaper) or (ListPaper.Count = 0) then
//    Exit;
//
//  iFound       := Random(ListPaper.Count);
//  sPapelParede := ListPaper.Strings[iFound];
//  sExt         := ExtractFileExt(sPapelParede);
//
//  if FileExists(sPapelParede) then
//    if (sExt = '.jpg') or (sExt = '.jpeg') then
//      WallPaper.Picture := kLoadJPEG(PChar(sPapelParede))
//    else if (sExt = '.bmp') then
//      WallPaper.Picture.LoadFromFile(sPapelParede);
//
//end;
{$ENDIF}

{
function ExportarTabela( Transacao: TIBTransaction;
 const TableName, Where: String):Boolean;
var
  DelimOutput: TIBOutputDelimitedFile;
  _SQL: TIBSQL;
  _Text: String;
begin

  Result := False;

  if not Transacao.InTransaction then
    Transacao.StartTransaction;

  _SQL             := TIBSQL.Create(NIL);
  _SQL.Transaction := Transacao;

  _Text := 'SELECT * FROM '+TableName;
  if Where <> '' then
    _Text := _Text + ' WHERE '+Where;

  _SQL.SQL.Text := _Text;

  DelimOutput := TIBOutputDelimitedFile.Create;
  DelimOutput.ColDelimiter := ';';
  DelimOutput.RowDelimiter := #13;

  try try
    if not Transacao.InTransaction then Transacao.StartTransaction ;
    DelimOutput.Filename := ExtractFilePath(Application.ExeName)+'o_'+TableName+'.sql';
    _SQL.BatchOutput(DelimOutput);
    Result := True;
  except
    on E:Exception do begin
      MsgErro( E.Message,  );
    end;
  end;
  finally
    DelimOutput.Free;
    _SQL.Transaction.Commit;
    _SQL.Free;
  end;

end;

function ImportarTabela( Transacao: TIBTransaction;
 const TableName, Where: String):Boolean;

  function _GetFields(aFields: TStringList; prefix: string): string;
  var i : integer;
  begin
      Result := '' ;
      for i := 0 to aFields.count - 1 do
          Result := result + prefix + aFields[i] + ', ' ;
      Result := Copy( Result , 1, Length(Result) - 2 );
  end;

var
  DelimInput: TIBInputDelimitedFile;
  _SQL: TIBSQL;
  aFields: TStringList;
  _Text: String;
begin

  Result := False;

  if not FileExists('o_'+TableName+'.sql') then begin
    MsgErro( 'O Arquivo "'+'o_'+TableName+'.sql" n�o foi encontrado'+#13+
             'Gere o arquivo requerido e tente novamente',
             'Importa��o de Dados');
    Exit;
  end;

  aFields := TStringList.Create;

  Transacao.DefaultDatabase.GetFieldNames( TableName, aFields );

  _SQL := TIBSQL.Create(Application);
  _SQL.Transaction := Transacao;

  DelimInput := TIBInputDelimitedFile.Create;

  DelimInput.ColDelimiter := ';';
  DelimInput.RowDelimiter := #13;
  DelimInput.Filename     := 'o_'+TableName+'.sql';

  if not Transacao.InTransaction then Transacao.StartTransaction;

  try try

    _Text := 'DELETE FROM '+TableName;
    if Where <> '' then
      _Text := _Text + ' WHERE '+Where;

    _SQL.SQL.Text := _Text;
    _SQL.ExecQuery;

    _SQL.Close;
    _SQL.SQL.Text := 'INSERT INTO '+TableName+' VALUES ('+_GetFields(aFields,':')+')';

    _SQL.BatchInput(DelimInput);

    Result := True;

  except
    on E:Exception do begin
      if _SQL.Transaction.InTransaction then _SQL.Transaction.Rollback;
      MsgErro( E.Message, 'Importa��o de Dados - Tabela "'+TableName+'"');
    end;
  end;

  finally
    if _SQL.Transaction.InTransaction then _SQL.Transaction.Commit;
    _SQL.Free;
    DelimInput.Free;
    aFields.Free;
  end;

end;
}

{ TeeChart Charting Library             }
{ Copyright 1995-2001 by David Berneda. }
{ All Rights Reserved.                  }

function EditColor( AOwner: TComponent; AColor: TColor): TColor;
begin
  with TColorDialog.Create(AOwner) do
  try
    Color := AColor;
    if Execute then AColor := Color;
  finally
    Free;
  end;
  result := AColor;
end;

procedure kBtnControle( Frm: TForm; Operacao: String;
  Listagem, DataSet, SP: TDataSet;
  TableName: String = ''; FieldDS: TFields = NIL);
var
  Controle: TComponent;
  Wc: TWinControl;
  bSucesso: Boolean;
  dsState: TDataSetState;
begin

  Wc := Frm.ActiveControl;

  Frm.ActiveControl := NIL;
  Frm.ActiveControl := Wc;

  if Length(Operacao) > 1 then
    Operacao := Operacao[ Pos('&',Operacao)+1];

  Operacao := UpperCase(Operacao[1]);

  //  A Operacao pode ser: 'O' para Novo, 'E' para Editar, 'C' para cancelar,
  //                       'G' para gravar, 'X' para Excluir, 'D' para detalhar

  if (Operacao = 'X') and (Listagem.RecordCount = 0) then
  begin
    Beep;   // N�o h� registro para excluir
    Exit;
  end;

  // Tenta detalhar o registro conforme botao Detalhar
  Controle := Frm.FindComponent('PageControl1');

  if Assigned(Controle) and (Controle is TPageControl) then
    if TPageControl(Controle).ActivePageIndex = 0 then
    begin
       Controle := Frm.FindComponent('btnDetalhar');
       {$IFDEF RX_LIB}
       if Assigned(Controle) and (Controle is TRxSpeedButton) then
         TRxSpeedButton(Controle).Click;
       {$ENDIF}
       if Assigned(Controle) and (Controle is TSpeedButton) then
         TSpeedButton(Controle).Click;
    end;

  if (Operacao = 'O') then
  begin   // Novo Registro

    if not DataSet.Active then
    begin
      if (DataSet is TClientDataSet) then
        TClientDataSet(DataSet).CreateDataSet
       else
        DataSet.Open;
    end;

    DataSet.Append;

  end else if (Operacao = 'E') then
  begin  // Editar/Modificar Registro

    if not DataSet.Active then
    begin
      if (DataSet is TClientDataSet) then
        TClientDataSet(DataSet).CreateDataSet
      else
        DataSet.Open;
    end;

    DataSet.Edit;

  end else if (Operacao = 'G') then   // Gravar modificacoes
  begin

    if not DataSet.Modified then
    begin
      DataSet.Cancel;
      Exit;
    end;

    if not kConfirme( 'Gravar as altera��es?') then
      Exit;

    if Assigned(SP) then
      kExecutaProc( DataSet, SP, kIfThenStr( DataSet.State = dsInsert, 'I', 'A'))
    else
    begin

      dsState := DataSet.State;
      DataSet.Post;

      if Assigned(FieldDS) then
      begin

        if dsState = dsInsert then
          bSucesso := kSQLInsert( DataSet, TableName, FieldDS)
        else
          bSucesso := kSQLUpdate( DataSet, TableName, FieldDS);

        if bSucesso then
          kSQLSelect( DataSet, TableName, FieldDS);

      end else
      begin

        if (dsState = dsInsert) then
          bSucesso := kSQLInsert( DataSet, TableName, DataSet.Fields)
        else
          bSucesso := kSQLUpdate( DataSet, TableName, DataSet.Fields);

        if bSucesso then
          kSQLSelect( DataSet, TableName, DataSet.Fields);

      end;

      if not bSucesso then
        DataSet.Edit;

    end;

  end else if (Operacao = 'C') then   // Cancelar modificacoes
  begin

    if (not DataSet.Modified) or kConfirme( 'Cancelar as altera��es?') then
      DataSet.Cancel;

  end else if (Operacao = 'X') then   // Excluir Registro
  begin

    if not kConfirme( 'Excluir Registro?') then
      Exit;

    if Assigned(SP) then
      kExecutaProc( DataSet, SP, 'E')
    else
    begin
      if Assigned(FieldDS) then
        bSucesso := kSQLDelete( DataSet, TableName, FieldDS)
      else
        bSucesso := kSQLDelete( DataSet, TableName, DataSet.Fields);
      if bSucesso then
        DataSet.Close;
    end;

  end else if (Operacao = 'D') then   // Detalhar/Mostrar registro
  begin

    if Assigned(SP) then
      kExecutaProc( DataSet, SP, 'C')
    else
    begin
      if Assigned(FieldDS) then
        kSQLSelect( DataSet, TableName, FieldDS)
      else
        kSQLSelect( DataSet, TableName, DataSet.Fields);
    end;

  end;

end;  // kBtnControle

procedure kControlAssigned( WinFrom, WinTo: TWinControl);
begin

  WinTo.Left    := WinFrom.Left;
  WinTo.Top     := WinFrom.Top;
  WinTo.Width   := WinFrom.Width;
  WinTo.Height  := WinFrom.Height;
  WinTo.TabStop := WinFrom.TabStop;
  WinTo.Enabled := WinFrom.Enabled;

  if (WinFrom is TDBEdit) and (WinTo is TDBEdit) then
  begin
    TDBEdit(WinTo).CharCase := TDBEdit(WinFrom).CharCase;
    TDBEdit(WinTo).DataSource := TDBEdit(WinFrom).DataSource;
    TDBEdit(WinTo).ReadOnly := TDBEdit(WinFrom).ReadOnly;
    TDBEdit(WinTo).ParentColor := TDBEdit(WinFrom).ParentColor;
  end;

  if (WinFrom is TCheckBox) and (WinTo is TCheckBox) then
  begin
    TCheckBox(WinTo).Checked := TCheckBox(WinFrom).Checked;
    TCheckBox(WinTo).State   := TCheckBox(WinFrom).State;
  end;

  if (WinFrom is TGroupBox) and (WinTo is TGroupBox) then
  begin
    WinTo.Parent := WinFrom.Parent;
    WinTo.Top    := WinFrom.Top + WinFrom.Height + 5;
  end;

end;

function kMaxWidthColumn( Columns: TDBGridColumns; Rate: Double): Integer;
var i: Integer;
begin
  // Calcular a largura do formulario para conter o Grid
  Result := Round( Rate * (35 + Columns.Count));
  for i := 0 to Columns.Count-1 do
    Inc( Result, Columns[i].Width);

  if Result < 544 then
    Result:= 544;    
end;

function kMaxWidthcxGridColumn( tv: TcxGridTableView; Rate: Double): Integer;
var i: Integer;
begin
  // Calcular a largura do formulario para conter o Grid
  Result := Round( Rate * (35 + tv.ColumnCount));
  for i := 0 to tv.ColumnCount-1 do
    Inc( Result, tv.Columns[i].Width);

  if Result < 544 then
    Result:= 544;
end;

function kGetPropInfo(Instance: TWinControl; PropName: String = 'Text'):String;
var
  pGetPropInfo: PPropInfo;
begin

  pGetPropInfo := GetPropInfo( Instance.ClassInfo, PropName);

  if Assigned(pGetPropInfo) then
    Result := GetStrProp(Instance, PropName)
  else
    Result := '';

end;  // proc kGetPropInfo

function kGetOrdProp(Instance: TObject; PropName: String):Longint;
var
  pGetPropInfo: PPropInfo;
begin

  pGetPropInfo := GetPropInfo(Instance, PropName);

  if Assigned(pGetPropInfo) then
    Result := GetOrdProp(Instance, PropName)
  else
    Result := 0;

end;  // proc kGetPropInfo

function kSetOrdProp(Instance: TObject; PropName: String; Value: Longint):Boolean;
var
  pGetPropInfo: PPropInfo;
begin

  pGetPropInfo := GetPropInfo(Instance, PropName);

  Result := Assigned(pGetPropInfo);

  if Result then
    SetOrdProp(Instance, pGetPropInfo, Value)

end;  // proc kSetOrdProp

{ 07/10/2006 by allan_lima }
function kGetLocalHostAddr: String;
var
  TcpClient1: TTcpClient;
begin

  TcpClient1 := TTcpClient.Create(NIL);

  try try
    Result := TcpClient1.LocalHostAddr;
  except
    Result := '';
  end;
  finally
    TcpClient1.Free;
  end;

end;

{ 07/10/2006 by allan_lima }
function kGetLocalHostName: String;
var
  TcpClient1: TTcpClient;
begin

  TcpClient1 := TTcpClient.Create(NIL);

  try try
    Result := TcpClient1.LocalHostName;
  except
    Result := '';
  end;
  finally
    TcpClient1.Free;
  end;

end;

// Verifica se a maquina local eh o servidor "SERVER"
function kIsHost:Boolean;
var
  sServer: String;
begin

  sServer := LowerCase(kGetOption('server'));

  if (sServer = '') then
    sServer := 'localhost';

  Result := (sServer = 'localhost');

  if (not Result) and (Pos('.',sServer) > 0) then  // sServer eh um IP
    Result := (sServer = kGetLocalHostAddr());

  if not Result then
    Result := ( sServer = LowerCase(kGetLocalHostName()));

end;

function kGetServer:String;
begin

  Result := LowerCase(kGetOption('server'));

  if (Result = EmptyStr) or (Result = 'localhost') then
    Result := '127.0.0.1';

end;


function kSalarioNormal( Salario: Currency; TipoSalario: String;
                         CargaHoraria: Integer):Double;
begin

  if (TipoSalario = '02') then  // Quizenalista
    Result := Salario * 2.0

  else if (TipoSalario = '03') then  // Semanalista
    Result := (Salario / 7.0) * 30.0

  else if (TipoSalario = '04') then // Diarista
    Result := Salario * 30.0

  else if (TipoSalario = '05') then // Horista
    Result := Salario * CargaHoraria

  else
    Result := Salario;

  Result := RoundTo( Result, -2);

end;  // kSalarioNormal

procedure kControlEnabled( Frm: TForm; MenuName: String; DataSet: TDataSet);
var
  bIncluir, bEditar, bExcluir, bEditando, bImprimir: Boolean;
  Botao: TComponent;
begin

  bIncluir  := ( kGetAcesso(MenuName) = 0 );
  bEditar   := ( kGetAcesso(MenuName) = 0 );
  bExcluir  := ( kGetAcesso(MenuName) = 0 );
  bImprimir := ( kGetAcesso(MenuName) = 0 );

  bEditando := (DataSet.State in [dsInsert,dsEdit]);

  Botao := Frm.FindComponent('BTNNOVO');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bIncluir;

  Botao := Frm.FindComponent('BTNEDITAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bEditar;

  Botao := Frm.FindComponent('BTNCANCELAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (bEditando);

  Botao := Frm.FindComponent('BTNGRAVAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (bEditando);

  Botao := Frm.FindComponent('BTNEXCLUIR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bExcluir;

  Botao := Frm.FindComponent('BTNIMPRIMIR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bImprimir;

  Botao := Frm.FindComponent('BTNCONSULTAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando);

  Botao := Frm.FindComponent('NAVEGADOR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando);

  kWinControlDataSet( Frm, DataSet);

end;  // kControlEnable

procedure kControlEnabled2( Frm: TForm; MenuName: String; DataSet: TDataSet);
var
  bIncluir, bEditar, bExcluir, bEditando, bImprimir: Boolean;
  Botao: TComponent;
begin

  bIncluir  := ( kGetAcesso(MenuName+'incluir') = 0 );
  bEditar   := ( kGetAcesso(MenuName+'editar') = 0 );
  bExcluir  := ( kGetAcesso(MenuName+'excluir') = 0 );
  bImprimir := ( kGetAcesso(MenuName+'imprimir') = 0 );

  bEditando := (DataSet.State in [dsInsert,dsEdit]);

  Botao := Frm.FindComponent('BTNNOVO');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bIncluir;

  Botao := Frm.FindComponent('BTNEDITAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bEditar;

  Botao := Frm.FindComponent('BTNCANCELAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (bEditando);

  Botao := Frm.FindComponent('BTNGRAVAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (bEditando);

  Botao := Frm.FindComponent('BTNEXCLUIR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bExcluir;

  Botao := Frm.FindComponent('BTNIMPRIMIR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando) and bImprimir;

  Botao := Frm.FindComponent('BTNCONSULTAR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando);

  Botao := Frm.FindComponent('NAVEGADOR');
  if Assigned(Botao) and (Botao is TControl) then
    TControl(Botao).Enabled := (not bEditando);

  kWinControlDataSet( Frm, DataSet);

end;  // kControlEnable2

procedure kGridTitleClick( Sender: TcxGridTableView; Column: TcxGridColumn; Field: TField = NIL);
var
  i: Integer;
begin
//  if not (Sender is TcxGridTableView) then
//    Exit;

  // Remove o negrito de todas as colunas do DBGrid
  for i := 0 to TcxGridTableView(Sender).ColumnCount -1 do
    TcxGridTableView(Sender).Columns[i].Styles.Header.Font.Style :=
      TcxGridTableView(Sender).Columns[i].Styles.Header.Font.Style - [fsBold];
    //TDBGrid(Sender).Columns[i].Title.Font.Style - [fsBold];

//  if Assigned(Field) then
//    kTitleBtnClick(Field)
//  else if Assigned(Column) and Assigned(Column.Field) then
//    kTitleBtnClick(Column.Field);

  // Define o negrito para a coluna ordenada
  //Column.Title.Font.Style := Column.Title.Font.Style + [fsBold];
  Column.Styles.Header.Font.Style := Column.Styles.Header.Font.Style - [fsBold];
end;

procedure TraduzirDevExpress(Localizer: TcxLocalizer);
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'\Tradu��oDev.ini') then
  begin
    Localizer.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Tradu��oDev.ini');
    Localizer.LanguageIndex := 1;
    Localizer.Active := True;
  end;
end;

procedure CriarColuna(Sender: TcxGridDBTableView; AFieldName, ACaption: string; AWidth: Integer; StyloHeader: TcxStyle);
begin
  with TcxGridDBTableView(Sender).CreateColumn do
  begin
    DataBinding.FieldName := AFieldName;
    Caption := ACaption;
    Width := AWidth;
    HeaderAlignmentHorz:= taCenter;
    Styles.Header:= StyloHeader;
  end;
end;

end.
