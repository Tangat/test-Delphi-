unit addtest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, WordXP,
  Vcl.OleServer, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  Tfrmtest = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    DBMemo6: TDBMemo;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    DlgOpen: TOpenDialog;
    WordApp: TWordApplication;
    WordDocument1: TWordDocument;
    ADOQAddTest: TADOQuery;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtest: Tfrmtest;

implementation

{$R *.dfm}

uses adoconn;

procedure Tfrmtest.BitBtn1Click(Sender: TObject);
var
      NoSave, ReadOnly, FileName, st, en : OleVariant;

 r: Variant;
  v,i,j:integer;
begin
  if combobox1.Text='' then
  begin
    showmessage('Панді танданыз');
    exit;
  end;
  if not dlgOpen.Execute then exit;

  NoSave:=false;
  ReadOnly:=true;
  FileName:=dlgOpen.FileName;
  //WordApp:=createOleObject('Word.Application');

  WordApp.ConnectKind:=ckNewInstance;
  WordApp.Connect;
  v:=0;
  WordApp.Documents.Open( FileName,EmptyParam,ReadOnly,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam);
  WordDocument1.ConnectTo(WordApp.ActiveDocument);
  WordDocument1.ConvertNumbersToText;
  dm.adoTPredmet.Locate('predmet',combobox1.Text,[]);

  v:=WordDocument1.Tables.Count;
  for i:=1 to v do
  begin
      dm.ADOTTest.Active:=false;
      ADOQAddTest.Active:=false;
      ADOQAddTest.SQL.Clear;
      ADOQAddtest.SQL.Add('INSERT INTO tbltest (vopros,otvet1,otvet2,otvet3,otvet4,otvet5,id_predmet) values (:v,:o1,:o2,:o3,:o4,:o5,:predmet)');
    ADOQAddtest.Parameters.ParamByName('v').Value:=trim(WordDocument1.Tables.Item(i).Rows.Item(1).Range.Text);
    ADOQAddtest.Parameters.ParamByName('o1').Value:=trim(WordDocument1.Tables.Item(i).Rows.Item(2).Range.Text);
    ADOQAddtest.Parameters.ParamByName('o2').Value:=trim(WordDocument1.Tables.Item(i).Rows.Item(3).Range.Text);
    ADOQAddtest.Parameters.ParamByName('o3').Value:=trim(WordDocument1.Tables.Item(i).Rows.Item(4).Range.Text);
    ADOQAddtest.Parameters.ParamByName('o4').Value:=trim(WordDocument1.Tables.Item(i).Rows.Item(5).Range.Text);
    ADOQAddtest.Parameters.ParamByName('o5').Value:=trim(WordDocument1.Tables.Item(i).Rows.Item(6).Range.Text);
    ADOQAddtest.Parameters.ParamByName('predmet').Value:=dm.ADOTPredmetid_predmet.AsInteger;
    ADOQAddtest.ExecSQL;
     {if (not (dm.adoTTest.State=dsedit)) or (not (dm.adoTTest.State=dsinsert)) then dm.adoTTest.Edit;
     dm.adoTTest.Append;
     {ADOQuery1.Active:=false;
     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.Add('INSERT INTO test (Vopros, Otvet1, Otvet2, Otvet3, Otvet4, Otvet5, id_predmet) VALUES ('+Trim(WordDocument1.Tables.Item(i).Rows.Item(1).Range.Text)+','+Trim(WordDocument1.Tables.Item(i).Rows.Item(2).Range.Text)+','+Trim(WordDocument1.Tables.Item(i).Rows.Item(3).Range.Text)+','+Trim(WordDocument1.Tables.Item(i).Rows.Item(4).Range.Text)+','+Trim(WordDocument1.Tables.Item(i).Rows.Item(5).Range.Text)+','+Trim(WordDocument1.Tables.Item(i).Rows.Item(6).Range.Text)+','+IntToStr(dm.ADOTPredmetid_predmet.AsInteger)+')');
     ADOQuery1.ExecSQL;}
     //dm.FDTTestID.Value:=0;
     {dm.adoTTestVopros.AsString:=Trim(WordDocument1.Tables.Item(i).Rows.Item(1).Range.Text);
     dm.adoTTestOtvet1.AsString:=Trim(WordDocument1.Tables.Item(i).Rows.Item(2).Range.Text);
     dm.adoTTestOtvet2.AsString:=Trim(WordDocument1.Tables.Item(i).Rows.Item(3).Range.Text);
     dm.adoTTestOtvet3.AsString:=Trim(WordDocument1.Tables.Item(i).Rows.Item(4).Range.Text);
     dm.adoTTestOtvet4.AsString:=Trim(WordDocument1.Tables.Item(i).Rows.Item(5).Range.Text);
     dm.adoTTestOtvet5.AsString:=Trim(WordDocument1.Tables.Item(i).Rows.Item(6).Range.Text);
     dm.ADOTTestid_predmet.Value:=dm.ADOTPredmetid_predmet.AsInteger;
     dm.adoTTest.Post;
     dm.adoTTest.Refresh;}
  end;
  WordApp.Quit(NoSave);
  WordApp.Disconnect;
  dm.ADOTTest.Active:=true;
  statusbar1.SimpleText:=inttostr(dm.adoTTest.RecordCount);

end;

procedure Tfrmtest.ComboBox1Change(Sender: TObject);
begin
 dm.ADOTpredmet.Locate('predmet',combobox1.Text,[]);
 statusbar1.Panels.Items[0].Text:=inttostr(dm.ADOTtest.RecordCount)+' вопросов';
end;

procedure Tfrmtest.FormShow(Sender: TObject);
begin
combobox1.Clear;
dm.adoTPredmet.First;
while not dm.adoTPredmet.Eof do
begin
  combobox1.Items.Add(dm.ADOTpredmetpredmet.AsString);
  dm.adoTPredmet.Next;
end;
end;

end.
