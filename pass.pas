unit pass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  Tfrmpass = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    edlogin: TMaskEdit;
    edpass: TMaskEdit;
    btnok: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpass: Tfrmpass;

implementation

{$R *.dfm}

procedure Tfrmpass.btnokClick(Sender: TObject);
begin
if (edlogin.Text='tanat') and (edpass.Text='tanat') then ShowMessage('ok');

end;

end.
