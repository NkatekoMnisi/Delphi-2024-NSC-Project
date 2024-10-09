unit fAdminUM_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DMUsers, Grids, DBGrids, jpeg, ExtCtrls, Menus, StdCtrls;

type
  TfrmAdminUM = class(TForm)
    pnlUserManagement: TPanel;
    Image1: TImage;
    dbgUsers: TDBGrid;
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    GroupBox1: TGroupBox;
    cmbSort: TComboBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Button3: TButton;
    edtSearch: TEdit;
    GroupBox3: TGroupBox;
    Button4: TButton;
    edtEdit: TEdit;
    ComboBox1: TComboBox;
    Help1: TMenuItem;
    procedure Back1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminUM: TfrmAdminUM;
  memWelc:Tmemo;    {}
  num:integer;
implementation

uses fAdminMainS_u;

{$R *.dfm}

procedure TfrmAdminUM.Back1Click(Sender: TObject);
begin
frmAdminMainS.show;
frmAdminUM.Close;
end;

procedure TfrmAdminUM.Button1Click(Sender: TObject);
begin
if cmbSort.Text='Names' then
begin
 DMtblUsers.ADOQUsers.SQL.Clear;
DMtblUsers.ADOQUsers.SQL.Add('select * from users order by UserName desc');
DMtblUsers.ADOQUsers.open;
end
else
begin
 DMtblUsers.ADOQUsers.SQL.Clear;
DMtblUsers.ADOQUsers.SQL.Add('select * from users order by UserSurname desc');
DMtblUsers.ADOQUsers.open;
end;

end;

procedure TfrmAdminUM.Button2Click(Sender: TObject);
begin
DMtblUsers.DSUsers.DataSet.Delete;

end;

procedure TfrmAdminUM.Button3Click(Sender: TObject);
begin

 DMtblUsers.ADOQUsers.SQL.Clear;
DMtblUsers.ADOQUsers.SQL.Add('select * from users where UserName like "%'+edtSearch.Text+'%" ');
DMtblUsers.ADOQUsers.open;
end;

procedure TfrmAdminUM.Button4Click(Sender: TObject);
var
sField:string;
begin
if edtEdit.text<>'' then
  begin
sField:=dbgUsers.DataSource.DataSet.FieldByName('userid').AsString;


if ComboBox1.Text='Name' then
begin
 DMtblUsers.ADOQUsers.SQL.Clear;
DMtblUsers.ADOQUsers.SQL.Add('update users set UserName="'+edtEdit.text+'" where userid='+sfield);
DMtblUsers.ADOQUsers.ExecSQL;
end;

if ComboBox1.Text='Surname' then
begin
 DMtblUsers.ADOQUsers.SQL.Clear;
DMtblUsers.ADOQUsers.SQL.Add('update users set UserSurname="'+edtEdit.text+'" where userid='+sfield);
DMtblUsers.ADOQUsers.ExecSQL;
end;

if ComboBox1.Text='Password' then
begin
 DMtblUsers.ADOQUsers.SQL.Clear;
DMtblUsers.ADOQUsers.SQL.Add('update users set Password="'+edtEdit.text+'" where userid='+sfield);
DMtblUsers.ADOQUsers.ExecSQL;
end;

DMtblUsers.ADOQUsers.SQL.Clear;
DMtblUsers.ADOQUsers.SQL.Add('select * from users ');
DMtblUsers.ADOQUsers.open;
  end
  else
    showmessage('Edit cannot be empty');
end;

procedure TfrmAdminUM.Button5Click(Sender: TObject);
begin
 DMtblUsers.ADOQUsers.SQL.Clear;
DMtblUsers.ADOQUsers.SQL.Add('select * from users ');
DMtblUsers.ADOQUsers.open;
end;

procedure TfrmAdminUM.FormShow(Sender: TObject);
begin
 DMtblUsers.ADOQUsers.SQL.Clear;
DMtblUsers.ADOQUsers.SQL.Add('select * from users ');
DMtblUsers.ADOQUsers.open;

num:=1;                                      {}

 memwelc:=Tmemo.Create(frmAdminUM);
memwelc.Parent:= frmAdminUM;

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

procedure TfrmAdminUM.Help1Click(Sender: TObject);
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
