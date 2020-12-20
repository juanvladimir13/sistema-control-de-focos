unit uFueraDeServicio;

{$MODE Delphi}

interface

uses
  SysUtils,
  uState, uStateType,
  uContext;

{ State -> ConcreteState }

type
  TFueraDeServicio = class(TInterfacedObject, IState)
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

{ TFueraDeServicio }

constructor TFueraDeServicio.create(_context: TContext);
begin
  Self.context := _context;
end;

procedure TFueraDeServicio.encendido();
var encendidoState: IState;
begin
  encendidoState:= context.getState(TStateType.Encendido);
  context.setState(encendidoState);
end;

procedure TFueraDeServicio.luzMedia();
begin
  raise Exception.create('Estado no valido');
end;

procedure TFueraDeServicio.apagado();
begin
  raise Exception.create('Estado no valido');
end;

procedure TFueraDeServicio.fueraDeServicio();
var fueraDeServicioState: IState;
begin
end;

end.

