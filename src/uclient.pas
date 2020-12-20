unit uClient;

interface

uses
  Classes,
  uFoco, uFocoType,
  uFocoHabitacion, uFocoPasillo,
  uFocoManager;
type
  TClient = class(TObject)
    private
      list : TList;
    public
      constructor create();
      procedure add(foco:TFoco);
      procedure remove(index:Integer);
      function get(index:Integer):TFoco;
      procedure clear();

      { Factory method function }
      function factoryMethod(codigo:String; typeFoco: TFocoType; voltaje: Word;
                              ubicacion: String; encendidoAutomatico:Boolean; sensores: TStringList): TFoco;
      { Prototype function }
      function prototypeOperation(index: Byte):TFoco;
  end;

implementation

{ TClient }

constructor TClient.create();
begin
  Self.list := TList.Create;
end;

procedure TClient.add(foco: TFoco);
begin
  list.Add(foco);
end;

procedure TClient.remove(index: Integer);
begin
  if index < list.Count then
    list.Delete(index);
end;

function TClient.get(index: Integer): TFoco;
begin
  if (index < list.Count) then
    Result:= TFoco(list.Items[index])
  else
    Result:= nil;
end;

procedure TClient.clear();
begin
  list.Clear;
end;

function TClient.factoryMethod(codigo: String; typeFoco: TFocoType;
  voltaje: Word; ubicacion: String; encendidoAutomatico: Boolean; sensores: TStringList):TFoco;
var foco:TFoco; manager: TFocoManager;
begin
  manager:= TFocoManager.create();
  foco := manager.factoryFoco(typeFoco);
  foco.setCodigo(codigo);
  foco.setVoltaje(voltaje);
  foco.setUbicacion(ubicacion);

  if (typeFoco = TFocoType.Habitacion) then
    TFocoHabitacion(foco).setSensores(sensores);

  if (typeFoco = TFocoType.Pasillo) then
    TFocoPasillo(foco).setEncendidoAutomatico(encendidoAutomatico);

  Result:= foco;
end;

function TClient.prototypeOperation(index: Byte):TFoco;
var foco:TFoco;
begin
  foco := nil;
  if index < list.Count then begin
    foco:= TFoco(list.Items[index]);
  end;
  Result := TFoco(foco.clone());
end;

end.

