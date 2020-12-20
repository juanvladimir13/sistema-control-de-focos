unit uFocoManager;

{$MODE Delphi}

interface

uses
  uFoco, uFocoType,
  uFocoHabitacion, uFocoLampara, uFocoPasillo,
  uFocoCreator;

{ Factory method -> ConcreteCreator }

type
  TFocoManager = class(TFocoCreator)
    public
      constructor create();
      { Factory Method }
      function factoryFoco(typeFoco: TFocoType): TFoco; override;
  end;

implementation

{ TFocoManager }

constructor TFocoManager.create();
begin
 inherited create();
end;

function TFocoManager.factoryFoco(typeFoco: TFocoType): TFoco;
var foco: TFoco;
begin
  case  typeFoco of
    TFocoType.Habitacion : foco := TFocoHabitacion.create();
    TFocoType.Lampara : foco := TFocoLampara.create();
    TFocoType.Pasillo : foco := TFocoPasillo.create();
  else
    foco := Nil;
  end;
  Result:= foco;
end;

end.

