unit fAgencyUpdate_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls,fAgencyLogin_u,DMAgencies,
  Menus;

type
  TfrmAgencyUpt = class(TForm)
    pnlUserManagement: TPanel;
    Image1: TImage;
    dbgAgencies: TDBGrid;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Button4: TButton;
    edtEdit: TEdit;
    ComboBox1: TComboBox;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    Help1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure Back1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgencyUpt: TfrmAgencyUpt;
     memWelc:Tmemo;    {}
  num:integer;
implementation

uses DMListings, fAgencyMain_u;

{$R *.dfm}

procedure TfrmAgencyUpt.Back1Click(Sender: TObject);
begin
 frmAgencyMain.show;
frmAgencyUpt.Close;
end;

procedure TfrmAgencyUpt.Button4Click(Sender: TObject);
var
sField,corAName:string;
begin
if edtEdit.text<>'' then
  begin
sField:=sAgencyid;

if ComboBox1.Text='Agency Name' then
 begin

DMtblAgencies.ADOQAgencies.SQL.Clear;
DMtblAgencies.ADOQAgencies.SQL.Add('update agencies set agencyname="'+edtEdit.text+'" where agencyid='+sfield);
DMtblAgencies.ADOQAgencies.ExecSQL;
 end;
 if ComboBox1.Text='Website' then
 begin
DMtblAgencies.ADOQAgencies.SQL.Clear;
DMtblAgencies.ADOQAgencies.SQL.Add('update agencies set Website="'+edtEdit.text+'" where agencyid='+sfield);
DMtblAgencies.ADOQAgencies.ExecSQL;
end;
if ComboBox1.Text='Contact Number' then
 begin
DMtblAgencies.ADOQAgencies.SQL.Clear;
DMtblAgencies.ADOQAgencies.SQL.Add('update agencies set ContactNumber="'+edtEdit.text+'" where agencyid='+sfield);
DMtblAgencies.ADOQAgencies.ExecSQL;
 end;
 if ComboBox1.Text='Email Address' then
 begin
DMtblAgencies.ADOQAgencies.SQL.Clear;
DMtblAgencies.ADOQAgencies.SQL.Add('update agencies set EmailAddress="'+edtEdit.text+'" where agencyid='+sfield);
DMtblAgencies.ADOQAgencies.ExecSQL;
end;

 DMtblAgencies.ADOQAgencies.SQL.Clear;
DMtblAgencies.ADOQAgencies.SQL.Add('SELECT * FROM agencies WHERE agencyid = ' + sAgencyid );
DMtblAgencies.ADOQAgencies.open;
  end
  else
  showmessage('Edit cannot be empty');

end;

procedure TfrmAgencyUpt.FormShow(Sender: TObject);
begin
num:=1;                                      {}

 memwelc:=Tmemo.Create(frmAgencyUpt);
memwelc.Parent:= frmAgencyUpt;

memwelc.Left:=180;
memwelc.Top:=100;
memwelc.Width:=500;
memwelc.Height:=300;

memwelc.Lines.Add('>Click continue under rent to search for properties');
memwelc.Lines.Add('>Click LOGIN>TO sign-in as a User');
memwelc.Lines.Add('>Click ADMIN>To sign-in as an Administrator');
memwelc.Lines.Add('>Click Agency>Login To sign-in as a real-estate firm');
memwelc.Lines.Add('>Click Agency>Register To get info on how to register as a real-estate firm');
memwelc.Hide;             {}


 DMtblAgencies.ADOQAgencies.SQL.Clear;
DMtblAgencies.ADOQAgencies.SQL.Add('SELECT * FROM agencies WHERE agencyid = ' + sAgencyid );
DMtblAgencies.ADOQAgencies.open;
end;

procedure TfrmAgencyUpt.Help1Click(Sender: TObject);
begin
 if num=1 then
 begin
memWelc.Show;
num:=2;
 end
else
begin
memWelc.Hide;
num:=1;
end;
end;

end.
