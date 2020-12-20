program prDomotica;

{$MODE Delphi}

uses
  Forms, Interfaces,
  ufprincipal in 'src\ufprincipal.pas' {TFPrincipal},
  ufoco in 'src\factorymethod\ufoco.pas',
  ufococreator in 'src\factorymethod\ufococreator.pas',
  ufocohabitacion in 'src\factorymethod\ufocohabitacion.pas',
  ufocolampara in 'src\factorymethod\ufocolampara.pas',
  ufocomanager in 'src\factorymethod\ufocomanager.pas',
  ufocopasillo in 'src\factorymethod\ufocopasillo.pas',
  ufocotype in 'src\factorymethod\ufocotype.pas',
  uprototype in 'src\prototype\uprototype.pas',
  uapagado in 'src\state\uapagado.pas',
  ucontext in 'src\state\ucontext.pas',
  uencendido in 'src\state\uencendido.pas',
  ufueradeservicio in 'src\state\ufueradeservicio.pas',
  uluzmedia in 'src\state\uluzmedia.pas',
  ustate in 'src\state\ustate.pas',
  ustatetype in 'src\state\ustatetype.pas',
  uclient in 'src\uclient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
