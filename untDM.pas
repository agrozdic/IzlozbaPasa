unit untDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    PAS: TADOQuery;
    IZLOZBA: TADOQuery;
    KATEGORIJA: TADOQuery;
    REZULTAT: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    RASA: TADOQuery;
    DataSource5: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
