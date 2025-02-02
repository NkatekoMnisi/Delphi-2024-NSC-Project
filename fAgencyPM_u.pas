unit fAgencyPM_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DMSuburbs,DMListings, StdCtrls, Grids, DBGrids, jpeg, ExtCtrls, Spin,
  Menus,fAgencyLogin_u, ExtDlgs,math;

type
  TfrmAgencyPM = class(TForm)
    pnlUserManagement: TPanel;
    Image1: TImage;
    dbgUsers: TDBGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    lblWeb: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    edtPrice: TEdit;
    edtArea: TEdit;
    GroupBox3: TGroupBox;
    Button4: TButton;
    edtEdit: TEdit;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    sedtBedroom: TSpinEdit;
    sedtBathroom: TSpinEdit;
    sedtParking: TSpinEdit;
    cbPool: TCheckBox;
    cbPetFriendly: TCheckBox;
    cbRental: TCheckBox;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    Button5: TButton;
    edtSuburb: TEdit;
    img1: TImage;
    Help1: TMenuItem;
    GroupBox4: TGroupBox;
    Button6: TButton;
    GroupBox5: TGroupBox;
    Button7: TButton;
    procedure Back1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgencyPM: TfrmAgencyPM;
  Limgdir:Tstringlist;
  memWelc:Tmemo;    {}
  num:integer;
implementation

uses fAgencyMain_u, DMAgencies, DMUsers;

{$R *.dfm}

procedure TfrmAgencyPM.Back1Click(Sender: TObject);
begin
frmAgencyMain.show;
frmAgencyPM.Close;
end;

procedure TfrmAgencyPM.Button1Click(Sender: TObject);
begin
   DMtblListings.qryListings.SQL.Clear;
    DMtblListings.qryListings.SQL.Add('SELECT * FROM listings WHERE agencyid = ' + sAgencyid + ' ORDER BY price desc');
 DMtblListings.qryListings.open;

end;

procedure TfrmAgencyPM.Button2Click(Sender: TObject);
var
myfile:textfile;
sfield:string;
begin
sField:=dbgUsers.DataSource.DataSet.FieldByName('listingid').AsString;
  assignfile(myfile,'DeletedProperties.txt');
 rewrite(myfile);
 writeln(myfile,sField);
 closefile(myfile);

DMtblListings.DSListings.DataSet.Delete;
end;

procedure TfrmAgencyPM.Button3Click(Sender: TObject);
var
sPrice,sArea,sSuburb,sBednum,sBathnum,sparking,sPool,sPF,sRental:string;
IsPool,IsPF,IsRental,IsSubExist,IsNotExistId:boolean;
tnow:Tdate;
iListingid:integer;
i1,i2,i:integer;
s1,s2,imgid:string;
sline:string;
myfile:textfile;
begin
s1:=edtPrice.Text;
s2:=edtArea.Text;


if (TryStrToInt(s1,i1)=true) and (TryStrToInt(s2,i2)=true)then
begin

tnow:=now;
formatdatetime('YYYY/MM/DD',tnow);
IsSubExist:=false;
 if (edtPrice.Text<>'') or (edtArea.Text<>'') or (sedtBedroom.value<>0) or (sedtBathroom.value<>0) then
  begin //
  if (i1<16000001) or (i1>800000)  then
   begin
 dmtblsuburbs.tblSuburbs.First;
while not dmtblsuburbs.tblSuburbs.eof do
begin
if (edtSuburb.text=dmtblsuburbs.tblSuburbs['Suburbname']) then
begin
IsSubExist:=True;
end;
dmtblsuburbs.tblSuburbs.Next;
end;

if IsSubExist=false then
begin
dmtblsuburbs.tblSuburbs.Append;
 dmtblsuburbs.tblSuburbs['Suburbname']:=edtSuburb.Text;
 dmtblsuburbs.tblSuburbs.Post;
end;

 dmtblsuburbs.tblSuburbs.First;
while not dmtblsuburbs.tblSuburbs.eof do
begin
if (edtSuburb.text=dmtblsuburbs.tblSuburbs['Suburbname']) then
begin
sSuburb:=dmtblsuburbs.tblSuburbs['Suburbid'];
end;
dmtblsuburbs.tblSuburbs.Next;
end;

if cbRental.Checked=true then
sRental:='2'
else
sRental:='1';
if cbPool.Checked=true then
sPool:='True'
else
sPool:='False';
if cbPetFriendly.Checked=true then
sPF:='True'
else
sPF:='False';

IsNotExistId:=false;

while IsNotExistId=false do
begin
iListingid:=RandomRange(1000,10000);
IsNotExistId:=true;                                      ////////
dmtbllistings.tblListings.First;
while not dmtbllistings.tblListings.eof do
begin
if iListingid=dmtbllistings.tblListings['Listingid'] then
begin
IsNotExistId:=false;
end;
dmtbllistings.tblListings.Next;
end;


assignfile(myfile,'DeletedProperties.txt');
reset(myfile);
while not eof(myfile) do
 begin
 readln(myfile,sline);
 if strtoint(sline)=iListingid then
  IsNotExistId:=false;
 end;
 closefile(myfile);
end;





dmtbllistings.tblListings.Append;
dmtbllistings.tblListings['Listingid']:=iListingid;
dmtbllistings.tblListings['Listing Date']:= tnow;
dmtbllistings.tblListings['Price']:=edtPrice.Text ;
dmtbllistings.tblListings['Bedroom_Number']:=sedtBedroom.value ;
dmtbllistings.tblListings['Bathroom_Number']:= sedtBathroom.value;
dmtbllistings.tblListings['Parking_Number']:= sedtParking.Value;
dmtbllistings.tblListings['Area_Size']:=edtArea.Text ;
dmtbllistings.tblListings['Pool']:=sPool ;
dmtbllistings.tblListings['Pets']:= sPF;
dmtbllistings.tblListings['Agencyid']:=sAgencyid ;
dmtbllistings.tblListings['Suburbid']:=sSuburb ;
dmtbllistings.tblListings['Typeid']:= sRental;
dmtbllistings.tblListings.Post;



 for I := 0 to 2 do
 begin
 if i=0 then
 imgid:='a';
  if i=1 then
 imgid:='b';
  if i=2 then
 imgid:='c';
img1.Picture.LoadFromFile(Limgdir[i]);
 img1.Picture.SaveToFile('D:\Pat\images\'+inttostr(iListingid)+imgid+'.jpg');


 end;
 showmessage('Saved Successfully');

   end
   else
     showmessage('Price must be between 800000 and 16 Million');

  end  //
  else
  showmessage('Enter all Information');
end
else
  showmessage('Price and Area must be numbers');





end;

procedure TfrmAgencyPM.Button4Click(Sender: TObject);
var
sField,spool,spf:string;
begin
if edtEdit.text<>'' then
begin
sField:=dbgUsers.DataSource.DataSet.FieldByName('listingid').AsString;

if ComboBox1.Text='Price' then
begin
 DMtblListings.qryListings.SQL.Clear;
DMtblListings.qryListings.SQL.Add('update listings set Price="'+edtEdit.text+'" where listingid='+sfield);
DMtblListings.qryListings.ExecSQL;
end;

if ComboBox1.Text='Bedroom Number' then
begin
 DMtblListings.qryListings.SQL.Clear;
//DMtblListings.qryListings.SQL.Add('update listings set Bedroom Number= 5 where listingid=1187');
DMtblListings.qryListings.SQL.Add('update listings set Bedroom_Number="'+edtEdit.text+'" where listingid='+sfield);
DMtblListings.qryListings.ExecSQL;
end;

if ComboBox1.Text='Bathroom Number' then
begin
DMtblListings.qryListings.SQL.Clear;
DMtblListings.qryListings.sql.Add('update listings set Bathroom_Number="'+edtEdit.text+'" where listingid='+sfield);
DMtblListings.qryListings.ExecSQL;
end;

if ComboBox1.Text='Parking Number' then
begin
 DMtblListings.qryListings.SQL.Clear;
DMtblListings.qryListings.SQL.Add('update listings set Parking_Number="'+edtEdit.text+'" where listingid='+sfield);
DMtblListings.qryListings.ExecSQL;
end;

if ComboBox1.Text='Area' then
begin
 DMtblListings.qryListings.SQL.Clear;
DMtblListings.qryListings.SQL.Add('update listings set Area_Size="'+edtEdit.text+'" where listingid='+sfield);
DMtblListings.qryListings.ExecSQL;
end;

if ComboBox1.Text='Pool' then
begin
if (edtEdit.Text='True') or (edtEdit.Text='False')or (edtEdit.Text='true' )or (edtEdit.Text='false')then
begin
DMtblListings.qryListings.SQL.Clear;
DMtblListings.qryListings.SQL.Add('update listings set Pool=+'+edtEdit.Text+' where listingid='+sfield);
DMtblListings.qryListings.ExecSQL;
end
else
showmessage('Has to be True or False');
end;

if ComboBox1.Text='Pet Friendly' then
begin
if (edtEdit.Text='True') or (edtEdit.Text='False')or (edtEdit.Text='true' )or (edtEdit.Text='false')then
begin
DMtblListings.qryListings.SQL.Clear;
DMtblListings.qryListings.SQL.Add('update listings set Pets="'+edtEdit.text+'" where listingid='+sfield);
DMtblListings.qryListings.ExecSQL;
end
else
showmessage('Has to be True or False');
end;


DMtblListings.qryListings.SQL.Clear;
DMtblListings.qryListings.SQL.Add('select * from listings where agencyid ='+sAgencyid);
DMtblListings.qryListings.open;
  end
  else
    showmessage('Edit cannot be empty');
end;

procedure TfrmAgencyPM.Button5Click(Sender: TObject);
var
 i:integer;
begin
Limgdir:=Tstringlist.Create;
for I := 1 to 3 do
 begin
OpenPictureDialog1.Execute();
Limgdir.Add(OpenPictureDialog1.FileName);
 end;

Button3.Enabled:=true;
end;

procedure TfrmAgencyPM.FormShow(Sender: TObject);
begin
  DMtblListings.qryListings.SQL.Clear;

    DMtblListings.qryListings.SQL.Add('select * from listings where agencyid ='+sAgencyid);

 DMtblListings.qryListings.open;

 num:=1;                                      {}

 memwelc:=Tmemo.Create(frmAgencyPM);
memwelc.Parent:= frmAgencyPM;

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

procedure TfrmAgencyPM.Help1Click(Sender: TObject);
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
