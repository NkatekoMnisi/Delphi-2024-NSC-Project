unit fAdminAM_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DMAgencies, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, Menus,DMListings,math;

type
  TfrmAdminAM = class(TForm)
    pnlUserManagement: TPanel;
    Image1: TImage;
    dbgAgencies: TDBGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Button3: TButton;
    edtAName: TEdit;
    GroupBox3: TGroupBox;
    Button4: TButton;
    edtEdit: TEdit;
    ComboBox1: TComboBox;
    MainMenu1: TMainMenu;
    H1: TMenuItem;
    Help1: TMenuItem;
    Label2: TLabel;
    lblWeb: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtEmail: TEdit;
    edtWebS: TEdit;
    edtContNum: TEdit;
    Button5: TButton;
    GroupBox4: TGroupBox;
    Button6: TButton;
    GroupBox5: TGroupBox;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminAM: TfrmAdminAM;
    memWelc:Tmemo;    {}
  num:integer;
implementation

uses DMAdmins, fAdminMainS_u;

{$R *.dfm}

procedure TfrmAdminAM.Button1Click(Sender: TObject);
begin
 DMtblAgencies.ADOQAgencies.SQL.Clear;           //DMtblListings
 DMtblAgencies.ADOQAgencies.SQL.Add('select agencies.agencyid,agencyname,count(listingid) as [Number of Properties] from agencies,listings where agencies.agencyid=listings.agencyid group by agencyname,agencies.agencyid order by count(listingid) desc ');
DMtblAgencies.ADOQAgencies.open;
end;

procedure TfrmAdminAM.Button2Click(Sender: TObject);
begin
DMtblAgencies.ADOQAgencies.Delete;
end;

procedure TfrmAdminAM.Button3Click(Sender: TObject);
var
corAname:string;
begin
if (edtAName.text<>'') or (edtWebS.text<>'') or (edtContNum.text<>'') or (edtEmail.text<>'') then
 begin
corAName:=uppercase(edtAName.text[1])+lowercase(copy(edtAName.text,2,length(edtAName.text)));
DMtblAgencies.ADOQAgencies.SQL.Clear;
DMtblAgencies.ADOQAgencies.SQL.Add('insert into agencies (AgencyName,Website,ContactNumber,EmailAddress) values ("'+corAName+'","'+edtWebS.text+'","'+edtContNum.text+'","'+edtEmail.text+'")' );            //YearOfEmployment
DMtblAgencies.ADOQAgencies.ExecSQL;

DMtblAgencies.ADOQAgencies.SQL.Clear;
DMtblAgencies.ADOQAgencies.SQL.Add('select * from agencies');
DMtblAgencies.ADOQAgencies.Open;

 end
 else
 showmessage('Surname or name cannot be empty');


end;

procedure TfrmAdminAM.Button4Click(Sender: TObject);
var
sField,corAName:string;
begin
if edtEdit.text<>'' then
  begin
sField:=dbgAgencies.DataSource.DataSet.FieldByName('agencyid').AsString;

if ComboBox1.Text='Agency Name' then
 begin
 corAName:=uppercase(edtEdit.text[1])+lowercase(copy(edtEdit.text,2,length(edtEdit.text)));
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
DMtblAgencies.ADOQAgencies.SQL.Add('select * from agencies');
DMtblAgencies.ADOQAgencies.Open;
  end
  else
  showmessage('Edit cannot be empty');

end;

procedure TfrmAdminAM.Button5Click(Sender: TObject);
begin
DMtblAgencies.ADOQAgencies.SQL.Clear;
DMtblAgencies.ADOQAgencies.SQL.Add('select * from agencies');
DMtblAgencies.ADOQAgencies.Open;
end;

procedure TfrmAdminAM.Button6Click(Sender: TObject);
begin
  DMtblAgencies.ADOQAgencies.SQL.Clear;           //DMtblListings
 DMtblAgencies.ADOQAgencies.SQL.Add('select agencies.agencyid,agencyname,format(avg(Price),0.00) as [average] from agencies,listings where agencies.agencyid=listings.agencyid group by agencyname,agencies.agencyid order by avg(price) desc ');
DMtblAgencies.ADOQAgencies.open;
end;

procedure TfrmAdminAM.Button7Click(Sender: TObject);
begin
   DMtblAgencies.ADOQAgencies.SQL.Clear;           //DMtblListings
 DMtblAgencies.ADOQAgencies.SQL.Add('select agencies.agencyid,agencyname,format(sum(Price),0.00) as [Total value of properties] from agencies,listings where agencies.agencyid=listings.agencyid group by agencyname,agencies.agencyid order by sum(price) desc ');
DMtblAgencies.ADOQAgencies.open;
end;

procedure TfrmAdminAM.FormShow(Sender: TObject);
begin
 num:=1;                                      {}

 memwelc:=Tmemo.Create(frmAdminAM);
memwelc.Parent:= frmAdminAM;

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
end;

procedure TfrmAdminAM.H1Click(Sender: TObject);
begin
   frmAdminAM.Close;
 frmAdminMainS.show;
end;

procedure TfrmAdminAM.Help1Click(Sender: TObject);
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
