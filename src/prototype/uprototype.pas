unit uPrototype;

{$MODE Delphi}

interface

{ Prototype -> Prototype }

type
  IPrototype = interface(IInterface)
  function clone(): TObject;
end;

implementation

end.

