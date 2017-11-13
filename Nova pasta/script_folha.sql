CREATE TABLE "public"."agencia" (
	"idbanco" Integer NOT NULL, 
	"idagencia" Serial, 
	"nome" Varchar(50),
	CONSTRAINT "PK_agencia" PRIMARY KEY ("idbanco", "idagencia"), 
	FOREIGN KEY ("idbanco")
		REFERENCES "public"."banco" ("idbanco")
		ON UPDATE NO ACTION ON DELETE NO ACTION
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17049
	 
	ON agencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17050
	 
	ON agencia
	FOR EACH
GO

CREATE TABLE "public"."banco" (
	"idbanco" Serial PRIMARY KEY, 
	"nome" Varchar(50) NOT NULL
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17047
	 
	ON banco
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17048
	 
	ON banco
	FOR EACH
GO

CREATE TABLE "public"."empresa" (
	"idempresa" Serial PRIMARY KEY, 
	"nome" Varchar(50) NOT NULL, 
	"idge" Integer NOT NULL, 
	"apelido" Varchar(30), 
	"cpf_cgc" Varchar(14), 
	"endereco" Varchar(30), 
	"complemento" Varchar(30), 
	"bairro" Varchar(30), 
	"cidade" Varchar(30), 
	"idpais" Varchar(3), 
	"iduf" Varchar(2), 
	"cep" Varchar(8), 
	"telefone" Varchar(15), 
	"observacao" Varchar(255), 
	"pessoa" Varchar(15) NOT NULL, 
	FOREIGN KEY ("idge")
		REFERENCES "public"."f_grupo_empresa" ("idge")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX "EMPRESA_CNPJ_IDX" ON empresa
	 USING btree (cpf_cgc)
GO
CREATE TRIGGER RI_ConstraintTrigger_17146
	 
	ON empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17147
	 
	ON empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17794
	 
	ON empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17795
	 
	ON empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18042
	 
	ON empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18043
	 
	ON empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18145
	 
	ON empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18146
	 
	ON empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18208
	 
	ON empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18209
	 
	ON empresa
	FOR EACH
GO

CREATE TABLE "public"."empresa_dados" (
	"idempresa" Serial PRIMARY KEY, 
	"chave" Varchar(30), 
	"valor" Varchar(100), 
	"ativo_x" Boolean NOT NULL DEFAULT false
)
GO
CREATE UNIQUE INDEX "EMPRESA_DADOS_IDX" ON empresa_dados
	 USING btree (chave)
GO

CREATE TABLE "public"."estado_civil" (
	"idestado_civil" Serial PRIMARY KEY, 
	"tipo" Varchar(2) NOT NULL, 
	"nome" Varchar(30)
)
GO
CREATE UNIQUE INDEX "ESTADO_CIVIL_IDX" ON estado_civil
	 USING btree (tipo)
GO

CREATE TABLE "public"."f_admissao" (
	"idadmissao" Serial PRIMARY KEY, 
	"tipo" Varchar(2) NOT NULL, 
	"nome" Varchar(30)
)
GO
CREATE UNIQUE INDEX "F_ADMISSAO_IDX" ON f_admissao
	 USING btree (tipo)
GO

CREATE TABLE "public"."f_automatico" (
	"idempresa" Integer NOT NULL, 
	"idfuncionario" Integer NOT NULL, 
	"id" Serial, 
	"idfolha_tipo" Varchar(1) NOT NULL, 
	"idevento" Integer NOT NULL, 
	"informado" Double Precision NOT NULL, 
	"competencias" Varchar(13), 
	"janeiro_x" Boolean NOT NULL, 
	"fevereiro_x" Boolean NOT NULL, 
	"marco_x" Boolean NOT NULL, 
	"abril_x" Boolean NOT NULL, 
	"maio_x" Boolean NOT NULL, 
	"junho_x" Boolean NOT NULL, 
	"julho_x" Boolean NOT NULL, 
	"agosto_x" Boolean NOT NULL, 
	"setembro_x" Boolean NOT NULL, 
	"outubro_x" Boolean NOT NULL, 
	"novembro_x" Boolean NOT NULL, 
	"dezembro_x" Boolean NOT NULL, 
	"salario13_x" Boolean NOT NULL,
	CONSTRAINT "pk_f_automatico" PRIMARY KEY ("idempresa", "idfuncionario", "id"), 
	FOREIGN KEY ("idempresa", "idfuncionario")
		REFERENCES "public"."funcionario" ("idfuncionario", "idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idevento")
		REFERENCES "public"."f_evento" ("idevento")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idfolha_tipo")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX f_automatico_idx1 ON f_automatico
	 USING btree (idempresa, idfuncionario, idfolha_tipo, idevento)
GO
CREATE TRIGGER RI_ConstraintTrigger_18528
	 
	ON f_automatico
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18529
	 
	ON f_automatico
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18533
	 
	ON f_automatico
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18534
	 
	ON f_automatico
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18538
	 
	ON f_automatico
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18539
	 
	ON f_automatico
	FOR EACH
GO
CREATE TRIGGER f_automatico_bu0
	BEFORE UPDATE
	ON f_automatico
	FOR EACH ROW
	EXECUTE PROCEDURE fn_atualizarcompetencia()
GO
CREATE TRIGGER f_automatico_bi0
	BEFORE INSERT
	ON f_automatico
	FOR EACH ROW
	EXECUTE PROCEDURE fn_atualizarcompetencia()
GO

CREATE TABLE "public"."f_base" (
	"idge" Integer NOT NULL, 
	"idbase" Serial, 
	"nome" Varchar(50), 
	"calculo" Varchar(1), 
	"valor" Varchar(1) DEFAULT '1'::character varying, 
	"ciclo" Integer NOT NULL, 
	"regime" Varchar(1), 
	"mes_inicial" Integer NOT NULL, 
	"competencia_13" Varchar(1), 
	"mes_sem_valor" Varchar(1),
	CONSTRAINT "pk_f_base" PRIMARY KEY ("idge", "idbase")
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18488
	 
	ON f_base
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18489
	 
	ON f_base
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18507
	 
	ON f_base
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18508
	 
	ON f_base
	FOR EACH
GO

CREATE TABLE "public"."f_base_evento" (
	"id" Serial PRIMARY KEY, 
	"idge" Integer NOT NULL, 
	"idbase" Integer NOT NULL, 
	"idevento" Integer NOT NULL, 
	"referencia" Integer NOT NULL, 
	FOREIGN KEY ("idevento")
		REFERENCES "public"."f_evento" ("idevento")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idbase", "idge")
		REFERENCES "public"."f_base" ("idbase", "idge")
		ON UPDATE RESTRICT ON DELETE CASCADE
)
GO
CREATE UNIQUE INDEX "f_base_evento_IDX" ON f_base_evento
	 USING btree (idge, idbase, idevento)
GO
CREATE TRIGGER RI_ConstraintTrigger_18509
	 
	ON f_base_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18510
	 
	ON f_base_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18514
	 
	ON f_base_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18515
	 
	ON f_base_evento
	FOR EACH
GO

CREATE TABLE "public"."f_base_folha" (
	"id" Serial PRIMARY KEY, 
	"idge" Integer NOT NULL, 
	"idbase" Integer NOT NULL, 
	"idfolha_tipo" Varchar(1) NOT NULL, 
	FOREIGN KEY ("idfolha_tipo")
		REFERENCES "" ()
		ON UPDATE CASCADE ON DELETE RESTRICT, 
	FOREIGN KEY ("idge", "idbase")
		REFERENCES "public"."f_base" ("idbase", "idge")
		ON UPDATE CASCADE ON DELETE CASCADE
)
GO
CREATE UNIQUE INDEX "f_base_folha_IDX" ON f_base_folha
	 USING btree (idge, idbase, idfolha_tipo)
GO
CREATE TRIGGER RI_ConstraintTrigger_18490
	 
	ON f_base_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18491
	 
	ON f_base_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18495
	 
	ON f_base_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18496
	 
	ON f_base_folha
	FOR EACH
GO

CREATE TABLE "public"."f_caged" (
	"id" Serial PRIMARY KEY, 
	"idcaged" Varchar(2) NOT NULL, 
	"nome" Varchar(30) NOT NULL, 
	"tipo" Varchar(1) NOT NULL
)
GO
CREATE UNIQUE INDEX "f_caged_IDX" ON f_caged
	 USING btree (idcaged)
GO

CREATE TABLE "public"."f_cargo" (
	"idempresa" Integer NOT NULL, 
	"idcargo" Serial PRIMARY KEY, 
	"nome" Varchar(50) NOT NULL, 
	"salario" Double Precision NOT NULL, 
	"cbo" Varchar(7)
)
GO
CREATE UNIQUE INDEX "f_cargo_IDX" ON f_cargo
	 USING btree (idempresa, idcargo)
GO

CREATE TABLE "public"."f_central" (
	"id" Serial PRIMARY KEY, 
	"idempresa" Integer NOT NULL, 
	"idfolha" Integer NOT NULL, 
	"idfuncionario" Integer NOT NULL, 
	"idevento" Integer NOT NULL, 
	"informado" Double Precision NOT NULL, 
	"referencia" Double Precision NOT NULL, 
	"calculado" Double Precision NOT NULL, 
	"totalizado" Double Precision NOT NULL, 
	"sequencia" Integer NOT NULL, 
	"liquido" Integer NOT NULL
)
GO
CREATE UNIQUE INDEX "f_central_IDX" ON f_central
	 USING btree (idempresa, idfolha, idfuncionario, idevento)
GO

CREATE TABLE "public"."f_central_funcionario" (
	"id" Serial PRIMARY KEY, 
	"idempresa" Integer NOT NULL, 
	"idfolha" Integer NOT NULL, 
	"idfuncionario" Integer NOT NULL, 
	"idcargo" Integer NOT NULL, 
	"idlotacao" Integer NOT NULL, 
	"salario" Double Precision NOT NULL, 
	"idtipo" Varchar(2) NOT NULL, 
	"idvarchar(2)" Varchar(2), 
	"idsalario" Varchar(2), 
	"carga_horaria" Integer NOT NULL, 
	"dependente_ir" Integer NOT NULL, 
	"idrecurso" Varchar(2) NOT NULL, 
	FOREIGN KEY ("idempresa", "idfuncionario")
		REFERENCES "public"."funcionario" ("idfuncionario", "idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idempresa", "idfolha")
		REFERENCES "public"."f_folha" ("idempresa", "idfolha")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX "f_central_funcionario_IDX" ON f_central_funcionario
	 USING btree (idempresa, idfolha, idfuncionario)
GO
CREATE TRIGGER RI_ConstraintTrigger_18405
	 
	ON f_central_funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18406
	 
	ON f_central_funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18410
	 
	ON f_central_funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18411
	 
	ON f_central_funcionario
	FOR EACH
GO
CREATE TRIGGER f_central_funcionario_bd0
	BEFORE DELETE
	ON f_central_funcionario
	FOR EACH ROW
	EXECUTE PROCEDURE fn_beforedelete_f_central_funcionario()
GO

CREATE TABLE "public"."f_comprovante_rendimento" (
	"id" Serial PRIMARY KEY, 
	"idge" Integer NOT NULL, 
	"grupo" Integer NOT NULL, 
	"subgrupo" Integer NOT NULL, 
	"descricao" Varchar(100), 
	"idevento" Integer NOT NULL, 
	"idtotalizador" Integer NOT NULL
)
GO
CREATE UNIQUE INDEX "f_comprovante_rendimento_IDX" ON f_comprovante_rendimento
	 USING btree (idge, grupo, subgrupo)
GO

CREATE TABLE "public"."f_dependente" (
	"idempresa" Integer NOT NULL, 
	"idfuncionario" Integer NOT NULL, 
	"nome" Varchar(50) NOT NULL, 
	"nascimento" timestamp NOT NULL, 
	"tipo" Varchar(10) NOT NULL, 
	"invalido_x" Boolean NOT NULL, 
	"sexo" Varchar(2),
	CONSTRAINT "pk_f_dependente" PRIMARY KEY ("idempresa", "idfuncionario", "nome"), 
	FOREIGN KEY ("idfuncionario", "idempresa")
		REFERENCES "public"."funcionario" ("idfuncionario", "idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX f_dependente_nome ON f_dependente
	 USING btree (idempresa, idfuncionario, nome)
GO
CREATE TRIGGER RI_ConstraintTrigger_18075
	 
	ON f_dependente
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18076
	 
	ON f_dependente
	FOR EACH
GO

CREATE TABLE "public"."f_dependente_tipo" (
	"id" Serial PRIMARY KEY, 
	"idtipo" Varchar(1) NOT NULL, 
	"descricao" Varchar(30) NOT NULL, 
	"limite_ano" Integer NOT NULL
)
GO
CREATE UNIQUE INDEX f_dependente_tipo_idx ON f_dependente_tipo
	 USING btree (idtipo)
GO

CREATE TABLE "public"."f_evento" (
	"idevento" Serial PRIMARY KEY, 
	"nome" Varchar(50) NOT NULL, 
	"tipo_calculo" Varchar(1) NOT NULL, 
	"tipo_evento" Varchar(1) NOT NULL, 
	"multiplicador" Double Precision NOT NULL, 
	"contra_partida" Integer NOT NULL, 
	"proporcional_x" Boolean NOT NULL DEFAULT false, 
	"liquido" Integer NOT NULL, 
	"valor_minimo" Double Precision NOT NULL, 
	"valor_maximo" Double Precision NOT NULL, 
	"chave" Integer NOT NULL, 
	"valor_hora" Varchar(1) NOT NULL, 
	"ativo_x" Boolean NOT NULL DEFAULT false, 
	"inc_01_x" Boolean NOT NULL DEFAULT false, 
	"inc_02_x" Boolean NOT NULL DEFAULT false, 
	"inc_03_x" Boolean NOT NULL DEFAULT false, 
	"inc_04_x" Boolean NOT NULL DEFAULT false, 
	"inc_05_x" Boolean NOT NULL DEFAULT false, 
	"inc_06_x" Boolean NOT NULL DEFAULT false, 
	"inc_07_x" Boolean NOT NULL DEFAULT false, 
	"inc_08_x" Boolean NOT NULL DEFAULT false, 
	"inc_09_x" Boolean NOT NULL DEFAULT false, 
	"inc_10_x" Boolean NOT NULL DEFAULT false, 
	"inc_11_x" Boolean NOT NULL DEFAULT false, 
	"inc_12_x" Boolean NOT NULL DEFAULT false, 
	"inc_13_x" Boolean NOT NULL DEFAULT false, 
	"inc_14_x" Boolean NOT NULL DEFAULT false, 
	"inc_15_x" Boolean NOT NULL DEFAULT false, 
	"inc_16_x" Boolean NOT NULL DEFAULT false, 
	"inc_17_x" Boolean NOT NULL DEFAULT false, 
	"inc_18_x" Boolean NOT NULL DEFAULT false, 
	"inc_19_x" Boolean NOT NULL DEFAULT false, 
	"inc_20_x" Boolean NOT NULL DEFAULT false, 
	"idformula" Integer NOT NULL, 
	"assume_x" Boolean NOT NULL DEFAULT false, 
	"formula_local" Varchar(30), 
	"total_lotacao_x" Boolean NOT NULL DEFAULT false, 
	"contra_cheque_x" Boolean NOT NULL DEFAULT false, 
	"complementar" Integer NOT NULL DEFAULT 0, 
	"tipo_salario" Varchar(1), 
	FOREIGN KEY ("idformula")
		REFERENCES "public"."f_formula" ("idformula")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17484
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17485
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER f_evento_bi0
	BEFORE INSERT
	ON f_evento
	FOR EACH ROW
	EXECUTE PROCEDURE fn_tg_f_evento()
GO
CREATE TRIGGER f_evento_bu0
	BEFORE UPDATE
	ON f_evento
	FOR EACH ROW
	EXECUTE PROCEDURE fn_tg_f_evento()
GO
CREATE TRIGGER RI_ConstraintTrigger_17761
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17762
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17887
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17888
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17997
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17998
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18132
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18133
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18186
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18187
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18357
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18358
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18512
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18513
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18526
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18527
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18565
	 
	ON f_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18566
	 
	ON f_evento
	FOR EACH
GO

CREATE TABLE "public"."f_evento_grupo" (
	"idgrupo" Serial PRIMARY KEY, 
	"nome" Varchar(30) NOT NULL
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18362
	 
	ON f_evento_grupo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18363
	 
	ON f_evento_grupo
	FOR EACH
GO

CREATE TABLE "public"."f_evento_lista" (
	"id" Serial PRIMARY KEY, 
	"idgrupo" Integer NOT NULL, 
	"idevento" Integer NOT NULL, 
	FOREIGN KEY ("idevento")
		REFERENCES "public"."f_evento" ("idevento")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idgrupo")
		REFERENCES "public"."f_evento_grupo" ("idgrupo")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX f_evento_lista_idx ON f_evento_lista
	 USING btree (idgrupo, idevento)
GO
CREATE TRIGGER RI_ConstraintTrigger_18359
	 
	ON f_evento_lista
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18360
	 
	ON f_evento_lista
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18364
	 
	ON f_evento_lista
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18365
	 
	ON f_evento_lista
	FOR EACH
GO

CREATE TABLE "public"."f_ferias" (
	"id" Serial PRIMARY KEY, 
	"idempresa" Integer NOT NULL, 
	"idfuncionario" Integer NOT NULL, 
	"periodo" timestamp NOT NULL, 
	"intencao_1" timestamp, 
	"intencao_2" timestamp, 
	"intencao_data" timestamp, 
	"gozo_1" timestamp, 
	"gozo_2" timestamp, 
	"conversao" Integer NOT NULL, 
	"aviso" timestamp, 
	"retorno" timestamp, 
	FOREIGN KEY ("idempresa", "idfuncionario")
		REFERENCES "public"."funcionario" ("idfuncionario", "idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX f_ferias_idx ON f_ferias
	 USING btree (idempresa, idfuncionario, periodo)
GO
CREATE TRIGGER RI_ConstraintTrigger_18337
	 
	ON f_ferias
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18338
	 
	ON f_ferias
	FOR EACH
GO

CREATE TABLE "public"."f_fgts" (
	"id" Serial PRIMARY KEY, 
	"idfgts" Varchar(2) NOT NULL, 
	"nome" Varchar(50) NOT NULL
)
GO
CREATE UNIQUE INDEX f_fgts_idx ON f_fgts
	 USING btree (idfgts)
GO

CREATE TABLE "public"."f_folha" (
	"idempresa" Integer NOT NULL, 
	"idfolha" Integer NOT NULL, 
	"descricao" Varchar(30) NOT NULL, 
	"idfolha_tipo" Varchar(1) NOT NULL, 
	"observacao" Varchar(250), 
	"data_credito" timestamp, 
	"periodo_inicio" timestamp NOT NULL, 
	"periodo_fim" timestamp NOT NULL, 
	"arquivar_x" Boolean NOT NULL, 
	"idgp" Integer NOT NULL, 
	"competencia" timestamp NOT NULL, 
	"mes" Integer NOT NULL, 
	"complementar_x" Boolean NOT NULL,
	CONSTRAINT "pk_f_folha" PRIMARY KEY ("idempresa", "idfolha"), 
	FOREIGN KEY ("idfolha_tipo")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18009
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18010
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER f_folha_bd0
	BEFORE DELETE
	ON f_folha
	FOR EACH ROW
	EXECUTE PROCEDURE fn_beforedelete_f_folha()
GO
CREATE TRIGGER f_folha_bi0
	BEFORE INSERT
	ON f_folha
	FOR EACH ROW
	EXECUTE PROCEDURE fn_beforeinsert_f_folha()
GO
CREATE TRIGGER f_folha_bu0
	BEFORE UPDATE
	ON f_folha
	FOR EACH ROW
	EXECUTE PROCEDURE fn_beforeupdate_f_folha()
GO
CREATE TRIGGER RI_ConstraintTrigger_18091
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18092
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18181
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18182
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18252
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18253
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18257
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18258
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18270
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18271
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18275
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18276
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18408
	 
	ON f_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18409
	 
	ON f_folha
	FOR EACH
GO

CREATE TABLE "public"."f_folha_base" (
	"idempresa" Integer NOT NULL, 
	"idfolha" Integer NOT NULL, 
	"idfolha_base" Serial,
	CONSTRAINT "pk_f_folha_base" PRIMARY KEY ("idempresa", "idfolha", "idfolha_base"), 
	FOREIGN KEY ("idfolha_base", "idempresa")
		REFERENCES "public"."f_folha" ("idempresa", "idfolha")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idfolha", "idempresa")
		REFERENCES "public"."f_folha" ("idempresa", "idfolha")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18272
	 
	ON f_folha_base
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18273
	 
	ON f_folha_base
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18277
	 
	ON f_folha_base
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18278
	 
	ON f_folha_base
	FOR EACH
GO

CREATE TABLE "public"."f_folha_cp" (
	"idempresa" Integer NOT NULL, 
	"idfolha" Integer NOT NULL, 
	"idfolha_cp" Serial,
	CONSTRAINT "pk_f_folha_cp" PRIMARY KEY ("idempresa", "idfolha", "idfolha_cp"), 
	FOREIGN KEY ("idfolha", "idempresa")
		REFERENCES "public"."f_folha" ("idempresa", "idfolha")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idempresa", "idfolha_cp")
		REFERENCES "public"."f_folha" ("idempresa", "idfolha")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18254
	 
	ON f_folha_cp
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18255
	 
	ON f_folha_cp
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18259
	 
	ON f_folha_cp
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18260
	 
	ON f_folha_cp
	FOR EACH
GO

CREATE TABLE "public"."f_folha_tipo" (
	"id" Serial PRIMARY KEY, 
	"idfolha_tipo" Varchar(1) NOT NULL, 
	"nome" Varchar(30) NOT NULL, 
	"totalizar_x" Boolean NOT NULL
)
GO
CREATE UNIQUE INDEX "F_FOLHA_TIPO_IDX" ON f_folha_tipo
	 USING btree (idfolha_tipo)
GO
CREATE TRIGGER RI_ConstraintTrigger_17751
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17752
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18007
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18008
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18122
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18123
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18233
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18234
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18493
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18494
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18536
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18537
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18570
	 
	ON f_folha_tipo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18571
	 
	ON f_folha_tipo
	FOR EACH
GO

CREATE TABLE "public"."f_folha_tipo_situacao" (
	"id" Serial PRIMARY KEY, 
	"idfolha_tipo" Varchar(1) NOT NULL, 
	"idsituacao" Varchar(2) NOT NULL, 
	FOREIGN KEY ("idsituacao")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idfolha_tipo")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX f_folha_tipo_situacao_idx ON f_folha_tipo_situacao
	 USING btree (idfolha_tipo, idsituacao)
GO
CREATE TRIGGER RI_ConstraintTrigger_18235
	 
	ON f_folha_tipo_situacao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18236
	 
	ON f_folha_tipo_situacao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18240
	 
	ON f_folha_tipo_situacao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18241
	 
	ON f_folha_tipo_situacao
	FOR EACH
GO

CREATE TABLE "public"."f_formula" (
	"idformula" Serial PRIMARY KEY, 
	"nome" Varchar(50) NOT NULL, 
	"formula" text
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17482
	 
	ON f_formula
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17483
	 
	ON f_formula
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17892
	 
	ON f_formula
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17893
	 
	ON f_formula
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17982
	 
	ON f_formula
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17983
	 
	ON f_formula
	FOR EACH
GO

CREATE TABLE "public"."f_grupo_empresa" (
	"idge" Serial PRIMARY KEY, 
	"nome" Varchar(50)
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17144
	 
	ON f_grupo_empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17145
	 
	ON f_grupo_empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17870
	 
	ON f_grupo_empresa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17871
	 
	ON f_grupo_empresa
	FOR EACH
GO

CREATE TABLE "public"."f_grupo_pagamento" (
	"idgp" Serial PRIMARY KEY, 
	"idge" Integer NOT NULL, 
	"nome" Varchar(30), 
	FOREIGN KEY ("idge")
		REFERENCES "public"."f_grupo_empresa" ("idge")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX "F_GRUPO_PAGAMENTO_IDX1" ON f_grupo_pagamento
	 USING btree (nome)
GO
CREATE UNIQUE INDEX "F_GRUPO_PAGAMENTO_IDX2" ON f_grupo_pagamento
	 USING btree (idge, idgp)
GO
CREATE TRIGGER RI_ConstraintTrigger_17872
	 
	ON f_grupo_pagamento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17873
	 
	ON f_grupo_pagamento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17882
	 
	ON f_grupo_pagamento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17883
	 
	ON f_grupo_pagamento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18047
	 
	ON f_grupo_pagamento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18048
	 
	ON f_grupo_pagamento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18560
	 
	ON f_grupo_pagamento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18561
	 
	ON f_grupo_pagamento
	FOR EACH
GO

CREATE TABLE "public"."f_incidencia" (
	"idincidencia" Serial PRIMARY KEY, 
	"nome" Varchar(30) NOT NULL
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17722
	 
	ON f_incidencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17723
	 
	ON f_incidencia
	FOR EACH
GO

CREATE TABLE "public"."f_indice" (
	"idempresa" Integer NOT NULL, 
	"idindice" Serial, 
	"nome" Varchar(50) NOT NULL,
	CONSTRAINT "pk_f_indice" PRIMARY KEY ("idempresa", "idindice"), 
	FOREIGN KEY ("idempresa")
		REFERENCES "public"."empresa" ("idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18210
	 
	ON f_indice
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18211
	 
	ON f_indice
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18218
	 
	ON f_indice
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18219
	 
	ON f_indice
	FOR EACH
GO
CREATE TRIGGER f_indice_ai0
	AFTER INSERT
	ON f_indice
	FOR EACH ROW
	EXECUTE PROCEDURE fn_afterinsert_f_indice()
GO

CREATE TABLE "public"."f_indice_valor" (
	"idempresa" Integer NOT NULL, 
	"idindice" Integer NOT NULL, 
	"competencia" timestamp NOT NULL, 
	"valor" Double Precision NOT NULL,
	CONSTRAINT "pk_f_indice_valor" PRIMARY KEY ("idempresa", "idindice", "competencia"), 
	FOREIGN KEY ("idempresa", "idindice")
		REFERENCES "public"."f_indice" ("idindice", "idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18220
	 
	ON f_indice_valor
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18221
	 
	ON f_indice_valor
	FOR EACH
GO

CREATE TABLE "public"."f_informado" (
	"idempresa" Integer NOT NULL, 
	"idfolha" Integer NOT NULL, 
	"idfuncionario" Integer NOT NULL, 
	"id" Serial, 
	"idevento" Integer NOT NULL, 
	"informado" Double Precision NOT NULL,
	CONSTRAINT "pk_f_informado" PRIMARY KEY ("idempresa", "idfolha", "idfuncionario", "id"), 
	FOREIGN KEY ("idempresa", "idfolha")
		REFERENCES "public"."f_folha" ("idempresa", "idfolha")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idevento")
		REFERENCES "public"."f_evento" ("idevento")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idempresa", "idfuncionario")
		REFERENCES "public"."funcionario" ("idfuncionario", "idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX f_informado_idx1 ON f_informado
	 USING btree (idempresa, idfolha, idfuncionario, idevento)
GO
CREATE TRIGGER RI_ConstraintTrigger_18178
	 
	ON f_informado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18179
	 
	ON f_informado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18183
	 
	ON f_informado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18184
	 
	ON f_informado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18188
	 
	ON f_informado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18189
	 
	ON f_informado
	FOR EACH
GO

CREATE TABLE "public"."f_inss" (
	"id" Serial PRIMARY KEY, 
	"competencia" timestamp NOT NULL, 
	"faixa" Double Precision NOT NULL, 
	"taxa" Double Precision NOT NULL
)
GO
CREATE UNIQUE INDEX f_inss_idx ON f_inss
	 USING btree (competencia, faixa)
GO

CREATE TABLE "public"."f_instrucao" (
	"id" Serial PRIMARY KEY, 
	"idinstrucao" Varchar(2) NOT NULL, 
	"nome" Varchar(50) NOT NULL
)
GO
CREATE UNIQUE INDEX "F_INSTRUCAO_idx" ON f_instrucao
	 USING btree (idinstrucao)
GO

CREATE TABLE "public"."f_lotacao" (
	"idempresa" Integer NOT NULL, 
	"idlotacao" Serial, 
	"nome" Varchar(50) NOT NULL, 
	"tipo" Varchar(1) NOT NULL, 
	"departamento" Integer NOT NULL, 
	"setor" Integer NOT NULL, 
	"secao" Integer NOT NULL, 
	"responsavel" Varchar(50), 
	"endereco" Varchar(50), 
	"cep" Varchar(8), 
	"bairro" Varchar(30), 
	"cidade" Varchar(30), 
	"telefone" Varchar(15), 
	"fax" Varchar(15), 
	"ativo_x" Boolean NOT NULL,
	CONSTRAINT "pk_f_lotacao" PRIMARY KEY ("idempresa", "idlotacao"), 
	FOREIGN KEY ("idempresa")
		REFERENCES "public"."empresa" ("idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18147
	 
	ON f_lotacao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18148
	 
	ON f_lotacao
	FOR EACH
GO

CREATE TABLE "public"."f_natureza_rendimento" (
	"id" Serial PRIMARY KEY, 
	"idnatureza" Varchar(4) NOT NULL, 
	"natureza" Varchar(50) NOT NULL
)
GO
CREATE UNIQUE INDEX "f_natureza_rendimento_IDX" ON f_natureza_rendimento
	 USING btree (idnatureza)
GO
CREATE TRIGGER RI_ConstraintTrigger_18052
	 
	ON f_natureza_rendimento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18053
	 
	ON f_natureza_rendimento
	FOR EACH
GO

CREATE TABLE "public"."f_padrao" (
	"idgp" Integer NOT NULL, 
	"idpadrao" Serial, 
	"idfolha_tipo" Varchar(1) NOT NULL, 
	"idevento" Integer NOT NULL, 
	"idtipo" Varchar(2) NOT NULL, 
	"idsituacao" Varchar(2) NOT NULL, 
	"idvinculo" Varchar(2) NOT NULL, 
	"idsalario" Varchar(2) NOT NULL, 
	"informado" Double Precision NOT NULL, 
	"competencias" Varchar(13), 
	"janeiro_x" Boolean NOT NULL, 
	"fevereiro_x" Boolean NOT NULL, 
	"marco_x" Boolean NOT NULL, 
	"abril_x" Boolean NOT NULL, 
	"maio_x" Boolean NOT NULL, 
	"junho_x" Boolean NOT NULL, 
	"julho_x" Boolean NOT NULL, 
	"agosto_x" Boolean NOT NULL, 
	"setembro_x" Boolean NOT NULL, 
	"outubro_x" Boolean NOT NULL, 
	"novembro_x" Boolean NOT NULL, 
	"dezembro_x" Boolean NOT NULL, 
	"salario13_x" Boolean NOT NULL,
	CONSTRAINT "pk_f_padrao" PRIMARY KEY ("idgp", "idpadrao"), 
	FOREIGN KEY ("idgp")
		REFERENCES "public"."f_grupo_pagamento" ("idgp")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idfolha_tipo")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idevento")
		REFERENCES "public"."f_evento" ("idevento")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX f_padrao_idx1 ON f_padrao
	 USING btree (idgp, idfolha_tipo, idevento, idtipo, idsituacao, idvinculo, idsalario)
GO
CREATE TRIGGER RI_ConstraintTrigger_18562
	 
	ON f_padrao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18563
	 
	ON f_padrao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18567
	 
	ON f_padrao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18568
	 
	ON f_padrao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18572
	 
	ON f_padrao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18573
	 
	ON f_padrao
	FOR EACH
GO
CREATE TRIGGER f_padrao_bi0
	BEFORE INSERT
	ON f_padrao
	FOR EACH ROW
	EXECUTE PROCEDURE fn_atualizarcompetencia()
GO
CREATE TRIGGER f_padrao_bu0
	BEFORE UPDATE
	ON f_padrao
	FOR EACH ROW
	EXECUTE PROCEDURE fn_atualizarcompetencia()
GO

CREATE TABLE "public"."f_programado" (
	"idempresa" Integer NOT NULL, 
	"idfuncionario" Integer NOT NULL, 
	"id" Serial, 
	"idfolha_tipo" Varchar(1) NOT NULL, 
	"idevento" Integer NOT NULL, 
	"informado" Double Precision NOT NULL, 
	"inicio" timestamp NOT NULL, 
	"termino" timestamp NOT NULL, 
	"suspenso_x" Boolean NOT NULL,
	CONSTRAINT "pk_f_programado" PRIMARY KEY ("idempresa", "idfuncionario", "id"), 
	FOREIGN KEY ("idempresa", "idfuncionario")
		REFERENCES "public"."funcionario" ("idfuncionario", "idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idfolha_tipo")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idevento")
		REFERENCES "public"."f_evento" ("idevento")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18124
	 
	ON f_programado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18125
	 
	ON f_programado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18129
	 
	ON f_programado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18130
	 
	ON f_programado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18134
	 
	ON f_programado
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18135
	 
	ON f_programado
	FOR EACH
GO

CREATE TABLE "public"."f_raca" (
	"id" Serial PRIMARY KEY, 
	"idraca" Varchar(2) NOT NULL, 
	"nome" Varchar(50) NOT NULL
)
GO
CREATE UNIQUE INDEX f_raca_idx ON f_raca
	 USING btree (idraca)
GO

CREATE TABLE "public"."f_recurso" (
	"id" Serial PRIMARY KEY, 
	"idrecurso" Varchar(2) NOT NULL, 
	"nome" Varchar(30) NOT NULL
)
GO
CREATE UNIQUE INDEX "f_recurso_IDX" ON f_recurso
	 USING btree (idrecurso)
GO

CREATE TABLE "public"."f_rescisao" (
	"id" Serial PRIMARY KEY, 
	"idrescisao" Varchar(2) NOT NULL, 
	"nome" Varchar(50) NOT NULL
)
GO
CREATE UNIQUE INDEX "f_rescisao_IDX" ON f_rescisao
	 USING btree (idrescisao)
GO
CREATE TRIGGER RI_ConstraintTrigger_17992
	 
	ON f_rescisao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17993
	 
	ON f_rescisao
	FOR EACH
GO

CREATE TABLE "public"."f_rescisao_contrato" (
	"idempresa" Integer NOT NULL, 
	"idfuncionario" Integer NOT NULL, 
	"demissao" timestamp, 
	"remuneracao" Double Precision NOT NULL, 
	"aviso_previo_x" Boolean NOT NULL, 
	"aviso_previo_data" timestamp, 
	"idrescisao" Varchar(2), 
	"idcaged" Varchar(2) NOT NULL, 
	"idfolha" Integer NOT NULL,
	CONSTRAINT "pk_f_rescisao_contrato" PRIMARY KEY ("idempresa", "idfuncionario"), 
	FOREIGN KEY ("idfuncionario", "idempresa")
		REFERENCES "public"."funcionario" ("idfuncionario", "idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idfolha", "idempresa")
		REFERENCES "public"."f_folha" ("idempresa", "idfolha")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18088
	 
	ON f_rescisao_contrato
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18089
	 
	ON f_rescisao_contrato
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18093
	 
	ON f_rescisao_contrato
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18094
	 
	ON f_rescisao_contrato
	FOR EACH
GO

CREATE TABLE "public"."f_rescisao_evento" (
	"idgp" Integer NOT NULL, 
	"idsindicato" Integer NOT NULL, 
	"idrescisao" Varchar(2) NOT NULL, 
	"idevento" Integer NOT NULL, 
	"idformula" Integer NOT NULL, 
	"mes_direito" Integer NOT NULL, 
	"informacao_x" Boolean NOT NULL,
	CONSTRAINT "pk_f_rescisao_evento" PRIMARY KEY ("idgp", "idsindicato", "idrescisao", "idevento"), 
	FOREIGN KEY ("idsindicato")
		REFERENCES "public"."f_sindicato" ("idsindicato")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idformula")
		REFERENCES "public"."f_formula" ("idformula")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idrescisao")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idevento")
		REFERENCES "public"."f_evento" ("idevento")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17984
	 
	ON f_rescisao_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17985
	 
	ON f_rescisao_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17989
	 
	ON f_rescisao_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17990
	 
	ON f_rescisao_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17994
	 
	ON f_rescisao_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17995
	 
	ON f_rescisao_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17999
	 
	ON f_rescisao_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18000
	 
	ON f_rescisao_evento
	FOR EACH
GO

CREATE TABLE "public"."f_sabado" (
	"id" Serial PRIMARY KEY, 
	"idsabado" Varchar(2) NOT NULL, 
	"nome" Varchar(30) NOT NULL
)
GO
CREATE UNIQUE INDEX "F_SABADO_IDX" ON f_sabado
	 USING btree (idsabado)
GO

CREATE TABLE "public"."f_salario" (
	"id" Serial PRIMARY KEY, 
	"idsalario" Varchar(2) NOT NULL, 
	"nome" Varchar(30) NOT NULL
)
GO
CREATE UNIQUE INDEX "F_SALARIO_IDX" ON f_salario
	 USING btree (idsalario)
GO

CREATE TABLE "public"."f_sequencia" (
	"idgp" Integer NOT NULL, 
	"idevento" Integer NOT NULL, 
	"idformula" Integer NOT NULL, 
	"sequencia" Integer NOT NULL,
	CONSTRAINT "pk_f_sequencia" PRIMARY KEY ("idgp", "idevento"), 
	FOREIGN KEY ("idformula")
		REFERENCES "public"."f_formula" ("idformula")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idevento")
		REFERENCES "public"."f_evento" ("idevento")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idgp")
		REFERENCES "public"."f_grupo_pagamento" ("idgp")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17884
	 
	ON f_sequencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17885
	 
	ON f_sequencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17889
	 
	ON f_sequencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17890
	 
	ON f_sequencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17894
	 
	ON f_sequencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17895
	 
	ON f_sequencia
	FOR EACH
GO

CREATE TABLE "public"."f_sindicato" (
	"idsindicato" Serial PRIMARY KEY, 
	"nome" Varchar(50) NOT NULL, 
	"endereco" Varchar(50), 
	"complemento" Varchar(30), 
	"bairro" Varchar(30), 
	"cidade" Varchar(30), 
	"idpais" Varchar(3), 
	"iduf" Varchar(2), 
	"cep" Varchar(8), 
	"cadastro" timestamp NOT NULL, 
	"atualizacao" timestamp, 
	"cnpj" Varchar(14), 
	"telefone" Varchar(15), 
	"observacao" text
)
GO
CREATE UNIQUE INDEX "SINDICATO_CNPJ_IDX" ON f_sindicato
	 USING btree (cnpj)
GO
CREATE TRIGGER F_SINDICATO_BI0
	BEFORE INSERT
	ON f_sindicato
	FOR EACH ROW
	EXECUTE PROCEDURE fn_atualizarcampocadastro()
GO
CREATE TRIGGER F_SINDICATO_BU0
	BEFORE UPDATE
	ON f_sindicato
	FOR EACH ROW
	EXECUTE PROCEDURE fn_atualizarcampoatualizacao()
GO
CREATE TRIGGER RI_ConstraintTrigger_17987
	 
	ON f_sindicato
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17988
	 
	ON f_sindicato
	FOR EACH
GO

CREATE TABLE "public"."f_situacao" (
	"id" Serial PRIMARY KEY, 
	"idsituacao" Varchar(2) NOT NULL, 
	"nome" Varchar(30), 
	"calcular_x" Boolean NOT NULL
)
GO
CREATE UNIQUE INDEX "f_situacao_IDX" ON f_situacao
	 USING btree (idsituacao)
GO
CREATE TRIGGER RI_ConstraintTrigger_18238
	 
	ON f_situacao
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18239
	 
	ON f_situacao
	FOR EACH
GO

CREATE TABLE "public"."f_tabela" (
	"idempresa" Integer NOT NULL, 
	"idtabela" Serial PRIMARY KEY, 
	"nome" Varchar(30) NOT NULL, 
	FOREIGN KEY ("idempresa")
		REFERENCES "public"."empresa" ("idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX "F_TABELA_IDX" ON f_tabela
	 USING btree (idempresa, idtabela)
GO
CREATE TRIGGER RI_ConstraintTrigger_17796
	 
	ON f_tabela
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17797
	 
	ON f_tabela
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17831
	 
	ON f_tabela
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17832
	 
	ON f_tabela
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17841
	 
	ON f_tabela
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17842
	 
	ON f_tabela
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18586
	 
	ON f_tabela
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18587
	 
	ON f_tabela
	FOR EACH
GO

CREATE TABLE "public"."f_tabela_faixa" (
	"idempresa" Integer NOT NULL, 
	"idtabela" Integer NOT NULL, 
	"competencia" timestamp NOT NULL, 
	"idfaixa" Serial, 
	"faixa" Double Precision NOT NULL, 
	"taxa" Double Precision NOT NULL, 
	"reduzir" Double Precision NOT NULL, 
	"acrescentar" Double Precision NOT NULL,
	CONSTRAINT "pk_f_tabela_faixa" PRIMARY KEY ("idempresa", "idtabela", "competencia", "idfaixa"), 
	FOREIGN KEY ("idempresa")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX f_tabela_faixa_idx1 ON f_tabela_faixa
	 USING btree (idempresa, idtabela, competencia, faixa)
GO
CREATE TRIGGER RI_ConstraintTrigger_18588
	 
	ON f_tabela_faixa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18589
	 
	ON f_tabela_faixa
	FOR EACH
GO
CREATE TRIGGER f_tabela_faixa_ad0
	AFTER DELETE
	ON f_tabela_faixa
	FOR EACH ROW
	EXECUTE PROCEDURE fn_afterdelete_f_tabela_faixa()
GO
CREATE TRIGGER f_tabela_faixa_ai0
	AFTER INSERT
	ON f_tabela_faixa
	FOR EACH ROW
	EXECUTE PROCEDURE fn_afterinsert_f_tabela_faixa()
GO

CREATE TABLE "public"."f_tabela_item" (
	"idempresa" Integer NOT NULL, 
	"idtabela" Integer NOT NULL, 
	"competencia" Integer NOT NULL, 
	"item" Integer NOT NULL, 
	"valor" Double Precision NOT NULL,
	CONSTRAINT "pk_f_tabela_item" PRIMARY KEY ("idempresa", "idtabela", "competencia", "item"), 
	FOREIGN KEY ("idtabela")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17833
	 
	ON f_tabela_item
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17834
	 
	ON f_tabela_item
	FOR EACH
GO

CREATE TABLE "public"."f_tabela_modelo" (
	"idempresa" Integer NOT NULL, 
	"idtabela" Integer NOT NULL, 
	"item" Integer NOT NULL, 
	"nome" Varchar(30),
	CONSTRAINT "pk_f_tabela_modelo" PRIMARY KEY ("idempresa", "idtabela", "item"), 
	FOREIGN KEY ("idempresa")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17843
	 
	ON f_tabela_modelo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17844
	 
	ON f_tabela_modelo
	FOR EACH
GO
CREATE TRIGGER f_tabela_modelo_ai0
	AFTER INSERT
	ON f_tabela_modelo
	FOR EACH ROW
	EXECUTE PROCEDURE fn_afterinsert_f_tabela_modelo()
GO
CREATE TRIGGER f_tabela_modelo_bd0
	BEFORE DELETE
	ON f_tabela_modelo
	FOR EACH ROW
	EXECUTE PROCEDURE fn_beforedelete_f_tabela_modelo()
GO

CREATE TABLE "public"."f_tipo" (
	"id" Serial PRIMARY KEY, 
	"idtipo" Varchar(2) NOT NULL, 
	"nome" Varchar(30)
)
GO
CREATE UNIQUE INDEX "f_tipo_IDX" ON f_tipo
	 USING btree (idtipo)
GO

CREATE TABLE "public"."f_totalizador" (
	"idtotal" Serial PRIMARY KEY, 
	"nome" Varchar(50), 
	"calculo" Varchar(1), 
	"valor" Varchar(1)
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17727
	 
	ON f_totalizador
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17728
	 
	ON f_totalizador
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17746
	 
	ON f_totalizador
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17747
	 
	ON f_totalizador
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17766
	 
	ON f_totalizador
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17767
	 
	ON f_totalizador
	FOR EACH
GO

CREATE TABLE "public"."f_totalizador_evento" (
	"idtotal" Integer NOT NULL, 
	"idevento" Integer NOT NULL, 
	"operacao" Integer NOT NULL,
	CONSTRAINT "pk_f_totalizador_evento" PRIMARY KEY ("idtotal", "idevento"), 
	FOREIGN KEY ("idtotal")
		REFERENCES "public"."f_totalizador" ("idtotal")
		ON UPDATE RESTRICT ON DELETE CASCADE, 
	FOREIGN KEY ("idevento")
		REFERENCES "public"."f_evento" ("idevento")
		ON UPDATE RESTRICT ON DELETE CASCADE
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17763
	 
	ON f_totalizador_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17764
	 
	ON f_totalizador_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17768
	 
	ON f_totalizador_evento
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17769
	 
	ON f_totalizador_evento
	FOR EACH
GO

CREATE TABLE "public"."f_totalizador_folha" (
	"idtotal" Integer NOT NULL, 
	"idfolha_tipo" Varchar(1) NOT NULL, 
	"ativo_x" Boolean NOT NULL,
	CONSTRAINT "pk_f_totalizador_folha" PRIMARY KEY ("idtotal", "idfolha_tipo"), 
	FOREIGN KEY ("idtotal")
		REFERENCES "public"."f_totalizador" ("idtotal")
		ON UPDATE RESTRICT ON DELETE CASCADE, 
	FOREIGN KEY ("idfolha_tipo")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE CASCADE
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17748
	 
	ON f_totalizador_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17749
	 
	ON f_totalizador_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17753
	 
	ON f_totalizador_folha
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17754
	 
	ON f_totalizador_folha
	FOR EACH
GO

CREATE TABLE "public"."f_totalizador_incidencia" (
	"idtotal" Integer NOT NULL, 
	"idincidencia" Integer NOT NULL, 
	"proventos_x" Boolean NOT NULL, 
	"descontos_x" Boolean NOT NULL, 
	"operacao" Integer NOT NULL, 
	"ativo_x" Boolean NOT NULL,
	CONSTRAINT "pk_f_totalizador_incidencia" PRIMARY KEY ("idtotal", "idincidencia"), 
	FOREIGN KEY ("idincidencia")
		REFERENCES "public"."f_incidencia" ("idincidencia")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idtotal")
		REFERENCES "public"."f_totalizador" ("idtotal")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17724
	 
	ON f_totalizador_incidencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17725
	 
	ON f_totalizador_incidencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17729
	 
	ON f_totalizador_incidencia
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17730
	 
	ON f_totalizador_incidencia
	FOR EACH
GO

CREATE TABLE "public"."f_valor_fixo" (
	"id" Serial PRIMARY KEY, 
	"idempresa" Integer NOT NULL, 
	"idvfixo" Integer NOT NULL, 
	"nome" Varchar(30) NOT NULL, 
	"valor" Double Precision NOT NULL
)
GO
CREATE UNIQUE INDEX "F_VALOR_FIXO_IDX" ON f_valor_fixo
	 USING btree (idempresa, idvfixo)
GO

CREATE TABLE "public"."f_vinculo" (
	"id" Serial PRIMARY KEY, 
	"idvinculo" Varchar(2) NOT NULL, 
	"nome" Varchar(30) NOT NULL
)
GO
CREATE UNIQUE INDEX "F_VINCULO_IDX" ON f_vinculo
	 USING btree (idvinculo)
GO

CREATE TABLE "public"."feriado" (
	"id" Serial PRIMARY KEY, 
	"data" timestamp NOT NULL, 
	"descricao" Varchar(30) NOT NULL
)
GO
CREATE UNIQUE INDEX "FERIADO_IDX" ON feriado
	 USING btree (data)
GO

CREATE TABLE "public"."funcionario" (
	"idempresa" Integer NOT NULL, 
	"idfuncionario" Serial, 
	"idpessoa" Integer NOT NULL, 
	"idadmissao" Varchar(2) NOT NULL, 
	"idraca" Varchar(2) NOT NULL, 
	"idsabado" Varchar(2) NOT NULL, 
	"idsalario" Varchar(2) NOT NULL, 
	"idvarchar(2)" Varchar(2) NOT NULL, 
	"idtipo" Varchar(2) NOT NULL, 
	"idvinculo" Varchar(2) NOT NULL, 
	"idfgts" Varchar(2) NOT NULL, 
	"admissao" timestamp NOT NULL, 
	"carga_horaria" Integer NOT NULL, 
	"salario" Double Precision NOT NULL, 
	"idrescisao" Varchar(2), 
	"idinstrucao" Varchar(2) NOT NULL, 
	"idcargo" Integer NOT NULL, 
	"cargo_nivel" Integer NOT NULL, 
	"idlotacao" Integer NOT NULL, 
	"ctps" Varchar(20), 
	"pis_ipasep" Varchar(11), 
	"demissao" timestamp, 
	"ano_chegada" Integer NOT NULL, 
	"optante_x" Boolean NOT NULL, 
	"fgts_x" Boolean NOT NULL, 
	"fgts_opcao" timestamp, 
	"fgts_retratacao" timestamp, 
	"deficiente_x" Boolean NOT NULL, 
	"idrecurso" Varchar(2) NOT NULL, 
	"idsindicato" Integer NOT NULL, 
	"idgp" Integer NOT NULL, 
	"dependente_ir" Integer NOT NULL, 
	"idbanco" Varchar(3) NOT NULL DEFAULT '000'::character varying, 
	"idagencia" Varchar(5) NOT NULL DEFAULT '00000'::character varying, 
	"conta_bancaria" Varchar(10), 
	"imposto_sindical_x" Boolean NOT NULL, 
	"adiantamento_x" Boolean NOT NULL, 
	"adiantamento" Double Precision NOT NULL, 
	"idcaged_admissao" Varchar(2) NOT NULL, 
	"idnatureza" Varchar(4) NOT NULL, 
	"ctps_serie" Varchar(10), 
	"ctps_orgao" Varchar(10), 
	"ctps_emissao" timestamp,
	CONSTRAINT "pk_funcionario" PRIMARY KEY ("idempresa", "idfuncionario"), 
	FOREIGN KEY ("idgp")
		REFERENCES "public"."f_grupo_pagamento" ("idgp")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idempresa")
		REFERENCES "public"."empresa" ("idempresa")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idpessoa", "idempresa")
		REFERENCES "public"."pessoa" ("idempresa", "idpessoa")
		ON UPDATE RESTRICT ON DELETE RESTRICT, 
	FOREIGN KEY ("idnatureza")
		REFERENCES "" ()
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE TRIGGER RI_ConstraintTrigger_18044
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18045
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18049
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18050
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18054
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18055
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18059
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18060
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18073
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18074
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER funcionario_bd0
	BEFORE DELETE
	ON funcionario
	FOR EACH ROW
	EXECUTE PROCEDURE fn_beforedelete_funcionario()
GO
CREATE TRIGGER RI_ConstraintTrigger_18086
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18087
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18127
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18128
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18176
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18177
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18335
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18336
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18403
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18404
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18531
	 
	ON funcionario
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18532
	 
	ON funcionario
	FOR EACH
GO

CREATE TABLE "public"."loja" (
	"id" Serial PRIMARY KEY, 
	"idempresa" Integer NOT NULL, 
	"idloja" Integer NOT NULL, 
	"nome" Varchar(30) NOT NULL
)
GO
CREATE UNIQUE INDEX "LOJA_IDX" ON loja
	 USING btree (idempresa, idloja)
GO

CREATE TABLE "public"."pais" (
	"id" Serial PRIMARY KEY, 
	"idpais" Varchar(3) NOT NULL, 
	"nome" Varchar(30) NOT NULL, 
	"nacionalidade" Varchar(30), 
	"capital" Varchar(30)
)
GO
CREATE UNIQUE INDEX "PAIS_IDX" ON pais
	 USING btree (idpais)
GO

CREATE TABLE "public"."pessoa" (
	"idempresa" Integer NOT NULL, 
	"idpessoa" Integer NOT NULL, 
	"nome" Varchar(50) NOT NULL, 
	"apelido" Varchar(30), 
	"atividade" Varchar(30), 
	"pessoa" Varchar(1) DEFAULT 'F'::character varying, 
	"cpf_cgc" Varchar(14), 
	"rg" Varchar(20), 
	"sexo" Varchar(1), 
	"pai" Varchar(50), 
	"mae" Varchar(50), 
	"idnacionalidade" Varchar(3), 
	"idnaturalidade" Varchar(2), 
	"idestado_civil" Varchar(2), 
	"endereco" Varchar(50), 
	"complemento" Varchar(30), 
	"bairro" Varchar(30), 
	"cidade" Varchar(30), 
	"idpais" Varchar(3), 
	"iduf" Varchar(2), 
	"cep" Varchar(8), 
	"endereco2" Varchar(30), 
	"complemento2" Varchar(30), 
	"bairro2" Varchar(30), 
	"cidade2" Varchar(30), 
	"idpais2" Varchar(3), 
	"iduf2" Varchar(2), 
	"cep2" Varchar(8), 
	"celular" Varchar(15), 
	"bip" Varchar(15), 
	"fax" Varchar(15), 
	"principal" Varchar(15), 
	"complementar" Varchar(15), 
	"fonefax" Varchar(15), 
	"email" Varchar(250), 
	"homepage" Varchar(250), 
	"observacao" Varchar(250), 
	"cadastro" timestamp, 
	"atualizacao" timestamp, 
	"nascimento" timestamp, 
	"rg_orgao" Varchar(10), 
	"rg_emissao" timestamp,
	CONSTRAINT "pk_pessoa" PRIMARY KEY ("idempresa", "idpessoa")
)
GO
CREATE TRIGGER pessoa_bi0
	BEFORE INSERT
	ON pessoa
	FOR EACH ROW
	EXECUTE PROCEDURE fn_atualizarcampocadastro()
GO
CREATE TRIGGER pessoa_bu0
	BEFORE UPDATE
	ON pessoa
	FOR EACH ROW
	EXECUTE PROCEDURE fn_atualizarcampoatualizacao()
GO
CREATE TRIGGER RI_ConstraintTrigger_18057
	 
	ON pessoa
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_18058
	 
	ON pessoa
	FOR EACH
GO

CREATE TABLE "public"."plano_conta" (
	"idempresa" Integer NOT NULL, 
	"idplano" Integer NOT NULL, 
	"nome" Varchar(50), 
	"codigo" Varchar(15), 
	"tipo" Varchar(1) NOT NULL DEFAULT 'A'::character varying, 
	"retificadora_x" Boolean NOT NULL, 
	"idplano_grupo" Integer NOT NULL,
	CONSTRAINT "pk_plano_conta" PRIMARY KEY ("idempresa", "idplano"), 
	FOREIGN KEY ("idplano_grupo", "idempresa")
		REFERENCES "public"."plano_grupo" ("idempresa", "idplano_grupo")
		ON UPDATE RESTRICT ON DELETE RESTRICT
)
GO
CREATE UNIQUE INDEX plano_conta_idx1 ON plano_conta
	 USING btree (idempresa, codigo)
GO
CREATE TRIGGER RI_ConstraintTrigger_17608
	 
	ON plano_conta
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17609
	 
	ON plano_conta
	FOR EACH
GO

CREATE TABLE "public"."plano_grupo" (
	"idempresa" Integer NOT NULL, 
	"idplano_grupo" Integer NOT NULL, 
	"nome" Varchar(30) NOT NULL,
	CONSTRAINT "pk_plano_grupo" PRIMARY KEY ("idempresa", "idplano_grupo")
)
GO
CREATE TRIGGER RI_ConstraintTrigger_17606
	 
	ON plano_grupo
	FOR EACH
GO
CREATE TRIGGER RI_ConstraintTrigger_17607
	 
	ON plano_grupo
	FOR EACH
GO

CREATE TABLE "public"."sys_empresa" (
	"chave" Varchar(15) NOT NULL PRIMARY KEY, 
	"valor" Varchar(250), 
	"ativo" Smallint NOT NULL DEFAULT 1
)
GO

CREATE TABLE "public"."sys_form" (
	"form" Varchar(15) NOT NULL, 
	"controle" Varchar(15) NOT NULL, 
	"valor" Integer NOT NULL, 
	"ativo" Boolean NOT NULL,
	CONSTRAINT "pk_sys_form" PRIMARY KEY ("form", "controle")
)
GO

CREATE TABLE "public"."sys_user" (
	"login" Varchar(15) NOT NULL, 
	"chave" Varchar(30) NOT NULL, 
	"valor" Varchar(100), 
	"ativo" BOOLEAN NOT NULL DEFAULT 1,
	CONSTRAINT "pk_sys_user" PRIMARY KEY ("login", "chave")
)
GO
CREATE UNIQUE INDEX "SYS_USER_IDX" ON sys_user
	 USING btree (login, chave)
GO

CREATE TABLE "public"."system" (
	"id" Serial PRIMARY KEY, 
	"local" Varchar(15) NOT NULL, 
	"chave" Varchar(30) NOT NULL, 
	"valor" Varchar(100), 
	"descricao" Varchar(100), 
	"ativo" Boolean NOT NULL DEFAULT true
)
GO
CREATE UNIQUE INDEX "SYSTEM_IDX" ON system
	 USING btree (local, chave)
GO
CREATE UNIQUE INDEX "SYSTEM_IDX1" ON system
	 USING btree (local, chave)
GO

CREATE TABLE "public"."uf" (
	"iduf" Varchar(2) NOT NULL PRIMARY KEY, 
	"nome" Varchar(30) NOT NULL, 
	"naturalidade" Varchar(30), 
	"capital" Varchar(30), 
	"regiao" Varchar(2)
)
GO

CREATE TABLE "public"."user_access" (
	"id" Serial PRIMARY KEY, 
	"group_id" Integer NOT NULL, 
	"menu_id" Integer NOT NULL, 
	"authorized" Boolean NOT NULL DEFAULT false
)
GO
CREATE UNIQUE INDEX "USER_ACCESS_IDX" ON user_access
	 USING btree (group_id, menu_id)
GO

CREATE TABLE "public"."user_group" (
	"group_id" Serial PRIMARY KEY, 
	"group_name" Varchar(50)
)
GO

CREATE TABLE "public"."user_progs" (
	"id" Serial PRIMARY KEY, 
	"menu_name" Varchar(50) NOT NULL, 
	"menu_id" Integer NOT NULL, 
	"menu_level" Integer NOT NULL, 
	"menu_order" Integer NOT NULL, 
	"menu_caption" Varchar(100) NOT NULL, 
	"menu_parent" Integer NOT NULL, 
	"menu_active" Boolean NOT NULL DEFAULT true
)
GO
CREATE UNIQUE INDEX "USER_PROGS_IDX" ON user_progs
	 USING btree (menu_name)
GO

CREATE TABLE "public"."user_users" (
	"user_id" Serial PRIMARY KEY, 
	"user_login" Varchar(15) NOT NULL, 
	"user_name" Varchar(50) NOT NULL, 
	"last_pwd_change" timestamp, 
	"expiration_date" timestamp, 
	"user_active" Boolean NOT NULL DEFAULT true, 
	"group_id" Integer NOT NULL DEFAULT 0, 
	"user_pwd" Varchar(15)
)
GO

CREATE TABLE "public"."version" (
	"version" Varchar(20) NOT NULL
)
GO

CREATE OR REPLACE FUNCTION fn_afterdelete_f_tabela_faixa()
RETURNS trigger AS
$BODY$
   DECLARE iCount INTEGER;
begin 
	  /* Se nao houve mais faixas para a tabela
	     os itens tambem sao excluidos */
	
	  SELECT COUNT(*) FROM F_TABELA_FAIXA
	  WHERE IDEMPRESA = OLD.IDEMPRESA AND IDTABELA = OLD.IDTABELA AND
	        COMPETENCIA = OLD.COMPETENCIA
	  INTO iCount;
if (iCount = 0) then
	    DELETE FROM F_TABELA_ITEM
	    WHERE IDEMPRESA = OLD.IDEMPRESA AND IDTABELA = OLD.IDTABELA AND
	        COMPETENCIA = OLD.COMPETENCIA;
end if;
--return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_afterinsert_f_indice()
RETURNS trigger AS
$BODY$
   declare data TimeStamp;
declare row f_indice_valor%rowtype;
begin 
      FOR row in 
	    SELECT DISTINCT COMPETENCIA FROM f_indice_valor
	  WHERE (IDEMPRESA = NEW.IDEMPRESA)
      LOOP 
        data = row.competencia;
INSERT INTO F_INDICE_VALOR
	      ( IDEMPRESA, IDINDICE, COMPETENCIA, VALOR)
	    VALUES
	      ( NEW.IDEMPRESA, NEW.IDINDICE, data, 0);
END LOOP;
return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_afterinsert_f_tabela_faixa()
RETURNS trigger AS
$BODY$
   declare iCount INTEGER;
declare dData timestamp;
begin 
  /* Verifica se existe ITENS para a competencia */
  SELECT COUNT(ITEM) FROM F_TABELA_ITEM
  WHERE IDEMPRESA = NEW.IDEMPRESA AND IDTABELA = NEW.IDTABELA AND COMPETENCIA = NEW.COMPETENCIA
  INTO iCount;
if (iCount = 0) then
  
    SELECT COUNT(COMPETENCIA) FROM F_TABELA_ITEM
    WHERE IDEMPRESA = NEW.IDEMPRESA AND IDTABELA = NEW.IDTABELA AND COMPETENCIA < NEW.COMPETENCIA
    INTO iCount;
if (iCount = 0) then
    
      /* Nao existe uma competencia menor que a competencia em questao
         apenas inclui os itens do modelo com valores default */

      INSERT INTO F_TABELA_ITEM
        (IDEMPRESA, IDTABELA, COMPETENCIA, ITEM)
      SELECT IDEMPRESA, IDTABELA, NEW.COMPETENCIA, ITEM
      FROM F_TABELA_MODELO
      WHERE IDEMPRESA = NEW.IDEMPRESA AND IDTABELA = NEW.IDTABELA;
else
    
      /* Os valores dos itens sac copiados de uma competencia
         imediatamente menor que a competencia em questao */

      SELECT MAX(COMPETENCIA) FROM F_TABELA_ITEM
      WHERE IDEMPRESA = NEW.IDEMPRESA AND IDTABELA = NEW.IDTABELA AND COMPETENCIA < NEW.COMPETENCIA
      INTO dData;
INSERT INTO F_TABELA_ITEM
        (IDEMPRESA, IDTABELA, COMPETENCIA, ITEM, VALOR)
      SELECT IDEMPRESA, IDTABELA, NEW.COMPETENCIA, ITEM, VALOR FROM F_TABELA_ITEM
      WHERE IDEMPRESA = NEW.IDEMPRESA AND IDTABELA = NEW.IDTABELA AND COMPETENCIA = dData;
end if;
end if;
return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_afterinsert_f_tabela_modelo()
RETURNS trigger AS
$BODY$
   declare data TimeStamp;
declare row f_tabela_item%rowtype;
begin 
      FOR row in 
	    SELECT DISTINCT competencia FROM F_TABELA_ITEM
	  WHERE (IDEMPRESA = NEW.IDEMPRESA AND IDTABELA = NEW.IDTABELA)
      LOOP 
        data = row.competencia;
INSERT INTO F_TABELA_ITEM
	      ( IDEMPRESA, IDTABELA, COMPETENCIA, ITEM, VALOR)
	    VALUES
	      ( NEW.IDEMPRESA, NEW.IDTABELA, data, NEW.ITEM, 0);
END LOOP;
return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_atualizarcampoatualizacao()
RETURNS trigger AS
$BODY$
   begin 
      new.atualizacao = now();
return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_atualizarcampocadastro()
RETURNS trigger AS
$BODY$
   begin 
      new.cadastro = now();
return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_atualizarcompetencia()
RETURNS trigger AS
$BODY$
   declare sComp VARCHAR(13);
begin 
	  sComp = '';
if (NEW.JANEIRO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.FEVEREIRO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.MARCO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.ABRIL_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.MAIO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.JUNHO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.JULHO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.AGOSTO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.SETEMBRO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.OUTUBRO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.NOVEMBRO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.DEZEMBRO_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
if (NEW.SALARIO13_X = true) then sComp = sComp || 'X';
else sComp = sComp || ' ';
end if;
NEW.COMPETENCIAS = sComp;
return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_beforedelete_f_central_funcionario()
RETURNS trigger AS
$BODY$
   begin 
	  delete from f_central
	  where idempresa = old.idempresa
	        and idfolha = old.idfolha
	        and idfuncionario = old.idfuncionario;
--return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_beforedelete_f_folha()
RETURNS trigger AS
$BODY$
   begin 
	  DELETE FROM F_FOLHA_CP
	  WHERE (IDEMPRESA = OLD.IDEMPRESA) AND
	        ( (IDFOLHA = OLD.IDFOLHA) OR
	          (IDFOLHA_CP = OLD.IDFOLHA) );
--return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_beforedelete_f_tabela_modelo()
RETURNS trigger AS
$BODY$
   begin 
	  DELETE FROM F_TABELA_ITEM
	  WHERE IDEMPRESA = OLD.IDEMPRESA AND IDTABELA = OLD.IDTABELA AND ITEM = OLD.ITEM;
--return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_beforedelete_funcionario()
RETURNS trigger AS
$BODY$
   begin 
	  DELETE FROM F_DEPENDENTE
	  WHERE IDEMPRESA = OLD.IDEMPRESA AND
	        IDFUNCIONARIO = OLD.IDFUNCIONARIO;
DELETE FROM F_CENTRAL_FUNCIONARIO
	  WHERE IDEMPRESA = OLD.IDEMPRESA AND
	        IDFUNCIONARIO = OLD.IDFUNCIONARIO;
--return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_beforeinsert_f_folha()
RETURNS trigger AS
$BODY$
   begin 
	  if (new.competencia = 13) then
	    new.mes = 12;
else
	    new.mes = new.competencia;
end if;
return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_beforeupdate_f_folha()
RETURNS trigger AS
$BODY$
   begin 
	  if (new.competencia = 13) then
	    new.mes = 12;
else
	    new.mes = new.competencia;
end if;
return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE OR REPLACE FUNCTION fn_tg_f_evento()
RETURNS trigger AS
$BODY$
   begin 
  if (new.tipo_calculo <> 'C') then /*  CONTRA-PARTIDA */
    new.contra_partida = 0;
end if;
if (new.tipo_evento = 'D') then /* DESCONTO*/
    new.liquido = -1;
end if;
if (new.tipo_evento = 'P') then /* PROVENTO*/
    new.liquido = 1;
end if;
if (new.tipo_evento = 'B') then /* BASE DE CALCULO*/
    new.liquido = 0;
new.inc_01_x = false;
new.inc_02_x = false;
new.inc_03_x = false;
new.inc_04_x = false;
new.inc_05_x = false;
new.inc_06_x = false;
new.inc_07_x = false;
new.inc_08_x = false;
new.inc_09_x = false;
new.inc_10_x = false;
new.inc_11_x = false;
new.inc_12_x = false;
new.inc_13_x = false;
new.inc_14_x = false;
new.inc_15_x = false;
new.inc_16_x = false;
new.inc_17_x = false;
new.inc_18_x = false;
new.inc_19_x = false;
new.inc_20_x = false;
else
    new.total_lotacao_x = True;
new.contra_cheque_x = True;
end if;
return new;
end;
$BODY$
LANGUAGE plpgsql VOLATILE;
GO

CREATE SEQUENCE "public"."agencia_idagencia_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."banco_idbanco_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."empresa_dados_idempresa_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."empresa_idempresa_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."estado_civil_idestado_civil_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_admissao_idadmissao_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_automatico_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_base_evento_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_base_folha_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_base_idbase_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_caged_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_cargo_idcargo_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_central_funcionario_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_central_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_comprovante_rendimento_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_dependente_tipo_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_evento_grupo_idgrupo_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_evento_idevento_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_evento_lista_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_ferias_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_fgts_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_folha_base_idfolha_base_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_folha_cp_idfolha_cp_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_folha_tipo_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_folha_tipo_situacao_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_formula_idformula_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_grupo_empresa_idge_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_grupo_pagamento_idgp_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_incidencia_idincidencia_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_indice_idindice_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_informado_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_inss_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_instrucao_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_lotacao_idlotacao_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_natureza_rendimento_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_padrao_idpadrao_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_programado_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_raca_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_recurso_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_rescisao_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_sabado_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_salario_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_sindicato_idsindicato_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_situacao_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_tabela_faixa_idfaixa_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_tabela_idtabela_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_tipo_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_totalizador_idtotal_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_valor_fixo_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."f_vinculo_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."feriado_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."funcionario_idfuncionario_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."loja_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."pais_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."system_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."user_access_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."user_group_group_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."user_progs_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO

CREATE SEQUENCE "public"."user_users_user_id_seq"
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
GO
