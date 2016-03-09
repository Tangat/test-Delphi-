unit gruppa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.Win.ADODB;

type
  Tfrmgruppa = class(TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmgruppa: Tfrmgruppa;

implementation

{$R *.dfm}

uses adoconn;

procedure Tfrmgruppa.BitBtn1Click(Sender: TObject);
begin
panel3.Visible:=true;
Panel4.Visible:=false;
dm.AdoTGrup.Insert;
DBEdit1.SetFocus;
end;

procedure Tfrmgruppa.BitBtn2Click(Sender: TObject);
begin
dm.ADOTgrup.Delete;
dm.ADOTgrup.Refresh;
end;

procedure Tfrmgruppa.BitBtn3Click(Sender: TObject);
begin
Close;
end;

procedure Tfrmgruppa.BitBtn4Click(Sender: TObject);
begin
dm.adoTGrup.Edit;
Panel3.Visible:=true;
Panel4.Visible:=false;
DBEdit1.SetFocus;
end;

procedure Tfrmgruppa.BitBtn5Click(Sender: TObject);
begin
if (not (dm.adoTGrup.State=dsedit)) or (not (dm.adoTGrup.State=dsinsert)) then dm.adoTGrup.Edit;
dm.adoTGrup.Post;
panel4.Visible:=true;
panel3.Visible:=false;
dm.adoTGrup.Refresh;
end;

procedure Tfrmgruppa.BitBtn6Click(Sender: TObject);
begin
dm.adoTGrup.Cancel;
Panel4.Visible:=true;
Panel3.Visible:=false;
end;

end.
