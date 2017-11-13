{
Projeto FolhaLivre - Folha de Pagamento Livre
Formulário para Pesquisa em um DataSet

Copyright (c) 2002-2005 Allan Lima

Este programa é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

@project-name: FolhaLivre
@project-email: folha_livre@yahoo.com.br
@autor-name: Allan Lima
@autor-email: allan_kardek@yahoo.com.br

Histórico das modificações

* 19/11/2007 - Primeira versão

}

unit fcolor;

{$I flivre.inc}

interface

uses
  {$IFDEF VCL}Graphics{$ENDIF}
  {$IFDEF CLX}QGraphics{$ENDIF};

procedure kSetColor(Cor: TColor); overload;
procedure kSetColor(Cor: String); overload;
function  kGetColor:TColor;

procedure kSetColorProgram(Cor: TColor); overload;
procedure kSetColorProgram(Cor: String); overload;
function  kGetColorProgram:TColor;

procedure kSetColorTitle(Cor: TColor); overload;
procedure kSetColorTitle(Cor: String); overload;
function  kGetColorTitle: TColor;

implementation

var
  cMain: TColor;
  cProgram: TColor;
  cTitle: TColor;

procedure kSetColor(Cor: TColor);
begin
  cMain := Cor;
end;

procedure kSetColor(Cor: String);
begin
  cMain := StringToColor(Cor);
end;

function kGetColor: TColor;
begin
  Result := cMain;
end;

procedure kSetColorProgram(Cor: TColor);
begin
  cProgram := Cor;
end;

procedure kSetColorProgram(Cor: String);
begin
  cProgram := StringToColor(Cor);
end;

function kGetColorProgram: TColor;
begin
  Result := cProgram;
end;

procedure kSetColorTitle(Cor: TColor);
begin
  cTitle := Cor;
end;

procedure kSetColorTitle(Cor: String);
begin
  cTitle := StringToColor(Cor);
end;

function kGetColorTitle: TColor;
begin
  Result := cTitle;
end;

initialization
  cMain := $00E0E9EF;
  cProgram := clTeal;
  cTitle := clBlack;

end.
