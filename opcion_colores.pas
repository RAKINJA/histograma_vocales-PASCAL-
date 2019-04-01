unit opcion_colores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type
  {TopColores}
  TopColores = class(TForm)
    boton_ok: TBitBtn;
    boton_cancelar: TBitBtn;

    color_a: TColorButton;
    color_i: TColorButton;
    color_e: TColorButton;
    color_o: TColorButton;
    color_u: TColorButton;

    a_: TLabel;
    e_: TLabel;
    i_: TLabel;
    o_: TLabel;
    u_: TLabel;

    procedure color_aClick(Sender: TObject);
    procedure color_aColorChanged(Sender: TObject);
    procedure color_eColorChanged(Sender: TObject);
    procedure color_iColorChanged(Sender: TObject);
    procedure color_oColorChanged(Sender: TObject);
    procedure color_uColorChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

  public
  		colorA , colorE, colorI, colorO, colorU : TColor;
        colora_cambio, colore_cambio, colori_cambio, coloro_cambio, coloru_cambio : boolean;
  end;

var
  opColores: TopColores;

  //colorA , colorE, colorI, colorO, colorU : TColor;

implementation

{$R *.frm}

{ TopColores }

procedure TopColores.color_aColorChanged(Sender: TObject);
begin
     if color_a.ColorDialog.Execute then begin
     	colorA := color_a.ColorDialog.Color;
     end;

     color_a.ButtonColor := colorA;

     colora_cambio := true;
     colore_cambio := false;
     colori_cambio := false;
     coloro_cambio := false;
     coloru_cambio := false;
end;

procedure TopColores.color_aClick(Sender: TObject);
begin
	 if color_e.ColorDialog.Execute then begin
        colorE := color_e.ColorDialog.Color;
        color_e.ButtonColor:=colorE;
     end;



     colora_cambio := false;
     colore_cambio := true;
     colori_cambio := false;
     coloro_cambio := false;
     coloru_cambio := false;
end;

procedure TopColores.color_eColorChanged(Sender: TObject);
begin
     {if color_e.ColorDialog.Execute then begin
        colorE := color_e.ColorDialog.Color;
     end;

     color_e.ButtonColor:=colorE;

     colora_cambio := false;
     colore_cambio := true;
     colori_cambio := false;
     coloro_cambio := false;
     coloru_cambio := false;}
end;

procedure TopColores.color_iColorChanged(Sender: TObject);
begin
     if color_i.ColorDialog.Execute then begin
        colorI := color_i.ColorDialog.Color;
     end;

     color_i.ButtonColor:=colorI;

     colora_cambio := false;
     colore_cambio := false;
     colori_cambio := true;
     coloro_cambio := false;
     coloru_cambio := false;
end;

procedure TopColores.color_oColorChanged(Sender: TObject);
begin
	 if color_o.ColorDialog.Execute then begin
        colorO := color_o.ColorDialog.Color;
     end;
     color_o.ButtonColor:=colorO;

     colora_cambio := false;
     colore_cambio := false;
     colori_cambio := false;
     coloro_cambio := true;
     coloru_cambio := false;
end;

procedure TopColores.color_uColorChanged(Sender: TObject);
begin
	 if color_u.ColorDialog.Execute then begin
        colorU := color_u.ColorDialog.Color;
     end;
     color_u.ButtonColor:=colorU;

     colora_cambio := false;
     colore_cambio := false;
     colori_cambio := false;
     coloro_cambio := false;
     coloru_cambio := true;
end;

procedure TopColores.FormCreate(Sender: TObject);
begin
     colora_cambio := false;
     colore_cambio := false;
     colori_cambio := false;
     coloro_cambio := false;
     coloru_cambio := false;
end;

end.

