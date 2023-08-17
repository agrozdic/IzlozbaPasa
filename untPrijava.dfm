object formPrijava: TformPrijava
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Prijava pasa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 440
    Top = 168
    Width = 17
    Height = 13
    Caption = 'Pas'
  end
  object Label2: TLabel
    Left = 424
    Top = 208
    Width = 34
    Height = 13
    Caption = 'Izlozba'
  end
  object Label3: TLabel
    Left = 408
    Top = 248
    Width = 49
    Height = 13
    Caption = 'Kategorija'
  end
  object rgIzbor: TRadioGroup
    Left = 424
    Top = 40
    Width = 185
    Height = 105
    Caption = 'Izbor akcije'
    Columns = 2
    Items.Strings = (
      'Unos'
      'Brisanje')
    TabOrder = 0
    OnClick = rgIzborClick
  end
  object cbPas: TComboBox
    Left = 464
    Top = 168
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object cbIzlozba: TComboBox
    Left = 464
    Top = 208
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object cbKategorija: TComboBox
    Left = 464
    Top = 248
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object btnUpisi: TButton
    Left = 544
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Upisi'
    TabOrder = 4
    OnClick = btnUpisiClick
  end
  object btnObrisi: TButton
    Left = 624
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Obrisi'
    TabOrder = 5
    OnClick = btnObrisiClick
  end
  object btnIzadji: TButton
    Left = 704
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 6
    OnClick = btnIzadjiClick
  end
end
