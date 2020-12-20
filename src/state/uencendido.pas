unit uEncendido;

{$MODE Delphi}

interface

uses
  Classes, Controls,
  SysUtils,
  uState, uStateType,
  uContext;

{ State -> ConcreteState }

type
  TEncendido = class (TInterfacedObject, IState)
    private
      context : TContext;
    public
      constructor create(_context: TContext);

      { Handle : metodos de la Interface IState }
      procedure encendido();
      procedure luzMedia();
      procedure apagado();
      procedure fueraDeServicio();
  end;

implementation

{ TEncendido }

constructor TEncendido.create(_context: TContext);
begin
  Self.context := _context;
end;

procedure TEncendido.encendido();
var encendidoState: IState;
begin
end;

procedure TEncendido.luzMedia();
var luzMediaState:IState;
begin
  luzMediaState:= context.getState(TStateType.LuzMedia);
  context.setState(luzMediaState);
end;

procedure TEncendido.apagado();
var apagadoState:IState;
begin
  apagadoState:= context.getState(TStateType.Apagado);
  context.setState(apagadoState);
end;

procedure TEncendido.fueraDeServicio();
begin
  raise Exception.create('Estado no valido');
end;

end.

