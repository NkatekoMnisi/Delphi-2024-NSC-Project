unit fAdminSS_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls,DMAdmins,DMListings,DMUsers,DMAgencies,
  Menus;

type
  TfrmAdminSS = class(TForm)
    pnlUserManagement: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    edtEdit: TEdit;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    GroupBox4: TGroupBox;
    Edit3: TEdit;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Back1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminSS: TfrmAdminSS;

implementation

uses fAdminMainS_u;

{$R *.dfm}

procedure TfrmAdminSS.Back1Click(Sender: TObject);
begin
 frmAdminSS.Close;
 frmAdminMainS.show;
end;

procedure TfrmAdminSS.FormShow(Sender: TObject);
var
count:integer;
begin

count:=DMtblusers.adotblUsers.RecordCount;
edtEdit.Text:=inttostr(count);
count:=DMtblAdmins.tblAdmins.RecordCount;
Edit1.Text:=inttostr(count);
count:=DMtblAgencies.adotblAgencies.RecordCount;
Edit2.Text:=inttostr(count);
count:=DMtbllistings.tbllistings.RecordCount;
Edit3.Text:=inttostr(count);
end;

end.
