unit ufprincipal;

interface

uses
  SysUtils,
  Forms,
  Dialogs,
  StdCtrls, ComCtrls,
  uFoco, uFocoType, Classes, uFocoHabitacion,
  uClient, Controls;

type

  { TFPrincipal }

  TFPrincipal = class(TForm)
    btnApagar: TButton;
    btnClonar: TButton;
    btnCrear: TButton;
    btnEncender: TButton;
    btnFueraServicio: TButton;
    btnLimpiar: TButton;
    btnEliminar: TButton;
    btnLuzMedia: TButton;
    cbxFocoType: TComboBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label6: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    txtEncendidoAutomatico: TCheckBox;
    txtSensor1: TEdit;
    txtSensor2: TEdit;
    txtSensor3: TEdit;
    txtSensor4: TEdit;
    GroupBox2: TGroupBox;
    panSensores: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    txtCodigo: TEdit;
    txtState: TLabel;
    txtVoltaje: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtUbicacion: TMemo;
    UpDown1: TUpDown;
    updCodigo: TUpDown;
    lisProducto: TListBox;
    txtInformacion: TLabel;
    procedure btnApagarClick(Sender: TObject);
    procedure btnClonarClick(Sender: TObject);
    procedure btnCrearClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnEncenderClick(Sender: TObject);
    procedure btnFueraServicioClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnLuzMediaClick(Sender: TObject);
    procedure cbxFocoTypeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lisProductoClick(Sender: TObject);
  private
    client: TClient;
  public
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.lfm}

{ TFPrincipal }


procedure TFPrincipal.btnEncenderClick(Sender: TObject);
var foco: TFoco;
begin
  if (lisProducto.ItemIndex <> -1) then begin
    foco := client.get(lisProducto.ItemIndex);
    try
      foco.encender();
      txtState.Caption:= foco.getEstado();
      txtInformacion.Caption:= foco.ToString();
    Except on E : Exception do
      ShowMessage('Estado no valido');
    end;
  end else begin
    ShowMessage('Seleccionar un Item del listado');
  end;
end;

procedure TFPrincipal.btnFueraServicioClick(Sender: TObject);
var foco: TFoco;
begin
  if (lisProducto.ItemIndex <> -1) then begin
    foco := client.get(lisProducto.ItemIndex);
    try
      foco.fueraDeServicio();
      txtState.Caption:= foco.getEstado();
      txtInformacion.Caption:= foco.ToString();
    Except on E : Exception do
      ShowMessage('Estado no valido');
    end;
  end else begin
    ShowMessage('Seleccionar un Item del listado');
  end;
end;


procedure TFPrincipal.btnLimpiarClick(Sender: TObject);
begin
  client.clear();
  lisProducto.Clear;
  txtInformacion.Caption:= '';
  txtState.Caption := '';
end;

procedure TFPrincipal.btnApagarClick(Sender: TObject);
var foco: TFoco;
begin
  if (lisProducto.ItemIndex <> -1) then begin
    foco := client.get(lisProducto.ItemIndex);
    try
      foco.apagar();
      txtState.Caption:= foco.getEstado();
      txtInformacion.Caption:= foco.ToString();
    Except on E : Exception do
      ShowMessage('Estado no valido');
    end;
  end else begin
    ShowMessage('Seleccionar un Item del listado');
  end;
end;

procedure TFPrincipal.btnClonarClick(Sender: TObject);
var foco:TFoco;
begin
  if (lisProducto.ItemIndex <> -1) then begin
    foco := client.prototypeOperation(lisProducto.ItemIndex);
    client.add(foco);
    lisProducto.AddItem(foco.fullName(), foco);
    ShowMessage('Agregado Item al listado de focos');
  end else begin
    ShowMessage('Seleccionar un Item del listado');
  end;
end;


procedure TFPrincipal.btnCrearClick(Sender: TObject);
var voltaje: ShortInt; sensores:TStringList;
  typeFoco: TFocoType; foco: TFoco;
begin
  if ((Trim(txtCodigo.Text) <> '') and (Trim(txtUbicacion.Text) <> '')
      and (Trim(txtVoltaje.Text)<> '')) then begin

        case cbxFocoType.ItemIndex of
            0: typeFoco := TFocoType.Habitacion;
            1: typeFoco := TFocoType.Lampara;
            2: typeFoco := TFocoType.Pasillo;
        end;

        try
          voltaje := StrToInt(txtVoltaje.Text);
        Except on E : EConvertError do
          voltaje := 13;
        end;

        sensores := TStringList.Create;
        sensores.Add(txtSensor1.Text);
        sensores.Add(txtSensor2.Text);
        sensores.Add(txtSensor3.Text);
        sensores.Add(txtSensor4.Text);

        foco := client.factoryMethod(txtCodigo.Text, typeFoco, voltaje,
                                     txtUbicacion.Text, txtEncendidoAutomatico.Checked, sensores);

        client.add(foco);
        lisProducto.AddItem(foco.fullName(), foco);

       txtVoltaje.Text:= '5';
       txtUbicacion.Clear;
       txtEncendidoAutomatico.Checked:= False;
       txtSensor1.Clear;
       txtSensor2.Clear;
       txtSensor3.Clear;
       txtSensor4.Clear;
  end else begin
    ShowMessage('Introducir todos los datos y datos validos');
  end;
end;

procedure TFPrincipal.btnEliminarClick(Sender: TObject);
begin
  if (lisProducto.ItemIndex <> -1) then begin
    client.remove(lisProducto.ItemIndex);
    lisProducto.DeleteSelected;
    txtInformacion.Caption:= '';
    txtState.Caption:= '';
  end;
end;

procedure TFPrincipal.btnLuzMediaClick(Sender: TObject);
var foco: TFoco;
begin
  if (lisProducto.ItemIndex <> -1) then begin
    foco := client.get(lisProducto.ItemIndex);
    try
      foco.luzMedia();
      txtState.Caption:= foco.getEstado();
      txtInformacion.Caption:= foco.ToString();
    Except on E : Exception do
      ShowMessage('Estado no valido');
    end;
  end else begin
    ShowMessage('Seleccionar un Item del listado');
  end;
end;

procedure TFPrincipal.cbxFocoTypeChange(Sender: TObject);
begin
  if ( cbxFocoType.ItemIndex = 0) then begin
    panSensores.Visible:= True;
    txtEncendidoAutomatico.Visible:= False;
  end;

  if ( cbxFocoType.ItemIndex = 1) then begin
    panSensores.Visible:= False;
    txtEncendidoAutomatico.Visible:= False;
  end;

  if ( cbxFocoType.ItemIndex = 2) then begin
    panSensores.Visible:= False;
    txtEncendidoAutomatico.Visible:= True;
  end;

end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  client:= TClient.create();
  panSensores.Visible:= True;
  txtEncendidoAutomatico.Visible:= False;
end;

procedure TFPrincipal.lisProductoClick(Sender: TObject);
var foco: TFoco;
begin
  if (lisProducto.ItemIndex <> -1) then begin
    foco := client.get(lisProducto.ItemIndex);
    if foco <> nil then begin
      txtInformacion.Caption:= foco.ToString();
      txtState.Caption:= client.get(lisProducto.ItemIndex).getEstado();
    end else begin
      ShowMessage('Null')
    end;
  end;
end;
end.

