unit DMAdmins;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDMtblAdmins = class(TDataModule)
    conAdmins: TADOConnection;
    tblAdmins: TADOTable;
    DSAdmins: TDataSource;
    qryAdmins: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMtblAdmins: TDMtblAdmins;

implementation

{$R *.dfm}

procedure TDMtblAdmins.DataModuleCreate(Sender: TObject);
begin
      if FileExists('D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

  if FileExists('I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
  conAdmins.ConnectionString:='I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

     if FileExists('X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conAdmins.ConnectionString:='Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';
  conAdmins.Connected:=true;
  tblAdmins.Active:=true;
  qryAdmins.Active:=true;
end;

end.
