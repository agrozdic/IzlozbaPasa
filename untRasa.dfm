object formRasa: TformRasa
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Spisak pasa po rasi'
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
    Left = 344
    Top = 96
    Width = 34
    Height = 13
    Caption = 'Izlozba'
  end
  object Label2: TLabel
    Left = 352
    Top = 136
    Width = 24
    Height = 13
    Caption = 'Rasa'
  end
  object Label3: TLabel
    Left = 280
    Top = 176
    Width = 227
    Height = 13
    Caption = 'Ukupan broj pasa koji su ucestvovali na izlozbi -'
  end
  object lblUcestvovali: TLabel
    Left = 512
    Top = 176
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 216
    Top = 200
    Width = 291
    Height = 13
    Caption = 'Ukupan broj pasa trazene rase koji su ucestvovali na izlozbi -'
  end
  object lblRasa: TLabel
    Left = 512
    Top = 200
    Width = 3
    Height = 13
  end
  object cbIzlozba: TComboBox
    Left = 384
    Top = 96
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object cbRasa: TComboBox
    Left = 384
    Top = 136
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object dbGrid: TDBGrid
    Left = 560
    Top = 96
    Width = 217
    Height = 233
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnPrikazi: TButton
    Left = 312
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Prikazi'
    TabOrder = 3
  end
  object btnIzadji: TButton
    Left = 400
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Izadji'
    TabOrder = 4
    OnClick = btnIzadjiClick
  end
end
