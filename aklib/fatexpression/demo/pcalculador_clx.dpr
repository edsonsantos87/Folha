program pcalculador_clx;

uses
  QForms,
  ucalculador_clx in 'ucalculador_clx.pas' {Calculador},
  ClipperExpression in '../ClipperExpression.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCalculador, Calculador);
  Application.Run;
end.
