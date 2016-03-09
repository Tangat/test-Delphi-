unit report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Data.Win.ADODB,
  Vcl.OleServer, ExcelXP, comobj, JvDBUltimGrid, JvExDBGrids, JvDBGrid,
  JvComponentBase, JvDBGridExport, JvADOQuery, frxClass, frxDBSet, frxPreview;

type
  Tfrmreport = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    ADOQRepost: TADOQuery;
    DSReport: TDataSource;
    ExcelApplication1: TExcelApplication;
    BitBtn3: TBitBtn;
    JvADOQuery1: TJvADOQuery;
    ADOQRepostid_grup: TAutoIncField;
    ADOQRepostSNP: TWideStringField;
    ADOQRepostzachnom: TWideStringField;
    ADOQRepostpredmet: TWideStringField;
    ADOQRepostrezult: TIntegerField;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreport: Tfrmreport;

implementation

{$R *.dfm}

uses adoconn;

procedure Tfrmreport.BitBtn1Click(Sender: TObject);
begin
  ADOQRepost.Active := false;
  ADOQRepost.SQL.Clear;
  ADOQRepost.SQL.Add('SELECT  tblgrup.id_grup,  tblstudent.SNP,' +
    '  tblstudent.zachnom,  tblpredmet.predmet,  tblrezult.rezult' +
    ' FROM tblstudent  LEFT OUTER JOIN tblrezult    ON tblstudent.id_student = tblrezult.idstudent'
    + '  RIGHT OUTER JOIN tblpredmet    ON tblpredmet.id_predmet = tblrezult.idpredmet  RIGHT OUTER JOIN tblgrup'
    + '    ON tblgrup.id_grup = tblrezult.id_grup    AND tblgrup.id_grup = tblstudent.grup WHERE tblgrup.id_grup = '
    + dm.ADOTgrupid_grup.AsString + '');
  ADOQRepost.Active := true;
end;

procedure Tfrmreport.BitBtn2Click(Sender: TObject);
var
  i, j, index, p: Integer;
  g: sTring;
  ExcelApp, sheet: Variant;
begin
  p := 0;
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Visible := true;
  ExcelApp.WorkBooks.Add(-4167);
  ExcelApp.WorkBooks[1].WorkSheets[1].name := 'Export';
  sheet := ExcelApp.WorkBooks[1].WorkSheets['Export'];
  sheet.cells[2, 2] := 'Группа';
  sheet.cells[2, 3] := dm.ADOTgrupgrup.AsString + '  ';
  sheet.cells[2, 4] := dm.ADOTgrupkurs.AsString + 'Курс';
  // Sheet.Cells[3,3]:=dm.IBTPredmetPREDMETA.AsString;
  sheet.cells[4, 2] := 'Мамандық бойынша мемлекеттік емтихан';
  // Sheet.Cells[4,3]:=dm.IBTPredmetPREPOD.AsString;
  sheet.cells[5, 2] := date;
  sheet.cells[5, 3] := time;
  sheet.cells[6, 1] := '№';
  sheet.cells[6, 2] := 'ФИО';
  sheet.cells[6, 3] := 'Зачетка';
  sheet.cells[6, 4] := 'Предмет';
  sheet.cells[6, 8] := 'Экзамен';
  sheet.cells[6, 9] := 'Итог';
  index := 7; // çàïîëíåíèå ñî 2 ñòðîêè
  DBGrid1.DataSource.DataSet.First;

  for i := 1 to DBGrid1.DataSource.DataSet.RecordCount do
  begin
    sheet.cells[index, 1] := i;
    sheet.cells[index, 2] := DBGrid1.fields[0].AsString;
    sheet.cells[index, 3] := DBGrid1.fields[1].AsString;
    sheet.cells[index, 4] := DBGrid1.fields[2].AsString;
    sheet.cells[index, 5] := DBGrid1.fields[3].AsString;
    sheet.cells[index, 6].select;
    DBGrid1.DataSource.DataSet.Next;
    inc(index);

  end;
  sheet.cells[index + 1, 3] := 'IT';
  sheet.cells[index + 1, 7] := 'asd';
  ExcelApp.Visible := true;

end;

procedure Tfrmreport.BitBtn3Click(Sender: TObject);
var
  k: Integer;
begin
  ADOQRepost.First;

  for k := 1 to ADOQRepost.RecordCount do
  begin
    if dm.ADOTrepostFIO.Value = ADOQRepostSNP.AsString then
    begin
      if dm.ADOTrepostpredmet2.IsNull then
      begin
        dm.ADOTrepost.Edit;
        dm.ADOTrepostpredmet2.Value := ADOQRepostrezult.AsInteger;
        ADOQRepost.Next;
      end
      else if dm.ADOTrepostpredmet3.IsNull then
      begin
        dm.ADOTrepost.Edit;
        dm.ADOTrepostpredmet3.Value := ADOQRepostrezult.AsInteger;
        ADOQRepost.Next;
      end
      else
        ADOQRepost.Next;
    end
    else
    begin
      dm.ADOTrepost.Insert;
      dm.ADOTrepostgrup.Value := ADOQRepostid_grup.AsInteger;
      dm.ADOTrepostFIO.Value := ADOQRepostSNP.AsString;
      dm.ADOTrepostzachnom.Value := ADOQRepostzachnom.AsString;
      dm.ADOTrepostpredmet1.Value := ADOQRepostrezult.AsInteger;
      ADOQRepost.Next;
    end;
    dm.ADOTrepost.Post;
  end;

end;

procedure Tfrmreport.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text <> 'Выберите группу' then
    dm.adoTGrup.Locate('grup', ComboBox1.Text, []);

end;

procedure Tfrmreport.FormShow(Sender: TObject);
begin
  ComboBox1.Clear;
  dm.adoTGrup.First;
  while not dm.adoTGrup.Eof do
  begin
    ComboBox1.Items.Add(dm.ADOTgrupgrup.AsString);
    dm.adoTGrup.Next;
  end;
  ComboBox1.Text := 'Выберите группу'
end;

end.
