{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}
//{$IFNDEF NO_FDB}
unit fdb;
//{$ENDIF}

// Esta diretiva esta sendo usada porque nao consigo criar os
// campos (Field) para o DataSet  atraves de chamadas a Fields.Add()

//{$DEFINE ENABLED_DEFS}
//
//{$IFNDEF NO_FLIVRE}
//  {$I flivre.inc}
//{$ENDIF}

interface

uses
  Classes, SysUtils,
//  {$IFDEF CLX}Qt, QForms, QControls,{$ENDIF}
//  {$IFDEF VCL}Windows, Forms, Controls,{$ENDIF}

//  {$IFDEF ADO}ADODB,{$ENDIF}
//  {$IFDEF DBX}FMTBcd, SqlExpr, DBXpress, SqlConst,{$ENDIF}
//  {$IFDEF IBX}IBDatabase, IBQuery, IBTable, IBSQL, IB, IBStoredProc,{$ENDIF}
//
//  {$IFDEF FL_MIDASLIB}MidasLib,{$ENDIF}
//  {$IFDEF FL_D6}Variants,{$ENDIF}

  MidasLib, Variants, Qt, QForms, QControls,
  Windows, Forms, Controls,
  IniFiles, DB, DBClient, TypInfo,

  //Firedac
  uADStanIntf, uADStanOption, uADStanError, uADGUIxIntf, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, uADCompClient,
  uADDAptManager;

//function kStartConnection( Connection:
//{$IFDEF ADO}TADOConnection{$ENDIF}
//{$IFDEF DBX}TSQLConnection{$ENDIF}
//{$IFDEF IBX}TIBDataBase{$ENDIF}): Boolean;

function kStartConnection( Connection:TADConnection ): Boolean;

function kOpenConnection: Boolean;

procedure kSetConnection(Connection: TCustomConnection);

//function kGetConnection: {$IFDEF ADO}TADOConnection{$ENDIF}
//                         {$IFDEF DBX}TSQLConnection{$ENDIF}
//                         {$IFDEF IBX}TIBDataBase{$ENDIF};

function kGetConnection: TADConnection;

//function kSetParam( Query: {$IFDEF ADO}TADOQuery{$ENDIF}
//                           {$IFDEF BDE}TQuery{$ENDIF}
//                           {$IFDEF DBX}TSQLQuery{$ENDIF}
//                           {$IFDEF IBX}TIBQuery{$ENDIF};
//                    Nome: String; Valor: Variant): Boolean;

function kSetParam(Query: TADQuery; Nome: String; Valor: Variant): Boolean;

// Funções para suporte a transações
function kStartTransaction:Boolean;
function kInTransaction:Boolean;
function kCommitTransaction:Boolean;
function kRollbackTransaction:Boolean;

function kPesquisaKey( CampoSELECT, CampoWHERE, Tabela: String;
  Pesquisa: Variant; var Resultado:Variant):Boolean;

function kMaxCodigo( Tabela, Campo: String; Empresa: Integer = -1;
 Where: String = ''; IniciarTransacao: Boolean = True):Integer; overload;

function kMaxCodigo( Tabela, Campo: String;
 Where: String; IniciarTransacao: Boolean = True):Integer; overload;

function kSQLInsert( DeltaDS: TDataSet; TableName: String; FieldDS: TFields;
  IniciarTransacao: Boolean = True):Boolean;

function kSQLInsertArray( DataSet: TDataSet;
  DataSetName: array of String; DataSetList: array of TDataSet):Boolean;

function kSQLUpdate( DeltaDS: TDataSet; TableName: String; FieldDS: TFields;
  IniciarTransacao: Boolean = True):Boolean;

function kSQLCache( DataSet: TDataSet; TableName: String; Fields: TFields;
  IniciarTransacao: Boolean = True):Boolean;

//{$IFDEF MSWINDOWS}
function kSQLUpdateArray( DataSet: TDataSet;
  DataSetName: array of String; DataSetList: array of TDataSet):Boolean;
//{$ENDIF}

function kSQLDelete( DataSet: TDataSet; TableName: String;
  FieldDS: TFields; IniciarTransacao: Boolean = True):Boolean;

function kSQLDeleteArray( DeltaDS: TDataSet;
  TableNames: array of String; Tables: array of TDataSet):Boolean;

function kSQLSelect( DataSet: TDataSet; TableName: String; FieldDS: TFields;
  IniciarTransacao: Boolean = True):Boolean;

function kSQLSelectArray( DeltaDS: TDataSet;
  TableNames: array of String; Tables: array of TDataSet):Boolean;

function kSQLSelectFrom( DataSet: TDataSet;
  const TableName: String; Empresa: Integer = -1; Where: String=''; Order: String='';
  IniciarTransacao: Boolean = True):Boolean; overload;

function kSQLSelectFrom( DataSet: TDataSet;
  const TableName, Where : String; Order: String='';
  IniciarTransacao: Boolean = True):Boolean; overload;

function kSQLKey( DeltaDS: TDataSet; TableName: String; FieldDS: TFields;
  IniciarTransacao: Boolean = True):Integer;

function kGenerator( GeneratorName: String; Incremento: Integer = 0):Integer;

procedure kSetField( DataSet: TDataSet;
  vType: TFieldType; vFieldName: String;
  vFieldKind: TFieldKind; vProviderFlags: TProviderFlags = [];
  vSize: Integer = 0; vMask: String = '');

function kIsField( const TableName, FieldName: String):Boolean;
function kExistField( const TableName, FieldName: String):Boolean;
function kExistDomain( const DomainName: String):Boolean;

function kExistIndice( const IndiceName: String;
                       const TableName: String = ''):Boolean;

function kExistProcedure( const ProcName: String;
  IniciarTransacao: Boolean = True):Boolean;

function kExistTable( Table: String; const IniciarTransacao: Boolean = True):Boolean;

function kExistGenerator( const GeneratorName: String;
  IniciarTransacao: Boolean = True):Boolean;

function kExistTrigger( const TriggerName: String;
  IniciarTransacao: Boolean = True):Boolean;

procedure kNovaPesquisa( DataSet: TDataSet; Titulo, Instrucao: String;
  const AcceptAll: Boolean = True; const AcceptEmpty: Boolean = False);

procedure kNovaColuna( DataSet: TDataSet; Coluna, Tamanho, Display: Integer;
  Titulo: String; Mascara: String = ''); overload;

procedure kNovaColuna( DataSet: TDataSet; Tamanho, Display: Integer;
  Titulo: String; Mascara: String = ''); overload;

function kApagaFiltroX( Tabela, Usuario:String):Boolean;

function kExecutaProc( DS, SP: TDataSet; Operacao: String):Boolean; overload;
function kExecutaProc( DS: TDataSet; SP, Operacao: String):Boolean; overload;
function kExecutaProc( SP: TDataSet): Boolean; overload;

function kExecScript( const Texto, FileName: String;
  const Head: Boolean = False;
  const Separator: String = ';';
  const IniciarTransacao: Boolean = True):Boolean;

function kExecSQL( const Texto: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Boolean; overload;
function kExecSQL( const Texto: String;
  const IniciarTransacao: Boolean = True):Boolean; overload;

// ----

function kOpenSQL( DataSet: TDataSet; const Command: String;
  const IniciarTransacao: Boolean = True): Boolean; overload;

function kOpenSQL( DataSet: TDataSet; const Command: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Boolean; overload;

function kOpenSQL( DataSet: TDataSet; const Tabela, Where: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Boolean; overload;

function kOpenTable( DataSet: TDataSet; const Tabela: String; const Where: String = '';
  const IniciarTransacao: Boolean = True):Boolean; overload;

// -----

procedure kConectar( Frm: TForm);

// -----

function kCountSQL( const Tabela, Where: String;
  const IniciarTransacao: Boolean = True):Integer; overload;

function kCountSQL( const Tabela, Where: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Integer; overload;

function kCountSQL( const Texto: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Integer; overload;

function kCountSQL( const Texto: String;
  const IniciarTransacao: Boolean = True):Integer; overload;

function kCountRowSQL( const Texto: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Integer;

// -----

function kSQLInsertDataSet( DataSet: TDataSet;
  TableName: String; IniciarTransacao: Boolean = True):Boolean;

// Preencher a lista "List" com os valores do campo "FieldName" de DataSet
procedure kGetFieldValueList( List: TStrings; DataSet: TDataSet;
                              const FieldName: String);

function kGetFieldTable( const TableName, FieldName: String;
  const Empresa: Integer = -1; const Where: String = '';
  const IniciarTransacao: Boolean = True): Variant; overload;

function kGetFieldTable( const TableName, FieldName: String;
  const Where: String = '';
  const IniciarTransacao: Boolean = True): Variant; overload;

/// **********

function kGetFieldSQL( const Texto: String; const ParamList: array of Variant;
  var Value: Variant; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean; overload;

function kGetFieldSQL( const Texto: String;
  var Value: Variant; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean; overload;

function kGetFieldSQL( const Texto: String; const ParamList: Array of Variant;
  var Value: String; FieldName: String = '';
  const IniciarTransacao: Boolean = True): Boolean; overload;

function kGetFieldSQL( const Texto: String;
  var Value: String; FieldName: String = '';
  const IniciarTransacao: Boolean = True): Boolean; overload;

function kGetFieldSQL( const Texto: String; const ParamList: Array of Variant;
  var Value: Integer; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean; overload;

function kGetFieldSQL( const Texto: String;
  var Value: Integer; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean; overload;

function kGetFieldSQL( const Texto: String; const ParamList: Array of Variant;
  var Value: Currency; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean; overload;

function kGetFieldSQL( const Texto: String;
  var Value: Currency; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean; overload;

function kGetFieldSQL( const Texto: String; const ParamList: Array of Variant;
  var Value: TDateTime; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean; overload;

function kGetFieldSQL( const Texto: String;
  var Value: TDateTime; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean; overload;

/// **********

function kSaveDataSetTxt( DataSet: TDataSet; const FileName: String;
 const Head: Boolean = True; const Separator: String = ';'):Boolean;

//{$IFDEF IBX}
function kTrataErro(E:Exception):String;
//{$ENDIF}

function kGetErrorLastSQL: String;
function kSetErrorMessage( View: Boolean):Boolean;

function kGetDateTime: TDateTime;
function kCreateQuery(AOwner: TComponent = nil): TADQuery;
function kGetNextId(Tabela, Campo: string): Integer;

implementation

uses fsuporte, ftext, foption;

const
  C_UNIT = 'fdb.pas';

var
//  {$IFDEF ADO}
//  lConnection: TADOConnection;
//  {$ENDIF}
//  {$IFDEF DBX}
//  lTransaction: TTransactionDesc;
//  lConnection: TSQLConnection;
//  {$ENDIF}
//  {$IFDEF IBX}
//  lConnection: TIBDataBase;
//  {$ENDIF}
  lConnection: TADConnection;

  lErrorLastSQL: String;
  lErrorMessage: Boolean = True;

function kStartConnection( Connection:TADConnection ): Boolean;
var
  lsIni: string;
  lConfiguracao: TIniFile;
  lsServidor: string;
  lsDataBase: string;
  lsUsuario: string;
  lsSenha: string;
  lsDrive: string;
begin
  Result := False;

  lsIni := ChangeFileExt( ParamStr(0), '.ini');

  if not FileExists(lsIni) then
  begin
    kErro('O arquivo de configuração não foi encontrado.');
    Exit;
  end;

  try
    lConfiguracao := TInifile.Create( lsIni );
    try
      lsServidor := lConfiguracao.ReadString('DATA','SERVER','');
      lsDataBase := lConfiguracao.ReadString('DATA','DATABASE','');
      lsUsuario := lConfiguracao.ReadString('DATA','USUARIO','');
      lsSenha := lConfiguracao.ReadString('DATA','SENHA','');
      lsDrive := lConfiguracao.ReadString('DATA','DRIVERID','');

      Connection.Connected := False;
      Connection.Params.Clear;
      Connection.Params.Add('Server='+ lsServidor);
      Connection.Params.Add('Database='+ lsDataBase);
      Connection.Params.Add('User_Name='+ lsUsuario);
      Connection.Params.Add('Password='+ lsSenha);
      Connection.Params.Add('DriverID='+ lsDrive);
      Connection.Params.Add('Client DLL name = C:\Dll_postgres\libpq.dll');
      Connection.Connected := True;
    finally
      FreeandNil(lConfiguracao);
    end; {try}
  except on e:Exception do
    begin
      kErro('Erro: '+ #13 + E.Message);
      Exit;
    end;
  end;
  Result:= True;
end;
//function kStartConnection( Connection:
//{$IFDEF ADO}TADOConnection{$ENDIF}
//{$IFDEF DBX}TSQLConnection{$ENDIF}
//{$IFDEF IBX}TIBDataBase{$ENDIF}): Boolean;
//var
//  i: Integer;
//  Ini: TIniFile;
//  sDatabase, sOption, sValue, sIni, sSection, sDriver: String;
//  KeyList: TStringList;
//  pSQLPropInfo: PPropInfo;
//begin
//
//  sIni := ChangeFileExt( ParamStr(0), '.ini');
//
//  Result := False;
//
//  if not FileExists(sIni) then
//  begin
//    kErro('O arquivo de configuração não foi encontrado.');
//    Exit;
//  end;
//
//  Ini := TIniFile.Create(sIni);
//  KeyList := TStringList.Create;
//
//  try try
//
//
//    // Quando o banco de dados não é informado o sistema
//    // primeiramente supõe que o nome do banco é o mesmo que da aplicacao
//
//    sDatabase := ChangeFileExt(ParamStr(0), '.fdb');  // extensão padrão do firebird
//
//    if not FileExists(sDatabase) then
//      sDatabase := ChangeFileExt(ParamStr(0), '.fb');  // extensão do Firebird
//
//    if not FileExists(sDatabase) then
//      sDatabase := ChangeFileExt(ParamStr(0), '.ib');   // extensão do Interbase
//
//    if not FileExists(sDatabase) then
//      // antiga extensão do Interbase/Firebird, não é mais recomendada
//      sDatabase := ChangeFileExt(ParamStr(0), '.gdb');
//
//    // Se o banco de dados na possuir o mesmo nome da aplicacao o sistema
//    // buscará o primeiro arquivo que combine com as extensões desejadas
//
//    if not FileExists(sDatabase) then
//      sDatabase := kFirstFile(ExtractFilePath(ParamStr(0))+'*.fdb');
//
//    if not FileExists(sDatabase) then
//      sDatabase := kFirstFile(ExtractFilePath(ParamStr(0))+'*.fb');
//
//    if not FileExists(sDatabase) then
//      sDatabase := kFirstFile(ExtractFilePath(ParamStr(0))+'*.ib');
//
//    if not FileExists(sDatabase) then
//      sDatabase := kFirstFile(ExtractFilePath(ParamStr(0))+'*.gdb');
//
//    sSection := 'OPTIONS';
//
//    if not Ini.SectionExists(sSection) then
//      raise Exception.CreateFmt('A seção "%s" não existe no arquivo de configurações.',[sSection]);
//
//    if not Ini.ValueExists(sSection, 'DRIVER') then
//      raise Exception.Create('O valor "DRIVER" não existe no arquivo de configurações.');
//
//    Ini.ReadSection( sSection, KeyList);
//
//    for i := 0 to KeyList.Count-1 do
//      kSetOption( KeyList[i], Ini.ReadString( sSection, KeyList[i], '') );
//
//    sDriver := Ini.ReadString(sSection, 'DRIVER', '');
//
//    sSection := sDriver+'_DRIVER';
//
//    if not Ini.SectionExists(sSection) then
//      raise Exception.CreateFmt('A seção "%s" não existe no arquivo de configurações.', [sSection]);
//
//    Ini.ReadSection( sSection, KeyList);
//
//    for i := 0 to KeyList.Count - 1 do
//    begin
//
//      sOption := KeyList.Strings[i];
//      sValue  := Ini.ReadString(sSection, sOption, '');
//
//      if (Pos( 'database', LowerCase(sOption)) > 0) and (sValue = EmptyStr) then
//      begin
//        if not FileExists(sDatabase) then
//          raise Exception.Create('Falha na conexão local: a base de dados não foi encontrada');
//        sValue := sDatabase;
//      end;
//
//      pSQLPropInfo := GetPropInfo( Connection, sOption);
//
//      if Assigned(pSQLPropInfo) then  // A conexão possui a propriedade?
//      begin
//
//        case PropType(Connection, sOption) of
//         tkString:
//           SetStrProp( Connection, pSQLPropInfo, sValue);
//         tkEnumeration:
//           SetEnumProp( Connection, pSQLPropInfo, sValue);
//         tkLString:
//           SetStrProp( Connection, pSQLPropInfo, sValue);
//         tkInteger:
//           SetOrdProp( Connection, pSQLPropInfo, StrToInt(sValue));
//        end;
//
//      end;
//
//    end;
//
//    sSection := sDriver+'_CONNECTION';
//
//    if not Ini.SectionExists(sSection) then
//      raise Exception.CreateFmt('A seção "%s" não existe no arquivo de configurações.', [sSection]);
//
//    Ini.ReadSectionValues( sSection, KeyList);
//
//    for i := 0 to KeyList.Count-1 do
//    begin
//
//      sOption := KeyList.Names[i];
//      {$IFDEF FL_D7}
//      sValue  := KeyList.ValueFromIndex[i];
//      {$ELSE}
//       sValue  := KeyList.Values[sOption];
//      {$ENDIF}
//
//      if (Pos( 'database', LowerCase(sOption)) > 0) and (sValue = EmptyStr) then
//      begin
//        if not FileExists(sDatabase) then
//          raise Exception.Create('Falha na conexão local: a base de dados não foi encontrada');
//        KeyList.Values[sOption] := sDatabase;
//      end;
//    end;
//
//    Connection.Params.BeginUpdate;
//    Connection.Params.AddStrings(KeyList);
//    Connection.Params.EndUpdate;
//
//    kSetConnection(Connection);
//    Result := True;
//
//  except
//    on E:Exception do
//      kErro(E.Message);
//  end;
//  finally
//    KeyList.Free;
//    Ini.Free;
//  end;
//
//end;  // function kStartConnection

function kOpenConnection: Boolean;
begin

  Result := True;

//  try
//    {$IFDEF ADO}lConnection.Open;{$ENDIF}
//    {$IFDEF DBX}lConnection.Open;{$ENDIF}
//    {$IFDEF IBX}lConnection.Open;{$ENDIF}
//  except
//    on E:Exception do
//    begin
//      kErro(E.Message);
//      Result := False;
//    end;
//  end;

end;

procedure kSetConnection( Connection: TCustomConnection);
begin
  lConnection := (Connection as TADConnection);
// lConnection := {$IFDEF ADO}(Connection as TADOConnection){$ENDIF}
//                {$IFDEF DBX}(Connection as TSQLConnection){$ENDIF}
//                {$IFDEF IBX}(Connection as TIBDataBase){$ENDIF};
end;

//function kGetConnection: {$IFDEF ADO}TADOConnection{$ENDIF}
//                         {$IFDEF DBX}TSQLConnection{$ENDIF}
//                         {$IFDEF IBX}TIBDataBase{$ENDIF};
function kGetConnection: TADConnection;
begin
  Result := lConnection;
end;

//function kSetParam( Query: {$IFDEF ADO}TADOQuery{$ENDIF}
//                           {$IFDEF DBX}TSQLQuery{$ENDIF}
//                           {$IFDEF IBX}TIBQuery{$ENDIF};
//                    Nome: String; Valor: Variant): Boolean;
function kSetParam( Query: TADQuery; Nome: String; Valor: Variant): Boolean;
begin
  Result := False;
  if (Query.Params.FindParam(Nome) <> NIL) then
  begin
    Query.ParamByName(Nome).Value := Valor;
    Result := True;
  end
end;  // function kSetParam

{ Inicia uma transação para controle das operações no DB }
function kStartTransaction:Boolean;
//{$IFDEF DBX}
//var
//  STransIsolationKey: string;
//  ILevel: TTransIsolationLevel;
//{$ENDIF}
begin

  try
//    {$IFDEF ADO}lConnection.BeginTrans;{$ENDIF}
//    {$IFDEF DBX}
//    ILevel := xilReadCommitted;
//    STransIsolationKey := Format(TRANSISOLATION_KEY, [lConnection.DriverName]);
//    if lConnection.Params.Values[STransIsolationKey] <> '' then
//    begin
//      if LowerCase(lConnection.Params.Values[STransIsolationKey]) = SRepeatRead then
//        ILevel := xilRepeatableRead
//      else if LowerCase(lConnection.Params.Values[STransIsolationKey]) = SDirtyRead then
//        ILevel := xilDirtyRead
//      else
//        ILevel := xilReadCommitted;
//    end;
//
//    FillChar(lTransaction, Sizeof(lTransaction), 0);
//    lTransaction.TransactionID := 1;
//    lTransaction.IsolationLevel := ILevel;
//    lConnection.StartTransaction(lTransaction);
//    {$ENDIF}
//    {$IFDEF IBX}lConnection.StartTransaction;{$ENDIF}
    lConnection.StartTransaction;
    Result := lConnection.InTransaction;
  except
    Result := False;
  end;

end;

{ Verifica se há uma transação ativa para o DB }
function kInTransaction:Boolean;
begin

  try
    Result := lConnection.InTransaction;
//    {$IFDEF ADO}Result := lConnection.InTransaction;{$ENDIF}
//    {$IFDEF DBX}Result := lConnection.InTransaction;{$ENDIF}
//    {$IFDEF IBX}Result := lConnection.DefaultTransaction.InTransaction;{$ENDIF}
  except
    Result := False;
  end;

end;

function kCommitTransaction:Boolean;
begin

  try
//    {$IFDEF ADO}lConnection.CommitTrans;{$ENDIF}
//    {$IFDEF DBX}lConnection.Commit(lTransaction);{$ENDIF}
//    {$IFDEF IBX}lConnection.DefaultTransaction.Commit;{$ENDIF}
    lConnection.Commit;
    Result := True;
  except
    Result := False;
  end;

end;

function kRollbackTransaction:Boolean;
begin

  try
//    {$IFDEF ADO}lConnection.RollbackTrans;{$ENDIF}
//    {$IFDEF DBX}lConnection.Rollback(lTransaction);{$ENDIF}
//    {$IFDEF IBX}lConnection.DefaultTransaction.Rollback;{$ENDIF}
    lConnection.Rollback;
    Result := True;
  except
    Result := False;
  end;

end;

function kPesquisaKey( CampoSELECT, CampoWHERE, Tabela: String;
  Pesquisa: Variant; var Resultado:Variant): Boolean ;
var
  SQL: TStringList;
  sWhere: String;
begin

  Resultado := NULL;

  Result := False;
  sWhere := '';

  if VarIsNull(Pesquisa) or VarIsEmpty(Pesquisa) then
    Exit;

  case VarType(Pesquisa) of
    varSmallint, varInteger, varSingle, varDouble, varCurrency, varByte:
       sWhere := VarToStr(Pesquisa);
    varString:
       sWhere := QuotedStr(VarToStr(Pesquisa)) ;
  end;

  if (Length(sWhere) = 0) then
    Exit;

  SQL := TStringList.Create;

  try

    SQL.BeginUpdate;
    SQL.Add('SELECT '+CampoSELECT+' FROM '+Tabela) ;
    SQL.Add('WHERE  '+CampoWHERE+' = '+sWhere);
    SQL.EndUpdate;

    Result := kGetFieldSQL( SQL.Text, Resultado);

  finally
    SQL.Free;
  end;

end;  // function kPesquisaKey

{ Incrementa em 1 o maior número do codigo informado }
function kMaxCodigo( Tabela, Campo: String; Empresa: Integer = -1;
 Where: String = ''; IniciarTransacao: Boolean = True):Integer;
var
  SQL: TStringList;
  pvDataSet: TClientDataSet;
begin

  SQL := TStringList.Create;
  pvDataSet := TClientDataSet.Create(NIL);

  try

    SQL.BeginUpdate;
    SQL.Add('SELECT MAX('+Campo+') FROM '+Tabela);
    if (Empresa > -1) then
    begin
      SQL.Add('WHERE IDEMPRESA = '+IntToStr(Empresa));
      if Where <> '' then
        SQL.Add('AND '+Where);
    end else if Where <> '' then
      SQL.Add('WHERE '+Where);
    SQL.EndUpdate;

    Result := 0;

    if kOpenSQL( pvDataSet, SQL.Text, IniciarTransacao) then
      Result := pvDataSet.Fields[0].AsInteger+1;

  finally
    SQL.Free;
    pvDataSet.Free;
  end;

end;  // function kMaxCodigo

function kMaxCodigo( Tabela, Campo: String;
 Where: String; IniciarTransacao: Boolean = True):Integer;
begin
  Result := kMaxCodigo( Tabela, Campo, -1, Where, IniciarTransacao);
end;

function kSQLInsert( DeltaDS: TDataSet; TableName: String; FieldDS: TFields;
  IniciarTransacao: Boolean = True):Boolean;
var
  i:Integer;
  FieldName, sError, sInsert, sValues, sUpdate, sWhere: String;
  pFlags: TProviderFlags;
//  Query: {$IFDEF ADO}TADOQuery{$ENDIF}
//         {$IFDEF DBX}TSQLQuery{$ENDIF}
//         {$IFDEF IBX}TIBQuery{$ENDIF};
  Query: TADQuery;
  tpField: TField;
begin

  sInsert := '';
  sValues := '';
  sUpdate := '';
  sWhere  := '';
  Result  := True;

  for i := 0 to (FieldDS.Count - 1) do
  begin

    tpField := FieldDS[i];

    FieldName := tpField.FieldName;
    pFlags    := tpField.ProviderFlags;

    if (not (pfHidden in pFlags)) and
       ((pfInKey in pFlags) or (pfInUpdate in pFlags)) and
       Assigned(DeltaDS.FindField(FieldName)) and
       (DeltaDS.FieldByName(FieldName).FieldKind = fkData) then
    begin

      if (Length(sInsert) > 0) then
        sInsert := sInsert + ', ';

      sInsert := sInsert + FieldName;

      if (Length(sValues) > 0) then
        sValues := sValues + ', ';

      sValues := sValues +  ':' + FieldName;

    end;  // if

  end;  // for i

  if IniciarTransacao and not kInTransaction() then
    kStartTransaction();

//  {$IFDEF ADO}Query := TADOQuery.Create(NIL);{$ENDIF}
//  {$IFDEF IBX}Query := TIBQuery.Create(nil);{$ENDIF}
//  {$IFDEF DBX}Query := TSQLQuery.Create(nil);{$ENDIF}
  Query:= TADQuery.Create(nil);

  try
  try

    with Query do
    begin

//      {$IFDEF ADO}Connection := kGetConnection;{$ENDIF}
//      {$IFDEF DBX}SQLConnection := kGetConnection;{$ENDIF}
//      {$IFDEF IBX}Transaction := kGetConnection.DefaultTransaction;{$ENDIF}
      Connection:= kGetConnection;

      SQL.BeginUpdate;
      SQL.Add( 'INSERT INTO '+TableName);
      SQL.Add( '('+sInsert+')');
      SQL.Add( 'VALUES ('+sValues+')');
      SQL.EndUpdate;

      for i := 0 to (FieldDS.Count - 1) do
      begin

        FieldName := FieldDS[i].FieldName;

        if Assigned(Params.FindParam(FieldName)) then
        begin
          if DeltaDS.FieldByName(FieldName).DataType = ftInteger then
            ParamByName(FieldName).AsInteger := DeltaDS.FieldByName(FieldName).AsInteger
//          {$IFDEF FL_D6}
          else if DeltaDS.FieldByName(FieldName).DataType = ftTimeStamp then
            ParamByName(FieldName).AsDateTime := DeltaDS.FieldByName(FieldName).AsDateTime
//          {$ENDIF}
          else if DeltaDS.FieldByName(FieldName).DataType = ftString then
            ParamByName(FieldName).AsString := DeltaDS.FieldByName(FieldName).AsString
          else
            ParamByName(FieldName).Value := DeltaDS.FieldByName(FieldName).Value;
        end;

      end;  // for i

      ExecSQL;

    end;  // with Query do

  except
    on E:Exception do
    begin

      sError := 'Instrução SQL'+#13#13+Query.SQL.Text;

//      {$IFDEF DEBUG}
//      sError := #13#13+sError+#13+'Parametros'+#13;
//      for i := 0 to Query.Params.Count-1 do
//        sError := sError+' '+
//                  Query.Params[i].Name + ' = ' + Query.Params[i].AsString;
//      {$ENDIF}

      if IniciarTransacao then
      begin
        if kInTransaction() then
          kRollbackTransaction();
        if lErrorMessage then
          kErro( E, sError, C_UNIT, 'kSQLInsert()');
      end;

      lErrorLastSQL := E.Message+#13#13+sError;

      Result := False;

    end;
  end;
  finally
    Query.Free;
    if IniciarTransacao and kInTransaction() then
      kCommitTransaction();
  end;

end;  // function kSQLInsert

function kSQLInsertArray( DataSet: TDataSet;
  DataSetName: array of String; DataSetList: array of TDataSet):Boolean;
var
  i: Integer;
  bSucesso: Boolean;
begin

  bSucesso := False;

  if not kInTransaction() then
    kStartTransaction();

  try try

    for i := High(DataSetName) downto Low(DataSetName) do
    begin
      bSucesso := kSQLInsert( DataSet, DataSetName[i], DataSetList[i].Fields, False);
      if not bSucesso then
        raise Exception.Create(lErrorLastSQL);
    end;

  except
    on E:Exception do
    begin
      if kInTransaction() then
        kRollbackTransaction();
      kErro( E.Message, C_UNIT, 'kSQLInsertArray()')
    end;
  end;  // except
  finally
    if kInTransaction() then
      kCommitTransaction();
  end;  // finally

  Result := bSucesso;

end;  // function kSQLInsertArray

function kSQLUpdate( DeltaDS: TDataSet;
  TableName: String; FieldDS: TFields;
  IniciarTransacao: Boolean = True):Boolean;
var
  i:Integer;
  FieldName, sUpdate, sWhere: String;
  pFlags: TProviderFlags;
//  {$IFDEF ADO}Query: TADOQuery;{$ENDIF}
//  {$IFDEF IBX}Query: TIBQuery;{$ENDIF}
//  {$IFDEF DBX}Query: TSQLQuery;{$ENDIF}
  Query: TADQuery;
begin

  sUpdate := '';
  sWhere  := '';
  Result  := True;

  for i := 0 to (FieldDS.Count - 1) do
  begin

    FieldName := FieldDS[i].FieldName;
    pFlags    := FieldDS[i].ProviderFlags;

    if ( not (pfHidden in pFlags) ) and
       Assigned(DeltaDS.FindField(FieldName)) and
       (DeltaDS.FieldByName(FieldName).FieldKind = fkData) then
    begin

      if (pfInKey in pFlags) then
      begin

        if Length(sWhere) > 0 then
          sWhere := sWhere + ' and ';

        sWhere := sWhere + '('+FieldName+' = :'+FieldName+')';

      end else if (pfInUpdate in pFlags) then
      begin

        if Length(sUpdate) > 0 then
          sUpdate := sUpdate + ', ';

        if DeltaDS.FindField(FieldName).IsNull then
          sUpdate := sUpdate + FieldName + ' = NULL'
        else
          sUpdate := sUpdate + FieldName + ' = :'+FieldName;

      end;

    end;  // if

  end;  // for i

  if IniciarTransacao and (not kInTransaction()) then
    kStartTransaction();

//  {$IFDEF ADO}
//  Query := TADOQuery.Create(NIL);
//  {$ENDIF}
//  {$IFDEF DBX}
//  Query := TSQLQuery.Create(nil);
//  {$ENDIF}
//  {$IFDEF IBX}
//  Query := TIBQuery.Create(nil);
//  {$ENDIF}
  Query:= TADQuery.Create(nil);
  try
  try

    with Query do
    begin

//      {$IFDEF ADO}Connection := lConnection{$ENDIF}
//      {$IFDEF DBX}SQLConnection := lConnection{$ENDIF}
//      {$IFDEF IBX}Transaction := lConnection.DefaultTransaction{$ENDIF};
      Connection:= kGetConnection;

      SQL.BeginUpdate;
      SQL.Add('UPDATE '+TableName);
      SQL.Add('SET '+sUpdate);
      SQL.Add('WHERE '+sWhere);
      SQL.EndUpdate;

      for i := 0 to (FieldDS.Count - 1) do
      begin
        FieldName := FieldDS[i].FieldName;
        if Assigned(Params.FindParam(FieldName)) then
          ParamByName(FieldName).Value := DeltaDS.FieldByName(FieldName).Value;
      end;  // for i

      ExecSQL;

    end;  // with Query do

  except
    on E:Exception do
    begin
      lErrorLastSQL := E.Message;
      if IniciarTransacao then
      begin
        if kInTransaction() then
          kRollbackTransaction();
        kErro( E, '*Instrução SQL*'+#13+Query.SQL.Text, C_UNIT, 'kSQLUpdate()');
      end;
      Result := False;
    end;
  end;
  finally
    Query.Free;
    if IniciarTransacao and kInTransaction() then
      kCommitTransaction();
  end;

end;  // function kSQLUpdate

function kSQLCache( DataSet: TDataSet; TableName: String; Fields: TFields;
  IniciarTransacao: Boolean = True):Boolean;
begin
  if (DataSet.State = dsInsert) then
    Result := kSQLInsert( DataSet, TableName, Fields, IniciarTransacao)
  else
    Result := kSQLUpdate( DataSet, TableName, Fields, IniciarTransacao);
end;

//{$IFDEF MSWINDOWS}
function kSQLUpdateArray( DataSet: TDataSet;
  DataSetName: array of String; DataSetList: array of TDataSet):Boolean;
var
  i: Integer;
  bSucesso: Boolean;
begin

  bSucesso := False;

  if not kInTransaction() then
    kStartTransaction();

  try try
    for i := Low(DataSetName) to High(DataSetName) do
    begin
      bSucesso := kSQLUpdate( DataSet, DataSetName[i], DataSetList[i].Fields, False);
      if not bSucesso then
        raise Exception.Create(lErrorLastSQL);
    end;
  except
    on E:Exception do
    begin
      if kInTransaction() then
        kRollbackTransaction();
      kErro( E.Message, C_UNIT, 'kSQLUpdateArray()');
    end;
  end;  // except
  finally
    if kInTransaction() then
       kCommitTransaction();
  end;  // finally

  Result := bSucesso;

end;  // function kSQLUpdateArray
//{$ENDIF}

function kSQLDelete( DataSet: TDataSet; TableName: String;
  FieldDS: TFields; IniciarTransacao: Boolean = True):Boolean;
var
  i:Integer;
  FieldName, sWhere: String;
  pFlags: TProviderFlags;
//  {$IFDEF ADO}Query: TADOQuery;{$ENDIF}
//  {$IFDEF IBX}Query: TIBQuery;{$ENDIF}
//  {$IFDEF DBX}Query: TSQLQuery;{$ENDIF}
  Query: TADQuery;
begin

  sWhere := '';
  Result := True;

  { TProviderFlag = (pfInUpdate, pfInWhere, pfInKey, pfHidden);
    TProviderFlags = set of TProviderFlag; }

  for i := 0 to (FieldDS.Count - 1) do
  begin

    FieldName := FieldDS[i].FieldName;
    pFlags    := FieldDS[i].ProviderFlags;

    if (pfInKey in pFlags) and Assigned(DataSet.FindField(FieldName)) and
       (DataSet.FieldByName(FieldName).FieldKind = fkData) then
    begin
      if (Length(sWhere) > 0) then
        sWhere := sWhere + ' and ';
      sWhere := sWhere + FieldName+' = :'+FieldName;
    end;  // if

  end;  // for i

  if IniciarTransacao then
  begin
    if not kInTransaction() then
      kStartTransaction();
  end;

//  {$IFDEF ADO}Query := TADOQuery.Create(NIL);{$ENDIF}
//  {$IFDEF IBX}Query := TIBQuery.Create(nil);{$ENDIF}
//  {$IFDEF DBX}Query := TSQLQuery.Create(nil);{$ENDIF}
  Query:= TADQuery.Create(nil);

  try
  try
    with Query do
    begin

//      {$IFDEF ADO}Connection := lConnection{$ENDIF}
//      {$IFDEF DBX}SQLConnection := lConnection{$ENDIF}
//      {$IFDEF IBX}Transaction := lConnection.DefaultTransaction{$ENDIF};
      Connection:= kGetConnection();
      SQL.BeginUpdate;
      SQL.Add( 'DELETE FROM '+TableName);
      SQL.Add( 'WHERE '+sWhere);
      SQL.EndUpdate;

      for i := 0 to (FieldDS.Count - 1) do
      begin
        FieldName := FieldDS[i].FieldName;
        if Assigned(Params.FindParam( FieldName)) then
          ParamByName(FieldName).Value := DataSet.FieldByName(FieldName).Value;
      end;  // for i

      ExecSQL;

    end;  // with Query do

  except
    on E:Exception do
    begin
      lErrorLastSQL := E.Message;
      if IniciarTransacao then
      begin
        if kInTransaction() then
          kRollbackTransaction();
        kErro( E, '* Instrução SQL *'+ #13#10 + Query.SQL.Text, C_UNIT, 'kSQLDelete()');
      end;
      Result := False;
    end;
  end;

  finally
    Query.Free;
    if IniciarTransacao then
    begin
      if kInTransaction() then
        kCommitTransaction();
    end;
  end;

end;  // function kSQLDelete

function kSQLDeleteArray( DeltaDS: TDataSet;
  TableNames: array of String; Tables: array of TDataSet):Boolean;
var
  i: Integer;
  bSucesso: Boolean;
begin

  bSucesso := False;

  if not kInTransaction() then
    kStartTransaction();

  try try
    for i := Low(TableNames) to High(TableNames) do
    begin
      bSucesso := kSQLDelete( DeltaDS, TableNames[i], Tables[i].Fields, False);
      if not bSucesso then
        raise Exception.Create(lErrorLastSQL);
    end;
  except
    on E:Exception do
    begin
      lErrorLastSQL := E.Message;
      if kInTransaction() then
        kRollbackTransaction();
      kErro( E, E.Message, C_UNIT, 'kSQLDeleteArray()');
    end;
  end;  // except
  finally
    if kInTransaction() then
      kCommitTransaction();
  end;  // finally

  Result := bSucesso;

end;  // function kSQLUpdateArray

function kSQLSelect( DataSet: TDataSet; TableName: String; FieldDS: TFields;
  IniciarTransacao: Boolean = True):Boolean;
var
  i:Integer;
  FieldName, sSelect, sWhere: String;
  evNewRecord,
  evBeforeInsert, evAfterInsert,
  evBeforeEdit,   evAfterEdit,
  evBeforePost,   evAfterPost: TDataSetNotifyEvent;
  pFlags: TProviderFlags;
//  {$IFDEF ADO}Query: TADOQuery;{$ENDIF}
//  {$IFDEF IBX}Query: TIBQuery;{$ENDIF}
//  {$IFDEF DBX}Query: TSQLQuery;{$ENDIF}
  Query: TADQuery;
begin

  sSelect := '';
  sWhere  := '';
  Result  := True;

  { TProviderFlag = (pfInUpdate, pfInWhere, pfInKey, pfHidden);
    TProviderFlags = set of TProviderFlag; }

  for i := 0 to (FieldDS.Count - 1) do
  begin

    FieldName := FieldDS[i].FieldName;
    pFlags    := FieldDS[i].ProviderFlags;

    if (not (pfHidden in pFlags)) and
       Assigned(DataSet.FindField(FieldName)) and
       (DataSet.FieldByName(FieldName).FieldKind = fkData) then
    begin

      if (pfInKey in pFlags) then
      begin

        if (Length(sWhere) > 0) then
          sWhere := sWhere + ' and ';

        sWhere := sWhere + FieldName +' = :_' + FieldName;

      end else {if (pfInUpdate in pFlags) then}
      begin

        if (Length(sSelect) > 0) then
          sSelect := sSelect + ', ';

        sSelect := sSelect + FieldName;

      end;

    end;  // if then

  end;  // for i := 0 to do

  if IniciarTransacao then
  begin
    if not kInTransaction() then
      kStartTransaction();
  end;

//  {$IFDEF ADO}Query := TADOQuery.Create(NIL);{$ENDIF}
//  {$IFDEF IBX}Query := TIBQuery.Create(nil);{$ENDIF}
//  {$IFDEF DBX}Query := TSQLQuery.Create(nil);{$ENDIF}
  Query:= TADQuery.Create(nil);

  with DataSet do
  begin

    evNewRecord    := OnNewRecord;
    evBeforeInsert := BeforeInsert;
    evAfterInsert  := AfterInsert;
    evBeforeEdit   := BeforeEdit;
    evAfterEdit    := AfterEdit;
    evBeforePost   := BeforePost;
    evAfterPost    := AfterPost;

    OnNewRecord  := NIL;
    BeforeInsert := NIL;
    AfterInsert  := NIL;
    BeforeEdit   := NIL;
    AfterEdit    := NIL;
    BeforePost   := NIL;
    AfterPost    := NIL;

  end;  // with DeltaDS

  try try

    with Query do
    begin
      Connection:= kGetConnection();
//      {$IFDEF ADO}Connection := lConnection{$ENDIF}
//      {$IFDEF DBX}SQLConnection := lConnection{$ENDIF}
//      {$IFDEF IBX}Transaction := lConnection.DefaultTransaction{$ENDIF};

      SQL.BeginUpdate;
      SQL.Add( 'SELECT '+sSelect+' FROM '+TableName);
      SQL.Add( 'WHERE '+sWhere);
      SQL.EndUpdate;

      for i := 0 to (FieldDS.Count - 1) do
      begin
        FieldName := FieldDS[i].FieldName;
        if Assigned( Params.FindParam( '_'+FieldName)) then
          ParamByName( '_'+FieldName).Value := DataSet.FieldByName(FieldName).Value;
      end;  // for i

      Open;

      DataSet.Edit;

      for i := 0 to (Fields.Count - 1) do
      begin
        FieldName := Fields[i].FieldName;
        if Assigned(DataSet.FindField(FieldName)) then
          {$IFDEF FL_D6}
          if Fields[i].DataType = ftTimeStamp then
            DataSet.FieldByName(FieldName).AsDateTime := Fields[i].AsDateTime
          else
          {$ENDIF}
            DataSet.FieldByName(FieldName).Value := Fields[i].Value;
      end; // for

      DataSet.Post;

    end;  // with Query do

  except
    on E:Exception do
    begin
      lErrorLastSQL := E.Message;
      if IniciarTransacao then
      begin
        if kInTransaction() then
          kRollbackTransaction();
        kErro( E, 'Instrução SQL' + #13 + Query.SQL.Text,
                 C_UNIT, 'kSQLSelect()');
      end;
      Result := False;
    end;
  end;
  finally
    with DataSet do
    begin
      if Assigned(evNewRecord)    then OnNewRecord  := evNewRecord;
      if Assigned(evBeforeInsert) then BeforeInsert := evBeforeInsert;
      if Assigned(evAfterInsert)  then AfterInsert  := evAfterInsert;
      if Assigned(evBeforeEdit)   then BeforeEdit   := evBeforeEdit;
      if Assigned(evAfterEdit)    then AfterEdit    := evAfterEdit;
      if Assigned(evBeforePost)   then BeforePost   := evBeforePost;
      if Assigned(evAfterPost)    then AfterPost    := evAfterPost;
    end;  // with DeltaDS
    Query.Free;
    if IniciarTransacao then
    begin
      if kInTransaction() then
        kCommitTransaction();
    end;
  end;

end;  // function kSQLSelect

function kSQLSelectArray( DeltaDS: TDataSet;
  TableNames: array of String; Tables: array of TDataSet):Boolean;
var
  i: Integer;
  bSucesso: Boolean;
begin

  bSucesso := False;

  if not kInTransaction() then
    kStartTransaction();

  try try
    for i := Low(TableNames) to High(TableNames) do
    begin
      bSucesso := kSQLSelect( DeltaDS, TableNames[i], Tables[i].Fields, False);
      if not bSucesso then
        raise Exception.Create('');
    end;
  except
    on E:Exception do
    begin
      if kInTransaction() then
        kRollbackTransaction();
    end;
  end;  // except
  finally
    if kInTransaction() then
      kCommitTransaction();
  end;  // finally

  Result := bSucesso;

end;  // function kSQLSelectArray

function kSQLSelectFrom( DataSet: TDataSet;
  const TableName, Where: String; Order: String='';
  IniciarTransacao: Boolean = True):Boolean;
begin
  Result := kSQLSelectFrom( DataSet, TableName, -1, Where, Order, IniciarTransacao);
end;

function kSQLSelectFrom( DataSet: TDataSet;
  const TableName: String; Empresa: Integer = -1; Where: String=''; Order: String='';
  IniciarTransacao: Boolean = True):Boolean;
var
  i: Integer;
  FieldName, sSelect: String;
  evNewRecord, evBeforePost, evAfterPost, evBeforeInsert,
  evAfterInsert, evBeforeEdit, evAfterEdit, evCalcFields: TDataSetNotifyEvent;
  pFlags: TProviderFlags;
  bEmpresa: Boolean;
  SQL: TStringList;
begin

  bEmpresa := kIsField( TableName, 'IDEMPRESA');

  sSelect := '';
  Result  := True;

{ TProviderFlag = (pfInUpdate, pfInWhere, pfInKey, pfHidden);
  TProviderFlags = set of TProviderFlag; }

  with DataSet do
  begin

    DisableControls;
    Close;

    if not Active then
      if DataSet is TClientDataSet then
      begin
        if (Fields.Count = 0) and (FieldDefs.Count = 0) then
          sSelect := '*'
        else
          TClientDataSet(DataSet).CreateDataSet;
      end else
        DataSet.Open;

    for i := 0 to (Fields.Count - 1) do
    begin

      FieldName := Fields[i].FieldName;
      pFlags    := Fields[i].ProviderFlags;

      if not (pfHidden in pFlags) and (Fields[i].FieldKind = fkData) then
      begin
        if Length(sSelect) > 0 then
          sSelect := sSelect + ', ';
        sSelect := sSelect + FieldName;
      end;  // if then

    end;  // for i := 0 to do

    evNewRecord    := OnNewRecord;
    evBeforePost   := BeforePost;
    evAfterPost    := AfterPost;
    evBeforeInsert := BeforeInsert;
    evAfterInsert  := AfterInsert;
    evBeforeEdit   := BeforeEdit;
    evAfterEdit    := AfterEdit;
    evCalcFields   := OnCalcFields;

    OnNewRecord  := NIL;
    BeforePost   := NIL;
    AfterPost    := NIL;
    BeforeInsert := NIL;
    AfterInsert  := NIL;
    BeforeEdit   := NIL;
    AfterEdit    := NIL;
    OnCalcFields := NIL;

  end;  // with DataSet

  SQL := TStringList.Create;

  try try

    SQL.BeginUpdate;
    SQL.Add( 'SELECT '+sSelect+' FROM '+TableName);
    if bEmpresa and (Empresa > -1) then
    begin
      SQL.Add( 'WHERE IDEMPRESA = '+IntToStr(Empresa));
      if Where <> '' then
        SQL.Add('AND '+Where);
    end else if (Where <> '') then
      SQL.Add( 'WHERE '+Where);

    if Order <> '' then
      SQL.Add( 'ORDER BY '+Order);
    SQL.EndUpdate;

    if not kOpenSQL( DataSet, SQL.Text, IniciarTransacao) then
      raise Exception.Create(lErrorLastSQL);

  except
    on E:Exception do
    begin
      kErro( E.Message, C_UNIT, 'kSQLSelectFrom()');
      Result := False;
    end;
  end;
  finally
    SQL.Free;
    with DataSet do begin
      if Assigned(evNewRecord)    then OnNewRecord  := evNewRecord;
      if Assigned(evBeforePost)   then BeforePost   := evBeforePost;
      if Assigned(evAfterPost)    then AfterPost    := evAfterPost;
      if Assigned(evBeforeInsert) then BeforeInsert := evBeforeInsert;
      if Assigned(evAfterInsert)  then AfterInsert  := evAfterInsert;
      if Assigned(evBeforeEdit)   then BeforeEdit   := evBeforeEdit;
      if Assigned(evAfterEdit)    then AfterEdit    := evAfterEdit;
      if Assigned(evCalcFields)   then OnCalcFields := evCalcFields;
      EnableControls;
    end;  // with DeltaDS
  end;

end;  // function kSQLSelectFrom

function kSQLKey( DeltaDS: TDataSet; TableName: String; FieldDS: TFields;
  IniciarTransacao: Boolean = True):Integer;
var
  i:Integer;
  FieldName, sWhere: String;
  pFlags: TProviderFlags;
//  {$IFDEF ADO}Query: TADOQuery;{$ENDIF}
//  {$IFDEF IBX}Query: TIBQuery;{$ENDIF}
//  {$IFDEF DBX}Query: TSQLQuery;{$ENDIF}
  Query: TADQuery;
begin

  sWhere  := '';
  Result  := 0;

  { TProviderFlag = (pfInUpdate, pfInWhere, pfInKey, pfHidden);
    TProviderFlags = set of TProviderFlag; }

  for i := 0 to (FieldDS.Count - 1) do
  begin

    FieldName := FieldDS[i].FieldName;
    pFlags    := FieldDS[i].ProviderFlags;

    if (not (pfHidden in pFlags)) and
       Assigned(DeltaDS.FindField(FieldName)) and (pfInKey in pFlags) then
    begin

      if (Length(sWhere) > 0) then
        sWhere := sWhere + ' and ';

      sWhere := sWhere + FieldName +' = :_' + FieldName;

    end;  // if then

  end;  // for i := 0 to do

  if IniciarTransacao then
  begin
    if not kInTransaction() then
      kStartTransaction();
  end;

//  {$IFDEF ADO}Query := TADOQuery.Create(NIL);{$ENDIF}
//  {$IFDEF IBX}Query := TIBQuery.Create(nil);{$ENDIF}
//  {$IFDEF DBX}Query := TSQLQuery.Create(nil);{$ENDIF}
  Query:= TADQuery.Create(nil);
  try try

    with Query do
    begin
      Connection:= kGetConnection();
//      {$IFDEF ADO}Connection := lConnection{$ENDIF}
//      {$IFDEF DBX}SQLConnection := lConnection{$ENDIF}
//      {$IFDEF IBX}Transaction := lConnection.DefaultTransaction{$ENDIF};

      SQL.BeginUpdate;
      SQL.Add( 'SELECT cast(COUNT(*) as integer) as COUNT FROM '+TableName);
      SQL.Add( 'WHERE '+sWhere);
      SQL.EndUpdate;

      for i := 0 to (FieldDS.Count - 1) do
      begin
        FieldName := FieldDS[i].FieldName;
        if Assigned( Params.FindParam( '_'+FieldName)) then
          ParamByName( '_'+FieldName).Value := DeltaDS.FieldByName(FieldName).Value;
      end;  // for i

      Open;
      Result := Fields[0].AsInteger;
      Close;

    end;  // with Query do

  except
    on E:Exception do
    begin
      lErrorLastSQL := E.Message;
      if IniciarTransacao then
      begin
        if kInTransaction() then
          kRollbackTransaction();
        kErro( E, 'Instrução SQL' + #13 + Query.SQL.Text,
                 'fkernel.dll', 'kSQLKey()');
      end;
    end;
  end;
  finally
    Query.Free;
    if IniciarTransacao then
    begin
      if kInTransaction() then
        kCommitTransaction();
    end;
  end;

end;  // function kSQLKey

function kGenerator( GeneratorName: String; Incremento: Integer = 0): Integer;
var
  SQL: TStringList;
begin

  SQL := TStringList.Create;

  try

    SQL.BeginUpdate;
    SQL.Add('SELECT GEN_ID('+GeneratorName+','+IntToStr(Incremento)+')');
    SQL.Add('FROM RDB$DATABASE');
    SQL.EndUpdate;

    if not kGetFieldSQL( SQL.Text, Result) then
      Result := -1;

  finally
    SQL.Free;
  end;

end;

function kExistProcedure( const ProcName: String;
  IniciarTransacao: Boolean = True):Boolean;
//{$IFDEF DBX}
var
  List: TStringList;
//{$ENDIF}
begin
  Result:= True;
//  {$IFDEF DBX}
//  List := TStringList.Create;
//  try
//    kGetConnection.GetProcedureNames(List);
//    Result := (List.IndexOf(ProcName) <> -1);
//  finally
//    List.Free;
//  end;
//  {$ENDIF}
//  {$IFDEF IBX}
//  Result := (kCountSQL( 'SELECT COUNT(*) FROM RDB$PROCEDURES'#13+
//                        'WHERE RDB$PROCEDURE_NAME = :PROCEDURE',
//                        [ProcName], IniciarTransacao) > 0)
//  {$ENDIF}
end;  // kExistProcedure

function kExistIndice( const IndiceName: String; const TableName: String = ''):Boolean;
var
  _text: String;
begin

//  {$IFDEF INTERBASE}
//  _text := 'SELECT COUNT(*) FROM RDB$INDICES'#13+
//           'WHERE RDB$INDEX_NAME = '+QuotedStr(IndiceName);
//
//  if (TableName <> '') then
//    _text := _text + #13 + 'AND RDB$RELATION_NAME = '+QuotedStr(TableName);
//
//  Result := (kCountSQL(_text) > 0);
//
//  if (not Result) then
//  begin
//
//    _text := 'SELECT COUNT(*) FROM RDB$RELATION_CONSTRAINTS'#13+
//             'WHERE RDB$CONSTRAINT_NAME = '+QuotedStr(IndiceName);
//
//    if (TableName <> '') then
//      _text := _text + #13 + 'AND RDB$RELATION_NAME = '+QuotedStr(TableName);
//
//    Result := (kCountSQL(_text) > 0);
//
//  end;
//  {$ENDIF}
  Result:= False;

end;  // function kExistIndice

procedure kSetField( DataSet: TDataSet;
  vType: TFieldType; vFieldName: String;
  vFieldKind: TFieldKind; vProviderFlags: TProviderFlags = [];
  vSize: Integer = 0; vMask: String = '');
//{$IFNDEF ENABLED_DEFS}
var
  Field: TField;
//{$ENDIF}
begin

//  {$IFDEF ENABLED_DEFS}

  if vFieldKind = fkData then
    DataSet.FieldDefs.Add( vFieldName, vType, vSize);

//  {$ELSE}

  if vType = ftInteger then
    Field := TIntegerField.Create(DataSet)
//  else if vType = ftNumeric then
//    Field := TNumericField.Create(DataSet)
  else if vType = ftString then
    Field := TStringField.Create(DataSet)
  else
    Field := TField.Create(DataSet);

  Field.FieldName := vFieldName;
  Field.FieldKind := vFieldKind;

  Field.DataSet := DataSet;

  if (vProviderFlags <> []) then
    Field.ProviderFlags := vProviderFlags;

  if (vSize > 0) then
    Field.Size := vSize;

  if (vMask <> '') then
    Field.EditMask := vMask;

  DataSet.Fields.Add(Field);

//  {$ENDIF}

end;  // kSetField

function kIsField( const TableName, FieldName: String):Boolean;
begin
  Result := kExistField( TableName, FieldName);
end;

function kExistField( const TableName, FieldName: String):Boolean;
var
  Query: TADQuery;
begin
  Query:= TADQuery.Create(nil);
  try
    Query.Connection:= kGetConnection();
    Query.SQL.Add('    SELECT 1');
    Query.SQL.Add('    FROM pg_catalog.pg_class c');
    Query.SQL.Add('    LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace');
    Query.SQL.Add('    INNER JOIN pg_attribute a ON (c.oid = a.attrelid)');
    Query.SQL.Add('    WHERE c.relkind = ''r''');
    Query.SQL.Add('    AND Upper(c.relname) = '+ QuotedStr(UpperCase(TableName)));
    Query.SQL.Add('    and a.attnum > 0');
    Query.SQL.Add('    and Upper(a.attname) = '+ QuotedStr(UpperCase(FieldName)));
    Query.Open;

    Result:= not Query.IsEmpty;
  finally
    FreeAndNil( Query );
  end;

end;  // kExistField

function kExistDomain( const DomainName: String):Boolean;
begin
  Result := kExistField( '', DomainName);
end;

function kExistTable( Table: String; const IniciarTransacao: Boolean = True):Boolean;
var
  Query: TADQuery;
begin
  Query:= TADQuery.Create(nil);
  try
    Query.Connection:= kGetConnection();
    Query.SQL.Add('SELECT n.nspname as "Schema"');
    Query.SQL.Add('     , c.relname as "Name"');
    Query.SQL.Add('FROM pg_catalog.pg_class c');
    Query.SQL.Add('LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace');
    Query.SQL.Add('WHERE c.relkind = ''r''');
    Query.SQL.Add('AND Upper(c.relname) = '+ QuotedStr(UpperCase(Table)));
    Query.SQL.Add('ORDER BY 1,2;');
    Query.Open;

    Result:= not Query.IsEmpty;
  finally
    FreeAndNil( Query );
  end;
end;

function kExistGenerator( const GeneratorName: String;
  IniciarTransacao: Boolean = True):Boolean;
var
  iCount: Integer;
begin

//  {$IFDEF INTERBASE}
//  iCount := kCountSQL( 'RDB$GENERATORS',
//                       'RDB$GENERATOR_NAME = :GENERATOR',
//                       [GeneratorName], IniciarTransacao);
//  {$ENDIF}

  Result := (iCount > 0);

end;  // kExistGenerator

function kExistTrigger( const TriggerName: String;
  IniciarTransacao: Boolean = True):Boolean;
var iCount: Integer;
begin

//  {$IFDEF INTERBASE}
//  iCount := kCountSQL( 'SELECT COUNT(*) FROM RDB$TRIGGERS'#13+
//                       'WHERE RDB$TRIGGER_NAME = '+QuotedStr(TriggerName),
//                       [], IniciarTransacao);
//  {$ENDIF}
  Result := (iCount > 0);
end;  // kExistTrigger

procedure kNovaPesquisa( DataSet: TDataSet;
  Titulo, Instrucao: String;
  const AcceptAll: Boolean = True; const AcceptEmpty: Boolean = False);
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

procedure kNovaColuna( DataSet: TDataSet; Coluna, Tamanho, Display: Integer;
  Titulo: String; Mascara: String = '');
begin

  with DataSet do
  begin
    if (not Active) then
      if (DataSet is TClientDataSet) then
        TClientDataSet(DataSet).CreateDataSet
      else
        Open;
    if (Coluna = -1) then
      Coluna := RecordCount;
    Append;
    FieldByName('COLUNA').AsInteger  := Coluna;
    FieldByName('TITULO').AsString   := Titulo;
    FieldByName('TAMANHO').AsInteger := Tamanho;
    FieldByName('DISPLAY').AsInteger := Display;
    FieldByName('MASCARA').AsString  := Mascara;
    Post;
  end;  // with DataSet

end;

procedure kNovaColuna( DataSet: TDataSet; Tamanho, Display: Integer;
  Titulo: String; Mascara: String = '');
begin
  kNovaColuna( DataSet, -1, Tamanho, Display, Titulo, Mascara);
end;

function kApagaFiltroX( Tabela, Usuario:String):Boolean;
var
  SQL: TStringList;
begin

  SQL := TStringList.Create;

  try

    SQL.BeginUpdate;
    SQL.Add('DELETE FROM '+Tabela);
    SQL.Add('WHERE USER_NAME = '+QuotedStr(Usuario) );
    SQL.EndUpdate;

    Result := kExecSQL( SQL.Text);

  finally
    SQL.Free;
  end;

end;  // func kApagaFiltroX

function kExecSQL( const Texto: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Boolean;
var
//  {$IFDEF ADO}Query: TADOCommand;{$ENDIF}
//  {$IFDEF DBX}Query: TSQLQuery;{$ENDIF}
//  {$IFDEF IBX}Query: TIBSQL;{$ENDIF}
  Query: TADQuery;
  i: Integer;
begin

  if IniciarTransacao then
  begin
    if not kInTransaction() then
      kStartTransaction();
  end;

//  {$IFDEF ADO}Query := TADOCommand.Create(NIL);{$ENDIF}
//  {$IFDEF IBX}Query := TIBSQL.Create(nil);{$ENDIF}
//  {$IFDEF DBX}Query := TSQLQuery.Create(nil);{$ENDIF}
   Query:= TADQuery.Create(nil);
   Result := False;

   try try
     with Query do
     begin

//       {$IFDEF IBX}
//       if (Length(ParamList) = 0) then
//         ParamCheck  := False;
//       {$ENDIF}
       Connection:= kGetConnection();
//       {$IFDEF ADO}Connection := lConnetion;{$ENDIF}
//       {$IFDEF DBX}SQLConnection := lConnection;{$ENDIF}
//       {$IFDEF IBX}Transaction := lConnection.DefaultTransaction;{$ENDIF}

       SQL.BeginUpdate;
       SQL.Clear;
       SQL.Add( Texto);
       SQL.EndUpdate;

       if (Length(ParamList) > 0) then
         for i := Low(ParamList) to High(ParamList) do
           if (i < Params.Count) then
//             {$IFDEF FL_D6}
//             if VarIsType( ParamList[i], varDate) then
//             {$ELSE}
             if VarType( ParamList[i]) = varDate then
//             {$ENDIF}
               Params[i].AsDateTime := VarToDateTime( ParamList[i])
             else
               Params[i].Value := ParamList[i];

//       {$IFDEF ADO}Execute;{$ENDIF}
//       {$IFDEF IBX}ExecQuery;{$ENDIF}
//       {$IFDEF DBX}ExecSQL;{$ENDIF}
       ExecSQL;
       Result := True;
     end;
   except
     on E:Exception do
     begin
       lErrorLastSQL := E.Message;
       if IniciarTransacao then
       begin
         if kInTransaction() then
           kRollbackTransaction();
         kErro( E, Texto, C_UNIT, 'kExecSQL()');
       end;
     end;
   end;
   finally
     if IniciarTransacao then
     begin
      if kInTransaction() then
        kCommitTransaction();
     end;
     Query.Free;
   end;

end;  // kExecSQL

function kExecSQL( const Texto: String;
  const IniciarTransacao: Boolean = True):Boolean;
begin
  Result := kExecSQL( Texto, [], IniciarTransacao);
end; // kExecSQL

function kOpenSQL( DataSet: TDataSet; const Command: String;
  const IniciarTransacao: Boolean = True): Boolean;
begin
  Result := kOpenSQL( DataSet, Command, [], IniciarTransacao);
end;

function kOpenSQL( DataSet: TDataSet; const Command: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Boolean;
begin
  Result := kOpenSQL( DataSet, '', Command, ParamList, IniciarTransacao);
end;

function kOpenSQL( DataSet: TDataSet; const Tabela, Where: String;
  const ParamList: Array of Variant; const IniciarTransacao: Boolean = True):Boolean;
var
  i: Integer;
//  {$IFDEF ADO}Query: TADOQuery;{$ENDIF}
//  {$IFDEF DBX}Query: TSQLQuery;{$ENDIF}
//  {$IFDEF IBX}Query: TIBQuery;{$ENDIF}
  Query: TADQuery;
  sSQL: String;
begin

  if IniciarTransacao then
  begin
    if not kInTransaction() then
      kStartTransaction();
  end;

//  {$IFDEF ADO}Query := TADOQuery.Create(NIL);{$ENDIF}
//  {$IFDEF IBX}Query := TIBQuery.Create(nil);{$ENDIF}
//  {$IFDEF DBX}Query := TSQLQuery.Create(nil);{$ENDIF}
  Query:= TADQuery.Create(nil);
  Result := False;

  try try

     with Query do
     begin
       Close;
       Connection:= kGetConnection();
//       {$IFDEF ADO}Connection := lConnection;{$ENDIF}
//       {$IFDEF DBX}SQLConnection := lConnection;{$ENDIF}
//       {$IFDEF IBX}Transaction := lConnection.DefaultTransaction;{$ENDIF}

       if (UpperCase(Copy(Where, 1, 6)) = 'SELECT') then
         sSQL := Where
       else begin
         if (Tabela <> '') then
           sSQL := 'SELECT * FROM '+Tabela;
         if (Where <> '') then
           sSQL := sSQL+#13+'WHERE '+Where;
       end;

       SQL.BeginUpdate;
       SQL.Clear;
       SQL.Add(sSQL);
       SQL.EndUpdate;

       if (Length(ParamList) > 0) and (Params.Count > 0) then
         for i := 0 to Params.Count -1 do
           if (i < Length(ParamList)) then
//             {$IFDEF FL_D6}
//             if VarIsType( ParamList[i], varDate) then
//             {$ELSE}
             if VarType( ParamList[i]) = varDate then
//             {$ENDIF}
               Params[i].AsDateTime := VarToDateTime( ParamList[i])
             else
               Params[i].Value := ParamList[i];

       Open;

       kDataSetToData( Query, DataSet);
       Result := True;

     end;  // with Query do

   except
     on E:Exception do
     begin
       lErrorLastSQL := E.Message;
       if IniciarTransacao then
       begin
         if kInTransaction() then
           kRollbackTransaction();
         kErro( E, 'Instrução SQL:'#13#13+Query.Text, C_UNIT, 'kOpenSQL()');
       end;
     end;
   end;
   finally
     Query.Free;
     if IniciarTransacao then
     begin
      if kInTransaction() then
        kCommitTransaction();
     end;
   end;

end;  // kOpenSQL

function kOpenTable( DataSet: TDataSet; const Tabela: String; const Where: String = '';
  const IniciarTransacao: Boolean = True):Boolean;
begin
  Result := kOpenSQL( DataSet, Tabela, Where, [], IniciarTransacao);
end;

procedure kConectar( Frm: TForm);
var
  i: Integer;
begin
  with Frm do
    for i := 0 to (ComponentCount - 1) do
//      {$IFDEF IBX}
//      if (Components[i] is TIBQuery) then
//        TIBQuery(Components[i]).Database := kGetConnection
//      else if (Components[i] is TIBTable) then
//        TIBTable(Components[i]).Database := kGetConnection
//      else if (Components[i] is TIBStoredProc) then
//        TIBStoredProc(Components[i]).Database := kGetConnection;
//      {$ENDIF}
//      {$IFDEF DBX}
//      if (Components[i] is TSQLQuery) then
//        TSQLQuery(Components[i]).SQLConnection := kGetConnection
//      else if (Components[i] is TSQLTable) then
//        TSQLTable(Components[i]).SQLConnection := kGetConnection
//      else if (Components[i] is TSQLStoredProc) then
//        TSQLStoredProc(Components[i]).SQLConnection := kGetConnection;
//      {$ENDIF}

      if (Components[i] is TADQuery) then
        TADQuery(Components[i]).Connection := kGetConnection
      else if (Components[i] is TADTable) then
        TADTable(Components[i]).Connection := kGetConnection
      else if (Components[i] is TADStoredProc) then
        TADStoredProc(Components[i]).Connection := kGetConnection;
end;  // kConectar

// *** kCountSQL ***

function kCountSQL( const Texto: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Integer;
var
  DataSet: TClientDataSet;
begin

  if (Texto = '') then
  begin
    Result := 0;
    Exit;
  end;

  DataSet := TClientDataSet.Create(NIL);

  try
    if kOpenSQL( DataSet, Texto, ParamList, IniciarTransacao) then
      Result := DataSet.Fields[0].AsInteger
    else
      Result := -1;
  finally
    DataSet.Free;
  end;

end;  // kCountSQL

function kCountSQL( const Tabela, Where: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Integer;
var
  SQL: TStringList;
begin

  SQL := TStringList.Create;

  try

    SQL.BeginUpdate;
    SQL.Add('SELECT cast(COUNT(*) as integer) as COUNT FROM '+Tabela);
    if (Where <> '') then
    begin
      if Copy( UpperCase(Where), 1, 5) = 'WHERE' then
        SQL.Add(Where)
      else
        SQL.Add('WHERE '+Where);
    end;
    SQL.EndUpdate;

    Result := kCountSQL( SQL.Text, ParamList, IniciarTransacao);

  finally
    SQL.Free;
  end;

end;

function kCountSQL( const Tabela, Where: String;
  const IniciarTransacao: Boolean = True):Integer;
begin
  Result := kCountSQL( Tabela, Where, [], IniciarTransacao);
end;

function kCountSQL( const Texto: String;
  const IniciarTransacao: Boolean = True):Integer;
begin
  Result := kCountSQL( Texto, [], IniciarTransacao);
end;

function kCountRowSQL( const Texto: String;
  const ParamList: Array of Variant;
  const IniciarTransacao: Boolean = True):Integer;
var
  DataSet: TClientDataSet;
begin

  if (Texto = '') then
  begin
    Result := 0;
    Exit;
  end;

  DataSet := TClientDataSet.Create(NIL);

  try
    if kOpenSQL( DataSet, Texto, ParamList, IniciarTransacao) then
      Result := DataSet.RecordCount
    else
      Result := -1;
  finally
    DataSet.Free;
  end;

end;  // kCountSQL

function kExecutaProc( DS: TDataSet; SP, Operacao: String):Boolean;
var
//  {$IFDEF ADO}SPa: TADOStoredProc;{$ENDIF}
//  {$IFDEF DBX}SPa: TSQLStoredProc;{$ENDIF}
//  {$IFDEF IBX}SPa: TIBStoredProc;{$ENDIF}
  SPa: TADStoredProc;
begin

//  SPa := {$IFDEF ADO}TADOStoredProc.Create(NIL){$ENDIF}
//         {$IFDEF DBX}TSQLStoredProc.Create(NIL){$ENDIF}
//         {$IFDEF IBX}TIBStoredProc.Create(NIL){$ENDIF};
  SPa:= TADStoredProc.Create(nil);
  try
//    {$IFDEF ADO}SPa.Connection := lConnection{$ENDIF}
//    {$IFDEF DBX}SPa.SQLConnection := lConnection{$ENDIF}
//    {$IFDEF IBX}SPa.Transaction := lConnection.DefaultTransaction{$ENDIF};
    SPa.Connection:= kGetConnection();

    SPa.StoredProcName := SP;

//    {$IFNDEF DBX}SPa.Prepare;{$ENDIF}

    Result := kExecutaProc( DS, SPa, Operacao);

  finally
    SPa.Free;
  end;

end;

function kExecutaProc( DS, SP: TDataSet; Operacao: String):Boolean;
var
  i: Integer;
  sNomeCampo: String;
  SPa: TADStoredProc;
//  {$IFDEF DBX}SPa: TSQLStoredProc;{$ENDIF}
//  {$IFDEF IBX}SPa: TIBStoredProc;{$ENDIF}
begin

  if not kInTransaction() then
    kStartTransaction();

//  {$IFDEF DBX}
//  SPa := TSQLStoredProc(SP);
//  {$ENDIF}
//
//  {$IFDEF IBX}
//  SPa := TIBStoredProc(SP);
//  {$ENDIF}
  SPa:= TADStoredProc(SP);
  try
  try

    // Limpa todos os parametros de entrada
    // Preencha todos parametros de entrada
    // conforme correspondencia pelos campos do DataSet DS

    for i := 0 to SPa.Params.Count - 1 do
      if Copy( SPa.Params[i].Name, 1, 2) = 'I_' then
      begin // E' parametro de entrada
        SPa.Params[i].Value := NULL;
        sNomeCampo := Copy( SPa.Params[i].Name, 3, 50);
        if DS.FindField( sNomeCampo) <> NIL then
          SPa.Params[i].Value := DS.FieldByName(sNomeCampo).Value;
      end; // if

    // Seta a operacao se for o caso
    if Assigned(SPa.Params.FindParam('OPERACAO')) then
      SPa.Params.ParamByName('OPERACAO').Value := Operacao;

    // Executa a Store Procedure
    SPa.ExecProc;

    if (Operacao <> '') then
    begin

      DS.Close;

      if (DS is TClientDataSet) then
        TClientDataSet(DS).CreateDataSet
      else
        DS.Open;

      if (Operacao[1] in ['I','A','C']) then
      begin

        DS.Append;

        for i := 0 to (DS.Fields.Count - 1) do
        begin
          sNomeCampo := 'O_'+DS.Fields[i].FieldName;
          if (SPa.Params.FindParam(sNomeCampo) <> nil) then
             DS.Fields[i].Value := SPa.ParamByName(sNomeCampo).Value;
         end;  // for

        DS.Post;

      end;  // if

    end;

    Result := True;

  except
    on E:Exception do
    begin
      Result := False;
      if kInTransaction() then
        kRollbackTransaction();
      kErro( E, '', C_UNIT, 'kExecutaProc()');
    end;
  end;  // try
  finally
    if SP.Active then SP.Close;
    if kInTransaction() then
      kCommitTransaction();
  end;

  // Executa uma consulta para recuperar os dados realmente gravados
  if Result and (Operacao[1] in ['A','I']) then
    kExecutaProc( DS, SP, 'C');

end;  // func kExecutaProc

function kExecutaProc( SP: TDataSet):Boolean;
var
//  {$IFDEF DBX}SPa: TSQLStoredProc;{$ENDIF}
//  {$IFDEF IBX}SPa: TIBStoredProc;{$ENDIF}
  SPa: TADStoredProc;
begin

  if not kInTransaction() then
    kStartTransaction();

//  {$IFDEF DBX}
//  SPa := TSQLStoredProc(SP);
//  {$ENDIF}
//
//  {$IFDEF IBX}
//  SPa := TIBStoredProc(SP);
//  {$ENDIF}
  SPa:= TADStoredProc(SP);
  try try

    // Executa a Store Procedure
    SPa.ExecProc;
    Result := True;

  except
    on E:Exception do
    begin
      Result := False;
      if kInTransaction() then
        kRollbackTransaction();
      kErro( E, '', C_UNIT, 'kExecutaProc()');
    end;
  end;  // try
  finally
    if SP.Active then SP.Close;
    if kInTransaction() then
      kCommitTransaction();
  end;

end;  // func kExecutaProc

function kExecScript( const Texto, FileName: String;
  const Head: Boolean = False;
  const Separator: String = ';';
  const IniciarTransacao: Boolean = True):Boolean;
var
//  Query: {$IFDEF IBX}TIBQuery{$ENDIF}
//         {$IFDEF DBX}TSQLQuery{$ENDIF};
  Query: TADQuery;
begin

  if IniciarTransacao then
  begin
    if not kInTransaction() then
      kStartTransaction();
  end;

//  {$IFDEF IBX}
//  Query := TIBQuery.Create(nil);
//  {$ENDIF}
//  {$IFDEF DBX}
//   Query := TSQLQuery.Create(nil);
//  {$ENDIF}
   Query:= TADQuery.Create(nil);
   Result := False;

   try try
     with Query do
     begin

//       {$IFDEF IBX}
//       ParamCheck  := False;
//       {$ENDIF}
//
//       {$IFDEF ADO}Connection := lConnection{$ENDIF}
//       {$IFDEF DBX}SQLConnection := lConnection{$ENDIF}
//       {$IFDEF IBX}Transaction := lConnection.DefaultTransaction{$ENDIF};
       Connection:= kGetConnection();
       SQL.Text := Texto;

       Open;
       Result := kSaveDataSetTxt( Query, FileName, Head, Separator);

     end;
   except
     on E:Exception do
     begin
       lErrorLastSQL := E.Message;
       if IniciarTransacao then
       begin
        if kInTransaction() then
          kRollbackTransaction();
         kErro( E, E.Message+#13#13+Texto, C_UNIT, 'kExecScript()');
       end;
     end;
   end;
   finally
     Query.Free;
     if IniciarTransacao then
     begin
      if kInTransaction() then
        kCommitTransaction();
     end;
   end;

end;  // kExecScript

function kSQLInsertDataSet( DataSet: TDataSet;
  TableName: String; IniciarTransacao: Boolean = True):Boolean;
var
  i:Integer;
  FieldName, sInsert, sValues: String;
//  {$IFDEF IBX}Query: TIBQuery;{$ENDIF}
//  {$IFDEF DBX}Query: TSQLQuery;{$ENDIF}
  Query: TADQuery;
begin

  sInsert := '';
  sValues := '';
  Result  := True;

  for i := 0 to (DataSet.Fields.Count - 1) do
  begin
    FieldName := DataSet.Fields[i].FieldName;
    if (Length(sInsert) > 0) then sInsert := sInsert + ', ';
    sInsert := sInsert + FieldName;
    if (Length(sValues) > 0) then sValues := sValues + ', ';
    sValues := sValues +  ':' + FieldName;
  end;  // for i

  if IniciarTransacao and not kInTransaction() then
    kStartTransaction();

//  {$IFDEF ADO}Query := TADOQuery.Create(nil);{$ENDIF}
//  {$IFDEF DBX}Query := TSQLQuery.Create(nil);{$ENDIF}
//  {$IFDEF IBX}Query := TIBQuery.Create(nil);{$ENDIF}
  Query:= TADQuery.Create(nil);
  try try

    with Query do
    begin
      Connection:= kGetConnection();
//      {$IFDEF ADO}Connection := lConnection{$ENDIF}
//      {$IFDEF DBX}SQLConnection := lConnection{$ENDIF}
//      {$IFDEF IBX}Transaction := lConnection.DefaultTransaction{$ENDIF};

      SQL.BeginUpdate;
      SQL.Add( 'INSERT INTO '+TableName);
      SQL.Add( '('+sInsert+')');
      SQL.Add( 'VALUES ('+sValues+')');
      SQL.EndUpdate;
//      {$IFDEF IBX}Prepare;{$ENDIF}
//      {$IFDEF DBX}PrepareStatement;{$ENDIF}
      Prepare;
      DataSet.First;

      while not DataSet.Eof do  {07/03/2003}
      begin

        Close;

        for i := 0 to (DataSet.Fields.Count - 1) do
        begin
          FieldName := DataSet.Fields[i].FieldName;
          if Assigned(Params.FindParam(FieldName)) then
            ParamByName(FieldName).Value := DataSet.FieldByName(FieldName).Value;
        end;  // for i

        ExecSQL;

        DataSet.Next;

      end;

      Unprepare;
//      {$IFDEF IBX}UnPrepare;{$ENDIF}  //?

    end;  // with Query do

  except
    on E:Exception do
    begin
      lErrorLastSQL := E.Message;
      if IniciarTransacao then
      begin
        if kInTransaction() then
          kRollbackTransaction();
        kErro( E, '*Instrução SQL*'#13#10+Query.SQL.Text,
                  C_UNIT, 'kSQLInsertDataSet()');
      end;
      Result := False;
    end;
  end;
  finally
    Query.Free;
    if IniciarTransacao then
    begin
      if kInTransaction() then
        kCommitTransaction();
    end;
  end;

end;  // function kSQLInsertDataSet

procedure kGetFieldValueList( List: TStrings; DataSet: TDataSet;
  const FieldName: String);
begin
  DataSet.First;
  List.BeginUpdate;
  List.Clear;
  while not DataSet.Eof do
  begin
    List.Add(DataSet.FieldByName(FieldName).AsString);
    DataSet.Next;
  end;
  List.EndUpdate;
end;

function kGetFieldTable( const TableName, FieldName: String;
  const Empresa: Integer = -1; const Where: String = '';
  const IniciarTransacao: Boolean = True): Variant;
var
  SQL: TStringList;
begin

  SQL := TStringList.Create;

  try

    SQL.BeginUpdate;

    SQL.Add('SELECT '+FieldName+' FROM '+TableName);
    if (Empresa > -1) then
    begin
      SQL.Add('WHERE IDEMPRESA = '+IntToStr(Empresa));
      if (Where <> '') then
        SQL.Add('AND '+Where);
    end else if (Where <> '') then
      SQL.Add('WHERE '+Where);

    SQL.EndUpdate;

    kGetFieldSQL( SQL.Text, Result, FieldName, IniciarTransacao);

  finally
    SQL.Free;
  end;

end;  // function kGetFieldTable

function kGetFieldTable( const TableName, FieldName: String;
  const Where: String = '';
  const IniciarTransacao: Boolean = True): Variant; overload;
begin
  Result := kGetFieldTable( TableName, FieldName, -1, Where, IniciarTransacao);
end;

// ---

function kGetFieldSQL( const Texto: String; const ParamList: Array of Variant;
  var Value: Variant; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean;
var
//  Query: {$IFDEF ADO}TADOQuery{$ENDIF}
//         {$IFDEF DBX}TSQLQuery{$ENDIF}
//         {$IFDEF IBX}TIBQuery{$ENDIF};
  Query: TADQuery;
  i: Integer;
begin

  if IniciarTransacao then
  begin
    if not kInTransaction() then
      kStartTransaction();
  end;

//  {$IFDEF ADO}Query := TADOQuery.Create(NIL);{$ENDIF}
//  {$IFDEF DBX}Query := TSQLQuery.Create(NIL);{$ENDIF}
//  {$IFDEF IBX}Query := TIBQuery.Create(NIL);{$ENDIF}
  Query:= TADQuery.Create(nil);

  Result := False;

  try try

     with Query do
     begin

//       {$IFDEF IBX}
//       if (Length(ParamList) = 0) then
//         ParamCheck  := False;
//       {$ENDIF}
//
//       {$IFDEF ADO}Connection := lConnection{$ENDIF}
//       {$IFDEF DBX}SQLConnection := lConnection{$ENDIF}
//       {$IFDEF IBX}Transaction := lConnection.DefaultTransaction{$ENDIF};
       Connection:= kGetConnection();
       SQL.BeginUpdate;
       SQL.Clear;
       SQL.Add( Texto);
       SQL.EndUpdate;

       if (Length(ParamList) > 0) then
         for i := Low(ParamList) to High(ParamList) do
           if (i < Params.Count) then
//             {$IFDEF FL_D6}
             if VarIsType( ParamList[i], varDate) then
//             {$ELSE}
             if VarType( ParamList[i]) = varDate then
//             {$ENDIF}
               Params[i].AsDateTime := VarToDateTime( ParamList[i])
             else
               Params[i].Value := ParamList[i];

       Open;

       if (FieldName = '') then
         Value := Fields[0].Value
       else
         Value := FieldByName(FieldName).Value;

     end;  // with Query do

     Result := True;

   except
     on E:Exception do
     begin
       lErrorLastSQL := E.Message;
       if IniciarTransacao then
       begin
         if kInTransaction() then
           kRollbackTransaction();
         kErro( E, 'Instrução SQL:'#13#13+Query.Text, C_UNIT, 'kGetFieldSQL()');
       end;
     end;
   end;
   finally
     Query.Free;
     if IniciarTransacao then
     begin
      if kInTransaction() then
        kCommitTransaction();
     end;
   end;

end;  // kGetFieldSQL

function kGetFieldSQL( const Texto: String;
  var Value: Variant; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean;
begin
  Result := kGetFieldSQL( Texto, [], Value, FieldName, IniciarTransacao);
end;

function kGetFieldSQL( const Texto: String; const ParamList: Array of Variant;
  var Value: String;
  FieldName: String = ''; const IniciarTransacao: Boolean = True):Boolean;
var
  vValue: Variant;
begin
  Result := kGetFieldSQL( Texto, ParamList, vValue, FieldName, IniciarTransacao);
  if Result then
    Value := VarToStr(vValue);
end;

function kGetFieldSQL( const Texto: String; var Value: String;
  FieldName: String = ''; const IniciarTransacao: Boolean = True):Boolean;
var
  vValue: Variant;
begin
  Result := kGetFieldSQL( Texto, [], vValue, FieldName, IniciarTransacao);
  if Result then
    Value := VarToStr(vValue);
end;

function kGetFieldSQL( const Texto: String; const ParamList: Array of Variant;
  var Value: Integer; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean;
var
  vValue: Variant;
begin
  Result := kGetFieldSQL( Texto, ParamList, vValue, FieldName, IniciarTransacao);
  if Result then
    Value := StrToInt( VarToStr(vValue));
end;  // function kGetFieldSQL

function kGetFieldSQL( const Texto: String;
  var Value: Integer; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean;
var
  vValue: Variant;
begin
  Result := kGetFieldSQL( Texto, [], vValue, FieldName, IniciarTransacao);
  if Result then
    Value := StrToInt( VarToStr(vValue));
end;  // function kGetFieldSQL

function kGetFieldSQL( const Texto: String; const ParamList: Array of Variant;
  var Value: Currency; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean;
var
  vValue: Variant;
begin
  Result := kGetFieldSQL( Texto, ParamList, vValue, FieldName, IniciarTransacao);
  if Result then
    if vValue = Null then
      Value := 0.00
    else
      Value := VarAsType(vValue, varCurrency);
end;  // function kGetFieldSQL

function kGetFieldSQL( const Texto: String;
  var Value: Currency; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean;
begin
  Result := kGetFieldSQL( Texto, [], Value, FieldName, IniciarTransacao);
end;  // function kGetFieldSQL

function kGetFieldSQL( const Texto: String; const ParamList: Array of Variant;
  var Value: TDateTime; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean;
var
  vValue: Variant;
begin
  Result := kGetFieldSQL( Texto, ParamList, vValue, FieldName, IniciarTransacao);
  if Result and not VarIsNull(vValue) then
    Value := VarToDateTime(vValue);
end;  // function kGetFieldSQL

function kGetFieldSQL( const Texto: String;
  var Value: TDateTime; FieldName: String = '';
  const IniciarTransacao: Boolean = True):Boolean;
var
  vValue: Variant;
begin
  Result := kGetFieldSQL( Texto, [], vValue, FieldName, IniciarTransacao);
  if Result then
    Value := VarToDateTime(vValue);
end;  // function kGetFieldSQL


//*******

function kSaveDataSetTxt( DataSet: TDataSet; const FileName: String;
 const Head: Boolean = True; const Separator: String = ';'):Boolean;
var
  i: Integer;
  sLinha: String;
  Text: TextFile;
begin

  AssignFile( Text, FileName);

  try try

    Rewrite(Text);

    with DataSet do
    begin

      if Head then
      begin
        sLinha := Fields[0].FieldName;
        for i := 1 to FieldCount-1 do
          sLinha := sLinha + Separator + Fields[i].FieldName;
        Writeln( Text, sLinha);
      end;

      First;

      while not Eof do
      begin
        sLinha := Fields[0].AsString;
        for i := 1 to FieldCount-1 do
          sLinha := sLinha + Separator + Fields[i].AsString;
        Writeln( Text, sLinha);
        Next;
      end;

    end;

    Result := True;

  except
    Result := False;
  end;
  finally
    CloseFile(Text);
  end;

end;

//{$IFDEF IBX}
function kTrataErro(E: Exception):String;
begin

  Result := '';

//  if not (E is EIBInterBaseError) then
//    Exit;
//
//  case EIBInterBaseError(E).SQLCode of
//  -206: Result := 'Não foi possível efetuar a consulta. Verifique os dados informados.';
//  -913: Result := 'Transação será revertida. Registro em Uso na Rede';
//  -530: Result := 'Violação de Integridade Referencial. Existem outras informações dependentes destas.';
//  -902: Result := 'Você não tem Acesso ao Banco de Dados. Erro Interno, contate o Administrador.';
//  -625: Result := 'Erro de validação de coluna(s). O(s) dado(s) pode(m) ser(em) obrigatório(s) ou estar(em) inválido(s)';
//  -551: Result := 'Você não tem permissão para esta Operação. Contate o Administrador.';
//  -803: Result := 'Chave Primária já existente. Regitro não pode ser duplicado';
//  -832: Result := 'Este resgistro não pode ser excluído porque' + #10 +
//                  'Existem outros que dependem dele e que não foram excluídos';
//  -12203: Result := 'Base de Dados está fora do ar. Favor entrar'+#10+
//                    'em contato com o responsável pela rede na '+ #10+
//                    'localidade selecionada ou tente mais tarde.';
//  -10256 : Result := 'Erro desconhecido do Banco de dados';
//  else
//    Result := '';
//  end;

end;
//{$ENDIF}

function kGetErrorLastSQL: String;
begin
  Result := lErrorLastSQL;
end;

function kSetErrorMessage( View: Boolean):Boolean;
begin
  Result := lErrorMessage;
  lErrorMessage := View;
end;

function kGetDateTime: TDateTime;
var
  dHoje: TDateTime;
  sSGDB: String;
  b: Boolean;
begin

  b := True;
  Result := Now;
  sSGDB := LowerCase(kGetOption('sgdb_name'));

  if (sSGDB = 'firebird') or (sSGDB = 'interbase') then
    b := kGetFieldSQL('SELECT CAST(''NOW'' AS TIMESTAMP) FROM RDB$DATABASE', dHoje)
  else if (sSGDB = 'oracle') then
    b := kGetFieldSQL('SELECT NOW;', dHoje);

  if b then Result := dHoje;

end;

function kCreateQuery(AOwner: TComponent = nil): TADQuery;
begin
  if Assigned(AOwner) then
    Result:= TADQuery.Create( AOwner)
  else
    Result:= TADQuery.Create(nil);

  Result.Connection:= kGetConnection();
end;

function kGetNextId(Tabela, Campo: string): Integer;
var
  Query: TADQuery;
begin
  Result:= 0;
  Query:= kCreateQuery();
  try
    try
      Query.SQL.Text:= Format('select (currval(pg_get_serial_sequence(%s, %s)) + 1) NextId', [QuotedStr(Tabela), QuotedStr(Campo)]);
      Query.Open;
      if not Query.IsEmpty then
        Result:= Query.Fields[0].AsInteger;
    except on e:exception do
      kErro(e, e.Message, '', 'kGetNextId');
    end;
  finally
    FreeAndNil( Query );
  end;
end;

end.
