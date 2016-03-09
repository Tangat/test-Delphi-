unit student;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, ExcelXP, Vcl.OleServer,comobj;

type
  Tfrmstudent = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    OpenDialog1: TOpenDialog;
    ExcelApplication1: TExcelApplication;
    ExcelOLEObject1: TExcelOLEObject;
    ADOQuery1: TADOQuery;
    DSstudent: TDataSource;
    Panel4: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmstudent: Tfrmstudent;

implementation

{$R *.dfm}

uses adoconn;

procedure Tfrmstudent.BitBtn1Click(Sender: TObject);
begin
panel1.Visible:=false;
panel4.Visible:=true;
dbedit1.SetFocus;
dm.ADOTStudent.Insert;
end;

procedure Tfrmstudent.BitBtn2Click(Sender: TObject);
begin
panel1.Visible:=false;
panel4.Visible:=true;
dbedit1.SetFocus;
dm.ADOTStudent.Edit;
end;

procedure Tfrmstudent.BitBtn3Click(Sender: TObject);
begin
dm.ADOTStudent.Delete;
dm.ADOTStudent.Refresh;
end;

procedure Tfrmstudent.BitBtn4Click(Sender: TObject);
begin
close;
end;

procedure Tfrmstudent.BitBtn5Click(Sender: TObject);
begin
if (not (dm.adoTStudent.State=dsedit)) or (not (dm.adoTStudent.State=dsinsert)) then dm.adoTStudent.Edit;
//dm.FDTStudentID.Value:=0;
dm.ADOTstudentid_predmet.Value:=0;
dm.adoTStudent.Post;
dm.adoTStudent.Refresh;
panel4.Visible:=false;
panel1.Visible:=true;
end;

procedure Tfrmstudent.BitBtn6Click(Sender: TObject);
begin
panel4.Visible:=false;
panel1.Visible:=true;
dm.adoTGrup.Cancel;
end;

procedure Tfrmstudent.BitBtn8Click(Sender: TObject);
var
  excel:variant;
  i,j:word;
begin
 excel:= createoleobject('excel.application');
  if not opendialog1.Execute then exit;
  excel.workbooks.open(opendialog1.FileName);
  excel.visible:=true;
  i:=1;
  While excel.sheets[1].cells[i+1,1].text<>'' do
  begin
    i:=i+1;
    if (not (dm.adotStudent.State=dsedit)) or (not (dm.adoTStudent.State=dsinsert)) then dm.adoTStudent.Edit; begin
    dm.adoTStudent.Insert;
    //dm.ADOTStudentid_student.Value:=0;
    dm.ADOTStudentSNP.Value:=excel.sheets[1].cells[i,1].text;
    dm.ADOTStudentZachNom.Value:=excel.sheets[1].cells[i,2].text;
    dm.ADOTStudentGrup.Value:=dm.ADOTgrupid_grup.AsInteger;
    dm.ADOTstudentid_predmet.Value:=0;
    dm.ADOTStudent.Post;
    dm.ADOTStudent.Refresh;          end;
  end;
end;

procedure Tfrmstudent.ComboBox1Change(Sender: TObject);
begin
if combobox1.Text<>'Оќу тобын тањдањыз' then
begin
  Dm.ADOTgrup.Locate('grup',combobox1.Text,[]);

  bitbtn1.Enabled:=true;
  bitbtn8.Enabled:=true;
end
else
begin
 bitbtn1.Enabled:=false;
 bitbtn8.Enabled:=false;
end;
  ADOQuery1.Active:=false;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT tblstudent.id_student, tblstudent.SNP, tblstudent.ZachNom FROM tblgrup INNER JOIN tblstudent ON tblgrup.ID_grup = tblstudent.Grup WHERE  tblstudent.grup = '+ dm.ADOTgrupid_grup.AsString + '');
  ADOQuery1.Active:=true;
end;

procedure Tfrmstudent.FormShow(Sender: TObject);
begin
ComboBox1.Clear;
dm.ADOTGrup.First;
while not dm.ADOTGrup.Eof do
begin
  ComboBox1.Items.Add(dm.ADOTGrupGrup.AsString);
  dm.ADOTGrup.Next;
end;
combobox1.Items.Add('Оќу тобын тањдањыз');
 panel4.Visible:=false;
 panel1.Visible:=true;
 bitbtn1.Enabled:=false;
 bitbtn8.Enabled:=false;
 combobox1.Text:='Оќу тобын тањдањыз';
end;

end.
