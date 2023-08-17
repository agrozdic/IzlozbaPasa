program IzlozbaPasa;

uses
  Forms,
  untMain in 'untMain.pas' {formMain},
  untPrijava in 'untPrijava.pas' {formPrijava},
  untSpisak in 'untSpisak.pas' {formSpisak},
  untUnos in 'untUnos.pas' {formUnos},
  untRasa in 'untRasa.pas' {formRasa},
  untDM in 'untDM.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformPrijava, formPrijava);
  Application.CreateForm(TformSpisak, formSpisak);
  Application.CreateForm(TformUnos, formUnos);
  Application.CreateForm(TformRasa, formRasa);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
