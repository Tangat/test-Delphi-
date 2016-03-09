unit Appoint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Data.Win.ADODB;

type
  TfrmAppoint = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    ADOQAppoint: TADOQuery;
    DSQAppoint: TDataSource;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppoint: TfrmAppoint;

implementation

{$R *.dfm}

uses adoconn;

procedure TfrmAppoint.BitBtn1Click(Sender: TObject);
begin
dm.ADOTAppoint.Edit;
dm.ADOTAppoint.Insert;
dm.ADOTAppointData.Value:=StrToDate(FormatDateTime('dd.mm.yyyy',DateTimePicker1.Date));
dm.ADOTAppointIDGrup.Value:=dm.ADOTgrupid_grup.AsInteger;
dm.ADOTAppointIDPredmet.Value:=dm.ADOTPredmetid_predmet.AsInteger;
dm.ADOTAppoint.Post;
ADOQAppoint.Active:=false;
ADOQAppoint.Active:=true;
end;

procedure TfrmAppoint.ComboBox1Change(Sender: TObject);
begin
if ComboBox1.Text<>'Выберите группу' then
dm.adoTGrup.Locate('grup',ComboBox1.Text,[]);
end;

procedure TfrmAppoint.ComboBox2Change(Sender: TObject);
begin
if ComboBox2.Text<>'Выберите предмету' then
dm.ADOTPredmet.Locate('predmet',ComboBox2.Text,[]);
end;

procedure TfrmAppoint.FormShow(Sender: TObject);
begin
ComboBox1.Clear;
dm.adoTGrup.First;
while not dm.adoTGrup.Eof do begin
ComboBox1.Items.Add(dm.adoTGrupGrup.AsString);
dm.adoTGrup.Next;
end;
ComboBox1.Text:='Выберите группу';
ComboBox2.Clear;
dm.adoTPredmet.First;
while not dm.adoTPredmet.Eof do begin
ComboBox2.Items.Add(dm.ADOTPredmetpredmet.AsString);
dm.adoTPredmet.Next;
end;
ComboBox2.Text:='Выберите предмету';
end;

end.
