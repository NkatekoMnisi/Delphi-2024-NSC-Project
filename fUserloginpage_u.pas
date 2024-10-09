unit fUserloginpage_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, jpeg, StdCtrls,oUserLogin_u, DB, ADODB,fMainUserForm_u,DMUsers;

type
  TLoginForm = class(TForm)
    UserloginPanel: TPanel;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    Help1: TMenuItem;
    btnEnter: TButton;
    edtName: TEdit;
    Image1: TImage;
    Panel1: TPanel;
    lblName: TLabel;
    lblSName: TLabel;
    lblPass: TLabel;
    edtSName: TEdit;
    edtPass: TEdit;
    BtnClear: TButton;
    Label4: TLabel;
    cbSH: TCheckBox;
    procedure Label4Click(Sender: TObject);
    procedure cbSHClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  LoginForm: TLoginForm;
   objUserLogin:UsersLoginInfo;
   myfile2:textfile;
    memWelc:Tmemo;    {}
  num:integer;
implementation

uses fUserRegistrationPage_u, fWelcomepage_u;


{$R *.dfm}

procedure TLoginForm.Back1Click(Sender: TObject);
begin
frmWelcomePageForm.show;
LoginForm.Close;
end;

procedure TLoginForm.BtnClearClick(Sender: TObject);
begin
edtName.Clear;
edtSName.Clear;
edtPass.Clear;
end;

procedure TLoginForm.btnEnterClick(Sender: TObject);
var
corName,corSName,sUserid,sUTF:string;
bUserfound:boolean;
myfile:textfile;
sDusern,sDusersn,sDpass:string;
begin
if (edtName.text<>'') or (edtSName.text<>'') or (edtPass.text<>'')then
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

DMtblUsers.adotblUsers.First;
while not DMtblUsers.adotblUsers.eof do
begin
sDusern:=DMtblUsers.adotblUsers['Username'];
sDusersn:=DMtblUsers.adotblUsers['Usersurname'];
sDpass:=DMtblUsers.adotblUsers['Password'];
if (sDusern=corName) and (sDusersn=corSName) and (sDpass=edtPass.text)  then
begin
bUserfound:=true;
suserid:=DMtblUsers.adotblUsers['Userid'];
sUID:=DMtblUsers.adotblUsers['Userid'];
end;
DMtblUsers.adotblUsers.Next;
end;


if bUserfound=True then
begin
sUTF:='u'+suserid+'.txt';
 assignfile(myfile,sUTF);
 rewrite(myfile);
 writeln(myfile,datetostr(now));
 closefile(myfile);

  assignfile(myfile2,'CurrentUser.txt');
 rewrite(myfile2);
 writeln(myfile2,suserid);
 closefile(myfile2);
MainUserForm.show;
LoginForm.Close;

end
else
begin
showmessage('No users with matching details found');
end;
         //Sibusiso  Mkhwanazi S1buMkhw@

end
else
begin
if objUserLogin.getCorrectUN=false then
begin
showmessage('Name should not contain numbers ,special characters or spaces');
edtName.Color:=clred;
end
else
edtName.Color:=clgreen;
if objUserLogin.getCorrectUSN=false then
begin
showmessage('Surname should not contain numbers,special characters  or spaces');
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
 showmessage('Enter al info');

end;

procedure TLoginForm.cbSHClick(Sender: TObject);
begin
if  cbSH.Checked=true then
edtPass.PasswordChar:=#0;
if  cbSH.Checked=false then
edtPass.PasswordChar:='*';
end;

procedure TLoginForm.FormCreate(Sender: TObject);
var
myfile:textfile;
begin
 assignfile(myfile,'CurrentUser.txt');
 rewrite(myfile);
 writeln(myfile,'NULL');
 closefile(myfile);
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
 num:=1;                                      {}

 memwelc:=Tmemo.Create(LoginForm);
memwelc.Parent:=LoginForm;

memwelc.Left:=180;
memwelc.Top:=100;
memwelc.Width:=500;
memwelc.Height:=300;

memwelc.Lines.Add('>Name must not contain spaces ,numbers or special characters');
memwelc.Lines.Add('>Surname must not contain spaces ,numbers or special characters');
memwelc.Lines.Add('>Click Enter>To Register');
memwelc.Lines.Add('>Click Show>To See your password');
memwelc.Hide;             {}
end;

procedure TLoginForm.Help1Click(Sender: TObject);
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

procedure TLoginForm.Label4Click(Sender: TObject);
begin
 RegisterForm.show;
end;

end.
