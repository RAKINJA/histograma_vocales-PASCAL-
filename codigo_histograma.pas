unit codigo_histograma;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus;

type

  puntero_pos = ^integer;

  TBarra = record
  		ancho, alto : integer;
        color  : TColor;
        titulo : string;
  end;

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
  		procedure crearHistograma(arreglo_barra: array of TBarra);
        procedure crearBarras( arreglo_barra : array of TBarra);
        procedure asignarCoordenadas(arreglo_barra: array of TBarra);
  		procedure pintarBarras();

  end;

var
  formulario_histograma: Tformulario_histograma;

  contador_a, contador_e, contador_i, contador_o, contador_u :integer;
  cantidad_barras : integer; // varibales para contar las barras en total del histograna;

  Archivo : Textfile; // variable para el menu_archivo de texto

  arreglo_barra : array [0..4] of TBarra;
implementation

{$R *.frm}

{ Tformulario_histograma }

procedure Tformulario_histograma.FormCreate(Sender: TObject);
begin
     // Inicializacion de las variables
     cantidad_barras := 5;

     // Asignacion de tamaños
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
                 case caracter of
                      'a':contador_a := contador_a+1;
                      'e':contador_e := contador_e+1;
                      'i':contador_i := contador_i+1;
                      'o':contador_o := contador_o+1;
                      'u':contador_u := contador_u+1;
                 end;

           end;

           crearHistograma(arreglo_barra);

           closefile(Archivo);
        end;

     end;

end;

{
    Procedimiento para graficar
}

procedure Tformulario_histograma.crearHistograma(arreglo_barra: array of TBarra);
var
   arreglo_aux : array [0..4] of TBarra;


begin;
	  // Llamar a la funcion de crearBarras
	  crearBarras(arreglo_aux);
      showmessage(arreglo_aux[2].titulo);
      // llamar a la funcion de asignarCoordenadas
      asignarCoordenadas(arreglo_aux);

      // llamar a la funcion de pintado
      pintarBarras();
end;

{
 	procedimiento para crear las Barras
}
procedure Tformulario_histograma.crearBarras(arreglo_barra: array of TBarra);
var
   i : integer;
   auxtitulo : string;
   auxcolor : TColor;
begin
     showmessage('la cantidad de barras es '+inttostr(cantidad_barras));
	 for i:= 0 to cantidad_barras-1 do begin

         case i of
         	  0 : begin
                auxtitulo := 'A';
                auxcolor  := Clblack;
              end;
              1 : begin
                auxtitulo := 'E';
                auxcolor  := Clred;
              end;
              2 : begin
                auxtitulo := 'I';
                auxcolor  := Clgray;
              end;
              3 : begin
              	auxtitulo := 'O';
                auxcolor := Clblue;
              end;
              4 :begin
                auxtitulo := 'U';
                auxcolor  := Clgreen;
              end;
         end;

	 	 arreglo_barra[i].color := auxtitulo;
         arreglo_barra[i].titlo := auxtitulo;

         showmessage(arreglo_barra[i].titulo);
     end;
end;

{
 	procedimiento para asignar coordenadas a las barras
}
procedure Tformulario_histograma.asignarCoordenadas(arreglo_barra: array of TBarra);
var
   i : integer;
begin
     for i :=0 to cantidad_barras-1 do begin
     	 //showmessage(arreglo_barra[i].titulo);
     end;
end;

{
 	procedimiento para pintar las Barras
}
procedure Tformulario_histograma.pintarBarras();
begin

end;

end.

