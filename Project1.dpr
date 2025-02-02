program Project1;

uses
  Forms,
  fWelcomepage_u in 'fWelcomepage_u.pas' {frmWelcomePageForm},
  fUserloginpage_u in 'fUserloginpage_u.pas' {LoginForm},
  oUserLogin_u in 'oUserLogin_u.pas',
  fUserRegistrationPage_u in 'fUserRegistrationPage_u.pas' {RegisterForm},
  fMainUserForm_u in 'fMainUserForm_u.pas' {MainUserForm},
  fUserNotfScreen_u in 'fUserNotfScreen_u.pas' {frmUserNotf},
  fUserSS_u in 'fUserSS_u.pas' {frmUserSS},
  fAdminLogin_u in 'fAdminLogin_u.pas' {frmAdmin},
  fAdminMana_u in 'fAdminMana_u.pas' {frmAdminMana},
  fAdminMainS_u in 'fAdminMainS_u.pas' {frmAdminMainS},
  fAdminSS_u in 'fAdminSS_u.pas' {frmAdminSS},
  fAdminUM_u in 'fAdminUM_u.pas' {frmAdminUM},
  fAdminAM_u in 'fAdminAM_u.pas' {frmAdminAM},
  fAgencyLogin_u in 'fAgencyLogin_u.pas' {frmAgencyLogin},
  fAgencyMain_u in 'fAgencyMain_u.pas' {frmAgencyMain},
  fAgencyPS_u in 'fAgencyPS_u.pas' {frmAgencyPS},
  fAgencyPM_u in 'fAgencyPM_u.pas' {frmAgencyPM},
  DMUsers in 'DMUsers.pas' {DMtblUsers: TDataModule},
  DMListings in 'DMListings.pas' {DMtblListings: TDataModule},
  DMAdmins in 'DMAdmins.pas' {DMtblAdmins: TDataModule},
  DMImages in 'DMImages.pas' {DMtblImages: TDataModule},
  DMAgencies in 'DMAgencies.pas' {DMtblAgencies: TDataModule},
  fAgencyReg_u in 'fAgencyReg_u.pas' {frmAgencyReg},
  DMSuburbs in 'DMSuburbs.pas' {DMtblSuburbs: TDataModule},
  fAgencyUpdate_u in 'fAgencyUpdate_u.pas' {frmAgencyUpt};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWelcomePageForm, frmWelcomePageForm);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TRegisterForm, RegisterForm);
  Application.CreateForm(TMainUserForm, MainUserForm);
  Application.CreateForm(TfrmUserNotf, frmUserNotf);
  Application.CreateForm(TfrmUserSS, frmUserSS);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TfrmAdminMana, frmAdminMana);
  Application.CreateForm(TfrmAdminMainS, frmAdminMainS);
  Application.CreateForm(TfrmAdminSS, frmAdminSS);
  Application.CreateForm(TfrmAdminUM, frmAdminUM);
  Application.CreateForm(TfrmAdminAM, frmAdminAM);
  Application.CreateForm(TfrmAgencyLogin, frmAgencyLogin);
  Application.CreateForm(TfrmAgencyMain, frmAgencyMain);
  Application.CreateForm(TfrmAgencyPS, frmAgencyPS);
  Application.CreateForm(TfrmAgencyPM, frmAgencyPM);
  Application.CreateForm(TDMtblUsers, DMtblUsers);
  Application.CreateForm(TDMtblListings, DMtblListings);
  Application.CreateForm(TDMtblAdmins, DMtblAdmins);
  Application.CreateForm(TDMtblImages, DMtblImages);
  Application.CreateForm(TDMtblAgencies, DMtblAgencies);
  Application.CreateForm(TfrmAgencyReg, frmAgencyReg);
  Application.CreateForm(TDMtblSuburbs, DMtblSuburbs);
  Application.CreateForm(TfrmAgencyUpt, frmAgencyUpt);
  Application.Run;
end.
