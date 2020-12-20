unit uContext;

{$MODE Delphi}

interface

uses
  Classes,
  uState, uStateType;

{ State -> Context }

type
  TContext = class(TObject)
    private
      state : IState;
      states: Array[0..3] of IState;
      stateName:String;
      procedure setStateName(_stateName:String);
    public
      { Metodos de clase }
      constructor create();
      procedure setState(_state: IState);
      function getState():IState; overload;
      function getState(stateType:TStateType):IState; overload;
      function clone():TObject;
      function getStateName():String;

      { Request : metodos del patron State }
      procedure encender();
      procedure luzMedia();
      procedure apagar();
      procedure fueraDeServicio();
  end;

implementation
uses uEncendido, uLuzMedia, uApagado, uFueraDeServicio;

{ TContext }

constructor TContext.create();
begin
  states[0] := TEncendido.create(Self);
  states[1] := TLuzMedia.create(Self);
  states[2] := TApagado.create(Self);
  states[3] := TFueraDeServicio.create(Self);
  state := states[2];
  stateName:= 'Apagado';
end;

procedure TContext.setState(_state: IState);
begin
  Self.state := _state;
end;

function TContext.getState(): IState;
begin
  Result:= state;
end;

function TContext.getState(stateType: TStateType): IState;
var _state:IState;
begin
  _state := nil;
  case stateType of
    TStateType.Encendido :
      begin
        _state := states[0];
        stateName:= 'Encendido';
      end;
    TStateType.LuzMedia :
      begin
      _state := states[1];
      stateName:= 'Luz media';
      end;
    TStateType.Apagado :
      begin
        _state := states[2];
        stateName:= 'Apagado';
      end;
    TStateType.FueraDeServicio :
      begin
        _state := states[3];
        stateName:= 'Fuera de Servicio';
      end;
  end;
  Result:= _state;
end;

procedure TContext.encender();
begin
  state.encendido();
end;

procedure TContext.luzMedia();
begin
  state.luzMedia();
end;

procedure TContext.apagar();
begin
  state.apagado();
end;

procedure TContext.fueraDeServicio();
begin
  state.fueraDeServicio();
end;

function TContext.getStateName(): String;
begin
  Result:= stateName;
end;

procedure TContext.setStateName(_stateName:String);
begin
  Self.stateName:= _stateName;
  if _stateName = 'Encendido' then
    state := states[0];
  if _stateName = 'Luz media' then
    state := states[1];
  if _stateName = 'Apagado' then
    state := states[2];
  if _stateName = 'Fuera de Servicio' then
    state := states[3];
end;

function TContext.clone(): TObject;
var context:TContext;
begin
  context := TContext.create();
  context.setStateName(getStateName());
  Result:= context;
end;

end.

