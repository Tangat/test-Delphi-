unit predmet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  Tfrmpredmet = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpredmet: Tfrmpredmet;

implementation

{$R *.dfm}

uses adoconn;

procedure Tfrmpredmet.BitBtn1Click(Sender: TObject);
begin
dm.ADOTpredmet.Insert;
panel3.Visible:=false;
panel4.Visible:=true;
dbedit3.SetFocus;
end;

procedure Tfrmpredmet.BitBtn2Click(Sender: TObject);
begin
dm.adoTPredmet.Edit;
panel3.Visible:=false;
panel4.Visible:=true;
dbedit3.SetFocus;
end;

procedure Tfrmpredmet.BitBtn3Click(Sender: TObject);
begin
dm.adoTPredmet.Delete;
dm.ADOTpredmet.Refresh;
end;

procedure Tfrmpredmet.BitBtn4Click(Sender: TObject);
begin
close;
end;

procedure Tfrmpredmet.BitBtn5Click(Sender: TObject);
begin
panel4.Visible:=false;
panel3.Visible:=true;
if (not (dm.adoTPredmet.State=dsedit)) or (not (dm.adoTPredmet.State=dsinsert)) then dm.adoTPredmet.Edit;
//dm.FDTPredmetID.Value:=0;
{dm.ADOTPredmetid_predmet.Value:=dm.adoTPupID.AsInteger;}
dm.adoTPredmet.Post;
dm.adoTPredmet.Refresh;
end;

procedure Tfrmpredmet.BitBtn6Click(Sender: TObject);
begin
panel4.Visible:=false;
panel3.Visible:=true;
dm.adoTPredmet.Cancel;
end;

end.
