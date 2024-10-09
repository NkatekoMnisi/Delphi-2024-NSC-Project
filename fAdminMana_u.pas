unit fAdminMana_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Grids, DBGrids,DMAdmins,oUserLogin_u, Menus;

type
  TfrmAdminMana = class(TForm)
    pnlUserManagement: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Button3: TButton;
    edtAName: TEdit;
    edtASurName: TEdit;
    GroupBox3: TGroupBox;
    edtEdit: TEdit;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label1: TLabel;
    dbgAdmins: TDBGrid;
    btnEdit: TButton;
    Button5: TButton;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    Help1: TMenuItem;

    procedure Button3Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Back1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminMana: TfrmAdminMana;
   objUserLogin:UsersLoginInfo;
     memWelc:Tmemo;    {}
  num:integer;
implementation

uses fAdminMainS_u;

{$R *.dfm}

procedure TfrmAdminMana.Back1Click(Sender: TObject);
begin
  frmAdminMana.Close;
 frmAdminMainS.show;
end;

procedure TfrmAdminMana.btnEditClick(Sender: TObject);
var
sField:string;
begin
if edtEdit.text<>'' then
  begin
sField:=dbgAdmins.DataSource.DataSet.FieldByName('Adminid').AsString;

if ComboBox1.Text='Admin Name' then
 begin
DMtblAdmins.qryAdmins.SQL.Clear;
DMtblAdmins.qryAdmins.SQL.Add('update Administators set AdminName="'+edtEdit.text+'" where Adminid ='+sfield);
DMtblAdmins.qryAdmins.ExecSQL;
 end;
 if ComboBox1.Text='Admin SurName' then
 begin
DMtblAdmins.qryAdmins.SQL.Clear;
DMtblAdmins.qryAdmins.SQL.Add('update Administators set AdminSurname="'+edtEdit.text+'" where Adminid='+sfield);
DMtblAdmins.qryAdmins.ExecSQL;
end;


  end
  else
   showmessage('Edit cannot be empty');
 DMtblAdmins.qryAdmins.SQL.Clear;
DMtblAdmins.qryAdmins.SQL.Add('select * from Administators');
DMtblAdmins.qryAdmins.Open;

end;

procedure TfrmAdminMana.Button2Click(Sender: TObject);
begin
 DMtblAdmins.DSAdmins.DataSet.Delete;
end;

procedure TfrmAdminMana.Button3Click(Sender: TObject);
var
sField,corName,corSName:string;
now:tdate;
begin
if (edtAName.text<>'') or (edtASurName.text<>'') then
 begin
 objUserLogin:=UsersLoginInfo.create(edtAName.text,edtASurName.text,'null');
  objUserLogin.setCorrectName;
   objUserLogin.setCorrectSurname;

if  (objUserLogin.getCorrectUN=True) and  (objUserLogin.getCorrectUSN=true)then
begin
corName:=uppercase(edtAName.text[1])+lowercase(copy(edtAName.text,2,length(edtAName.text)));
corSName:=uppercase(edtASurName.text[1])+lowercase(copy(edtASurName.text,2,length(edtASurName.text)));
 now:=now;

DMtblAdmins.qryAdmins.SQL.Clear;
DMtblAdmins.qryAdmins.SQL.Add('insert into Administators (AdminName,AdminSurname,YearOfEmployment) values ("'+corName+'","'+corSName+'", now  )' );            //YearOfEmployment
//'update users set UserSurname="'+edtEdit.text+'" where userid='+sfield
DMtblAdmins.qryAdmins.ExecSQL;

DMtblAdmins.qryAdmins.SQL.Clear;
DMtblAdmins.qryAdmins.SQL.Add('select * from Administators');
DMtblAdmins.qryAdmins.Open;
end
else
begin
 if objUserLogin.getCorrectUN=false then
begin
showmessage('Name should not contain numbers ,special characters or spaces');
edtAName.Color:=clred;
end
else
edtAName.Color:=clgreen;
if objUserLogin.getCorrectUSN=false then
begin
showmessage('Surname should not contain numbers,special characters  or spaces');
edtASurName.Color:=clred;
end
else
edtASurName.Color:=clgreen;
end;
 end
 else
 showmessage('Surname or name cannot be empty')

 end;
procedure TfrmAdminMana.FormShow(Sender: TObject);
begin
num:=1;                                      {}

 memwelc:=Tmemo.Create(frmAdminMana);
memwelc.Parent:= frmAdminMana;

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

procedure TfrmAdminMana.Help1Click(Sender: TObject);
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
