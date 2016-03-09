unit adoconn;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADOTgrup: TADOTable;
    ADOTstudent: TADOTable;
    ADOTpredmet: TADOTable;
    ADOTtest: TADOTable;
    ADOTgrupid_grup: TAutoIncField;
    ADOTgrupgrup: TWideStringField;
    ADOTgrupkurs: TIntegerField;
    ADOTstudentid_student: TAutoIncField;
    ADOTstudentSNP: TWideStringField;
    ADOTstudentzachnom: TWideStringField;
    ADOTstudentgrup: TIntegerField;
    DSgrup: TDataSource;
    DSstudent: TDataSource;
    DSpredmet: TDataSource;
    DStest: TDataSource;
    ADOTpredmetid_predmet: TAutoIncField;
    ADOTpredmetpredmet: TWideStringField;
    ADOTpredmetteacher: TWideStringField;
    ADOTtestid_test: TAutoIncField;
    ADOTtestvopros: TBlobField;
    ADOTtestotvet1: TBlobField;
    ADOTtestotvet2: TBlobField;
    ADOTtestotvet3: TBlobField;
    ADOTtestotvet4: TBlobField;
    ADOTtestotvet5: TBlobField;
    ADOTtestid_predmet: TIntegerField;
    ADOTAppoint: TADOTable;
    DSAppoint: TDataSource;
    ADOTAppointid_appoint: TAutoIncField;
    ADOTAppointData: TDateField;
    ADOTAppointIDGrup: TIntegerField;
    ADOTAppointIDPredmet: TIntegerField;
    ADOTrepost: TADOTable;
    ADOTrepostid_report: TAutoIncField;
    ADOTrepostgrup: TIntegerField;
    ADOTrepostFIO: TWideStringField;
    ADOTrepostzachnom: TWideStringField;
    ADOTrepostbilet: TSmallintField;
    ADOTrepostpredmet1: TSmallintField;
    ADOTrepostpredmet2: TSmallintField;
    ADOTrepostpredmet3: TSmallintField;
    ADOTrepostball: TFloatField;
    ADOTrepostprocent: TSmallintField;
    ADOTrepostbook: TWideStringField;
    ADOTstudentid_predmet: TIntegerField;
    DSReport: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
