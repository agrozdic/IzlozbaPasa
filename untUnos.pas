unit untUnos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TformUnos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rgIzbor: TRadioGroup;
    btnUpisi: TButton;
    btnObrisi: TButton;
    btnIzadji: TButton;
    editSifra: TEdit;
    editMesto: TEdit;
    datePicker: TDateTimePicker;
    procedure rgIzborClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnIzadjiClick(Sender: TObject);
    procedure btnUpisiClick(Sender: TObject);
    procedure btnObrisiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formUnos: TformUnos;

implementation

uses untDM;

{$R *.dfm}

procedure TformUnos.rgIzborClick(Sender: TObject);
  begin
    case (rgIzbor.ItemIndex) of
      0:
        begin
          editSifra.Enabled:=false;
          editMesto.Enabled:=true;
          datePicker.Enabled:=true;
          btnUpisi.Enabled:=true;
          btnObrisi.Enabled:=false;
        end;
      1:
        begin
          editSifra.Enabled:=true;
          editMesto.Enabled:=false;
          datePicker.Enabled:=false;
          btnUpisi.Enabled:=false;
          btnObrisi.Enabled:=true;
        end;
    end;
  end;

procedure TformUnos.FormActivate(Sender: TObject);
  begin
    editSifra.Enabled:=false;
    editMesto.Enabled:=false;
    datePicker.Enabled:=false;
    btnUpisi.Enabled:=false;
    btnObrisi.Enabled:=false;
  end;

procedure TformUnos.btnIzadjiClick(Sender: TObject);
  begin
    Close;
  end;

procedure TformUnos.btnUpisiClick(Sender: TObject);
  var
    izlozbaID: integer;
  begin
    editSifra.Text:=Uppercase(Copy(editMesto.text, 1, 3)) + Copy(DateToStr(datePicker.Date), 4, 2) + '20' + Copy(DateToStr(datePicker.Date), 7, 2);
    if(editMesto.Text='')
      then
        showmessage('Nedovoljno parametara. Unesite mesto!')
      else
        begin
          with dm do
            begin
              IZLOZBA.Close;
              IZLOZBA.SQL.Clear;
              IZLOZBA.SQL.Text:='SELECT * FROM IZLOZBA WHERE Mesto=:mesto AND Datum=:datum';
              IZLOZBA.Parameters.ParamByName('mesto').Value:=editMesto.Text;
              IZLOZBA.Parameters.ParamByName('datum').Value:=datePicker.Date;
              IZLOZBA.Open;
              if(IZLOZBA.Eof)
                then
                  begin
                    IZLOZBA.Close;
                    IZLOZBA.SQL.Clear;
                    IZLOZBA.SQL.Text:='SELECT * FROM IZLOZBA';
                    IZLOZBA.Open;
                    IZLOZBA.Last;
                    izlozbaID:=IZLOZBA.Fields.Fields[0].Value+1;
                    showmessage(IntToStr(IZLOZBAID));
                    IZLOZBA.Close;
                    IZLOZBA.SQL.Clear;
                    IZLOZBA.SQL.Text:='INSERT INTO IZLOZBA (IzlozbaID, Mesto, Datum) VALUES (:izlozbaID, :mesto, :datum)';
                    IZLOZBA.Parameters.ParamByName('izlozbaID').Value:=izlozbaID;
                    IZLOZBA.Parameters.ParamByName('mesto').Value:=editMesto.Text;
                    IZLOZBA.Parameters.ParamByName('datum').Value:=datePicker.Date;
                    IZLOZBA.ExecSQL;
                    showmessage('Uspesno upisivanje u bazu.');
                  end
                else
                  showmessage('U bazi vec postoji ovakva izlozba.');
            end;
        end;
  end;

procedure TformUnos.btnObrisiClick(Sender: TObject);
  var
    mesto, mesec, godina, mesto1, mesec1, godina1, izlozbaID: string;
    indikator: integer;
  begin
    if(editSifra.text='')
      then
        showmessage('Nedovoljno parametara. Unesite sifru!')
      else
        begin
          with dm do
            begin
              mesto:=Uppercase(Copy(editSifra.text, 1, 1)) + Lowercase(Copy(editSifra.Text, 2, 2));
              mesec:=Copy(editSifra.text, 4, 2);
              godina:=Copy(editSifra.text, 8, 2);
              IZLOZBA.Close;
              IZLOZBA.SQL.Clear;
              IZLOZBA.SQL.Text:='SELECT Mesto, Datum, IzlozbaID FROM IZLOZBA';
              IZLOZBA.Open;
              IZLOZBA.First;
              indikator:=0;
              while(not(IZLOZBA.Eof)) do
                begin
                  mesto1:=Copy(IZLOZBA.Fields.Fields[0].AsString, 1, 3);
                  mesec1:=Copy(IZLOZBA.Fields.Fields[1].AsString, 4, 2);
                  godina1:=Copy(IZLOZBA.Fields.Fields[1].AsString, 7, 2);
                  if((mesto=mesto1) and (mesec=mesec1) and (godina=godina1))
                    then
                      begin
                        indikator:=1;
                        break;
                      end;
                  IZLOZBA.Next;
                end;
              if(indikator=1)
                then
                  begin
                    izlozbaID:=IZLOZBA.Fields.Fields[2].AsString;
                    IZLOZBA.Close;
                    IZLOZBA.SQL.Clear;
                    IZLOZBA.SQL.Text:='DELETE FROM IZLOZBA WHERE IzlozbaID=:izlozbaID';
                    IZLOZBA.Parameters.ParamByName('izlozbaID').Value:=izlozbaID;
                    IZLOZBA.ExecSQL;
                    showmessage('Uspesno obrisana izlozba.');
                  end
              else
                showmessage('Ne postoji takva izlozba.');

            end;
        end;
  end;

end.
