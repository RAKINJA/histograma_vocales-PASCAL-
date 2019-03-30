object formulario_histograma: Tformulario_histograma
  Left = 281
  Height = 104
  Top = 187
  Width = 159
  Caption = 'Histograma'
  ClientHeight = 84
  ClientWidth = 159
  Menu = menu_principal
  OnCreate = FormCreate
  LCLVersion = '6.7'
  object grafico: TImage
    Left = 8
    Height = 40
    Top = 8
    Width = 50
  end
  object menu_principal: TMainMenu
    Left = 72
    Top = 8
    object menu_archivo: TMenuItem
      Caption = 'Archivo'
      object abrir_archivo: TMenuItem
        Caption = 'Abrir Archivo'
        OnClick = abrir_archivoClick
      end
      object guardar_captura: TMenuItem
        Caption = 'Guardar Captura'
      end
    end
    object opciones: TMenuItem
      Caption = 'Opciones'
      object colores: TMenuItem
        Caption = 'Color'
      end
    end
  end
  object cuadro_abrir: TOpenDialog
    Left = 120
    Top = 8
  end
end
