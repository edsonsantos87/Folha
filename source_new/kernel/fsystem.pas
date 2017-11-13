{
Projeto FolhaLivre - Folha de Pagamento Livre

Copyright (C) 2002 Allan Lima

Este programa é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.
}

{$IFNDEF NO_FSYSTEM}
unit fsystem;
{$ENDIF}

{$IFNDEF NO_FLIVRE}
{$I flivre.inc}
{$ENDIF}

interface

uses {fdepstr,} {$IFDEF FL_MIDASLIB}Midas,{$ENDIF} DBClient;

{var
  lSystem: TDepStr;}

{procedure kOpenSystem;
procedure kFreeSystem;}
function kGetSystem( Name: String; const Default:String=''):String;
procedure kSetSystem( Name: String; const Value:String);

implementation

uses fdb, ftext;

{procedure kOpenSystem;
var
  DataSet: TClientDataSet;
  sLocal, sChave, sValor: String;
begin

  if not Assigned(lSystem) then
    lSystem := TDepStr.Create
  else
    lSystem.Clear;

  DataSet := TClientDataSet.Create(NIL);

  try

    if kSQLSelectFrom( DataSet, 'SYSTEM', 'ATIVO = 1') then
    begin
      with DataSet do
      begin
        First;
        while not EOF do
        begin
          sLocal := FieldByName('LOCAL').AsString;
          sChave := FieldByName('CHAVE').AsString;
          sValor := FieldByName('VALOR').AsString;
          if (sChave <> '') then
            sLocal := sLocal+'_'+sChave;
          kSetSystem( sLocal, sValor);
          Next;
        end;  // while not EOF
      end;  // with Query
    end;

  finally
    DataSet.Free;
  end;

end;}

{procedure kSetSystem( Name: String; const Value: String);
begin
  if not Assigned(lSystem) then
    lSystem := TDepStr.Create;
  lSystem.SetValue( Name, Value);
end;  // SetSystem}

procedure kSetSystem( Name: String; const Value: String);
var
  sLocal, sChave, sWhere: String;
  iPos: Integer;
begin

  iPos := Pos( '_', Name);

  sLocal := Name;
  sChave := '';

  if (iPos > 0) then
  begin
    sLocal := Copy( Name, 1, iPos-1);
    sChave := Copy( Name, iPos+1, Length(Name));
  end;

  sWhere := 'WHERE LOCAL = :LOCAL AND CHAVE = :CHAVE';

  if (kCountSQL('SELECT COUNT(*) FROM SYSTEM'#13+sWhere, [sLocal, sChave]) = 0) then
    kExecSQL('INSERT INTO SYSTEM (LOCAL, CHAVE, VALOR, ATIVO)'#13+
             'VALUES (:LOCAL, :CHAVE, :VALOR, 1)', [sLocal, sChave, Value])
  else
    kExecSQL('UPDATE SYSTEM SET VALOR = :VALOR'#13+sWhere, [Value, sLocal, sChave]);

end;  // SetSystem

function kGetSystem( Name: String; const Default:String=''):String;
var
  sLocal, sChave, sWhere: String;
  i, iPos: Integer;
begin

  Result := Default;

  iPos := 0;
  for i := Length(Name) downto 1 do
    if Name[i] = '_' then
    begin
      iPos := i;
      Break;
    end;

  sLocal := Name;
  sChave := '';

  if (iPos > 0) then
  begin
    sLocal := Copy( Name, 1, iPos-1);
    sChave := Copy( Name, iPos+1, Length(Name));
  end;

  sWhere := 'WHERE LOCAL = :LOCAL AND CHAVE = :CHAVE AND ATIVO = 1';

  if (kCountSQL('SELECT COUNT(*) FROM SYSTEM '+sWhere, [sLocal, sChave]) = 0) then
    Exit;

  kGetFieldSQL('SELECT VALOR FROM SYSTEM '+sWhere, [sLocal, sChave], Result);

end;  // GetSystem

{procedure kFreeSystem;
begin
  lSystem.Free;
end;  // procedure FreeSystem}

end.
