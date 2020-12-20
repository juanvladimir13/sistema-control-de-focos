unit uFocoPasillo;

{$MODE Delphi}

interface

uses
  sysutils,
  uFoco, uFocoType,
  uContext;

{ Factory method -> ConcreteProduct }

type
    TFocoPasillo = class(TFoco)
    private
      encendidoAutomatico: Boolean;
      context: TContext;
    public
      { Metodos de la clase }
      constructor create();
      function ToString(): String; override;

      { Getters and Setters }
      procedure setEncendidoAutomatico(_encendidoAutomatico: Boolean);
      function getEncendidoAutomatico():Boolean;
      procedure setContext(_context: TContext);
      function getContext():TContext;
      procedure setData(codigo:String; voltaje: ShortInt; ubicacion: String; _encendidoAutomatico:Boolean);

      { Metodos de la clase TFoco }
      procedure encender(); override;
      procedure luzMedia(); override;
      procedure apagar(); override;
      procedure fueraDeServicio(); override;
      function getEstado():String; override;

      { Metodos del patron Prototype }
      function clone():TObject; override;
   end;

implementation

{ TFocoPasillo }

constructor TFocoPasillo.create();
begin
  inherited create();
  context:= TContext.create();

  setTipo(TFocoType.Pasillo);
  encendidoAutomatico:= False;
end;

procedure TFocoPasillo.encender();
begin
  context.encender();
end;

procedure TFocoPasillo.luzMedia();
begin
  context.luzMedia();
end;

procedure TFocoPasillo.apagar();
begin
  context.apagar();
end;

procedure TFocoPasillo.fueraDeServicio();
begin
  context.fueraDeServicio();
end;

function TFocoPasillo.getEstado(): String;
begin
  Result:= context.getStateName();
end;

function TFocoPasillo.ToString(): String;
var info:String;
begin
  info := 'Cod: ' + getCodigo() + #13;
  info := info + 'Tipo: ' + getTipoStr() + #13;
  info := info + 'Voltaje: ' + IntToStr(getVoltaje()) + #13;
  info := info + 'Ubicacion: ' + getUbicacion + #13;
  info := info + 'Encendido Auto: ' + BoolToStr(encendidoAutomatico) + #13;
  info := info + 'Estado: ' + getEstado();
  Result:= info;
end;

procedure TFocoPasillo.setData(codigo: String;
  voltaje: ShortInt; ubicacion: String; _encendidoAutomatico:Boolean);
begin
   setCodigo(codigo);
   setVoltaje(voltaje);
   setUbicacion(ubicacion);
   setEncendidoAutomatico(_encendidoAutomatico);
end;

procedure TFocoPasillo.setEncendidoAutomatico(_encendidoAutomatico: Boolean);
begin
  Self.encendidoAutomatico:= _encendidoAutomatico;
end;

function TFocoPasillo.getEncendidoAutomatico(): Boolean;
begin
  Result:= encendidoAutomatico;
end;

procedure TFocoPasillo.setContext(_context: TContext);
begin
  Self.context := _context;
end;

function TFocoPasillo.getContext(): TContext;
begin
  Result:= context;
end;

function TFocoPasillo.clone(): TObject;
var foco: TFocoPasillo;
begin
  foco := TFocoPasillo.create();
  foco.setCodigo(getCodigo());
  foco.setTipo(getTipo());
  foco.setVoltaje(getVoltaje());
  foco.setUbicacion(getUbicacion());
  foco.setEncendidoAutomatico(getEncendidoAutomatico());
  foco.setContext(TContext(getContext().clone()));
  Result := foco;
end;

end.

