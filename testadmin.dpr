program testadmin;

uses
  Vcl.Forms,
  Glav in 'Glav.pas' {frmglav},
  pass in 'pass.pas' {frmpass},
  gruppa in 'gruppa.pas' {frmgruppa},
  adoconn in 'adoconn.pas' {DM: TDataModule},
  student in 'student.pas' {frmstudent},
  predmet in 'predmet.pas' {frmpredmet},
  addtest in 'addtest.pas' {frmtest},
  report in 'report.pas' {frmreport},
  Appoint in 'Appoint.pas' {frmAppoint};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmglav, frmglav);
  Application.CreateForm(Tfrmpass, frmpass);
  Application.CreateForm(Tfrmgruppa, frmgruppa);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrmstudent, frmstudent);
  Application.CreateForm(Tfrmpredmet, frmpredmet);
  Application.CreateForm(Tfrmtest, frmtest);
  Application.CreateForm(Tfrmreport, frmreport);
  Application.CreateForm(TfrmAppoint, frmAppoint);
  Application.Run;
end.
