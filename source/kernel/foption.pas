{
Projeto FolhaLivre - Folha de Pagamento Livre

Copyright (C) 2007 Allan Lima

Este programa é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.
}

unit foption;

interface

uses Classes;

procedure kSetOption( OptionName: String; const OptionValue: String);
function kGetOption( OptionName: String; const Default:String=''):String;

implementation

var
  lOptions: TStringList;

procedure kSetOption( OptionName: String; const OptionValue: String);
begin
  lOptions.Values[OptionName] := OptionValue;
end;  // kSetOption

function kGetOption( OptionName: String; const Default:String=''):String;
begin
  Result := Default;
  if lOptions.IndexOfName(OptionName) > -1 then
    Result := lOptions.Values[OptionName];
end;  // kGetOption

initialization
  lOptions := TStringList.Create;

finalization
  lOptions.Free;

end.
