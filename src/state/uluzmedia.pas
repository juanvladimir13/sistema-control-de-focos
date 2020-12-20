unit uLuzMedia;

{$MODE Delphi}

interface

uses
  Sysutils,
  uState, uStateType,
  uContext;

{ State -> ConcreteState }

type
  TLuzMedia = class(TInterfacedObject,IState)
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

{ TLuzMedia }

constructor TLuzMedia.create(_context: TContext);
begin
  Self.context := _context;
end;

procedure TLuzMedia.encendido();
begin
  raise Exception.create('Estado no valido');
end;

procedure TLuzMedia.luzMedia();
var luzMediaState:IState;
begin
end;

procedure TLuzMedia.apagado();
var apagadoState:IState;
begin
  apagadoState:= context.getState(TStateType.Apagado);
  context.setState(apagadoState);
end;

procedure TLuzMedia.fueraDeServicio();
begin
  raise Exception.create('Estado no valido');
end;

end.

