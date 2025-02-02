unit fUserSS_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, jpeg,fMainUserForm_u, StdCtrls,DMListings,DMSuburbs,DMAgencies;

type
  TfrmUserSS = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Back1: TMenuItem;
    Help1: TMenuItem;
    Panel2: TPanel;
    Memo1: TMemo;
    Image2: TImage;
    Image3: TImage;
    Button1: TButton;
    edtPrice: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtBath: TEdit;
    edtArea: TEdit;
    edtBed: TEdit;
    edtPark: TEdit;
    Label6: TLabel;
    edtSuburb: TEdit;
    Image4: TImage;
    procedure Back1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserSS: TfrmUserSS;
  found:boolean;
  count:integer;
 LListingId:Tstringlist;
  LSuburb:Tstringlist;
  LBedNum:Tstringlist;
  LBathNum:Tstringlist;
  LParkNum:Tstringlist;
  LPrice:Tstringlist;
  LArea:Tstringlist;
  LAgencyName:Tstringlist;
  LWebsite:Tstringlist;
    LContactNumber:Tstringlist;
  LEmailAddress:Tstringlist;
  memWelc:Tmemo;    {}
  num:integer;
implementation

uses DMUsers;

{$R *.dfm}

procedure TfrmUserSS.Back1Click(Sender: TObject);
begin
 MainUserForm.show;
 frmUserSS.Close;
end;

procedure TfrmUserSS.Button1Click(Sender: TObject);
begin
Memo1.Lines.Clear;
Memo1.Lines.add('Agency Contact Information');
Memo1.Lines.add('___________________________');
if not count<0 then
begin
   edtPrice.Text:='R'+LPrice[count];
    edtArea.Text:=LArea[count]+'m3';
    edtBed.Text:=LBedNum[count];
    edtBath.Text:=LBathNum[count];
    edtPark.Text:=LParkNum[count];
    edtSuburb.Text:=LSuburb[count];
     Memo1.Lines.Add('Agency Name: '+LAgencyName[count]);
     Memo1.Lines.Add('Website: '+LWebsite[count]);
     Memo1.Lines.Add('contact : '+LContactNumber[count]);
     Memo1.Lines.Add('Email Address: '+LEmailAddress[count]);
        Image2.Picture.LoadFromFile('D:\Pat\images\'+LListingId[count]+'a.jpg');
      Image3.Picture.LoadFromFile('D:\Pat\images\'+LListingId[count]+'b.jpg');
       Image4.Picture.LoadFromFile('D:\Pat\images\'+LListingId[count]+'c.jpg');
count:=Count-1;
end
else
begin
 Button1.Caption:='No more found';
end;

end;

procedure TfrmUserSS.FormShow(Sender: TObject);
var
myfile:textfile;
sline:string;
sPool,sPF:string;
sSuburb,sBedNum,sBathNum,sType,sParkNum:string;
iMINP,iMaxP,iMINA,iMaxA,iType:integer;
sMINP,sMaxP,sMINA,sMaxA:string;
sPrice,sArea:string;
cp,i:integer;
IsPool,IsPF:boolean;
sDSuburb,sDBedNum,sDBathNum,sDType,sDParkNum,sAgency,sListingId:string;
iDArea,iDprice,iDType:integer;
IsDPool,IsDPF:boolean;
begin
  num:=1;                                      {}

 memwelc:=Tmemo.Create(frmUserSS);
memwelc.Parent:= frmUserSS;

memwelc.Left:=180;
memwelc.Top:=100;
memwelc.Width:=500;
memwelc.Height:=300;

memwelc.Lines.Add('>Click more to see more properties that match your criteria');
memwelc.Lines.Add('>If No propety is found try changing your criteria');
memwelc.Lines.Add('>Click back to change your criteria');
memwelc.Hide;             {}




LListingId:=Tstringlist.Create;
  LSuburb:=Tstringlist.Create;
  LBedNum:=Tstringlist.Create;
  LBathNum:=Tstringlist.Create;
  LParkNum:=Tstringlist.Create;
  LPrice:=Tstringlist.Create;
  LArea:=Tstringlist.Create;
  LAgencyName:=Tstringlist.Create;
  LWebsite:=Tstringlist.Create;
    LContactNumber:=Tstringlist.Create;
  LEmailAddress:=Tstringlist.Create;

count:=0;
found:=false;
assignfile(myfile,'CurrentSearch.txt');
reset(myfile);
readln(myfile,sline);
closefile(myfile);

cp:=pos('/',sline);
sType:=copy(sline,1,cp-1);
delete(sline,1,cp);
if sType='House' then
iType:=1
else
iType:=2;

cp:=pos('/',sline);
sSuburb:=copy(sline,1,cp-1);
delete(sline,1,cp);

cp:=pos('/',sline);
sBedNum:=copy(sline,1,cp-1);
delete(sline,1,cp);


cp:=pos('/',sline);
sBathNum:=copy(sline,1,cp-1);
delete(sline,1,cp);


cp:=pos('/',sline);
sParkNum:=copy(sline,1,cp-1);
delete(sline,1,cp);


cp:=pos('/',sline);
sPool:=copy(sline,1,cp-1);
delete(sline,1,cp);


cp:=pos('/',sline);
sPF:=copy(sline,1,cp-1);
delete(sline,1,cp);

cp:=pos('/',sline);
sPrice:=copy(sline,1,cp-1);
delete(sline,1,cp);

sArea:=sline;

if sPF='True' then
IsPF:=true
else
IsPF:=false;
if sPool='True' then
IsPool:=true
else
IsPool:=false;

cp:=pos('-',sPrice);
sMINP:=copy(sPrice,1,cp-1);
iMINP:=strtoint(sMINP);
sMaxP:=copy(sPrice,cp+1,length(sPrice));
iMaxP:=strtoint(sMaxP);

cp:=pos('-',sArea);
sMINA:=copy(sArea,1,cp-1);
iMINA:=strtoint(sMINA);
sMaxA:=copy(sArea,cp+1,length(sArea));
iMaxA:=strtoint(sMaxA);



DMtblsuburbs.tblSuburbs.First;
while not dMtblsuburbs.tblSuburbs.eof do
 begin
  dmtbllistings.tblListings.First;
  while not dmtbllistings.tblListings.eof do
  begin
     sListingId:=dmtbllistings.tblListings['Listingid'];
    sDSuburb:=DMtblsuburbs.tblSuburbs['Suburbname'];
     sDBedNum:=dmtbllistings.tblListings['Bedroom_Number'];
     sDBathNum:=dmtbllistings.tblListings['Bathroom_Number'];
     sDParkNum:=dmtbllistings.tblListings['Parking_Number'];
     iDType:=dmtbllistings.tblListings['Typeid'];
     IsDPool:=dmtbllistings.tblListings['Pool'];
     IsDPF:=dmtbllistings.tblListings['Pets'];
     iDPrice:=dmtbllistings.tblListings['Price'];
     iDArea:=dmtbllistings.tblListings['Area_Size'];
   if (dmtbllistings.tblListings['Suburbid']=DMtblsuburbs.tblSuburbs['Suburbid']) and (iType=iDType)and((iDPrice>=iMinP)and(iDPrice<=iMaxP)) and ((iDArea>=iMinA)and(iDArea<=iMaxA)) and ((sDSuburb=sSuburb)or(sSuburb='*')) and ((sDBedNum=sBedNum) or(sBedNum='*')) and ((sDBathNum=sBathNum)or(sBathNum='*')) and ((sDParkNum= sParkNum)or( sParkNum='*')) and (IsDPool= IsPool) and (IsDPF= IsPF)then
    begin
      DMtblAgencies.adotblAgencies.First;
      while not  DMtblAgencies.adotblAgencies.eof do
       begin
        sAgency:=DMtblAgencies.adotblAgencies['AgencyName'];
        if (dmtbllistings.tblListings['Agencyid']=DMtblAgencies.adotblAgencies['Agencyid']) then
         begin
  LListingId.Add(dmtbllistings.tblListings['Listingid']);
  LSuburb.Add(DMtblsuburbs.tblSuburbs['Suburbname']);
  LBedNum.Add(dmtbllistings.tblListings['Bedroom_Number']);
  LBathNum.Add(dmtbllistings.tblListings['Bathroom_Number']);
  LParkNum.Add(dmtbllistings.tblListings['Parking_Number']);
  LPrice.Add(dmtbllistings.tblListings['Price']);
  LArea.Add(dmtbllistings.tblListings['Area_Size']);
  LAgencyName.Add(DMtblAgencies.adotblAgencies['AgencyName']);
  LWebsite.Add(DMtblAgencies.adotblAgencies['Website']);
  LContactNumber.Add(DMtblAgencies.adotblAgencies['ContactNumber']);
  LEmailAddress.Add(DMtblAgencies.adotblAgencies['EmailAddress']);
    inc(count);
     Memo1.Lines.Add(dmtbllistings.tblListings['Listingid'])
         end;
         DMtblAgencies.adotblAgencies.Next;
        end;
      found:=true;
    end;
    dmtbllistings.tblListings.next;
   end;
    DMtblsuburbs.tblSuburbs.Next;
end;


 if found=false then
 begin

 count:=count-1;
 Button1.Enabled:=false;
 Button1.Visible:=false;
 Memo1.Enabled:=false;
 Memo1.Visible:=false;
  Panel2.Visible:=false;
 end
 else
 begin
 Memo1.Lines.Clear;
Memo1.Lines.add('Agency Contact Information');
Memo1.Lines.add('___________________________');
 count:=count-1;
     edtPrice.Text:='R'+LPrice[count];
    edtArea.Text:=LArea[count]+'m3';
    edtBed.Text:=LBedNum[count];
    edtBath.Text:=LBathNum[count];
    edtPark.Text:=LParkNum[count];
    edtSuburb.Text:=LSuburb[count];
   Memo1.Lines.Add('Agency Name: '+LAgencyName[count]);
     Memo1.Lines.Add('Website: '+LWebsite[count]);
     Memo1.Lines.Add('contact : '+LContactNumber[count]);
     Memo1.Lines.Add('Email Address: '+LEmailAddress[count]);
     Image2.Picture.LoadFromFile('D:\Pat\Nkateko Mnisi PAT\images\'+LListingId[count]+'a.jpg');
      Image3.Picture.LoadFromFile('D:\Pat\Nkateko Mnisi PAT\images\'+LListingId[count]+'b.jpg');
       Image4.Picture.LoadFromFile('D:\Pat\Nkateko Mnisi PAT\images\'+LListingId[count]+'c.jpg');
        count:=count-1;
    Panel1.Caption:='';
 end;


end;

procedure TfrmUserSS.Help1Click(Sender: TObject);
begin
 if num=1 then
 begin
memWelc.Show;
num:=2;
 end
else
begin
memWelc.Hide;
num:=1;
end;
end;

end.
