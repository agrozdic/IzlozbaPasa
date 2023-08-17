object formSpisak: TformSpisak
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Spisak pasa'
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
    Left = 320
    Top = 32
    Width = 34
    Height = 13
    Caption = 'Izlozba'
  end
  object Label2: TLabel
    Left = 200
    Top = 64
    Width = 172
    Height = 13
    Caption = 'Ukupan broj pasa koji je prijavljen - '
  end
  object lblPrijavljen: TLabel
    Left = 376
    Top = 64
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 200
    Top = 88
    Width = 168
    Height = 13
    Caption = 'Ukupan broj pasa koji se takmicio - '
  end
  object lblTakmicio: TLabel
    Left = 368
    Top = 88
    Width = 3
    Height = 13
  end
  object dbGrid: TDBGrid
    Left = 192
    Top = 120
    Width = 449
    Height = 249
    DataSource = dm.DataSource3
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object cbIzlozba: TComboBox
    Left = 368
    Top = 32
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object btnPrikazi: TButton
    Left = 656
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Prikazi'
    TabOrder = 2
    OnClick = btnPrikaziClick
  end
  object btnIzadji: TButton
    Left = 656
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 3
    OnClick = btnIzadjiClick
  end
end
