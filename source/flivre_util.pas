{
Projeto FolhaLivre - Folha de Pagamento Livre
Copyright (c) 2007 Allan Lima

O FolhaLivre é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

Histórico das alterações

* 19/11/2007 - Primeira versao

}

unit flivre_util;

interface

  TInfo = class
  private
    TEmpresa: Integer;
    TFolha: Integer;
    TGrupoEmpresa: Integer;
    TGrupoPagamento: Integer;
  protected
  public
    property Empresa: Integer read TEmpresa write TEmpresa;
    property Folha: Integer read TFolha write TFolha;
    property GrupoEmpresa: Integer read TGrupoEmpresa write TGrupoEmpresa;
    property GrupoPagamento: Integer read TGrupoPagamento write TGrupoPagamento;
  end;

var
  vInfo: TInfoFolhaLivre;

implementation

initialization
  vInfo :=

finalization


end.
