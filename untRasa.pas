unit untRasa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TformRasa = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblUcestvovali: TLabel;
    Label5: TLabel;
    lblRasa: TLabel;
    cbIzlozba: TComboBox;
    cbRasa: TComboBox;
    dbGrid: TDBGrid;
    btnPrikazi: TButton;
    btnIzadji: TButton;
    procedure btnIzadjiClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRasa: TformRasa;

implementation

uses untDM;

{$R *.dfm}

procedure TformRasa.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformRasa.FormActivate(Sender: TObject);
  begin
    with dm do
      begin
        cbIzlozba.Clear;
        IZLOZBA.Close;
        IZLOZBA.SQL.Clear;
        IZLOZBA.SQL.Text:='SELECT Mesto, Datum FROM IZLOZBA';
        IZLOZBA.Open;
        IZLOZBA.First;
        while(not(IZLOZBA.Eof)) do
          begin
            cbIzlozba.Items.Add(Uppercase(Copy(IZLOZBA.Fields.Fields[0].AsString, 1, 3)) + Copy(IZLOZBA.Fields.Fields[1].AsString, 4, 2) + '20' + Copy(IZLOZBA.Fields.Fields[1].AsString, 7, 2));
            IZLOZBA.Next;
          end;
        cbRasa.Clear;
        RASA.Close;
        RASA.SQL.Clear;
        RASA.SQL.Text:='SELECT NazivRase FROM RASA';
        RASA.Open;
        RASA.First;
        while(not(RASA.Eof)) do
          begin
            cbRasa.Items.Add(RASA.Fields.Fields[0].AsString);
            RASA.Next;
          end;
      end;
  end;

end.
