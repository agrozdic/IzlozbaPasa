object formUnos: TformUnos
  Left = 192
  Top = 124
  Width = 1044
  Height = 541
  Caption = 'Unos'
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
    Left = 432
    Top = 168
    Width = 22
    Height = 13
    Caption = 'Sifra'
  end
  object Label2: TLabel
    Left = 424
    Top = 208
    Width = 29
    Height = 13
    Caption = 'Mesto'
  end
  object Label3: TLabel
    Left = 424
    Top = 248
    Width = 31
    Height = 13
    Caption = 'Datum'
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
  object btnUpisi: TButton
    Left = 544
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Upisi'
    TabOrder = 1
    OnClick = btnUpisiClick
  end
  object btnObrisi: TButton
    Left = 624
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Obrisi'
    TabOrder = 2
    OnClick = btnObrisiClick
  end
  object btnIzadji: TButton
    Left = 704
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 3
    OnClick = btnIzadjiClick
  end
  object editSifra: TEdit
    Left = 472
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object editMesto: TEdit
    Left = 472
    Top = 208
    Width = 169
    Height = 21
    TabOrder = 5
  end
  object datePicker: TDateTimePicker
    Left = 472
    Top = 248
    Width = 209
    Height = 21
    Date = 44277.638944664350000000
    Format = 'dddd.  MMMM dd, yyyy'
    Time = 44277.638944664350000000
    DateFormat = dfLong
    TabOrder = 6
  end
end
