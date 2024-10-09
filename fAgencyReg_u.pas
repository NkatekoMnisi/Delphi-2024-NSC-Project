unit fAgencyReg_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, jpeg, ExtCtrls;

type
  TfrmAgencyReg = class(TForm)
    UserloginPanel: TPanel;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    Memo1: TMemo;
    procedure Back1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgencyReg: TfrmAgencyReg;

implementation

uses fWelcomepage_u;

{$R *.dfm}

procedure TfrmAgencyReg.Back1Click(Sender: TObject);
begin
 frmWelcomePageForm.show;
 frmAgencyReg.Close;
end;

procedure TfrmAgencyReg.FormCreate(Sender: TObject);
begin
 Memo1.Lines.Add('Contact us to REGISTER');
 Memo1.Lines.Add('______________________');
 Memo1.Lines.Add('Email: Contact@NelspruitProperties.co.za');
  Memo1.Lines.Add('Phone: +27 56 872 5691');
   Memo1.Lines.Add('Website: NelspruitProperties.com');
end;

end.
