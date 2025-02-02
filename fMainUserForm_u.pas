unit fMainUserForm_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, jpeg, Buttons,DMListings,DMUsers;

type
  TMainUserForm = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    MMNoti: TMenuItem;
    help2: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    cmbSuburb: TComboBox;
    cmbParkNum: TComboBox;
    cmbBedNum: TComboBox;
    cmbBathNum: TComboBox;
    cmbMinP: TComboBox;
    GroupBox1: TGroupBox;
    cmbMaxP: TComboBox;
    cbPool: TCheckBox;
    cbPF: TCheckBox;
    Button1: TButton;
    BitBtn1: TBitBtn;
    cbSI: TCheckBox;
    GroupBox2: TGroupBox;
    cmbMinA: TComboBox;
    cmbMaxA: TComboBox;
    cbRental: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure help2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Home1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainUserForm: TMainUserForm;
     memprefernces:Tmemo;
     iMINP,iMaxP,iMINA,iMaxA:integer;
     sPool,sPF:string;
     sSuburb,sBedNum,sBathNum,sType,sParkNum:string;
       memWelc:Tmemo;    {}
  num:integer;
implementation

uses fUserSS_u, fWelcomepage_u, DMAgencies;

{$R *.dfm}

procedure TMainUserForm.Button1Click(Sender: TObject);
var
sMINP,sMaxP,sMINA,sMaxA,sSC:string;
sSaveT ,sSaveP:string;
IsSave:boolean;
myfile:textfile;
begin

if (cbRental.Checked=true) and cbRental.Enabled=true then
 sType:='Rental';
if (cbRental.Checked=false) and cbRental.Enabled=true then
 sType:='House';
 if cbPool.Checked=true then
 sPool:='True'
 else
 sPool:='False';
 if cbPF.Checked=true then
 sPF:='True'
 else
 sPF:='False';
 if cbSI.Checked=true then
 IsSave:=true;

 if cmbSuburb.Text<>'Suburb' then
 sSuburb:=cmbSuburb.Text
 else
 sSuburb:='*';

  if cmbBedNum.Text<>'Bedroom number' then
 sBedNum:=cmbBedNum.Text
 else
 sBedNum:='*';

 if cmbBathNum.Text<>'Bathroom number' then
 sBathNum:=cmbBathNum.Text
 else
 sBathNum:='*';

 if cmbParkNum.Text<>'Parking number' then
  sParkNum:=cmbParkNum.Text
 else
  sParkNum:='*';

 if cmbMinP.Text<>'Min' then   {start }
 sMINP:=cmbMinP.Text
 else
 sMINP:='*';
 if cmbMaxP.Text<>'Max' then
 sMaxP:=cmbMaxP.Text
 else
 sMaxP:='*';

  if cmbMinA.Text<>'Min' then
 sMINA:=cmbMinA.Text
 else
 sMINA:='*';
 if cmbMaxA.Text<>'Max' then
 sMaxA:=cmbMaxA.Text
 else
 sMaxA:='*';                     {end }

 if sMINP<>'*' then        {start }
 iMINP:=strtoint(sMINP)
 else
 iMINP:=800000;
 if sMaxP<>'*' then
 iMaxP:=strtoint(sMaxP)
 else
 iMaxP:=16000000;

  if sMINA<>'*' then
 iMINA:=strtoint(sMINA)
 else
 iMINA:=400;
 if sMaxA<>'*' then
 iMaxA:=strtoint(sMaxA)
 else
 iMaxA:=2000;              {end}

 if iMINP>iMaxP then
iMaxP:=iMinP+1000000;
if iMINA>iMaxA then
iMaxA:=iMinA+100;

assignfile(myfile,'CurrentSearch.txt');
 rewrite(myfile);
 writeln(myfile,sType+'/'+sSuburb+'/'+sBedNum+'/'+sBathNum+'/'+sParkNum+'/'+sPool+'/'+sPF+'/'+inttostr(iMINP)+'-'+inttostr(iMaxP)+'/'+inttostr(iMINA)+'-'+inttostr(iMaxA));
 closefile(myfile);

if sType='Rental' then
sSaveT:='R'
else
sSaveT:='H';
sSaveP:=inttostr(iMINP)+'-'+inttostr(iMaxP);


 if sUID<>'0' then
 begin
 sSC:='sb('+sSuburb+')ty('+sSaveT+')pr('+sSaveP+')bd('+sBedNum+')bt('+sBathNum+')';
 DMtblusers.ADOQUsers.SQL.Clear;
DMtblusers.ADOQUsers.SQL.Add('update users set SavedCriteria="'+ sSC+'" where userid='+sUID);
DMtblusers.ADOQUsers.ExecSQL;
 end;

frmUserSS.show;
MainUserForm.Close;


end;

procedure TMainUserForm.FormCreate(Sender: TObject);

begin
Label1.Font.Color:=clMenuHighlight;




end;

procedure TMainUserForm.FormShow(Sender: TObject);
var
myfile:textfile;
sLine:string;
begin
num:=1;                                      {}

 memwelc:=Tmemo.Create(MainUserForm);
memwelc.Parent:=MainUserForm;

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


Label1.Font.Color:=clMenuHighlight;

assignfile(myfile,'CurrentUser.txt');
reset(myfile);
readln(myfile,sline);
closefile(myfile);

if sline='NULL' then
begin
MMNoti.Enabled:=false
end
else
begin
cbSI.Visible:=true;
cbSI.Enabled:=true;
cbRental.Enabled:=True;
cbRental.Visible:=True;
MMNoti.Enabled:=True;
end;

assignfile(myfile,'BOR.txt');
reset(myfile);
readln(myfile,sline);
closefile(myfile);

if sline='RENT' then
begin
Label1.Caption:='Rent Your Dream Property';
sType:='Rental';
end
else
begin
Label1.Caption:='Buy Your Dream Property';
sType:='House';
end;

  assignfile(myfile,'CurrentSearch.txt');
 rewrite(myfile);
 writeln(myfile,'NULL');
 closefile(myfile);
end;

procedure TMainUserForm.help2Click(Sender: TObject);
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

procedure TMainUserForm.Home1Click(Sender: TObject);
begin
frmWelcomePageForm.show;
MainUserForm.Close;
end;

end.
