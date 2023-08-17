object dm: Tdm
  OldCreateOrder = False
  Left = 192
  Top = 126
  Height = 516
  Width = 533
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=IzlozbaPasa.mdb;DBQ=D:\DESKTOP\PROJECTS\DELPHI\B1-2\Izlo' +
      'zbaPasa.mdb;DefaultDir=D:\DESKTOP\PROJECTS\DELPHI\B1-2;DriverId=' +
      '25;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;UID=admin;"'
    LoginPrompt = False
    Left = 64
    Top = 40
  end
  object PAS: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 64
    Top = 104
  end
  object IZLOZBA: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 64
    Top = 168
  end
  object KATEGORIJA: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 64
    Top = 232
  end
  object REZULTAT: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 64
    Top = 296
  end
  object DataSource1: TDataSource
    DataSet = PAS
    Left = 200
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = IZLOZBA
    Left = 200
    Top = 168
  end
  object DataSource3: TDataSource
    DataSet = KATEGORIJA
    Left = 200
    Top = 232
  end
  object DataSource4: TDataSource
    DataSet = REZULTAT
    Left = 200
    Top = 296
  end
  object RASA: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 64
    Top = 360
  end
  object DataSource5: TDataSource
    DataSet = RASA
    Left = 200
    Top = 360
  end
end
