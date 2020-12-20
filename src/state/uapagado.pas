unit uApagado;

{$MODE Delphi}

interface

uses
  SysUtils,
  uState, uStateType,
  uContext;

{ State -> ConcreteState }

type
  TApagado = class(TInterfacedObject, IState)
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

{ TApagado }

constructor TApagado.create(_context: TContext);
begin
  Self.context := _context;
end;

procedure TApagado.encendido();
var encendidoState: IState;
begin
  encendidoState:= context.getState(TStateType.Encendido);
  context.setState(encendidoState);
end;

procedure TApagado.luzMedia();
begin
  raise Exception.create('Estado no valido');
end;

procedure TApagado.apagado();
var apagadoState:IState;
begin
end;

procedure TApagado.fueraDeServicio();
var fueraDeServicioState: IState;
begin
  fueraDeServicioState:= context.getState(TStateType.FueraDeServicio);
  context.setState(fueraDeServicioState);
end;

end.

