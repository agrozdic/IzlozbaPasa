unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TformMain = class(TForm)
    MainMenu1: TMainMenu;
    Prijave1: TMenuItem;
    Prijavapasa1: TMenuItem;
    Spisakpasa1: TMenuItem;
    Izlzobe1: TMenuItem;
    Unos1: TMenuItem;
    Spisakpasaporasi1: TMenuItem;
    Kraj1: TMenuItem;
    Izlaz1: TMenuItem;
    procedure Izlaz1Click(Sender: TObject);
    procedure Prijavapasa1Click(Sender: TObject);
    procedure Spisakpasa1Click(Sender: TObject);
    procedure Unos1Click(Sender: TObject);
    procedure Spisakpasaporasi1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

uses untDM, untPrijava, untRasa, untSpisak, untUnos;

{$R *.dfm}

procedure TformMain.Izlaz1Click(Sender: TObject);
  begin
    Close;
  end;

procedure TformMain.Prijavapasa1Click(Sender: TObject);
  begin
    formPrijava.ShowModal;
  end;

procedure TformMain.Spisakpasa1Click(Sender: TObject);
  begin
    formSpisak.ShowModal;
  end;

procedure TformMain.Unos1Click(Sender: TObject);
  begin
    formUnos.ShowModal;
  end;

procedure TformMain.Spisakpasaporasi1Click(Sender: TObject);
  begin
    formRasa.ShowModal;
  end;

end.
