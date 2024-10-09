unit DMUsers;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMtblUsers = class(TDataModule)
    adoConUsers: TADOConnection;
    adotblUsers: TADOTable;
    ADOQUsers: TADOQuery;
    DSUsers: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMtblUsers: TDMtblUsers;

implementation

{$R *.dfm}

procedure TDMtblUsers.DataModuleCreate(Sender: TObject);
begin
   if FileExists('D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

  if FileExists('I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

     if FileExists('X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConUsers.ConnectionString:='Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';



  adoConUsers.Connected:=true;
  adotblUsers.Active:=true;
  ADOQUsers.Active:=true;


end;

end.
