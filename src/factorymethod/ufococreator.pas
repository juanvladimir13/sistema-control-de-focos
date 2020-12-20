 unit uFocoCreator;

{$MODE Delphi}

interface

uses
  uFoco, uFocoType;

{ Factory method -> Creator }

type
  TFocoCreator = class abstract(TObject)
    public
      constructor create();
      { Factory Method }
      function factoryFoco(typeFoco: TFocoType): TFoco; virtual; abstract;
  end;

implementation

{ TFocoCreator }

constructor TFocoCreator.create();
begin
end;

end.

