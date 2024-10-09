unit DMAgencies;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMtblAgencies = class(TDataModule)
    adoConAgencies: TADOConnection;
    adotblAgencies: TADOTable;
    ADOQAgencies: TADOQuery;
    DSAgencies: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMtblAgencies: TDMtblAgencies;

implementation

{$R *.dfm}

procedure TDMtblAgencies.DataModuleCreate(Sender: TObject);
begin
     if FileExists('D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

  if FileExists('I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

     if FileExists('X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   adoConAgencies.ConnectionString:='Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

  adoConAgencies.Connected:=true;
 adotblAgencies.Active:=true;
ADOQAgencies.Active:=true;
end;

end.
