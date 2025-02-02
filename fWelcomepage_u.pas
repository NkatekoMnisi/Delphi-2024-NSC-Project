unit fWelcomepage_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, jpeg, StdCtrls,oUserLogin_u, DB, ADODB,fMainUserForm_u,DMUsers;

type
  TfrmWelcomePageForm = class(TForm)
    pnlWelcome: TPanel;
    imgLogo: TImage;
    Label1: TLabel;
    pnlBuy: TPanel;
    pnlRent: TPanel;
    pnlSell: TPanel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Login1: TMenuItem;
    Login2: TMenuItem;
    Admin1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    imgBuy: TImage;
    imgrent: TImage;
    imgSell: TImage; {}
    Label5: TLabel;
    Label6: TLabel;
    btnCon2: TButton;
    btncon3: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Help2: TMenuItem;
    Agency1: TMenuItem;
    Login4: TMenuItem;
    Register3: TMenuItem;
    btncont1: TButton;
    procedure Login2Click(Sender: TObject);
    procedure btncont1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCon2Click(Sender: TObject);
    procedure Admin1Click(Sender: TObject);
    procedure btncon3Click(Sender: TObject);
    procedure Login4Click(Sender: TObject);
    procedure Register3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWelcomePageForm: TfrmWelcomePageForm;
  memWelc:Tmemo;    {}
  num:integer;
   sUID:string;
implementation

uses fUserloginpage_u, fAdminLogin_u, fAdminUM_u, fAdminMainS_u, fAgencyLogin_u,
  fAgencyReg_u, fAgencyUpdate_u;



{$R *.dfm}

procedure TfrmWelcomePageForm.Admin1Click(Sender: TObject);
begin
frmAdmin.show;
end;

procedure TfrmWelcomePageForm.btnCon2Click(Sender: TObject);
var
myfile:textfile;
begin
  assignfile(myfile,'BOR.txt');                 //Writes 'RENT' on textfile BOR
 rewrite(myfile);
 writeln(myfile,'RENT');
 closefile(myfile);
 MainUserForm.show;

end;

procedure TfrmWelcomePageForm.btncon3Click(Sender: TObject);
begin
frmAgencyLogin.show;
end;

procedure TfrmWelcomePageForm.btncont1Click(Sender: TObject);
var
myfile:textfile;
begin
  assignfile(myfile,'BOR.txt');                 //Writes 'BUY' on textfile BOR
 rewrite(myfile);
 writeln(myfile,'BUY');
 closefile(myfile);

 MainUserForm.show;


end;

procedure TfrmWelcomePageForm.Button1Click(Sender: TObject);
begin
memWelc.Show;
end;

procedure TfrmWelcomePageForm.Button2Click(Sender: TObject);
begin
frmAgencyUpt.Show;
end;

procedure TfrmWelcomePageForm.FormCreate(Sender: TObject);
var
myfile:textfile;
begin
assignfile(myfile,'CurrentUser.txt');
 rewrite(myfile);
 writeln(myfile,'NULL');
 closefile(myfile);
 sUID:='0';
 num:=1;                                      {}

 memwelc:=Tmemo.Create(frmWelcomePageForm);
memwelc.Parent:= frmWelcomePageForm;

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

procedure TfrmWelcomePageForm.Help2Click(Sender: TObject);
begin                {}
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

procedure TfrmWelcomePageForm.Login2Click(Sender: TObject);
begin
  LoginForm.show;
 frmWelcomePageForm.Hide;
end;

procedure TfrmWelcomePageForm.Login4Click(Sender: TObject);
begin
frmAgencyLogin.show;
end;

procedure TfrmWelcomePageForm.Register3Click(Sender: TObject);
begin
frmAgencyReg.show;
end;

end.
