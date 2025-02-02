unit fAdminLogin_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, jpeg,fWelcomepage_u,oUserLogin_u,DMAdmins;

type
  TfrmAdmin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtName: TEdit;
    edtSName: TEdit;
    Label3: TLabel;
    edtPass: TEdit;
    btnEnter: TButton;
    BtnClear: TButton;
    cbSH: TCheckBox;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    Help1: TMenuItem;
    procedure btnEnterClick(Sender: TObject);
    procedure Back1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;
   objUserLogin:UsersLoginInfo;
     memWelc:Tmemo;    {}
  num:integer;
implementation

uses fMainUserForm_u, DMUsers, fAdminMainS_u;

{$R *.dfm}

procedure TfrmAdmin.Back1Click(Sender: TObject);
begin
frmWelcomePageForm.show;
end;

procedure TfrmAdmin.BtnClearClick(Sender: TObject);
begin
edtSName.Clear;
edtPass.Clear;
edtName.Clear;
end;

procedure TfrmAdmin.btnEnterClick(Sender: TObject);
var
corName,corSName,sUserid,sUTF:string;
bUserfound:boolean;
begin
if (edtName.Text<>'') or (edtSName.text<>'') or (edtPass.text<>'')then
 begin
bUserfound:=false;
 objUserLogin:=UsersLoginInfo.create(edtName.text,edtSName.text,edtPass.text);
  objUserLogin.setCorrectName;
   objUserLogin.setCorrectSurname;
    objUserLogin.setCorrectPass;

if  (objUserLogin.getCorrectUN=True) and  (objUserLogin.getCorrectUSN=true) and  (objUserLogin.getCorrectUP=true)then
begin
corName:=uppercase(edtName.text[1])+lowercase(copy(edtName.text,2,length(edtName.text)));
corSName:=uppercase(edtSName.text[1])+lowercase(copy(edtSName.text,2,length(edtSName.text)));
DMtblAdmins.tblAdmins.First;
while not DMtblAdmins.tblAdmins.eof do
begin
if (DMtblAdmins.tblAdmins['AdminName']=corName) and (DMtblAdmins.tblAdmins['AdminSurname']=corSName) and ('ITPAT'=edtPass.text)  then
begin
bUserfound:=true;
end;
DMtblAdmins.tblAdmins.Next;
end;


if bUserfound=True then
begin
frmAdminMainS.show;
end
else
begin
showmessage('No users with matching details found');
end;
         //Thandiwe Nkosi

end
else
begin
if objUserLogin.getCorrectUN=false then
begin
showmessage('Name should not contain numbers,special characters or spaces');
edtName.Color:=clred;
end
else
edtName.Color:=clgreen;
if objUserLogin.getCorrectUSN=false then
begin
showmessage('Surname should not contain numbers,special characters or spaces');
edtSName.Color:=clred;
end
else
edtSName.Color:=clgreen;
if objUserLogin.getCorrectUP=false then
begin
showmessage('Password should not contain spaces');
edtPass.Color:=clred;
end
else
edtPass.Color:=clgreen;
end;
 end
 else
 showmessage('Enter all information');

end;

procedure TfrmAdmin.FormShow(Sender: TObject);
begin
num:=1;                                      {}

 memwelc:=Tmemo.Create(frmAdmin);
memwelc.Parent:= frmAdmin;

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

procedure TfrmAdmin.Help1Click(Sender: TObject);
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
