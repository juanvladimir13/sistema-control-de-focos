unit uFoco;

interface
uses uFocoType, uPrototype;

{ Factory method -> Product }
{ Prototype -> ConcreteProtype }

type
  TFoco = class abstract (TInterfacedObject,IPrototype)
  private
    codigo:String;
    tipo: TFocoType;
    voltaje: Word;
    ubicacion: String;
  public
    constructor create();

    { Metodos abstractos }
    procedure encender(); virtual; abstract;
    procedure luzMedia(); virtual; abstract;
    procedure apagar(); virtual; abstract;
    procedure fueraDeServicio(); virtual; abstract;
    function getEstado():String; virtual; abstract;

    { Getters }
    function getCodigo():String;
    function getTipo(): TFocoType;
    function getVoltaje(): Word;
    function getUbicacion():String;

    { Helpers }
    function getTipoStr():String;
    function fullName():String;

    { Setters }
    procedure setCodigo(_codigo:String);
    procedure setTipo(_tipo: TFocoType);
    procedure setVoltaje(_voltaje:Word);
    procedure setUbicacion(_ubicacion:String);

    { Metodos del patron Prototype}
    function clone():TObject; virtual; abstract;
end;

implementation

{ TFoco }

constructor TFoco.create();
begin
  Self.codigo:= 'FO-';
  Self.tipo:= TFocoType.Habitacion;
  Self.voltaje:= 220;
  Self.ubicacion:= 'Habitacion de @juanvladimir13';
end;

function TFoco.fullName(): String;
begin
  Result:= 'Cod: ' + getCodigo() + '   |   Tipo: ' + getTipoStr();
end;

function TFoco.getCodigo(): String;
begin
  Result:= codigo;
end;

function TFoco.getTipo(): TFocoType;
begin
  Result:= tipo;
end;

function TFoco.getVoltaje(): Word;
begin
  Result:= voltaje;
end;

function TFoco.getUbicacion(): String;
begin
  Result:= ubicacion;
end;

function TFoco.getTipoStr(): String;
var foco:String;
begin
  foco:= 'Sin categoria';
  case  tipo of
    TFocoType.Habitacion : foco := 'Habitacion';
    TFocoType.Lampara : foco := 'Lampara';
    TFocoType.Pasillo : foco := 'Pasillo';
  end;
  Result:= foco;
end;

procedure TFoco.setCodigo(_codigo: String);
begin
  Self.codigo:= _codigo;
end;

procedure TFoco.setTipo(_tipo: TFocoType);
begin
  Self.tipo:= _tipo;
end;

procedure TFoco.setVoltaje(_voltaje: Word);
begin
  Self.voltaje:= _voltaje;
end;

procedure TFoco.setUbicacion(_ubicacion: String);
begin
  Self.ubicacion:= _ubicacion;
end;

end.

