unit uFocoLampara;

{$MODE Delphi}

interface

uses
  sysutils,
  uFoco, uFocoType,
  uContext;

{ Factory method -> ConcreteProduct }

type
    TFocoLampara = class(TFoco)
    private
      context : TContext;
    public
      { Metodos de clase }
      constructor create();
      function ToString(): String; override;

      { Getters and Setters }
      procedure setContext(_context: TContext);
      function getContext():TContext;
      procedure setData(codigo:String; voltaje: ShortInt; ubicacion: String);

      { Metodos de la clase TFoco }
      procedure encender; override;
      procedure luzMedia; override;
      procedure apagar; override;
      procedure fueraDeServicio; override;
      function getEstado():String; override;

      { Metodos del patron Prototype}
      function clone():TObject; override;
   end;

implementation

{ TFocoLampara }

constructor TFocoLampara.create();
begin
  inherited create();
  context:= TContext.create();

  setTipo(TFocoType.Lampara);
end;

procedure TFocoLampara.setContext(_context: TContext);
begin
  Self.context := _context;
end;

function TFocoLampara.getContext(): TContext;
begin
  Result:= context;
end;

procedure TFocoLampara.encender;
begin
  context.encender();
end;

procedure TFocoLampara.luzMedia;
begin
  context.luzMedia();
end;

procedure TFocoLampara.apagar;
begin
  context.apagar();
end;

procedure TFocoLampara.fueraDeServicio;
begin
  context.fueraDeServicio();
end;

function TFocoLampara.getEstado(): String;
begin
  Result:= context.getStateName();
end;

function TFocoLampara.ToString: String;
var info:String;
begin
  info := 'Cod: ' + getCodigo() + #13;
  info := info + 'Tipo: ' + getTipoStr() + #13;
  info := info + 'Voltaje: ' + IntToStr(getVoltaje()) + #13;
  info := info + 'Ubicacion: ' + getUbicacion() + #13;
  info := info + 'Estado: ' + getEstado();
  Result:= info;
end;

procedure TFocoLampara.setData(codigo: String;
  voltaje: ShortInt; ubicacion: String);
begin
 setCodigo(codigo);
 setVoltaje(voltaje);
 setUbicacion(ubicacion);
end;

function TFocoLampara.clone(): TObject;
var foco: TFocoLampara;
begin
  foco := TFocoLampara.create();
  foco.setCodigo(getCodigo());
  foco.setTipo(getTipo());
  foco.setVoltaje(getVoltaje());
  foco.setUbicacion(getUbicacion());
  foco.setContext(TContext(getContext().clone()));
  Result := foco;
end;

end.

