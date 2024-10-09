unit fAdminMainS_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, jpeg, ExtCtrls,fAdminMana_u;

type
  TfrmAdminMainS = class(TForm)
    UserloginPanel: TPanel;
    Image1: TImage;
    btnEnter: TButton;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    MainMenu2: TMainMenu;
    Image2: TImage;
    procedure Home1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminMainS: TfrmAdminMainS;
  img:Tbitmap;
implementation

uses fAdminSS_u, fAdminAM_u, fAdminUM_u;

{$R *.dfm}

procedure TfrmAdminMainS.btnEnterClick(Sender: TObject);
begin
frmAdminSS.show;
end;

procedure TfrmAdminMainS.Button1Click(Sender: TObject);
begin
frmAdminAM.show;
end;

procedure TfrmAdminMainS.Button2Click(Sender: TObject);
begin
frmAdminUM.show;
end;

procedure TfrmAdminMainS.Button3Click(Sender: TObject);
begin
frmAdminMana.Show;
end;

procedure TfrmAdminMainS.Home1Click(Sender: TObject);
begin
frmAdminMainS.Show;
end;

end.
