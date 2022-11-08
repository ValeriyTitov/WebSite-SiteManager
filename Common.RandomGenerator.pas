unit Common.RandomGenerator;

interface
 Uses Classes, Windows, SysUtils;

type
 TRandomGenerator = class
   class function GenerateRandomMaleName:string;
   class function GenerateRandomFemaleName:string;
   class function GenerateRandomName:string;
   class function RandomMobilePhoneNumber:string;
   class function RandomPhoneNumber:string;
   class function RandomBirthDate(MinAge: Word = 18):TDateTime;
   class function RandomRoomNumber:string;
   class function Translit(Text:string):string;
   class function RandomEmail(FIO:string; Domain:string):string;

 end;


implementation
var
 FirstNameList:TstringList;
 LastNameList:TstringList;
 MiddleNameList:TstringList;
 FirstNameList2:TstringList;
 SecondNameList2:TstringList;
 MiddleNameList2:TstringList;





function TextToTranslit(Text: string): string;
var
 i:integer;
 C:string;

procedure DoReplace(const s:string);
begin
  Delete(text,i,1);
  Insert(s,text,i);
end;

begin

for i:=1 to Length(text)*3 do
 begin
   c:=copy(text,i,1);
   if c='�' then DoReplace('a') else
   if c='�' then DoReplace('b') else
   if c='�' then DoReplace('v') else
   if c='�' then DoReplace('g') else
   if c='�' then DoReplace('d') else
   if c='�' then DoReplace('e') else
   if c='�' then DoReplace('e') else
   if c='�' then DoReplace('zh') else
   if c='�' then DoReplace('z') else
   if c='�' then DoReplace('i') else
   if c='�' then DoReplace('y') else
   if c='�' then DoReplace('k') else
   if c='�' then DoReplace('l') else
   if c='�' then DoReplace('m') else
   if c='�' then DoReplace('n') else
   if c='�' then DoReplace('o') else
   if c='�' then DoReplace('p') else
   if c='�' then DoReplace('r') else
   if c='�' then DoReplace('s') else
   if c='�' then DoReplace('t') else
   if c='�' then DoReplace('u') else
   if c='�' then DoReplace('f') else
   if c='�' then DoReplace('h') else
   if c='�' then DoReplace('c') else
   if c='�' then DoReplace('ch') else
   if c='�' then DoReplace('sh') else
   if c='�' then DoReplace('sch') else
   if c='�' then DoReplace('''') else
   if c='�' then DoReplace('yi') else
   if c='�' then DoReplace('i') else
   if c='�' then DoReplace('ye') else
   if c='�' then DoReplace('yu') else
   if c='�' then DoReplace('ya') else
   if c='�' then DoReplace('A') else
   if c='�' then DoReplace('B') else
   if c='�' then DoReplace('V') else
   if c='�' then DoReplace('G') else
   if c='�' then DoReplace('D') else
   if c='�' then DoReplace('E') else
   if c='�' then DoReplace('E') else
   if c='�' then DoReplace('Zh') else
   if c='�' then DoReplace('Z') else
   if c='�' then DoReplace('I') else
   if c='�' then DoReplace('Y') else
   if c='�' then DoReplace('K') else
   if c='�' then DoReplace('L') else
   if c='�' then DoReplace('M') else
   if c='�' then DoReplace('N') else
   if c='�' then DoReplace('O') else
   if c='�' then DoReplace('P') else
   if c='�' then DoReplace('R') else
   if c='�' then DoReplace('S') else
   if c='�' then DoReplace('T') else
   if c='�' then DoReplace('U') else
   if c='�' then DoReplace('F') else
   if c='�' then DoReplace('H') else
   if c='�' then DoReplace('C') else
   if c='�' then DoReplace('Ch') else
   if c='�' then DoReplace('Sh') else
   if c='�' then DoReplace('Sch') else
   if c='�' then DoReplace('''') else
   if c='�' then DoReplace('Yi') else
   if c='�' then DoReplace('i') else
   if c='�' then DoReplace('Ye') else
   if c='�' then DoReplace('Yu') else
   if c='�' then DoReplace('Ya');
 end;
 Result:=Text;
end;


{ TRandomGenerator }


class function TRandomGenerator.GenerateRandomFemaleName: string;
begin
 Result:=SecondNameList2[Random(SecondNameList2.Count)]+' '+
 FirstNameList2[Random(FirstNameList2.Count)]+' '+
 MiddleNameList2[Random(MiddleNameList2.Count)];
end;

class function TRandomGenerator.GenerateRandomMaleName: string;
begin
  Result:=LastNameList[Random(LastNameList.Count)]+' '+
          FirstNameList[Random(FirstNameList.Count)]+' '+
          MiddleNameList[Random(MiddleNameList.Count)];
end;


class function TRandomGenerator.GenerateRandomName: string;
begin
 if Random(10)>5 then
  Result:=GenerateRandomFemaleName
   else
  Result:=GenerateRandomMaleName;
end;

class function TRandomGenerator.RandomBirthDate(MinAge: Word = 18): TDateTime;
var
 y,m,d:word;
begin
 DecodeDate(Now,y,m,d);
 y:=y-60;
 Result:=EncodeDate(y+Random(60-MinAge),Random(11)+1,Random(27)+1);
end;

class function TRandomGenerator.RandomEmail(FIO, Domain: string): string;
var
 List:TstringList;
begin
 Result:='';
 List:=TstringList.Create;
 try
  List.Delimiter:=' ';
  List.DelimitedText:=FIO;
  if List.Count=3 then
   begin
    Result:=List[0]+'.';
    Result:=Result+List[1][1]+List[2][1]+Domain;
   end;
 finally
  List.Free;
 end;

end;

class function TRandomGenerator.RandomMobilePhoneNumber: string;
begin
 Result:='+7';
 Result:=Result+' ('+(Random(20)+900).Tostring+')';
 Result:=Result+'-'+Random(999).Tostring;
 Result:=Result+'-'+Random(99).Tostring;
 Result:=Result+'-'+Random(99).Tostring;
end;

class function TRandomGenerator.RandomPhoneNumber: string;
begin
 Result:='+7';
 Result:=Result+' ('+(Random(9)+490).Tostring+')';
 Result:=Result+'-'+Random(999).Tostring;
 Result:=Result+'-'+Random(99).Tostring;
 Result:=Result+'-'+Random(99).Tostring;

end;

class function TRandomGenerator.RandomRoomNumber: string;
begin
 Result:=(Random(4)+1).Tostring;
 Result:=Result+'-'+(Random(20)+1).Tostring;
 if Random(10)>5 then
  Result:=Result+'(A)';
end;

class function TRandomGenerator.Translit(Text: string): string;
begin
 Result:=TextToTranslit(Text);
end;

initialization
 Randomize;
 
 FirstNameList:=TstringList.Create;
 LastNameList:=TstringList.Create;
 MiddleNameList:=TstringList.Create;
 FirstNameList2:=TstringList.Create;
 SecondNameList2:=TstringList.Create;
 MiddleNameList2:=TstringList.Create;

FirstNameList.Add('������');
FirstNameList.Add('�������');
FirstNameList.Add('�����');
FirstNameList.Add('������');
FirstNameList.Add('������');
FirstNameList.Add('�������');
FirstNameList.Add('������');
FirstNameList.Add('�����');
FirstNameList.Add('�������');
FirstNameList.Add('�����');
FirstNameList.Add('����������');
FirstNameList.Add('����');
FirstNameList.Add('�����');
FirstNameList.Add('������');
FirstNameList.Add('��������');
FirstNameList.Add('�����');
FirstNameList.Add('��������');
FirstNameList.Add('���������');
FirstNameList.Add('��������');
FirstNameList.Add('������');
FirstNameList.Add('������');
FirstNameList.Add('�������');
FirstNameList.Add('������');
FirstNameList.Add('������');
FirstNameList.Add('�������');
FirstNameList.Add('�����');
FirstNameList.Add('������');
FirstNameList.Add('������');
FirstNameList.Add('�������');
FirstNameList.Add('�������');
FirstNameList.Add('��������');
FirstNameList.Add('����');
FirstNameList.Add('�������');
FirstNameList.Add('������');
FirstNameList.Add('�������');
FirstNameList.Add('������');
FirstNameList.Add('�����');
FirstNameList.Add('����');
FirstNameList.Add('���������');
FirstNameList.Add('�������');
FirstNameList.Add('�������');
FirstNameList.Add('����');
FirstNameList.Add('�����');
FirstNameList.Add('������');
FirstNameList.Add('�����');
FirstNameList.Add('���������');
FirstNameList.Add('�����');
FirstNameList.Add('�����');
FirstNameList.Add('�������');
FirstNameList.Add('������');
FirstNameList.Add('�����');
FirstNameList.Add('�����');
FirstNameList.Add('����');
FirstNameList.Add('����');
FirstNameList.Add('����');
FirstNameList.Add('�����');
FirstNameList.Add('�������');
FirstNameList.Add('���');

LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('����������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('Ը�����');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('�����');
LastNameList.Add('�����');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('���������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('���������');
LastNameList.Add('��������');
LastNameList.Add('���������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('���������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('���������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('�����������');
LastNameList.Add('���������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('���������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('����������');
LastNameList.Add('������');
LastNameList.Add('���������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('�����');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('�����');
LastNameList.Add('����');
LastNameList.Add('���������');
LastNameList.Add('��������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('���������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('����������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('�����');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('���������');
LastNameList.Add('����������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('����');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('���������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('���������');
LastNameList.Add('��������');
LastNameList.Add('����������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('���������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('������');
LastNameList.Add('����������');
LastNameList.Add('��������');
LastNameList.Add('�����');
LastNameList.Add('������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('����������');
LastNameList.Add('������');
LastNameList.Add('������������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('������');
LastNameList.Add('������������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('��������');
LastNameList.Add('��������');
LastNameList.Add('�������');
LastNameList.Add('�����');
LastNameList.Add('������');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('�����');
LastNameList.Add('�������');
LastNameList.Add('�������');
LastNameList.Add('��������');
LastNameList.Add('�����');
LastNameList.Add('������');
LastNameList.Add('�����������');
LastNameList.Add('������');
LastNameList.Add('����������');
LastNameList.Add('�����');
LastNameList.Add('��������');
LastNameList.Add('������');
LastNameList.Add('�����');



MiddleNameList.Add('�������������');
MiddleNameList.Add('��������');
MiddleNameList.Add('�����������');
MiddleNameList.Add('����������');
MiddleNameList.Add('����������');
MiddleNameList.Add('���������');
MiddleNameList.Add('���������');
MiddleNameList.Add('�����������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('������������');
MiddleNameList.Add('���������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('������������');
MiddleNameList.Add('������������');
MiddleNameList.Add('������������');
MiddleNameList.Add('������������');
MiddleNameList.Add('����������');
MiddleNameList.Add('����������');
MiddleNameList.Add('�����������');
MiddleNameList.Add('����������');
MiddleNameList.Add('�����������');
MiddleNameList.Add('�����������');
MiddleNameList.Add('���������');
MiddleNameList.Add('���������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('����������');
MiddleNameList.Add('��������');
MiddleNameList.Add('��������');
MiddleNameList.Add('��������');
MiddleNameList.Add('�����');
MiddleNameList.Add('��������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('��������������');
MiddleNameList.Add('����������');
MiddleNameList.Add('�������');
MiddleNameList.Add('���������');
MiddleNameList.Add('��������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('���������');
MiddleNameList.Add('��������');
MiddleNameList.Add('����������');
MiddleNameList.Add('��������');
MiddleNameList.Add('���������');
MiddleNameList.Add('��������');
MiddleNameList.Add('��������');
MiddleNameList.Add('����������');
MiddleNameList.Add('����������');
MiddleNameList.Add('�������������');
MiddleNameList.Add('�����������');
MiddleNameList.Add('���������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('�������������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('���������');
MiddleNameList.Add('�������������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('���������');
MiddleNameList.Add('���������');
MiddleNameList.Add('����������');
MiddleNameList.Add('����������');
MiddleNameList.Add('�����������');
MiddleNameList.Add('����������');
MiddleNameList.Add('�����������');
MiddleNameList.Add('����������');
MiddleNameList.Add('�������');
MiddleNameList.Add('��������');
MiddleNameList.Add('���������');
MiddleNameList.Add('�����������');

FirstNameList2.Add('��������');
FirstNameList2.Add('����������');
FirstNameList2.Add('�����');
FirstNameList2.Add('����');
FirstNameList2.Add('���������');
FirstNameList2.Add('��������');
FirstNameList2.Add('������');
FirstNameList2.Add('��������');
FirstNameList2.Add('����');
FirstNameList2.Add('��������');
FirstNameList2.Add('���������');
FirstNameList2.Add('�������');
FirstNameList2.Add('�������');
FirstNameList2.Add('��������');
FirstNameList2.Add('����');
FirstNameList2.Add('��������');
FirstNameList2.Add('��������');
FirstNameList2.Add('������');
FirstNameList2.Add('����');
FirstNameList2.Add('�����');
FirstNameList2.Add('�������');
FirstNameList2.Add('�������');
FirstNameList2.Add('���������');
FirstNameList2.Add('�����');
FirstNameList2.Add('���������');
FirstNameList2.Add('�����');
FirstNameList2.Add('�������');
FirstNameList2.Add('�����');
FirstNameList2.Add('���');
FirstNameList2.Add('������');
FirstNameList2.Add('����');
FirstNameList2.Add('������');
FirstNameList2.Add('�����');
FirstNameList2.Add('������');
FirstNameList2.Add('��������');
FirstNameList2.Add('����');
FirstNameList2.Add('�������');
FirstNameList2.Add('������');
FirstNameList2.Add('����');
FirstNameList2.Add('������');
FirstNameList2.Add('�����');
FirstNameList2.Add('�����');
FirstNameList2.Add('������');
FirstNameList2.Add('�������');
FirstNameList2.Add('���������');
FirstNameList2.Add('������');
FirstNameList2.Add('�����');
FirstNameList2.Add('�����');
FirstNameList2.Add('������');
FirstNameList2.Add('���������');
FirstNameList2.Add('�������');
FirstNameList2.Add('�����');
FirstNameList2.Add('�������');
FirstNameList2.Add('����');
FirstNameList2.Add('�����');
FirstNameList2.Add('������');
FirstNameList2.Add('�����');
FirstNameList2.Add('������');
FirstNameList2.Add('���������');
FirstNameList2.Add('�����');
FirstNameList2.Add('��������');
FirstNameList2.Add('�������');
FirstNameList2.Add('�����');
FirstNameList2.Add('������');
FirstNameList2.Add('������');
FirstNameList2.Add('�������');
FirstNameList2.Add('������');
FirstNameList2.Add('�����');
FirstNameList2.Add('���������');
FirstNameList2.Add('����');
FirstNameList2.Add('���');
FirstNameList2.Add('��������');

SecondNameList2.Add('�������');
SecondNameList2.Add('��������');
SecondNameList2.Add('���������');
SecondNameList2.Add('������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('�������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('�������');
SecondNameList2.Add('�������');
SecondNameList2.Add('����������');
SecondNameList2.Add('���������');
SecondNameList2.Add('�������');
SecondNameList2.Add('�������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('�����������');
SecondNameList2.Add('���������');
SecondNameList2.Add('���������');
SecondNameList2.Add('��������');
SecondNameList2.Add('���������');
SecondNameList2.Add('�������');
SecondNameList2.Add('��������');
SecondNameList2.Add('������');
SecondNameList2.Add('��������');
SecondNameList2.Add('������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('�������');
SecondNameList2.Add('������');
SecondNameList2.Add('������');
SecondNameList2.Add('������');
SecondNameList2.Add('��������');
SecondNameList2.Add('����������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('���������');
SecondNameList2.Add('���������');
SecondNameList2.Add('���������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('����������');
SecondNameList2.Add('���������');
SecondNameList2.Add('����������');
SecondNameList2.Add('��������');
SecondNameList2.Add('���������');
SecondNameList2.Add('������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('������');
SecondNameList2.Add('�������');
SecondNameList2.Add('���������');
SecondNameList2.Add('���������');
SecondNameList2.Add('�������');
SecondNameList2.Add('���������');
SecondNameList2.Add('��������');
SecondNameList2.Add('�������');
SecondNameList2.Add('���������');
SecondNameList2.Add('��������');
SecondNameList2.Add('���������');
SecondNameList2.Add('�������');
SecondNameList2.Add('��������');
SecondNameList2.Add('�������');
SecondNameList2.Add('���������');
SecondNameList2.Add('��������');
SecondNameList2.Add('���������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('���������');
SecondNameList2.Add('����������');
SecondNameList2.Add('��������');
SecondNameList2.Add('���������');
SecondNameList2.Add('�������');
SecondNameList2.Add('����������');
SecondNameList2.Add('��������');
SecondNameList2.Add('��������');
SecondNameList2.Add('�������');
SecondNameList2.Add('������������');
SecondNameList2.Add('����������');
SecondNameList2.Add('���������');
SecondNameList2.Add('��������');
SecondNameList2.Add('�������');
SecondNameList2.Add('��������');
SecondNameList2.Add('�������');
SecondNameList2.Add('������');
SecondNameList2.Add('��������');
SecondNameList2.Add('����������');
SecondNameList2.Add('���������');
SecondNameList2.Add('�������');
SecondNameList2.Add('�����������');
SecondNameList2.Add('������');


MiddleNameList2.Add('�������������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('������������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('������������');
MiddleNameList2.Add('������������');
MiddleNameList2.Add('������������');
MiddleNameList2.Add('�������������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('������������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('��������������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('�������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('�������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('��������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('�������������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('�������������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('���������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('�����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('����������');
MiddleNameList2.Add('�������');
MiddleNameList2.Add('�������');
MiddleNameList2.Add('���������');


finalization
 FirstNameList.Free;
 LastNameList.Free;
 MiddleNameList.Free;

 FirstNameList2.Free;
 SecondNameList2.Free;
 MiddleNameList2.Free;

end.


