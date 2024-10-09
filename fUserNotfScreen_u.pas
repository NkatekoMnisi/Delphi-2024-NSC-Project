unit fUserNotfScreen_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,fMainUserForm_u,fWelcomepage_u;

type
  TfrmUserNotf = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserNotf: TfrmUserNotf;

implementation

{$R *.dfm}

procedure TfrmUserNotf.FormShow(Sender: TObject);
var
sSb,sTy,sPr,sDd,sBt:string;
begin
    //'sb('+sSuburb+')ty('+sSaveT+')pr('+sSaveP+')bd('+sBedNum+')bt('+sBathNum+')'


end;

end.
