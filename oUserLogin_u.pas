unit oUserLogin_u;

interface
  uses sysutils,math;
  type
    UsersLoginInfo=class(TOBJECT)
      private
       fusername:string;
      fusersurname:string;
       fPassword:string;
       fCorrectUN:boolean;
        fCorrectUSN:boolean;
         fCorrectUP:boolean;
      public
constructor create(username,usersurname,Password:string);
function getUsername:string;
function getUserpassword:string;
function getUsersurname:string;
procedure setCorrectName;
procedure setCorrectPass;
procedure setCorrectSurname;
function getCorrectUN:boolean;
function getCorrectUSN:boolean;
function getCorrectUP:boolean;
  end;
implementation

{ Users }



{ UsersLoginInfo }

constructor UsersLoginInfo.create(username, usersurname, Password: string);
begin
fusername:=username;
fusersurname:=usersurname;
fPassword:=Password;
fCorrectUN:=True;
fCorrectUSN:=True;
fCorrectUP:=True;
end;



function UsersLoginInfo.getCorrectUN: boolean;
begin
result:=fCorrectUN;
end;

function UsersLoginInfo.getCorrectUP: boolean;
begin
result:=fCorrectUP;
end;

function UsersLoginInfo.getCorrectUSN: boolean;
begin
 result:=fCorrectUSN;
end;

function UsersLoginInfo.getUsername: string;
begin
result:=fusername;
end;

function UsersLoginInfo.getUserpassword: string;
begin
result:=fPassword;
end;

function UsersLoginInfo.getUsersurname: string;
begin
result:=fusersurname;
end;

procedure UsersLoginInfo.setCorrectName;
var
i,j:integer;
arrSnum:array [1..10] of string;
arrSpc:array [1..32] of string;
begin
arrSnum[1]:='0';
arrSnum[2]:='1';
arrSnum[3]:='2';
arrSnum[4]:='3';
arrSnum[5]:='4';
arrSnum[6]:='5';
arrSnum[7]:='6';
arrSnum[8]:='7';
arrSnum[9]:='8';
arrSnum[10]:='9';

arrSpc[1]:='~';
arrSpc[2]:='`';
arrSpc[3]:='!';
arrSpc[4]:='@';
arrSpc[5]:='#';
arrSpc[6]:='$';
arrSpc[7]:='%';
arrSpc[8]:='^';
arrSpc[9]:='&';
arrSpc[10]:='*';
arrSpc[11]:='(';
arrSpc[12]:=')';
arrSpc[13]:='_';
arrSpc[14]:='-';
arrSpc[15]:='+';
arrSpc[16]:='=';
arrSpc[17]:='{';
arrSpc[18]:='}';
arrSpc[19]:='[';
arrSpc[20]:=']';
arrSpc[21]:='|';
arrSpc[22]:='\';
arrSpc[23]:=':';
arrSpc[24]:='"';
arrSpc[25]:=';';
arrSpc[26]:='<';
arrSpc[27]:='<';
arrSpc[28]:='>';
arrSpc[29]:='?';
arrSpc[31]:='.';
arrSpc[32]:='/';

for  i:= 1 to length(fusername) do
begin
for  j:= 1 to 32 do
begin
 if (fusername[i])=(arrSpc[j]) then
 fCorrectUN:=false;

end;
end;

for  i:= 1 to length(fusername) do
begin
for  j:= 1 to 10 do
begin
 if (fusername[i])=(arrSnum[j]) then
 fCorrectUN:=false;

end;
end;

for  i:= 1 to length(fusername) do
begin
if (fusername[i])=' ' then
 fCorrectUN:=false;
end;


end;

procedure UsersLoginInfo.setCorrectPass;
var
i:integer;
begin


for  i:= 1 to length(fPassword) do
begin
if (fPassword[i])=' ' then
 fCorrectUP:=false;
end;

end;

procedure UsersLoginInfo.setCorrectSurname;
var
i,j:integer;
arrSnum:array [1..10] of string;
arrSpc:array [1..32] of string;
begin
arrSnum[1]:='0';
arrSnum[2]:='1';
arrSnum[3]:='2';
arrSnum[4]:='3';
arrSnum[5]:='4';
arrSnum[6]:='5';
arrSnum[7]:='6';
arrSnum[8]:='7';
arrSnum[9]:='8';
arrSnum[10]:='9';

arrSpc[1]:='~';
arrSpc[2]:='`';
arrSpc[3]:='!';
arrSpc[4]:='@';
arrSpc[5]:='#';
arrSpc[6]:='$';
arrSpc[7]:='%';
arrSpc[8]:='^';
arrSpc[9]:='&';
arrSpc[10]:='*';
arrSpc[11]:='(';
arrSpc[12]:=')';
arrSpc[13]:='_';
arrSpc[14]:='-';
arrSpc[15]:='+';
arrSpc[16]:='=';
arrSpc[17]:='{';
arrSpc[18]:='}';
arrSpc[19]:='[';
arrSpc[20]:=']';
arrSpc[21]:='|';
arrSpc[22]:='\';
arrSpc[23]:=':';
arrSpc[24]:='"';
arrSpc[25]:=';';
arrSpc[26]:='>';
arrSpc[27]:='<';
arrSpc[28]:='>';
arrSpc[29]:='?';
arrSpc[31]:='.';
arrSpc[32]:='/';

 for  i:= 1 to length(fusersurname) do
begin
for  j:= 1 to 32 do
begin
 if (fusersurname[i])=(arrSpc[j]) then
 fCorrectUSN:=false;

end;
end;

for  i:= 1 to length(fusersurname) do
begin
for  j:= 1 to 10 do
begin
 if (fusersurname[i])=(arrSnum[j]) then
 fCorrectUSN:=false;

end;
end;

for  i:= 1 to length(fusersurname) do
begin
if (fusersurname[i])=' ' then
 fCorrectUSN:=false;
end;


end;

end.
