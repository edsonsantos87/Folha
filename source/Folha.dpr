program Folha;

{$I flivre.inc}


uses
  Forms,
  SysUtils,
  main in 'main.pas' {TFrmFLivre},
  flotacao in 'flotacao.pas' {FrmLotacao},
  ffolha in 'ffolha.pas' {FrmFolha},
  fevento in 'fevento.pas' {FrmEvento},
  fincidencia in 'fincidencia.pas' {FrmIncidencia},
  fvfixo in 'fvfixo.pas' {FrmVFixo},
  ffuncionario in 'ffuncionario.pas',
  fevento_grupo in 'fevento_grupo.pas' {FrmEvento_Grupo},
  fcargo in 'fcargo.pas' {FrmCargo},
  fformula in 'fformula.pas' {FrmFormula},
  ftabela in 'ftabela.pas' {FrmTabela},
  fgrupo_empresa in 'fgrupo_empresa.pas' {FrmGrupoEmpresa},
  fgrupo_pagamento in 'fgrupo_pagamento.pas' {FrmGrupoPagamento},
  fempresas in 'fempresas.pas' {FrmEmpresa},
  fsequencia in 'fsequencia.pas' {FrmSequencia},
  ffolha_tipo in 'ffolha_tipo.pas' {FrmFolhaTipo},
  fpadrao in 'fpadrao.pas' {FrmPadrao},
  finformado in 'finformado.pas' {FrmInformado},
  fautomatico in 'fautomatico.pas' {FrmAutomatico},
  fcalculador in 'fcalculador.pas',
  findice_valor in 'findice_valor.pas' {FrmIndiceValor},
  r_analitica in 'r_analitica.pas',
  r_contra_cheque in 'r_contra_cheque.pas',
  r_total_lotacao in 'r_total_lotacao.pas',
  fdialogo in 'kernel\fdialogo.pas' {FrmDialogo},
  fplano_grupo in 'kernel\fplano_grupo.pas' {FrmPlanoGrupo},
  sys_user in 'kernel\sys_user.pas' {frmsysuser},
  sys_global in 'kernel\sys_global.pas' {frmsysglobal},
  sys_empresa in 'kernel\sys_empresa.pas' {frmsysempresa},
  fplano in 'kernel\fplano.pas' {FrmPlano},
  fbase in 'kernel\fbase.pas' {FrmBase},
  fcadastro in 'kernel\fcadastro.pas' {FrmCadastro},
  fendereco in 'kernel\fendereco.pas' {FrameEndereco: TFrame},
  ffind in 'kernel\ffind.pas',
  ftipo in 'ftipo.pas',
  frecurso in 'frecurso.pas',
  r_lista_bancaria in 'r_lista_bancaria.pas',
  fupgrade in 'fupgrade.pas',
  fbanco in 'fbanco.pas' {FrmBanco},
  fdependente in 'fdependente.pas',
  fdependente_tipo in 'fdependente_tipo.pas',
  sys_empresa_dados in 'kernel\sys_empresa_dados.pas' {FrmSysEmpresaDados},
  r_lista_liquido in 'r_lista_liquido.pas',
  fsindicato in 'fsindicato.pas' {FrmSindicato},
  ftotalizador in 'ftotalizador.pas',
  fsituacao in 'fsituacao.pas',
  fbase_acumulacao in 'fbase_acumulacao.pas',
  frescisao in 'frescisao.pas',
  frescisao_causa in 'frescisao_causa.pas',
  splash in 'splash.pas' {SplashForm},
  frescisao_funcionario in 'frescisao_funcionario.pas' {frmRescisaoFuncionario},
  fcaged in 'fcaged.pas',
  fferiado in 'fferiado.pas' {FrmFeriado},
  fprogramado in 'fprogramado.pas',
  fimportador in 'fimportador.pas',
  fc_rendimto in 'fc_rendimto.pas' {frmc_rendimento},
  r_c_rendimento in 'r_c_rendimento.pas',
  fcolor in 'kernel\fcolor.pas',
  foption in 'kernel\foption.pas',
  LIB in '..\..\LIB\LIB.pas',
  fCidade in 'fCidade.pas' {FrmCidade};

{$R *.res}
{ Se esta diretiva for ativada a aplicação ficará com a aparença do Windows XP }
{.$R WindowsXP.RES}

begin

  Application.Initialize;

  Application.Title := 'Folha - Folha de Pagamento';
  if FileExists('splashscreen') then
  begin
    //Show Splash Form
    SplashForm := TSplashForm.CreateNew(Application);

    SplashForm.FileName := 'splashscreen';

    {$IFDEF MSWINDOWS}
    SplashForm.FormStyle := fsStayOnTop;
    {$ENDIF}

    SplashForm.Show;
    SplashForm.Update;

  end;

//  {$ENDIF}

  Application.CreateForm(TFrmFLivre, FrmFLivre);
  Application.Run;

end.
