unit DMSuburbs;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDMtblSuburbs = class(TDataModule)
    conSuburbs: TADOConnection;
    tblSuburbs: TADOTable;
    DSSuburbs: TDataSource;
    qrySuburbs: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMtblSuburbs: TDMtblSuburbs;

implementation

{$R *.dfm}

procedure TDMtblSuburbs.DataModuleCreate(Sender: TObject);
begin
   if FileExists('D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='D:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='E:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='F:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='G:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
  conSuburbs.ConnectionString:='H:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

  if FileExists('I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
  conSuburbs.ConnectionString:='I:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
 conSuburbs.ConnectionString:='J:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
  conSuburbs.ConnectionString:='K:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
  conSuburbs.ConnectionString:='L:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
 conSuburbs.ConnectionString:='M:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='N:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='O:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='P:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='Q:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='R:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='S:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='T:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='U:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

   if FileExists('V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='V:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

     if FileExists('X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='X:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='Y:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';

      if FileExists('Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb') then
   conSuburbs.ConnectionString:='Z:\Pat\Nkateko Mnisi PAT\propertymanagement.mdb';
  conSuburbs.Connected:=true;
  tblSuburbs.Active:=true;
  qrySuburbs.Active:=true;
end;

end.
