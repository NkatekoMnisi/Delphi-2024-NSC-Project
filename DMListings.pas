unit DMListings;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMtblListings = class(TDataModule)
    tblListings: TADOTable;
    qryListings: TADOQuery;
    DSListings: TDataSource;
    conListings: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMtblListings: TDMtblListings;

implementation

{$R *.dfm}

procedure TDMtblListings.DataModuleCreate(Sender: TObject);
begin
     if FileExists('D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

  if FileExists('I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
  conListings.ConnectionString:='S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
  conListings.ConnectionString:='U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

     if FileExists('X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conListings.ConnectionString:='Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';
  conListings.Connected:=true;
  tblListings.Active:=true;
  qryListings.Active:=true;
end;

end.
