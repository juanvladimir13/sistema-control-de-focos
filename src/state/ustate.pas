unit uState;

{$MODE Delphi}

interface

{ State -> State }

type
  IState = interface (IInterface)
    procedure encendido();
    procedure luzMedia();
    procedure apagado();
    procedure fueraDeServicio();
  end;

implementation

end.

