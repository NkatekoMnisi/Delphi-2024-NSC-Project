unit fAgencyPS_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Menus,DMSuburbs,DMListings,DMAgencies,DateUtils,fAgencyLogin_u;

type
  TfrmAgencyPS = class(TForm)
    pnlUserManagement: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Button4: TButton;
    edtYT: TEdit;
    cbYT: TComboBox;
    GroupBox1: TGroupBox;
    Button1: TButton;
    edtST: TEdit;
    cbTS: TComboBox;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    Help1: TMenuItem;
    Memo1: TMemo;
    procedure Back1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgencyPS: TfrmAgencyPS;
    memWelc:Tmemo;    {}
  num:integer;
implementation

uses fAgencyMain_u;

{$R *.dfm}

procedure TfrmAgencyPS.Back1Click(Sender: TObject);
begin
frmAgencyMain.show;
frmAgencyPS.Close;
end;

procedure TfrmAgencyPS.Button1Click(Sender: TObject);
var
iCount,isid:integer;

begin
iCount:=0;

if cbTS.Text='All' then
isid:=0;
if cbTS.Text='West Acres' then
isid:=1;
if cbTS.Text='Mataffin' then
isid:=2;
if cbTS.Text='Drum Rock' then
isid:=3;
if cbTS.Text='Kamagugu' then
isid:=4;
if cbTS.Text='Nelspruit Rural' then
isid:=5;
if cbTS.Text='Sonheuwel' then
isid:=6;
if cbTS.Text='Stonehenge' then
isid:=7;
if cbTS.Text='The Rest' then
isid:=8;

DMtbllistings.tblListings.First;
while not DMtbllistings.tblListings.eof do
begin
if (DMtbllistings.tblListings['Agencyid']=sAgencyid) and  ( (DMtbllistings.tblListings['Suburbid']=isid) or (isid=0) )   then
begin
inc(iCount)
end;
DMtbllistings.tblListings.Next;
end;

edtST.text:=inttostr(iCount);

end;

procedure TfrmAgencyPS.Button4Click(Sender: TObject);
var
iCount:integer;
text:string;
begin
iCount:=0;
Text:=cbYT.Text;
if cbYT.Text='All' then
Text:='1';
DMtbllistings.tblListings.First;
while not DMtbllistings.tblListings.eof do
begin
if (DMtbllistings.tblListings['Agencyid']=sAgencyid) and  ( (Yearof(DMtbllistings.tblListings['Listing Date'])=strtoint(text)) or (strtoint(text)=1) )   then
begin
inc(iCount)
end;
DMtbllistings.tblListings.Next;
end;

edtYT.text:=inttostr(iCount);

end;

procedure TfrmAgencyPS.FormShow(Sender: TObject);
var
 iCount2:integer;
iCount1:real;
begin
num:=1;                                      {}

 memwelc:=Tmemo.Create(frmAgencyPS);
memwelc.Parent:=frmAgencyPS;

memwelc.Left:=180;
memwelc.Top:=100;
memwelc.Width:=500;
memwelc.Height:=300;

memwelc.Lines.Add('>Click continue under rent to search for properties');
memwelc.Lines.Add('>Click LOGIN>TO sign-in as a User');
memwelc.Lines.Add('>Click ADMIN>To sign-in as an Administrator');
memwelc.Lines.Add('>Click Agency>Login To sign-in as a real-estate firm');
memwelc.Lines.Add('>Click Agency>Register To get info on how to register as a real-estate firm');
memwelc.Hide;

           {}

iCount1:=0;
iCount2:=0;

 DMtbllistings.tblListings.First;
while not DMtbllistings.tblListings.eof do
begin
if DMtbllistings.tblListings['Agencyid']=sAgencyid   then
begin
icount1:=icount1+DMtbllistings.tblListings['Price'];
inc(icount2);
end;
DMtbllistings.tblListings.Next;
end;



Memo1.Lines.Add('Value of properties');
Memo1.Lines.Add('____________________');
Memo1.Lines.Add(floattostrf(icount1,ffcurrency,12,2));
 Memo1.Lines.Add('Number of properties');
 Memo1.Lines.Add('____________________');
Memo1.Lines.Add(inttostr(icount2));
end;

procedure TfrmAgencyPS.Help1Click(Sender: TObject);
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
