unit untPrijava;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TformPrijava = class(TForm)
    rgIzbor: TRadioGroup;
    cbPas: TComboBox;
    cbIzlozba: TComboBox;
    cbKategorija: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnUpisi: TButton;
    btnObrisi: TButton;
    btnIzadji: TButton;
    procedure btnIzadjiClick(Sender: TObject);
    procedure rgIzborClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnUpisiClick(Sender: TObject);
    procedure btnObrisiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrijava: TformPrijava;

implementation

uses untDM;

{$R *.dfm}

procedure TformPrijava.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformPrijava.rgIzborClick(Sender: TObject);
  begin
    case (rgIzbor.ItemIndex) of             //posivljavanje nepotrebnih
      0:                                    //comboboxova i dugmadi
        begin
          cbPas.Enabled:=true;
          cbIzlozba.Enabled:=true;
          cbKategorija.Enabled:=true;
          btnUpisi.Enabled:=true;
          btnObrisi.Enabled:=false;
        end;
      1:
        begin
          cbPas.Enabled:=true;
          cbIzlozba.Enabled:=false;
          cbKategorija.Enabled:=false;
          btnUpisi.Enabled:=false;
          btnObrisi.Enabled:=true;
        end;
    end;
  end;

procedure TformPrijava.FormActivate(Sender: TObject);
  var
    i: integer;
  begin
    cbPas.Enabled:=false;                     //na pocetku svi combobox-ovi i
    cbIzlozba.Enabled:=false;                 //dugmad su posivljena
    cbKategorija.Enabled:=false;
    btnUpisi.Enabled:=false;
    btnObrisi.Enabled:=false;
    rgIzbor.ItemIndex:=-1;
    with dm do                                //direktan rad sa dm modulom
      begin
        formPrijava.cbPas.Clear;              //ciscenje combobox-a pri svakom pokretanju
        i:=0;                                 //za upis id-a u combobox
        ADOConnection1.Connected:=true;       //konektovanje sa bazom za svaki slucaj
        PAS.Close;                            //zatvaranje konekcije sa tabelom za svaki slucaj
        PAS.SQL.Clear;
        PAS.SQL.Text:='SELECT Ime FROM PAS';  //uzimanje svih imena iz tabele pas
        PAS.Open;                             //otvaranje konekcije sa tabelom pas
        PAS.First;                            //postavljanje kursora na prvi rezultat
        while(not(PAS.Eof)) do                //petlja do poslednjeg rezultata
          begin
            i:=i+1;
            formPrijava.cbPas.Items.Add(IntToStr(i) + ' - ' + PAS.Fields.Fields[0].AsString);   //format ID - imePsa, fields[0] je prva kolona (u ovom slucaju i jedina)
            PAS.Next;                         //postavljanje kursora na sledeci rezultat
          end;
        formPrijava.cbIzlozba.Clear;
        ADOConnection1.Connected:=true;
        IZLOZBA.Close;
        IZLOZBA.SQL.Clear;
        IZLOZBA.SQL.Text:='SELECT Mesto, Datum FROM IZLOZBA';   //postaviti datum na format dd/mm/yyyy
        IZLOZBA.Open;
        IZLOZBA.First;
        while(not(IZLOZBA.Eof)) do
          begin
            formPrijava.cbIzlozba.Items.Add(Uppercase(Copy(IZLOZBA.Fields.Fields[0].AsString, 1, 3)) + Copy(IZLOZBA.Fields.Fields[1].AsString, 4, 2) + Copy(IZLOZBA.Fields.Fields[1].AsString, 7, 4) + ' - ' + IZLOZBA.Fields.Fields[0].AsString);      //format BEO052015 - Bepograd
            IZLOZBA.Next;
          end;
        formPrijava.cbKategorija.Clear;
        i:=0;
        ADOConnection1.Connected:=true;
        KATEGORIJA.Close;
        KATEGORIJA.SQL.Clear;
        KATEGORIJA.SQL.Text:='SELECT Naziv FROM KATEGORIJA';
        KATEGORIJA.Open;
        KATEGORIJA.First;
        while(not(KATEGORIJA.Eof)) do
          begin
            i:=i+1;
            formPrijava.cbKategorija.Items.Add(IntToStr(i) + ' - ' + KATEGORIJA.Fields.Fields[0].AsString);     //format ID - nazivKategorije
            KATEGORIJA.Next;
          end;
      end;
  end;
procedure TformPrijava.btnUpisiClick(Sender: TObject);
  var
    pasID, izlozbaID, kategorijaID: string;
  begin
    with dm do
      begin
        if((formPrijava.cbPas.Text='') or (formPrijava.cbIzlozba.Text='') or (formPrijava.cbKategorija.Text=''))    //provera da li su sva polja uneta
          then
            showmessage('Nedovoljno parametara za upis. Popunite sva polja!')
          else
            begin
              pasID:=IntToStr(formPrijava.cbPas.ItemIndex+1);   //indeksi u combobox-u su i-1, pa se dodaje 1 kako bi se dobio odabrani pas
              izlozbaID:=IntToStr(formPrijava.cbIzlozba.ItemIndex+1);
              kategorijaID:=IntToStr(formPrijava.cbKategorija.ItemIndex+1);
              ADOConnection1.Connected:=true;
              REZULTAT.Close;
              REZULTAT.SQL.Clear;
              REZULTAT.SQL.Text:='SELECT IzlozbaID FROM REZULTAT WHERE (IzlozbaID=:izlozbaID AND KategorijaID=:kategorijaID) AND PasID=:pasID';   //sintaksa SQL da se ne bi mesali navodnici
              REZULTAT.Parameters.ParamByName('izlozbaID').Value:=izlozbaID;
              REZULTAT.Parameters.ParamByName('kategorijaID').Value:=kategorijaID;;
              REZULTAT.Parameters.ParamByName('pasID').Value:=pasID;
              REZULTAT.Open;
              if(REZULTAT.Eof)              //provera da li je vec upisan rezultat
                then
                  begin                     //ako nije upisan, rezultat upita ce biti prazan
                    REZULTAT.Close;         //i rezultat ce moci da se upise
                    REZULTAT.SQL.Clear;
                    REZULTAT.SQL.Text:='INSERT INTO Rezultat (IzlozbaID, KategorijaID, PasID) VALUES (:izlozbaID, :kategorijaID, :pasID)';
                    REZULTAT.Parameters.ParamByName('izlozbaID').Value:=izlozbaID;
                    REZULTAT.Parameters.ParamByName('kategorijaID').Value:=kategorijaID;
                    REZULTAT.Parameters.ParamByName('pasID').Value:=pasID;
                    REZULTAT.ExecSQL;
                    showmessage('Uspesno upisan rezultat!');
                  end
                else                  //ako jeste upisan, upit ce imati rezultata
                  showmessage('U bazi vec postoji ovakav rezultat!');
            end;
      end;
  end;

procedure TformPrijava.btnObrisiClick(Sender: TObject);
  var
    pasID: string;
  begin
    with dm do
      begin
        pasID:=IntToStr(formPrijava.cbPas.ItemIndex+1);
        ADOConnection1.Connected:=true;
        REZULTAT.Close;
        REZULTAT.SQL.Clear;
        REZULTAT.SQL.Text:='DELETE FROM REZULTAT WHERE PasID=:pasID';   //svaki red u kome je upisan dati pas
        REZULTAT.Parameters.ParamByName('pasID').Value:=pasID;          //ce biti izbrisan
        REZULTAT.ExecSQL;
        showmessage('Uspesno obrisani rezultati!');
      end;
  end;

end.
