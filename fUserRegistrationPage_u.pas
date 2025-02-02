unit fUserRegistrationPage_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Menus, DB, ADODB,DMUsers,fMainUserForm_u,math,DMAdmins,fWelcomepage_u;

type
  TRegisterForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    edtName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtSName: TEdit;
    edtCN: TEdit;
    edtEmail: TEdit;
    edtPass: TEdit;
    btnEnter: TButton;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    Help1: TMenuItem;
    procedure btnEnterClick(Sender: TObject);
    procedure edtCNChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Back1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterForm: TRegisterForm;
 myfile2:textfile;
   memWelc:Tmemo;    {}
  num:integer;
implementation



{$R *.dfm}

procedure TRegisterForm.Back1Click(Sender: TObject);
begin
frmWelcomePageForm.show;
RegisterForm.Close;
end;

procedure TRegisterForm.btnEnterClick(Sender: TObject);
var
sName,sSName,sCN,sEmail,sPass,sUTF:string;
IsCorName,IsCorSName,IsCorCN,IsNotExistId:boolean;
i,iUserid:integer;
myfile:textfile;
begin
sName:=edtName.text;
sSName:=edtSName.text;
sCN:=edtCN.text;
sEmail:=edtEmail.text;
sPass:=edtPass.text;

IsCorName:=True;
IsCorSName:=True;
IsCorCN:=True;


for I := 1 to length(sName) do
begin
if (sName[i] in ['0'..'9']) or (sName[i]=' ')  then
 begin
IsCorName:=false;
 end;
end;

for I := 1 to length(sSName) do
begin
if (sSName[i] in ['0'..'9']) or (sSName[i]=' ')  then
 begin
IsCorSName:=false;
 end;
end;

for I := 1 to length(sCN) do
begin
if (sCN[i] in ['a'..'z']) or (sCN[i] in ['A'..'Z'])  then
 begin
IsCorCN:=false;
 end;
end;

 if length(sCN)<>15 then
  IsCorCN:=false;
if (IsCorName=true) and (IsCorSName=true) and (IsCorCN=true) then
begin
 IsNotExistId:=false;

while IsNotExistId=false do
begin
iUserid:=RandomRange(10000,20000);
IsNotExistId:=true;
DMtblUsers.adotblUsers.First;
while not DMtblUsers.adotblUsers.eof do
begin
if iUserid=DMtblUsers.adotblUsers['Userid'] then
begin
IsNotExistId:=false;
end;
DMtblUsers.adotblUsers.Next;
end;
end;
sUID:=inttostr(iuserid);
sUTF:='u'+inttostr(iuserid)+'.txt';
 assignfile(myfile,sUTF);
 rewrite(myfile);
 writeln(myfile,datetostr(now));
 closefile(myfile);

  assignfile(myfile2,'CurrentUser.txt');
 rewrite(myfile2);
 writeln(myfile2,inttostr(iuserid));
 closefile(myfile2);

DMtblUsers.adotblUsers.Append;
DMtblUsers.adotblUsers['Userid']:=iUserid;
DMtblUsers.adotblUsers['UserName']:=uppercase(sName[1])+lowercase(copy(sName,2,length(sName)));
DMtblUsers.adotblUsers['UserSurname']:=uppercase(sSName[1])+lowercase(copy(sSName,2,length(sSName)));
DMtblUsers.adotblUsers['SavedCriteria']:='sb(*)ty(*)pr(*)bd(*)bt(*)';
DMtblUsers.adotblUsers['ContactNumber']:=sCN;
DMtblUsers.adotblUsers['EmailAddress']:=sEmail;
DMtblUsers.adotblUsers['Password']:=sPass;
DMtblUsers.adotblUsers.Post;
MainUserForm.Show;


end
else
begin
if (IsCorName=False) then
begin
edtName.color:=clred;
showmessage('Name should not contain numbers or spaces');
end
else
edtName.color:=clWindow;

if (IsCorSName=False) then
begin
edtSName.color:=clred;
showmessage('Surname should not contain numbers or spaces');
end
else
edtSName.color:=clWindow;

if (IsCorCN=False) then
showmessage('Cell Number should be 15 characters long and contain no letters');
end;


end;



procedure TRegisterForm.edtCNChange(Sender: TObject);
var
d:string;
begin
if (length(edtCN.Text)=6) or (length(edtCN.Text)=10) then
  begin
 d:= edtCN.text;
   edtCN.text:=d+' ';
  edtCN.selstart:=length(edtCN.Text);
  edtCN.SelLength:=0;
  end;

if length(edtCN.Text)>15 then
  begin
  edtCN.Color:=clred;
  end
  else
  edtCN.Color:=clWindow;
end;

procedure TRegisterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 assignfile(myfile2,'CurrentUser.txt');
 rewrite(myfile2);
 writeln(myfile2,'NULL');
 closefile(myfile2);
end;

procedure TRegisterForm.FormCreate(Sender: TObject);
begin
edtCN.Text:='+27 ';
end;

procedure TRegisterForm.FormShow(Sender: TObject);
begin
 num:=1;                                      {}

 memwelc:=Tmemo.Create(RegisterForm);
memwelc.Parent:=RegisterForm;

memwelc.Left:=180;
memwelc.Top:=100;
memwelc.Width:=500;
memwelc.Height:=300;

memwelc.Lines.Add('>Name must not contain spaces ,numbers or special characters');
memwelc.Lines.Add('>Surname must not contain spaces ,numbers or special characters');
memwelc.Lines.Add('>Number should be in the following format: +27 00 000 0000');
memwelc.Lines.Add('>Click Enter>To Register');

memwelc.Hide;             {}
end;

procedure TRegisterForm.Help1Click(Sender: TObject);
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

end
.
