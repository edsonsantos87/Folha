{
Projeto FolhaLivre - Folha de Pagamento Livre
Copyright (c) 2002-2007, Allan Lima, Belém-Pará-Brasil.

Este programa é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

@file-name: fupgrade.pas
Histórico das modificações

* 17/12/2007 - Adicionado o campo "IDNATUREZA" na tabela "FUNCIONARIO"
* 09/09/2007 - Novos campos para a Tabela "F_LOTACAO"
* 04/09/2007 - Novos campos para a Tabela "FUNCIONARIO"
* 17/07/2007 - Tabela Lotação
* 03/04/2007 - Eventos Programados
* 03/03/2007 - Campo "tipo_salario" da tabela "F_EVENTO"
* 09/09/2006 - Tabela de Feriados
* 10/07/2005 - Campo "complementar" da tabela "F_EVENTO"
* 19/06/2005 - Folha complementar x Folhas Bases

}

unit fupgrade;

{$I flivre.inc}

interface

uses Classes, SysUtils;

procedure UpgradeVersion;

implementation

uses ftext, fdb, fsuporte, DateUtils, DB,
     {$IFDEF FL_MIDASLIB}MidasLib,{$ENDIF} DBClient, Math;

procedure UpgradeVersion;
var
  _upgrade, _erro: Boolean;
  SQL: TStringList;
  sUpdate, sValue: String;
  DataSet1: TClientDataSet;
begin

  if not kConfirme('A atualização do sistema é um procedimento complexo.'#13+
                   'Prossiga somente se tiver certeza. Confirme?') then
    Exit;

  SQL      := TStringList.Create;
  _erro    := False;
  _upgrade := False;
  sUpdate := '';

  try try

    // 1.0

    if not kExistDomain('D_VALOR') then
    begin

      if not kExecSQL( 'CREATE DOMAIN D_VALOR AS'#13+
                       'CHAR(1) CHARACTER SET NONE DEFAULT ''1'''#13+
                       'CHECK (VALUE IN (''I'',''C'',''R'',''T''))'#13+
                       'COLLATE NONE') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o domínio D_VALOR';
      _upgrade := True;

    end;

    SQL.BeginUpdate;
    SQL.Clear;
    SQL.Add('SELECT RDB$FIELD_SOURCE');
    SQL.Add('FROM RDB$RELATION_FIELDS');
    SQL.Add('WHERE (RDB$FIELD_NAME = ''LIQUIDO'') AND');
    SQL.Add('      (RDB$RELATION_NAME = ''F_CENTRAL'')');
    SQL.EndUpdate;

    if kGetFieldSQL( SQL.Text, sValue) and (sValue = 'ORDEM') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('UPDATE RDB$RELATION_FIELDS');
      SQL.Add('SET RDB$FIELD_SOURCE = ''REFERENCIA''');
      SQL.Add('WHERE (RDB$FIELD_NAME = ''LIQUIDO'') AND');
      SQL.Add('(RDB$RELATION_NAME = ''F_CENTRAL'')');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Modificado o campo LIQUIDO da tabela F_CENTRAL';
      _upgrade := True;

    end;

    if not kExistTable('F_BASE') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_BASE (');
      SQL.Add('    IDGE            ID NOT NULL,');
      SQL.Add('    IDBASE          ID NOT NULL,');
      SQL.Add('    NOME            NOME,');
      SQL.Add('    CALCULO         ID_CHAR,');
      SQL.Add('    VALOR           D_VALOR,');
      SQL.Add('    CICLO           ORDEM,');
      SQL.Add('    REGIME          ID_CHAR,');
      SQL.Add('    MES_INICIAL     ORDEM,');
      SQL.Add('    COMPETENCIA_13  ID_CHAR,');
      SQL.Add('    MES_SEM_VALOR   ID_CHAR )');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação da tabela F_BASE';
      _upgrade := True;

    end; // F_BASE

    if kExistTable('F_BASE') and not kExistIndice( 'PK_F_BASE') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_BASE');
      SQL.Add('ADD CONSTRAINT PK_F_BASE');
      SQL.Add('PRIMARY KEY (IDGE, IDBASE)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave primária PK_F_BASE';
      _upgrade := True;

    end;  // FK_F_BASE

    if not kExistTable('F_BASE_FOLHA') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_BASE_FOLHA (');
      SQL.Add('    IDGE            ID NOT NULL,');
      SQL.Add('    IDBASE          ID NOT NULL,');
      SQL.Add('    IDFOLHA_TIPO    ID_CHAR NOT NULL )');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação da tabela F_BASE_FOLHA';
      _upgrade := True;

    end; // F_BASE_FOLHA

    if kExistTable('F_BASE_FOLHA') and not kExistIndice( 'PK_F_BASE_FOLHA') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_BASE_FOLHA');
      SQL.Add('ADD CONSTRAINT PK_F_BASE_FOLHA');
      SQL.Add('PRIMARY KEY (IDGE, IDBASE, IDFOLHA_TIPO)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave primária PK_F_BASE_FOLHA';
      _upgrade := True;

    end;  // PK_F_BASE_FOLHA

    if kExistTable('F_BASE_FOLHA') and not kExistIndice( 'FK_F_BASE_FOLHA') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_BASE_FOLHA');
      SQL.Add('ADD CONSTRAINT FK_F_BASE_FOLHA');
      SQL.Add('FOREIGN KEY (IDGE, IDBASE)');
      SQL.Add('REFERENCES F_BASE (IDGE, IDBASE)');
      SQL.Add('ON DELETE CASCADE');
      SQL.Add('ON UPDATE CASCADE');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave estrangeira FK_F_BASE_FOLHA';
      _upgrade := True;

    end;  // FK_F_BASE_FOLHA

    if kExistTable('F_BASE_FOLHA') and not kExistIndice( 'FK_F_BASE_FOLHA_TIPO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_BASE_FOLHA');
      SQL.Add('ADD CONSTRAINT FK_F_BASE_FOLHA_TIPO');
      SQL.Add('FOREIGN KEY (IDFOLHA_TIPO)');
      SQL.Add('REFERENCES F_FOLHA_TIPO (IDFOLHA_TIPO)');
      SQL.Add('ON UPDATE CASCADE');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave estrangeira FK_F_BASE_FOLHA_TIPO';
      _upgrade := True;

    end;  // FK_F_BASE_FOLHA_TIPO

    if not kExistTable('F_BASE_EVENTO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_BASE_EVENTO (');
      SQL.Add('    IDGE            ID NOT NULL,');
      SQL.Add('    IDBASE          ID NOT NULL,');
      SQL.Add('    IDEVENTO        ID NOT NULL,');
      SQL.Add('    REFERENCIA      REFERENCIA )');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação da tabela F_BASE_EVENTO';
      _upgrade := True;

    end; // F_BASE_EVENTO

    if kExistTable('F_BASE_EVENTO') and not kExistIndice( 'PK_F_BASE_EVENTO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_BASE_EVENTO');
      SQL.Add('ADD CONSTRAINT PK_F_BASE_EVENTO');
      SQL.Add('PRIMARY KEY (IDGE, IDBASE, IDEVENTO)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave primária PK_F_BASE_EVENTO';
      _upgrade := True;

    end;  // PK_F_BASE_FOLHA

    if kExistTable('F_BASE_EVENTO') and not kExistIndice( 'FK_F_BASE_EVENTO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_BASE_EVENTO');
      SQL.Add('ADD CONSTRAINT FK_F_BASE_EVENTO');
      SQL.Add('FOREIGN KEY (IDGE, IDBASE)');
      SQL.Add('REFERENCES F_BASE (IDGE, IDBASE)');
      SQL.Add('ON DELETE CASCADE');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave estrangeira FK_F_BASE_EVENTO';
      _upgrade := True;

    end;  // FK_F_BASE_EVENTO

    if kExistTable('F_BASE_EVENTO') and not kExistIndice( 'FK_F_BASE_EVENTO_2') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_BASE_EVENTO');
      SQL.Add('ADD CONSTRAINT FK_F_BASE_EVENTO_2');
      SQL.Add('FOREIGN KEY (IDEVENTO)');
      SQL.Add('REFERENCES F_EVENTO (IDEVENTO)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave estrangeira FK_F_BASE_EVENTO_2';
      _upgrade := True;

    end;  // FK_F_BASE_EVENTO_2

    if not kExistProcedure('SP_BASE') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE PROCEDURE SP_BASE');
      SQL.Add('RETURNS (');
      SQL.Add('    IDGE INTEGER,');
      SQL.Add('    IDBASE INTEGER,');
      SQL.Add('    NOME VARCHAR(30),');
      SQL.Add('    CALCULO VARCHAR(10),');
      SQL.Add('    VALOR VARCHAR(10),');
      SQL.Add('    TIPOS INTEGER,');
      SQL.Add('    EVENTOS INTEGER,');
      SQL.Add('    GE VARCHAR(30) )');
      SQL.Add('AS');
      SQL.Add('begin');
      SQL.Add('');
      SQL.Add('  FOR');
      SQL.Add('    SELECT');
      SQL.Add('      B.IDGE, B.IDBASE, B.NOME, B.CALCULO, B.VALOR,');
      SQL.Add('      (SELECT COUNT(*) FROM F_BASE_FOLHA');
      SQL.Add('       WHERE IDGE = B.IDGE AND IDBASE = B.IDBASE) AS TIPOS,');
      SQL.Add('      (SELECT COUNT(*) FROM F_BASE_EVENTO');
      SQL.Add('       WHERE IDGE = B.IDGE AND IDBASE = B.IDBASE) AS EVENTOS,');
      SQL.Add('       GE.NOME AS GE');
      SQL.Add('    FROM');
      SQL.Add('      F_BASE B, F_GRUPO_EMPRESA GE');
      SQL.Add('    WHERE');
      SQL.Add('      GE.IDGE = B.IDGE');
      SQL.Add('    INTO');
      SQL.Add('      :IDGE, :IDBASE, :NOME, :CALCULO, :VALOR, :TIPOS, :EVENTOS, :GE');
      SQL.Add('  DO BEGIN');
      SQL.Add('');
      SQL.Add('    if (:calculo = ''A'') then calculo = ''Acumulado'';');
      SQL.Add('    if (:calculo = ''Q'') then calculo = ''Contagem'';');
      SQL.Add('    if (:calculo = ''M'') then calculo = ''Média'';');
      SQL.Add('    if (:calculo = ''X'') then calculo = ''Máximo'';');
      SQL.Add('    if (:calculo = ''N'') then calculo = ''Mínimo'';');
      SQL.Add('');
      SQL.Add('    if (:valor = ''C'') then valor = ''Calculado'';');
      SQL.Add('    if (:valor = ''I'') then valor = ''Informado'';');
      SQL.Add('    if (:valor = ''R'') then valor = ''Referência'';');
      SQL.Add('    if (:valor = ''T'') then valor = ''Totalizado'';');
      SQL.Add('');
      SQL.Add('    SUSPEND;');
      SQL.Add('');
      SQL.Add('  END');
      SQL.Add('');
      SQL.Add('end');

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado a Store Procedure SP_BASE';
      _upgrade := True;

    end;

    // versão 1.1

    { Tabela F_FOLHA_TIPO_SITUACAO }

    if not kExistTable('F_FOLHA_TIPO_SITUACAO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_FOLHA_TIPO_SITUACAO (');
      SQL.Add('   IDFOLHA_TIPO  ID_CHAR NOT NULL,');
      SQL.Add('   IDSITUACAO    SITUACAO NOT NULL)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13#13 + '- Criação da tabela F_FOLHA_TIPO_SITUACAO';
      _upgrade := True;

    end; // F_FOLHA_TIPO_SITUACAO

    if kExistTable('F_FOLHA_TIPO_SITUACAO') and not kExistIndice('PK_F_FOLHA_TIPO_SITUACAO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_FOLHA_TIPO_SITUACAO');
      SQL.Add('ADD CONSTRAINT PK_F_FOLHA_TIPO_SITUACAO');
      SQL.Add('PRIMARY KEY (IDFOLHA_TIPO, IDSITUACAO)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave primária PK_F_FOLHA_TIPO_SITUACAO';
      _upgrade := True;

    end;  // PK_F_FOLHA_TIPO_SITUACAO

    if kExistTable('F_FOLHA_TIPO_SITUACAO') and not kExistIndice('FK_F_FOLHA_TIPO_SITUACAO_S') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_FOLHA_TIPO_SITUACAO');
      SQL.Add('ADD CONSTRAINT FK_F_FOLHA_TIPO_SITUACAO_S');
      SQL.Add('FOREIGN KEY (IDSITUACAO) REFERENCES F_SITUACAO (IDSITUACAO)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave estrangeira FK_F_FOLHA_TIPO_SITUACAO_S';
      _upgrade := True;

    end;  // FK_F_FOLHA_TIPO_SITUACAO_S

    if kExistTable('F_FOLHA_TIPO_SITUACAO') and not kExistIndice('FK_F_FOLHA_TIPO_SITUACAO_T') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_FOLHA_TIPO_SITUACAO');
      SQL.Add('ADD CONSTRAINT FK_F_FOLHA_TIPO_SITUACAO_T');
      SQL.Add('FOREIGN KEY (IDFOLHA_TIPO) REFERENCES F_FOLHA_TIPO (IDFOLHA_TIPO)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave estrangeira FK_F_FOLHA_TIPO_SITUACAO_T';
      _upgrade := True;

    end;  // FK_F_FOLHA_TIPO_SITUACAO_T

    if kExistField('FUNCIONARIO', 'IDCAGED_DEMISSAO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE FUNCIONARIO DROP IDCAGED_DEMISSAO');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Exclusão do campo "IDCAGED_DEMISSÃO" da tabela "FUNCIONARIO"';
      _upgrade := True;

    end;

    if kExistField('F_RESCISAO', 'CAGED') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_RESCISAO DROP CAGED');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Exclusão do campo "CAGED" da tabela "F_RESCISAO"';
      _upgrade := True;

    end;

    { Tabela F_RESCISAO_CONTRATO }

    if not kExistTable('F_RESCISAO_CONTRATO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_RESCISAO_CONTRATO (');
      SQL.Add('    IDEMPRESA          ID NOT NULL,');
      SQL.Add('    IDFUNCIONARIO      ID NOT NULL,');
      SQL.Add('    DEMISSAO           SMALL_DATE,');
      SQL.Add('    REMUNERACAO        NUMERO,');
      SQL.Add('    AVISO_PREVIO_X     LOGICO,');
      SQL.Add('    AVISO_PREVIO_DATA  SMALL_DATE,');
      SQL.Add('    IDRESCISAO         SITUACAO,');
      SQL.Add('    IDCAGED            SITUACAO NOT NULL,');
      SQL.Add('    IDFOLHA            ID NOT NULL)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13#13 + '- Criação da tabela "F_RESCISAO_CONTRATO"';
      _upgrade := True;

    end;

    if kExistTable('F_RESCISAO_CONTRATO') and not kExistIndice('PK_F_RESCISAO_CONTRATO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_RESCISAO_CONTRATO');
      SQL.Add('ADD CONSTRAINT PK_F_RESCISAO_CONTRATO');
      SQL.Add('PRIMARY KEY (IDEMPRESA, IDFUNCIONARIO)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do indíce primário "PK_F_RESCISAO_CONTRATO"';
      _upgrade := True;

    end;

    if kExistTable('F_RESCISAO_CONTRATO') and not kExistIndice('FK_F_RESCISAO_CONTRATO_FO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_RESCISAO_CONTRATO');
      SQL.Add('ADD CONSTRAINT FK_F_RESCISAO_CONTRATO_FO');
      SQL.Add('FOREIGN KEY (IDEMPRESA, IDFOLHA) REFERENCES F_FOLHA (IDEMPRESA, IDFOLHA)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do indíce estrangeiro "FK_F_RESCISAO_CONTRATO_FO"';
      _upgrade := True;

    end;

    if kExistTable('F_RESCISAO_CONTRATO') and not kExistIndice('FK_F_RESCISAO_CONTRATO_FU') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_RESCISAO_CONTRATO');
      SQL.Add('ADD CONSTRAINT FK_F_RESCISAO_CONTRATO_FU');
      SQL.Add('FOREIGN KEY (IDEMPRESA, IDFUNCIONARIO) REFERENCES FUNCIONARIO (IDEMPRESA, IDFUNCIONARIO)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do indíce estrangeiro "FK_F_RESCISAO_CONTRATO_FU"';
      _upgrade := True;

    end;

    { Tabela F_RESCISAO_EVENTO }

    if not kExistTable('F_RESCISAO_EVENTO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_RESCISAO_EVENTO (');
      SQL.Add('    IDGP          ID NOT NULL,');
      SQL.Add('    IDSINDICATO   ID NOT NULL,');
      SQL.Add('    IDRESCISAO    SITUACAO NOT NULL,');
      SQL.Add('    IDEVENTO      ID NOT NULL,');
      SQL.Add('    IDFORMULA     ID,');
      SQL.Add('    MES_DIREITO   ORDEM,');
      SQL.Add('    INFORMACAO_X  LOGICO NOT NULL)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13#13 + '- Criação da tabela "F_RESCISAO_EVENTO"';
      _upgrade := True;

    end;

    if kExistTable('F_RESCISAO_EVENTO') and not kExistIndice('PK_F_RESCISAO_EVENTO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_RESCISAO_EVENTO');
      SQL.Add('ADD CONSTRAINT PK_F_RESCISAO_EVENTO');
      SQL.Add('PRIMARY KEY (IDGP, IDSINDICATO, IDRESCISAO, IDEVENTO)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do indíce primário "PK_F_RESCISAO_EVENTO"';
      _upgrade := True;

    end;

    if kExistTable('F_RESCISAO_EVENTO') and not kExistIndice('FK_F_RESCISAO_EVENTO_EV') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_RESCISAO_EVENTO');
      SQL.Add('ADD CONSTRAINT FK_F_RESCISAO_EVENTO_EV');
      SQL.Add('FOREIGN KEY (IDEVENTO) REFERENCES F_EVENTO (IDEVENTO)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do indíce estrangeiro "FK_F_RESCISAO_EVENTO_EV"';
      _upgrade := True;

    end;

    if kExistTable('F_RESCISAO_EVENTO') and not kExistIndice('FK_F_RESCISAO_EVENTO_FO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_RESCISAO_EVENTO');
      SQL.Add('ADD CONSTRAINT FK_F_RESCISAO_EVENTO_FO');
      SQL.Add('FOREIGN KEY (IDFORMULA) REFERENCES F_FORMULA (IDFORMULA)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do indíce estrangeiro "FK_F_RESCISAO_EVENTO_FO"';
      _upgrade := True;

    end;

    if kExistTable('F_RESCISAO_EVENTO') and not kExistIndice('FK_F_RESCISAO_EVENTO_RE') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_RESCISAO_EVENTO');
      SQL.Add('ADD CONSTRAINT FK_F_RESCISAO_EVENTO_RE');
      SQL.Add('FOREIGN KEY (IDRESCISAO) REFERENCES F_RESCISAO (IDRESCISAO)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do indíce estrangeiro "FK_F_RESCISAO_EVENTO_RE"';
      _upgrade := True;

    end;

    if kExistTable('F_RESCISAO_EVENTO') and not kExistIndice('FK_F_RESCISAO_EVENTO_SI') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_RESCISAO_EVENTO');
      SQL.Add('ADD CONSTRAINT FK_F_RESCISAO_EVENTO_SI');
      SQL.Add('FOREIGN KEY (IDSINDICATO) REFERENCES F_SINDICATO (IDSINDICATO)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do indíce estrangeiro "FK_F_RESCISAO_EVENTO_SI"';
      _upgrade := True;

    end;

    // versão 1.2

    { Tabela F_FOLHA_BASE }

    if not kExistTable('F_FOLHA_BASE') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_FOLHA_BASE (');
      SQL.Add('   IDEMPRESA     ID NOT NULL,');
      SQL.Add('   IDFOLHA       ID NOT NULL,');
      SQL.Add('   IDFOLHA_BASE  ID NOT NULL)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13#13 + '- Criação da tabela F_FOLHA_BASE';
      _upgrade := True;

    end; // F_FOLHA_BASE

    if kExistTable('F_FOLHA_BASE') and not kExistIndice('PK_F_FOLHA_BASE') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_FOLHA_BASE');
      SQL.Add('ADD CONSTRAINT PK_F_FOLHA_BASE');
      SQL.Add('PRIMARY KEY (IDEMPRESA, IDFOLHA, IDFOLHA_BASE)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave primária PK_F_FOLHA_BASE';
      _upgrade := True;

    end;  // PK_F_FOLHA_BASE

    if kExistTable('F_FOLHA_BASE') and not kExistIndice('FK_F_FOLHA_BASE') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_FOLHA_BASE');
      SQL.Add('ADD CONSTRAINT FK_F_FOLHA_BASE');
      SQL.Add('FOREIGN KEY (IDEMPRESA, IDFOLHA_BASE)');
      SQL.Add('REFERENCES F_FOLHA (IDEMPRESA, IDFOLHA)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave estrangeira FK_F_FOLHA_BASE';
      _upgrade := True;

    end;  // FK_F_FOLHA_BASE

    if kExistTable('F_FOLHA_BASE') and not kExistIndice('FK_F_FOLHA_BASE_FOLHA') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_FOLHA_BASE');
      SQL.Add('ADD CONSTRAINT FK_F_FOLHA_BASE_FOLHA');
      SQL.Add('FOREIGN KEY (IDEMPRESA, IDFOLHA)');
      SQL.Add('REFERENCES F_FOLHA (IDEMPRESA, IDFOLHA)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave estrangeira FK_F_FOLHA_BASE_FOLHA';
      _upgrade := True;

    end;  // FK_F_FOLHA_BASE

    if not kExistField('F_FOLHA','COMPLEMENTAR_X') then
    begin

      if not kExecSQL('ALTER TABLE F_FOLHA ADD COMPLEMENTAR_X LOGICO') then
        raise Exception.Create('');

      if not kExecSQL('UPDATE F_FOLHA SET COMPLEMENTAR_X = 0') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "COMPLEMENTAR_X" na tabela "F_FOLHA"';
      _upgrade := True;

    end;  // Field COMPLEMENTAR_X

    if not kExistField('F_EVENTO','COMPLEMENTAR') then
    begin

      if not kExecSQL('ALTER TABLE F_EVENTO ADD COMPLEMENTAR ORDEM') then
        raise Exception.Create('');

      if not kExecSQL('UPDATE F_EVENTO SET COMPLEMENTAR = 0') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "COMPLEMENTAR" na tabela "F_EVENTO"';
      _upgrade := True;

    end;  // Field COMPLEMENTAR

    // versão 1.3

    { Tabela FERIADO }

    if not kExistTable('FERIADO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE FERIADO (');
      SQL.Add('   DATA       SMALL_DATE NOT NULL,');
      SQL.Add('   DESCRICAO  DESCRICAO NOT NULL)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13#13 + '- Criação da tabela FERIADO';
      _upgrade := True;

    end; // FERIADO

    if kExistTable('FERIADO') and not kExistIndice('PK_FERIADO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE FERIADO');
      SQL.Add('ADD CONSTRAINT PK_FERIADO');
      SQL.Add('PRIMARY KEY (DATA)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave primária PK_FERIADO';
      _upgrade := True;

    end;  // PK_FERIADO

    if kExistTable('FERIADO') and (kCountSQL('FERIADO', '') = 0) then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO FERIADO');
      SQL.Add('(DATA, DESCRICAO) VALUES (:DATA, :NOME)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text, [EncodeDate(YearOf(Date), 1, 1),
                                 'Confraternização Universal']) then Exit;

      if not kExecSQL(SQL.Text, [EncodeDate(YearOf(Date), 4, 21),
                                 'Tiradentes']) then Exit;

      if not kExecSQL(SQL.Text, [EncodeDate(YearOf(Date), 5, 1),
                                 'Dia do Trabalho']) then Exit;

      if not kExecSQL(SQL.Text, [EncodeDate(YearOf(Date), 9, 7),
                                 'Dia da Pátria']) then Exit;

      if not kExecSQL(SQL.Text, [EncodeDate(YearOf(Date), 10, 12),
                                 'Nossa Senhora de Aparecida']) then Exit;

      if not kExecSQL(SQL.Text, [EncodeDate(YearOf(Date), 11, 2),
                                 'Finados']) then Exit;

      if not kExecSQL(SQL.Text, [EncodeDate(YearOf(Date), 11, 15),
                                 'Proclamação da República']) then Exit;

      if not kExecSQL(SQL.Text, [EncodeDate(YearOf(Date), 12, 25),
                                 'Natal']) then Exit;

      sUpdate  := sUpdate + #13 + '- Cadastro dos principais feriados';
      _upgrade := True;

    end;  // PK_FERIADO

    // versão 1.4

    if not kExistField('F_EVENTO','TIPO_SALARIO') then
    begin

      if not kExecSQL('ALTER TABLE F_EVENTO ADD TIPO_SALARIO ID_CHAR') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "TIPO_SALARIO" na tabela "F_EVENTO"';
      _upgrade := True;

    end;  // TIPO_SALARIO

    if not kExistTable('F_PROGRAMADO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_PROGRAMADO (');
      SQL.Add('     IDEMPRESA      ID NOT NULL,');
      SQL.Add('     IDFUNCIONARIO  ID NOT NULL,');
      SQL.Add('     ID             ID NOT NULL,');
      SQL.Add('     IDFOLHA_TIPO   ID_CHAR NOT NULL,');
      SQL.Add('     IDEVENTO       ID NOT NULL,');
      SQL.Add('     INFORMADO      NUMERO NOT NULL,');
      SQL.Add('     INICIO         SMALL_DATE NOT NULL,');
      SQL.Add('     TERMINO        SMALL_DATE NOT NULL,');
      SQL.Add('     SUSPENSO_X     LOGICO NOT NULL)');
      SQL.EndUpdate;

      if not kExecSQL( SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação da tabela F_PROGRAMADO';
      _upgrade := True;

    end;

    if kExistTable('F_PROGRAMADO') and not kExistIndice('PK_F_PROGRAMADO') then
    begin

      if not kExecSQL('ALTER TABLE F_PROGRAMADO ADD CONSTRAINT PK_F_PROGRAMADO PRIMARY KEY (IDEMPRESA, IDFUNCIONARIO, ID)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave primária PK_F_PROGRAMADO';
      _upgrade := True;

    end;

    if kExistTable('F_PROGRAMADO') and not kExistIndice('FK_F_PROGRAMADO_EVENTO') then
    begin

      if not kExecSQL('ALTER TABLE F_PROGRAMADO ADD CONSTRAINT FK_F_PROGRAMADO_EVENTO FOREIGN KEY (IDEVENTO) REFERENCES F_EVENTO (IDEVENTO)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave secundária FK_F_PROGRAMADO_EVENTO';
      _upgrade := True;

    end;

    if kExistTable('F_PROGRAMADO') and not kExistIndice('FK_F_PROGRAMADO_FUNCIONARIO') then
    begin

      if not kExecSQL('ALTER TABLE F_PROGRAMADO ADD CONSTRAINT FK_F_PROGRAMADO_FUNCIONARIO FOREIGN KEY (IDEMPRESA, IDFUNCIONARIO) REFERENCES FUNCIONARIO (IDEMPRESA, IDFUNCIONARIO)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave secundária FK_F_PROGRAMADO_FUNCIONARIO';
      _upgrade := True;

    end;

    if kExistTable('F_PROGRAMADO') and not kExistIndice('FK_F_PROGRAMADO_TF') then
    begin

      if not kExecSQL('ALTER TABLE F_PROGRAMADO ADD CONSTRAINT FK_F_PROGRAMADO_TF FOREIGN KEY (IDFOLHA_TIPO) REFERENCES F_FOLHA_TIPO (IDFOLHA_TIPO)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave secundária FK_F_PROGRAMADO_TF';
      _upgrade := True;

    end;

    // versao 1.5

    if kExistIndice('FK_FUNCIONARIO_AGENCIA') then
    begin

      if not kExecSQL('ALTER TABLE FUNCIONARIO'#13+
                      'DROP CONSTRAINT FK_FUNCIONARIO_AGENCIA') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Excluído o indice FK_FUNCIONARIO_AGENCIA';
      _upgrade := True;

    end;

    // versao 1.5

    if (kCountSQL('SELECT RDB$FIELD_LENGTH FROM RDB$FIELDS'#13+
                  'WHERE RDB$FIELD_NAME = :NAME', ['AGENCIA']) = 4) then
    begin

      if kExistIndice('PK_AGENCIA') then
        if not kExecSQL('ALTER TABLE AGENCIA DROP CONSTRAINT PK_AGENCIA') then
          raise Exception.Create('');

      if not kExecSQL('ALTER DOMAIN AGENCIA TYPE CHAR(5)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Corrigido o tamanho do campo IDAGENCIA';
      _upgrade := True;

      kExecSQL('UPDATE AGENCIA SET IDAGENCIA = ''00000'' WHERE IDAGENCIA = ''0000''');
      kExecSQL('UPDATE FUNCIONARIO SET IDAGENCIA = ''00000'' WHERE IDAGENCIA = ''0000''');

    end;

    // versao 1.5

    if kExistField('F_LOTACAO','CODIGO') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO DROP CODIGO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Removido o campo "CODIGO" da tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','TIPO') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD TIPO ID_CHAR') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "TIPO" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistIndice('PK_AGENCIA') then
        if not kExecSQL('ALTER TABLE AGENCIA ADD CONSTRAINT PK_AGENCIA PRIMARY KEY (IDBANCO,IDAGENCIA)') then
          raise Exception.Create('');

    // versao 1.5

    if not kExistField('F_LOTACAO','DEPARTAMENTO') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD DEPARTAMENTO ID') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "DEPARTAMENTO" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','SETOR') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD SETOR ID') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "SETOR" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','SECAO') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD SECAO ID') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "SECAO" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','RESPONSAVEL') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD RESPONSAVEL NOME') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "RESPONSAVEL" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','ENDERECO') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD ENDERECO ENDERECO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "ENDERECO" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','CEP') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD CEP CEP') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "CEP" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','BAIRRO') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD BAIRRO DESCRICAO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "BAIRRO" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','CIDADE') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD CIDADE DESCRICAO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "CIDADE" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','TELEFONE') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD TELEFONE TELEFONE') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "TELEFONE" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','FAX') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD FAX TELEFONE') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "FAX" na tabela "F_LOTACAO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_LOTACAO','ATIVO_X') then
    begin

      if not kExecSQL('ALTER TABLE F_LOTACAO ADD ATIVO_X LOGICO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "ATIVO_X" na tabela "F_LOTACAO"';
      _upgrade := True;

      if not kExecSQL('UPDATE F_LOTACAO SET ATIVO_X = 1') then
        raise Exception.Create('');

    end;

    // versão 1.5

    if not kExistDomain('NATUREZA') then
    begin

      if not kExecSQL( 'CREATE DOMAIN NATUREZA AS CHAR(4)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o domínio NATUREZA';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistTable('F_NATUREZA_RENDIMENTO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_NATUREZA_RENDIMENTO (');
      SQL.Add('    IDNATUREZA   NATUREZA NOT NULL,');
      SQL.Add('    NATUREZA     NOME NOT NULL)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação da tabela F_NATUREZA_RENDIMENTO';
      _upgrade := True;

      if not kExecSQL('INSERT INTO F_NATUREZA_RENDIMENTO VALUES(:CODIGO,:NOME)',
                      ['0561','TRABALHO ASSALARIADO']) then
        raise Exception.Create('');

    end;  // F_NATUREZA_EVENTO

    // versao 1.5

    if not kExistIndice('PK_F_NATUREZA_RENDIMENTO') then
    begin

      if not kExecSQL('ALTER TABLE F_NATUREZA_RENDIMENTO'+sLineBreak+
                      'ADD CONSTRAINT PK_F_NATUREZA_RENDIMENTO'+sLineBreak+
                      'PRIMARY KEY (IDNATUREZA);') then
         raise Exception.Create('');

      sUpdate := sUpdate + #13 + '- Adicionado chave primária de F_NATUREZA_RENDIMENTO';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('FUNCIONARIO','IDNATUREZA') then
    begin

      if not kExecSQL('ALTER TABLE FUNCIONARIO ADD IDNATUREZA NATUREZA NOT NULL') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "IDNATUREZA" na tabela "FUNCIONARIO"';
      _upgrade := True;

      if not kExecSQL('UPDATE FUNCIONARIO SET IDNATUREZA = :N', ['0561']) then
        raise Exception.Create('');

    end;

    // versao 1.5

    if kExistField('FUNCIONARIO','IDNATUREZA') and
       kExistTable('F_NATUREZA_RENDIMENTO') and (not kExistIndice('FK_FUNCIONARIO_NATUREZA')) then
    begin

      if not kExecSQL('ALTER TABLE FUNCIONARIO ADD CONSTRAINT FK_FUNCIONARIO_NATUREZA FOREIGN KEY (IDNATUREZA) REFERENCES F_NATUREZA_RENDIMENTO (IDNATUREZA)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação de chave estrangeira FK_FUNCIONARIO_NATUREZA';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistDomain('DOCUMENTO') then
    begin

      if not kExecSQL( 'CREATE DOMAIN DOCUMENTO AS VARCHAR(10)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o domínio DOCUMENTO';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('PESSOA','RG_ORGAO') then
    begin

      if not kExecSQL('ALTER TABLE PESSOA ADD RG_ORGAO DOCUMENTO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "RG_ORGAO" na tabela "PESSOA"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('PESSOA','RG_EMISSAO') then
    begin

      if not kExecSQL('ALTER TABLE PESSOA ADD RG_EMISSAO SMALL_DATE') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "RG_EMISSAO" na tabela "PESSOA"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('FUNCIONARIO','CTPS_SERIE') then
    begin

      if not kExecSQL('ALTER TABLE FUNCIONARIO ADD CTPS_SERIE DOCUMENTO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "CTPS_SERIE" na tabela "FUNCIONARIO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('FUNCIONARIO','CTPS_ORGAO') then
    begin

      if not kExecSQL('ALTER TABLE FUNCIONARIO ADD CTPS_ORGAO DOCUMENTO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "CTPS_ORGAO" na tabela "FUNCIONARIO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('FUNCIONARIO','CTPS_EMISSAO') then
    begin

      if not kExecSQL('ALTER TABLE FUNCIONARIO ADD CTPS_EMISSAO SMALL_DATE') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo "CTPS_EMISSAO" na tabela "FUNCIONARIO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistIndice('EMPRESA_CNPJ_IDX','EMPRESA') then
    begin

      if not kExecSQL('UPDATE EMPRESA SET CPF_CGC = NULL WHERE CPF_CGC = ''''') then
        raise Exception.Create('');

      if kCountRowSQL('SELECT CPF_CGC, COUNT(*) FROM EMPRESA'+sLineBreak+
                      'WHERE CPF_CGC IS NOT NULL'+sLineBreak+
                      'GROUP BY 1 HAVING COUNT(*) > 1', []) > 0 then
        raise Exception.Create('Há número de CPF/CNPJ informado para mais de uma empresa.'+sLineBreak+
                               'Corrija o cadastro de empresas e'+sLineBreak+
                               'repita a atualização.');

      if not kExecSQL('CREATE UNIQUE INDEX EMPRESA_CNPJ_IDX ON EMPRESA (CPF_CGC)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criado o índice "EMPRESA_CNPJ_IDX" para a tabela "EMPRESA"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistIndice('SINDICATO_CNPJ_IDX','F_SINDICATO') then
    begin

      if not kExecSQL('UPDATE F_SINDICATO SET CNPJ = NULL WHERE CNPJ = ''''') then
        raise Exception.Create('');

      if kCountRowSQL('SELECT CNPJ, COUNT(*) FROM F_SINDICATO'+sLineBreak+
                      'WHERE CNPJ IS NOT NULL'+sLineBreak+
                      'GROUP BY 1 HAVING COUNT(*) > 1', []) > 0 then
        raise Exception.Create('Há número de CNPJ informado para mais de um sindicato.'+sLineBreak+
                               'Corrija o cadastro de sindicato e'+sLineBreak+
                               'repita a atualização.');

      if not kExecSQL('CREATE UNIQUE INDEX SINDICATO_CNPJ_IDX ON F_SINDICATO (CNPJ)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criado o índice "SINDICATO_CNPJ_IDX" para a tabela "F_SINDICATO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField('F_TOTALIZADOR_EVENTO', 'OPERACAO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_TOTALIZADOR_EVENTO');
      SQL.Add('ADD OPERACAO REFERENCIA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo OPERACAO tabela F_TOTALIZADOR_EVENTO';
      _upgrade := True;

      if not kExecSQL('UPDATE F_TOTALIZADOR_EVENTO SET OPERACAO = 1') then
        raise Exception.Create('');

    end;

    // versao 1.5

    if not kExistTable('F_TOTALIZADOR_INCIDENCIA') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_TOTALIZADOR_INCIDENCIA (');
      SQL.Add('    IDTOTAL      ID NOT NULL,');
      SQL.Add('    IDINCIDENCIA ID NOT NULL,');
      SQL.Add('    PROVENTOS_X LOGICO,');
      SQL.Add('    DESCONTOS_X LOGICO,');
      SQL.Add('    OPERACAO REFERENCIA,');
      SQL.Add('    ATIVO_X LOGICO)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação da tabela F_TOTALIZADOR_INCIDENCIA';
      _upgrade := True;

    end;  // F_TOTALIZADOR_INCIDENCIA

    // versao 1.5

    if not kExistIndice('PK_F_TOTALIZADOR_INCIDENCIA') then
    begin

      if not kExecSQL('ALTER TABLE F_TOTALIZADOR_INCIDENCIA'+sLineBreak+
                      'ADD CONSTRAINT PK_F_TOTALIZADOR_INCIDENCIA'+sLineBreak+
                      'PRIMARY KEY (IDTOTAL, IDINCIDENCIA);') then
         raise Exception.Create('');

      sUpdate := sUpdate + #13 + '- Adicionado chave primária de F_TOTALIZADOR_INCIDENCIA';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistIndice('FK_F_TOTALIZADOR_INCIDENCIA_I') then
    begin

      if not kExecSQL('ALTER TABLE F_TOTALIZADOR_INCIDENCIA'+sLineBreak+
                      'ADD CONSTRAINT FK_F_TOTALIZADOR_INCIDENCIA_I'+sLineBreak+
                      'FOREIGN KEY (IDINCIDENCIA) REFERENCES F_INCIDENCIA (IDINCIDENCIA);') then
         raise Exception.Create('');

      sUpdate := sUpdate + #13 + '- Adicionado o índice FK_F_TOTALIZADOR_INCIDENCIA_I';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistIndice('FK_F_TOTALIZADOR_INCIDENCIA_T') then
    begin

      if not kExecSQL('ALTER TABLE F_TOTALIZADOR_INCIDENCIA'+sLineBreak+
                      'ADD CONSTRAINT FK_F_TOTALIZADOR_INCIDENCIA_T'+sLineBreak+
                      'FOREIGN KEY (IDTOTAL) REFERENCES F_TOTALIZADOR (IDTOTAL);') then
         raise Exception.Create('');

      sUpdate := sUpdate + #13 + '- Adicionado o índice FK_F_TOTALIZADOR_INCIDENCIA_T';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistField( 'F_TOTALIZADOR_FOLHA', 'ATIVO_X') then
    begin

      if not kExecSQL( 'ALTER TABLE F_TOTALIZADOR_FOLHA ADD ATIVO_X LOGICO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Adicionado o campo ATIVO_X na tabela F_TOTALIZADOR_FOLHA';
      _upgrade := True;

      if not kExecSQL('UPDATE F_TOTALIZADOR_FOLHA SET ATIVO_X = 1') then
        raise Exception.Create('');

    end;

    // versao 1.5

    if not kExistTable('F_COMPROVANTE_RENDIMENTO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_COMPROVANTE_RENDIMENTO (');
      SQL.Add('    IDGE           ID NOT NULL,');
      SQL.Add('    GRUPO          ORDEM,');
      SQL.Add('    SUBGRUPO       ORDEM,');
      SQL.Add('    DESCRICAO      VALOR,');
      SQL.Add('    IDEVENTO       ID,');
      SQL.Add('    IDTOTALIZADOR  ID )');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação da tabela F_COMPROVANTE_RENDIMENTO';
      _upgrade := True;

    end;

    // versao 1.5

    if kExistTable('F_COMPROVANTE_RENDIMENTO') and
       not kExistIndice('PK_F_COMPROVANTE_RENDIMENTO') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('ALTER TABLE F_COMPROVANTE_RENDIMENTO');
      SQL.Add('ADD CONSTRAINT PK_F_COMPROVANTE_RENDIMENTO');
      SQL.Add('PRIMARY KEY (IDGE, GRUPO, SUBGRUPO)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do índice PK_F_COMPROVANTE_RENDIMENTO';
      _upgrade := True;

    end;

    // versao 1.5

    if (kCountSQL('F_COMPROVANTE_RENDIMENTO', '') = ZeroValue) then
    begin

      if (kCountSQL('F_TOTALIZADOR', 'IDTOTAL = :T', [31]) = ZeroValue) then
      begin

        if not kExecSQL('INSERT INTO F_TOTALIZADOR'+sLineBreak+
                        '(IDTOTAL, NOME, CALCULO, VALOR)'+sLineBreak+
                        'VALUES (31, :N, :C, :V)',
                        ['RENDIMENTOS TRIBUTAVEIS','A','C']) then
          raise Exception.Create('');

        // Desconsidera os tipos de folha referente ao 13o. salario
        if not kExecSQL('INSERT INTO F_TOTALIZADOR_FOLHA'+sLineBreak+
                        '(IDTOTAL, IDFOLHA_TIPO, ATIVO_X)'+sLineBreak+
                        'SELECT 31, IDFOLHA_TIPO, 1 FROM F_FOLHA_TIPO'+sLineBreak+
                        'WHERE NOT NOME STARTING :N', ['13']) then
          raise Exception.Create('');

        if not kExecSQL('INSERT INTO F_TOTALIZADOR_INCIDENCIA'+sLineBreak+
                        '(IDTOTAL, IDINCIDENCIA, PROVENTOS_X, OPERACAO, ATIVO_X)'+sLineBreak+
                        'SELECT 31, IDINCIDENCIA, 1, 1, 1 FROM F_INCIDENCIA'+sLineBreak+
                        'WHERE NOME STARTING :N  AND NOT NOME LIKE :O', ['I.R.R.F','%13%']) then
          raise Exception.Create('');

      end;

      if (kCountSQL('F_TOTALIZADOR', 'IDTOTAL = :T', [32]) = ZeroValue) then
      begin

        if not kExecSQL('INSERT INTO F_TOTALIZADOR'+sLineBreak+
                        '(IDTOTAL, NOME, CALCULO, VALOR)'+sLineBreak+
                        'VALUES (32, :N, :C, :V)',
                        ['PREVIDENCIA OFICIAL','A','C']) then
          raise Exception.Create('');

        if not kExecSQL('INSERT INTO F_TOTALIZADOR_FOLHA'+sLineBreak+
                        '(IDTOTAL, IDFOLHA_TIPO, ATIVO_X)'+sLineBreak+
                        'SELECT 32, IDFOLHA_TIPO, 1 FROM F_FOLHA_TIPO'+sLineBreak+
                        'WHERE NOT NOME STARTING :N', ['13']) then
          raise Exception.Create('');

        if not kExecSQL('INSERT INTO F_TOTALIZADOR_EVENTO'+sLineBreak+
                        '(IDTOTAL, IDEVENTO, OPERACAO)'+sLineBreak+
                        'SELECT 32, IDEVENTO, 1 FROM F_EVENTO'+sLineBreak+
                        'WHERE NOME STARTING :N AND INC_13_X = 0', ['I.N.S.S']) then
          raise Exception.Create('');

      end;

      if (kCountSQL('F_TOTALIZADOR', 'IDTOTAL = :T', [35]) = ZeroValue) then
      begin

        if not kExecSQL('INSERT INTO F_TOTALIZADOR'+sLineBreak+
                        '(IDTOTAL, NOME, CALCULO, VALOR)'+sLineBreak+
                        'VALUES (35, :N, :C, :V)',
                        ['IMPOSTO DE RENDA RETIDO','A','C']) then
          raise Exception.Create('');

        if not kExecSQL('INSERT INTO F_TOTALIZADOR_FOLHA'+sLineBreak+
                        '(IDTOTAL, IDFOLHA_TIPO, ATIVO_X)'+sLineBreak+
                        'SELECT 35, IDFOLHA_TIPO, 1 FROM F_FOLHA_TIPO'+sLineBreak+
                        'WHERE NOT NOME STARTING :N', ['13']) then
          raise Exception.Create('');

        if not kExecSQL('INSERT INTO F_TOTALIZADOR_EVENTO'+sLineBreak+
                        '(IDTOTAL, IDEVENTO, OPERACAO)'+sLineBreak+
                        'SELECT 35, IDEVENTO, 1 FROM F_EVENTO'+sLineBreak+
                        'WHERE NOME STARTING :N AND INC_13_X = 0', ['I.R.R.F']) then
          raise Exception.Create('');

      end;

      if (kCountSQL('F_TOTALIZADOR', 'IDTOTAL = :T', [51]) = ZeroValue) then
      begin

        if not kExecSQL('INSERT INTO F_TOTALIZADOR'+sLineBreak+
                        '(IDTOTAL, NOME, CALCULO, VALOR)'+sLineBreak+
                        'VALUES (51, :N, :C, :V)',
                        ['DECIMO TERCEIRO LIQUIDO','A','C']) then
          raise Exception.Create('');

        if not kExecSQL('INSERT INTO F_TOTALIZADOR_FOLHA'+sLineBreak+
                        '(IDTOTAL, IDFOLHA_TIPO, ATIVO_X)'+sLineBreak+
                        'SELECT 51, IDFOLHA_TIPO, 1 FROM F_FOLHA_TIPO'+sLineBreak+
                        'WHERE NOME STARTING :N', ['13']) then
          raise Exception.Create('');

        DataSet1 := TClientDataSet.Create(NIL);

        try

          if not kOpenSQL( DataSet1,
                           'SELECT IDINCIDENCIA FROM F_INCIDENCIA'+sLineBreak+
                           'WHERE NOME LIKE :N', ['I.R%13%']) then
            raise Exception.Create('');

          DataSet1.First;

          while not DataSet1.Eof do
          begin

            if not kExecSQL('INSERT INTO F_TOTALIZADOR_INCIDENCIA'+sLineBreak+
                            '(IDTOTAL, IDINCIDENCIA, PROVENTOS_X, OPERACAO, ATIVO_X)'+sLineBreak+
                            'VALUES (51, :I, 1, 1, 1)',
                            [DataSet1.Fields[0].AsInteger]) then
              raise Exception.Create('');

            if not kExecSQL('INSERT INTO F_TOTALIZADOR_EVENTO'+sLineBreak+
                            '(IDTOTAL, IDEVENTO, OPERACAO)'+sLineBreak+
                            'SELECT 51, IDEVENTO, -1 FROM F_EVENTO'+sLineBreak+
                            'WHERE TIPO_EVENTO = :T AND'+sLineBreak+
                            '      INC_'+kStrZero( DataSet1.Fields[0].AsInteger, 2)+'_X = 1', ['D']) then
              raise Exception.Create('');

            DataSet1.Next;

          end;  // while

        finally
          DataSet1.Free;
        end;

      end;

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 3, 0, '+QuotedStr('RENDIMENTOS TRIBUTAVEIS, DEDUCOES E IMPOSTO RETIDO NA FONTE'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO, IDTOTALIZADOR)');
      SQL.Add('SELECT IDGE, 3, 1, '+QuotedStr('TOTAL DOS RENDIMENTOS (INCLUSIVE FERIAS)'));
      SQL.Add(', 31 FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO, IDTOTALIZADOR)');
      SQL.Add('SELECT IDGE, 3, 2, '+QuotedStr('CONTRIBUICAO PREVIDENCIARIA OFICIAL'));
      SQL.Add(', 32 FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 3, 3, '+QuotedStr('CONTRIBUICAO A PREVIDENCIA PRIVADA'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 3, 4, '+QuotedStr('PENSAO ALIMENTICIA'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      if kCountSQL('SELECT FIRST 1 IDEVENTO FROM F_EVENTO WHERE NOME LIKE :N',
                   ['PENS_O%ALIM%']) <> ZeroValue then
      begin

        SQL.BeginUpdate;
        SQL.Clear;
        SQL.Add('UPDATE F_COMPROVANTE_RENDIMENTO');
        SQL.Add(' SET IDEVENTO = ');
        SQL.Add(' (SELECT FIRST 1 IDEVENTO FROM F_EVENTO WHERE NOME LIKE :N)');
        SQL.Add('WHERE GRUPO = 3 AND SUBGRUPO = 4');
        SQL.EndUpdate;

        if not kExecSQL(SQL.Text, ['PENS_O%ALIM%']) then
          raise Exception.Create('');

      end;

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO, IDTOTALIZADOR)');
      SQL.Add('SELECT IDGE, 3, 5, '+QuotedStr('IMPOSTO RETIDO NA FONTE'));
      SQL.Add(', 35 FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 4, 0, '+QuotedStr('RENDIMENTOS ISENTOS E NAO TRIBUTAVEIS'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 4, 2, '+QuotedStr('DIARIAS E AJUDA DE CUSTO'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 4, 6, '+QuotedStr('INDENIZACOES POR RESCISAO/ACIDENTE DE TRABALHO'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 5, 0, '+QuotedStr('RENDIMENTOS SUJEITOS A TRIBUTACAO EXCLUSIVA (RENDIMENTO LIQUIDO)'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO, IDTOTALIZADOR)');
      SQL.Add('SELECT IDGE, 5, 1, '+QuotedStr('DECIMO TERCEIRO SALARIO'));
      SQL.Add(', 51 FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 5, 2, '+QuotedStr('OUTROS-RESIDENTE EXTERIOR (PLR,ABONO,ETC.)'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 6, 0, '+QuotedStr('INFORMACOES COMPLEMENTARES'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 6, 1, '+QuotedStr('CAIXA DE ASSISTENCIA/PLANO DE SAUDE'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('INSERT INTO F_COMPROVANTE_RENDIMENTO');
      SQL.Add(' (IDGE, GRUPO, SUBGRUPO, DESCRICAO)');
      SQL.Add('SELECT IDGE, 6, 2, '+QuotedStr('SALARIO FAMILIA'));
      SQL.Add('FROM F_GRUPO_EMPRESA');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      if kCountSQL('SELECT FIRST 1 IDEVENTO FROM F_EVENTO WHERE NOME LIKE :N',
                   ['SAL_RIO%FAM_LIA%']) <> ZeroValue then
      begin

        SQL.BeginUpdate;
        SQL.Clear;
        SQL.Add('UPDATE F_COMPROVANTE_RENDIMENTO');
        SQL.Add(' SET IDEVENTO = ');
        SQL.Add(' (SELECT FIRST 1 IDEVENTO FROM F_EVENTO WHERE NOME LIKE :N)');
        SQL.Add('WHERE GRUPO = 6 AND SUBGRUPO = 2');
        SQL.EndUpdate;

        if not kExecSQL(SQL.Text, ['SAL_RIO%FAM_LIA%']) then
          raise Exception.Create('');

      end;

      sUpdate  := sUpdate + #13 + '- Preenchimento do Modelo de Comprovantes de Rendimentos';
      _upgrade := True;

    end;

    // versao 1.5

    if kExistField('F_EVENTO', 'IDGRUPO') then
    begin

      if not kExecSQL('ALTER TABLE F_EVENTO DROP IDGRUPO') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Removido o campo "IDGRUPO" da tabela "F_EVENTO"';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistTable('F_EVENTO_LISTA') then
    begin

      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('CREATE TABLE F_EVENTO_LISTA (');
      SQL.Add('    IDGRUPO           ID NOT NULL,');
      SQL.Add('    IDEVENTO          ID NOT NULL)');
      SQL.EndUpdate;

      if not kExecSQL(SQL.Text) then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação da tabela F_EVENTO_LISTA';
      _upgrade := True;

      kExecSQL('DELETE FROM F_EVENTO_GRUPO');

    end; // F_EVENTO_LISTA

    // versao 1.5

    if not kExistIndice('PK_F_EVENTO_LISTA', 'F_EVENTO_LISTA') then
    begin

      if not kExecSQL('ALTER TABLE F_EVENTO_LISTA'+sLineBreak+
                      'ADD CONSTRAINT PK_F_EVENTO_LISTA'+sLineBreak+
                      'PRIMARY KEY (IDGRUPO, IDEVENTO)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do índice primário da tabela F_EVENTO_LISTA';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistIndice('FK_F_EVENTO_LISTA_E', 'F_EVENTO_LISTA') then
    begin

      if not kExecSQL('ALTER TABLE F_EVENTO_LISTA'+sLineBreak+
                      'ADD CONSTRAINT FK_F_EVENTO_LISTA_E'+sLineBreak+
                      'FOREIGN KEY (IDEVENTO) REFERENCES F_EVENTO (IDEVENTO)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do índice estrangeiro "FK_F_EVENTO_LISTA_R" da tabela F_EVENTO_LISTA';
      _upgrade := True;

    end;

    // versao 1.5

    if not kExistIndice('FK_F_EVENTO_LISTA_G', 'F_EVENTO_LISTA') then
    begin

      if not kExecSQL('ALTER TABLE F_EVENTO_LISTA'+sLineBreak+
                      'ADD CONSTRAINT FK_F_EVENTO_LISTA_G'+sLineBreak+
                      'FOREIGN KEY (IDGRUPO) REFERENCES F_EVENTO_GRUPO (IDGRUPO)') then
        raise Exception.Create('');

      sUpdate  := sUpdate + #13 + '- Criação do índice estrangeiro "FK_F_EVENTO_LISTA_G" da tabela F_EVENTO_LISTA';
      _upgrade := True;

    end;

    // versao 1.5

    if (kCountSQL('F_EVENTO_GRUPO', '') = ZeroValue) then
    begin
      sValue := 'INSERT INTO F_EVENTO_GRUPO (IDGRUPO, NOME) VALUES (:C, :N)';
      kExecSQL( sValue, [ 1, 'SEGURIDADE SOCIAL']);
      kExecSQL( sValue, [ 2, 'IMPOSTO DE RENDA']);
      kExecSQL( sValue, [ 3, 'FUNDO DE GARANTIA']);
      kExecSQL( sValue, [10, 'FERIAS']);
      kExecSQL( sValue, [11, 'RESCISAO']);
      kExecSQL( sValue, [13, 'DECIMO TERCEIRO SALARIO']);
    end;

  except
    on E:Exception do
    begin
      kErro( E.Message, 'fupgrade.pas', 'upgradeversion()');
      _upgrade := False;
      _erro    := True;
    end;
  end;

  finally
    SQL.Free;
  end;  // finally

  if _erro then
    Exit;

  if _upgrade then
    kAviso( 'Atualização de versão concluída !!!'#13+sUpdate)
  else
    kAviso( 'Atualização de versão não foi necessária !!!');

end;  // upgradeversion

end.
