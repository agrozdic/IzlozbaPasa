unit untSpisak;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls;

type
  TformSpisak = class(TForm)
    dbGrid: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    lblPrijavljen: TLabel;
    Label4: TLabel;
    lblTakmicio: TLabel;
    cbIzlozba: TComboBox;
    btnPrikazi: TButton;
    btnIzadji: TButton;
    procedure btnIzadjiClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPrikaziClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSpisak: TformSpisak;

implementation

uses untDM;

{$R *.dfm}

procedure TformSpisak.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformSpisak.FormActivate(Sender: TObject);
  begin
    with dm do
      begin
        formSpisak.cbIzlozba.Clear;
        ADOConnection1.Connected:=true;
        KATEGORIJA.Close;
        KATEGORIJA.SQL.Clear;
        IZLOZBA.Close;
        IZLOZBA.SQL.Clear;
        IZLOZBA.SQL.Text:='SELECT Mesto, Datum FROM IZLOZBA';
        IZLOZBA.Open;
        IZLOZBA.First;
        while(not(IZLOZBA.Eof)) do
          begin
            formSpisak.cbIzlozba.Items.Add(Uppercase(Copy(IZLOZBA.Fields.Fields[0].AsString, 1, 3)) + Copy(IZLOZBA.Fields.Fields[1].AsString, 4, 2) + Copy(IZLOZBA.Fields.Fields[1].AsString, 7, 4));
            IZLOZBA.Next;
          end;
      end;
  end;

procedure TformSpisak.btnPrikaziClick(Sender: TObject);
  var
    izlozbaID: string;
    i, brojacKategorija, brojKategorija, brojPrijavljeni, brojTakmicili: integer;
  begin
    if(formSpisak.cbIzlozba.ItemIndex>-1)
      then
        begin
          with dm do
            begin
              i:=0;
              izlozbaID:=IntToStr(formSpisak.cbIzlozba.ItemIndex+1);
              KATEGORIJA.Close;
              KATEGORIJA.SQL.Clear;
              KATEGORIJA.SQL.Text:='SELECT * FROM KATEGORIJA';
              KATEGORIJA.Open;
              brojKategorija:=KATEGORIJA.RecordCount;
              for i:=1 to brojKategorija do
                begin
                  REZULTAT.Close;
                  REZULTAT.SQL.Clear;
                  REZULTAT.SQL.Text:='SELECT COUNT(KategorijaID) FROM REZULTAT WHERE KategorijaID=:kategorijaID AND IzlozbaID=:izlozbaID';
                  REZULTAT.Parameters.ParamByName('kategorijaID').Value:=i;
                  REZULTAT.Parameters.ParamByName('izlozbaID').Value:=izlozbaID;
                  REZULTAT.Open;
                  REZULTAT.First;
                  brojacKategorija:=REZULTAT.Fields.Fields[0].AsInteger;
                  KATEGORIJA.Close;
                  KATEGORIJA.SQL.Clear;
                  KATEGORIJA.SQL.Text:='UPDATE Kategorija SET Broj=:brojacKategorija WHERE KategorijaID=:i';
                  KATEGORIJA.Parameters.ParamByName('brojacKategorija').Value:=brojacKategorija;
                  KATEGORIJA.Parameters.ParamByName('i').Value:=I;
                  KATEGORIJA.ExecSQL;
                  REZULTAT.Next;
                end;
              KATEGORIJA.Close;
              KATEGORIJA.SQL.Clear;
              KATEGORIJA.SQL.Text:='SELECT * FROM KATEGORIJA';
              KATEGORIJA.Open;
              dbGrid.Columns[0].Title.Caption:='Sifra';
              dbGrid.Columns[1].Title.Caption:='Naziv kategorije';
              dbGrid.Columns[2].Title.Caption:='Broj pasa';
              REZULTAT.Close;
              REZULTAT.SQL.Clear;
              REZULTAT.SQL.Text:='SELECT * FROM REZULTAT WHERE IzlozbaID=:izlozbaID';
              REZULTAT.Parameters.ParamByName('izlozbaID').Value:=izlozbaID;
              REZULTAT.Open;
              brojPrijavljeni:=REZULTAT.RecordCount;
              REZULTAT.Close;
              REZULTAT.SQL.Clear;
              REZULTAT.SQL.Text:='SELECT * FROM REZULTAT WHERE Rezultat>0 AND IzlozbaID=:izlozbaID';
              REZULTAT.Parameters.ParamByName('izlozbaID').Value:=izlozbaID;
              REZULTAT.Open;
              brojTakmicili:=REZULTAT.RecordCount;
              lblPrijavljen.Caption:=IntToStr(brojPrijavljeni);
              lblTakmicio.Caption:=IntToStr(brojTakmicili);
            end;
        end
      else
        showmessage('Nedovoljno parametara. Popunite polje izlozba!');
  end;

end.
