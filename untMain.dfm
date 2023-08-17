object formMain: TformMain
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Izlozba pasa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 32
    Top = 16
    object Prijave1: TMenuItem
      Caption = 'Prijave'
      object Prijavapasa1: TMenuItem
        Caption = 'Prijava pasa'
        OnClick = Prijavapasa1Click
      end
      object Spisakpasa1: TMenuItem
        Caption = 'Spisak pasa'
        OnClick = Spisakpasa1Click
      end
    end
    object Izlzobe1: TMenuItem
      Caption = 'Izlozbe'
      object Unos1: TMenuItem
        Caption = 'Unos'
        OnClick = Unos1Click
      end
      object Spisakpasaporasi1: TMenuItem
        Caption = 'Spisak pasa po rasi'
        OnClick = Spisakpasaporasi1Click
      end
    end
    object Kraj1: TMenuItem
      Caption = 'Kraj'
      object Izlaz1: TMenuItem
        Caption = 'Izlaz'
        ShortCut = 32841
        OnClick = Izlaz1Click
      end
    end
  end
end
