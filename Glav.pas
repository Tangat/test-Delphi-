unit Glav;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  Tfrmglav = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    btngruppa: TBitBtn;
    btnstudent: TBitBtn;
    btnpredmet: TBitBtn;
    btntest: TBitBtn;
    btnreport: TBitBtn;
    btnAppoint: TBitBtn;
    procedure btngruppaClick(Sender: TObject);
    procedure btnstudentClick(Sender: TObject);
    procedure btnpredmetClick(Sender: TObject);
    procedure btntestClick(Sender: TObject);
    procedure btnAppointClick(Sender: TObject);
    procedure btnreportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmglav: Tfrmglav;

implementation

{$R *.dfm}

uses gruppa, student, predmet, addtest, Appoint, report;

procedure Tfrmglav.btnAppointClick(Sender: TObject);
begin
frmAppoint.ShowModal;
end;

procedure Tfrmglav.btngruppaClick(Sender: TObject);
begin
frmgruppa.ShowModal;
end;

procedure Tfrmglav.btnpredmetClick(Sender: TObject);
begin
frmpredmet.ShowModal;
end;

procedure Tfrmglav.btnreportClick(Sender: TObject);
begin
frmreport.ShowModal
end;

procedure Tfrmglav.btnstudentClick(Sender: TObject);
begin
frmstudent.ShowModal;
end;

procedure Tfrmglav.btntestClick(Sender: TObject);
begin
frmtest.ShowModal;
end;

end.
