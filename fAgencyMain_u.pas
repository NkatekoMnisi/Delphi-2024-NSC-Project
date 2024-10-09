unit fAgencyMain_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, jpeg, ExtCtrls,fAgencyLogin_u;

type
  TfrmAgencyMain = class(TForm)
    UserloginPanel: TPanel;
    Image1: TImage;
    btnEnter: TButton;
    Button1: TButton;
    Button2: TButton;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgencyMain: TfrmAgencyMain;

implementation

uses fAgencyPS_u, fAgencyPM_u, fAgencyUpdate_u;

{$R *.dfm}

procedure TfrmAgencyMain.btnEnterClick(Sender: TObject);
begin
frmAgencyPS.show;
frmAgencyMain.hide;

end;

procedure TfrmAgencyMain.Button1Click(Sender: TObject);
begin
 frmAgencyPM.show;
 frmAgencyMain.hide;
end;

procedure TfrmAgencyMain.Button2Click(Sender: TObject);
begin
frmAgencyUpt.show;
frmAgencyMain.Hide;
end;

end.
