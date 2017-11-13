{                                                                              }
{ Standard compiler directives.                                                }
{                                                                              }

// Opcoes de banco de dados

{$IFNDEF NO_DEFINE_ACESS}
  {.$DEFINE DBX}    // Database Express
  {$DEFINE IBX}    // Interbase Express
  {.$DEFINE IBO}    // Interbase Objects
  {.$DEFINE ADO}    // Acess Data Objet
  {.$DEFINE DBX}    // Database Express
  {.$DEFINE ZEOS}   // Zeos Objects
{$ENDIF}

{$IFDEF IBX}
  {$DEFINE INTERBASE}
{$ENDIF}

{$IFDEF IBO}
  {$DEFINE INTERBASE}
{$ENDIF}

// Opcoes de plataformas

{$IFNDEF LINUX}
  {$DEFINE MSWINDOWS}
{$ENDIF}

{$IFDEF LINUX}
  {$DEFINE CLX}   // O Kylix utiliza exclusivamente a CLX
  {$UNDEF VCL}
{$ENDIF}

{$IFNDEF CLX}
  {$DEFINE VCL}   // Utiliza a VCL como padrão
{$ENDIF}

{$DEFINE SYN_EDIT}
{$DEFINE MDI_WALLPAPER}
{$DEFINE AK_LIB}
{$DEFINE AK_USER}
{$DEFINE AK_LABEL}

{$DEFINE RX_LIB}
{$DEFINE VOLGAPAK}
{$DEFINE SPLASH_SCREEN}

{.$DEFINE DELPHI_BOLETO}

{$IFDEF CLX}
  {$UNDEF MDI_WALLPAPER}
  {$UNDEF RX_LIB}    // A biblioteca RXLIB não está portada para CLX
  {$UNDEF AK_USER}   // O componente AKUSER não está portado para CLX
  {$UNDEF DELPHI_BOLETO}
  {$UNDEF VOLGAPAK}
{$ENDIF}

{$IFDEF FLIVRE}
  {$UNDEF RX_LIB}
  {$UNDEF VOLGAPAK}
  {$UNDEF AK_USER}
  {$DEFINE FIREBIRD}
  {$UNDEF SPLASH_SCREEN}
{$ENDIF}

{$IFNDEF AK_LIB}      // Se a diretica AK_LIB (biblioteca) não estiver definida
   {$UNDEF AK_USER}   // desativa a diretiva AK_USER (componente)
   {$UNDEF AK_LABEL}
{$ENDIF}

{.$DEFINE DEBUG}

// Versao do Delphi

{$IFDEF VER160} { Borland Delphi 8.0 }
  {$DEFINE FL_D8}
{$ENDIF}

{$IFDEF VER150} { Borland Delphi 7.0 }
  {$DEFINE FL_D7}
{$ENDIF}

{$IFDEF VER140} { Borland Delphi 6.0 }
  {$DEFINE FL_D6}
{$ENDIF}

{$IFDEF VER130} { Borland Delphi 5.0 }
  {$DEFINE FL_D5}
{$ENDIF}

{$IFDEF VER120} { Borland Delphi 4.0 }
  {$DEFINE FL_D4}
{$ENDIF}

{$IFDEF VER100} { Borland Delphi 3.0 }
  {$DEFINE FL_D3}
{$ENDIF}

{$IFDEF FL_D7}
  {$DEFINE FL_D6}
{$ENDIF}

{$IFDEF FL_D6}
  {$DEFINE FL_D5}
  {$DEFINE FL_MIDASLIB}
{$ENDIF}

{$IFDEF FL_D5}
  {$DEFINE FL_D4}
{$ENDIF}

{$IFDEF FL_D4}
  {$DEFINE FL_D3}
{$ENDIF}
