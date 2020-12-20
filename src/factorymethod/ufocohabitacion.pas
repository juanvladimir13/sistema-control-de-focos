unit uFocoHabitacion;

{$MODE Delphi}

interface

uses
  Classes,
  sysutils,
  uFoco, uFocoType,
  uContext;

{ Factory method -> ConcreteProduct }

type
  TFocoHabitacion = class(TFoco)
    private
      sensores : TStringList;
      context: TContext;
    public
      { Metodos de clase }
      constructor create();
      function ToString():String; override;

      { Getters and Setters }
      procedure setData(codigo:String; voltaje: ShortInt; ubicacion: String; _sensores: TStringList);
      procedure setSensores(_sensores: TStringList);
      function getSensores():TStringList;
      procedure setContext(_context: TContext);
      function getContext():TContext;

      { Metodos de la clase TFoco }
      procedure encender(); override;
      procedure luzMedia(); override;
      procedure apagar(); override;
      procedure fueraDeServicio(); override;
      function getEstado():String; override;

      { Metodos del patron Prototype}
      function clone():TObject; override;
  end;

implementation

{ TFocoHabitacion }

constructor TFocoHabitacion.create();
begin
  inherited create();
  sensores:= TStringList.Create();
  context := TContext.create();

  setTipo(TFocoType.Habitacion);
end;

procedure TFocoHabitacion.encender();
begin
  context.encender();
end;

procedure TFocoHabitacion.luzMedia();
begin
  context.luzMedia();
end;

procedure TFocoHabitacion.apagar();
begin
  context.apagar();
end;

procedure TFocoHabitacion.fueraDeServicio();
begin
  context.fueraDeServicio();
end;

function TFocoHabitacion.getEstado(): String;
begin
  Result:= context.getStateName();
end;

function TFocoHabitacion.ToString(): String;
var info:String;
begin
  info := 'Cod: ' + getCodigo() + #13;
  info := info + 'Tipo: ' + getTipoStr() + #13;
  info := info + 'Voltaje: ' + IntToStr(getVoltaje()) + #13;
  info := info + 'Ubicacion: ' + getUbicacion + #13;
  info := info + 'Estado: ' + getEstado() + #13;
  info := info + 'Sensores: ' + #13 + getSensores().Text;

  Result:= info;
end;

procedure TFocoHabitacion.setData(codigo: String;
  voltaje: ShortInt; ubicacion: String; _sensores: TStringList);
begin
  setCodigo(codigo);
  setVoltaje(voltaje);
  setUbicacion(ubicacion);
  setSensores(_sensores);
end;

procedure TFocoHabitacion.setSensores(_sensores: TStringList);
var index: Byte;
begin
  Self.sensores.Clear;
  for index := 0 to _sensores.Count-1 do
    Self.sensores.Add(_sensores[index]);
end;

function TFocoHabitacion.getSensores(): TStringList;
begin
  Result:= Self.sensores;
end;

procedure TFocoHabitacion.setContext(_context: TContext);
begin
  Self.context := _context;
end;

function TFocoHabitacion.getContext(): TContext;
begin
  Result:= context;
end;

function TFocoHabitacion.clone(): TObject;
var foco: TFocoHabitacion;
begin
  foco := TFocoHabitacion.create();
  foco.setCodigo(getCodigo());
  foco.setTipo(getTipo());
  foco.setVoltaje(getVoltaje());
  foco.setUbicacion(getUbicacion());
  foco.setSensores(getSensores());
  foco.setContext(TContext(getContext().clone()));

  Result := foco;
end;

end.

