unit fAgencyLogin_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, jpeg, ExtCtrls, Menus,DMAgencies,oUserLogin_u;

type
  TfrmAgencyLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    edtName: TEdit;
    edtSID: TEdit;
    btnEnter: TButton;
    BitBtn1: TBitBtn;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    help1: TMenuItem;
    procedure Back1Click(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure help1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgencyLogin: TfrmAgencyLogin;
  sAgency,sAgencyid:string;
   objUserLogin:UsersLoginInfo;
     memWelc:Tmemo;    {}
  num:integer;
implementation

uses fWelcomepage_u, fAgencyMain_u, DMUsers;

{$R *.dfm}

procedure TfrmAgencyLogin.Back1Click(Sender: TObject);
begin
 frmWelcomePageForm.show;
 frmAgencyLogin.Close;
end;

procedure TfrmAgencyLogin.BitBtn1Click(Sender: TObject);
begin
 edtName.Clear;
 edtSID.Clear;
end;

procedure TfrmAgencyLogin.btnEnterClick(Sender: TObject);
var
corName:string;
bUserfound:boolean;

begin

 edtName.Color:=clWindow;
bUserfound:=false;
if (edtName.text<>'') or (edtSID.text<>'')then
 begin   //

 objUserLogin:=UsersLoginInfo.create(edtName.text,'null','null');
 objUserLogin.setCorrectName;

if (objUserLogin.getCorrectUN=True) then
 begin          ///
corName:=uppercase(edtName.text[1])+lowercase(copy(edtName.text,2,length(edtName.text)));


DMtblAgencies.adotblAgencies.First;
while not DMtblAgencies.adotblAgencies.eof do
begin
if (DMtblAgencies.adotblAgencies['AgencyName']=corName) and (DMtblAgencies.adotblAgencies['Agencyid']=edtSID.text)   then
begin
bUserfound:=true;
sAgency:=DMtblAgencies.adotblAgencies['AgencyName'];
sAgencyid:=DMtblAgencies.adotblAgencies['Agencyid'];
end;
DMtblAgencies.adotblAgencies.Next;
end;


if bUserfound=True then
begin
 frmAgencyMain.show;
  frmAgencyLogin.Close;
end
else
showmessage('Agency not found')

end
else///
 begin
 edtName.Color:=clred;
   showmessage('Name must not contain numbers,spaces or special characters');
 end;

 end  //
 else
 showmessage('Enter name and surname');

end;

procedure TfrmAgencyLogin.FormShow(Sender: TObject);
begin
 num:=1;                                      {}

 memwelc:=Tmemo.Create(frmAgencyLogin);
memwelc.Parent:=frmAgencyLogin;

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

procedure TfrmAgencyLogin.help1Click(Sender: TObject);
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
