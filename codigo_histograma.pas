unit codigo_histograma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus;

type

  { Tformulario_histograma }

  Tformulario_histograma = class(TForm)
    cuadro_abrir: TOpenDialog;
    grafico: TImage;
    menu_principal: TMainMenu;
    menu_archivo: TMenuItem;
    opciones: TMenuItem;
    colores: TMenuItem;
    abrir_archivo: TMenuItem;
    guardar_captura: TMenuItem;
    procedure abrir_archivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  contador_a, contador_e, contador_i, contador_o, contador_u :integer;
  formulario_histograma: Tformulario_histograma;

  Archivo : Textfile; // variable para el menu_archivo de texto

implementation

{$R *.frm}

{ Tformulario_histograma }

procedure Tformulario_histograma.FormCreate(Sender: TObject);
begin
     formulario_histograma.Width  := 500;
     formulario_histograma.Height := 400;

     grafico.setbounds(0,0,0,0);
     grafico.Height:=400;
     grafico.Width :=500;
     grafico.Canvas.Rectangle(0,0,grafico.Width, grafico.Height);
end;

procedure Tformulario_histograma.abrir_archivoClick(Sender: TObject);
var
   caracter : char;
begin
     if cuadro_abrir.Execute then begin
        AssignFile(Archivo, cuadro_abrir.FileName);

        {$I-}
             Reset(Archivo);
        {$I+}

        if IOResult = 0 then begin
           while not EOF(Archivo) do begin
                 read(Archivo, caracter);
                 showmessage(caracter);

                 case caracter of
                      'a':contador_a := contador_a+1;
                      'e':contador_e := contador_e+1;
                      'i':contador_i := contador_i+1;
                      'o':contador_o := contador_o+1;
                      'u':contador_u := contador_u+1;
                 end;

           end;
          closefile(Archivo);
        end;

     end;

end;

{
    Procedimiento para graficar
}



end.

