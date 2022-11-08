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
   if c='а' then DoReplace('a') else
   if c='б' then DoReplace('b') else
   if c='в' then DoReplace('v') else
   if c='г' then DoReplace('g') else
   if c='д' then DoReplace('d') else
   if c='е' then DoReplace('e') else
   if c='ё' then DoReplace('e') else
   if c='ж' then DoReplace('zh') else
   if c='з' then DoReplace('z') else
   if c='и' then DoReplace('i') else
   if c='й' then DoReplace('y') else
   if c='к' then DoReplace('k') else
   if c='л' then DoReplace('l') else
   if c='м' then DoReplace('m') else
   if c='н' then DoReplace('n') else
   if c='о' then DoReplace('o') else
   if c='п' then DoReplace('p') else
   if c='р' then DoReplace('r') else
   if c='с' then DoReplace('s') else
   if c='т' then DoReplace('t') else
   if c='у' then DoReplace('u') else
   if c='ф' then DoReplace('f') else
   if c='х' then DoReplace('h') else
   if c='ц' then DoReplace('c') else
   if c='ч' then DoReplace('ch') else
   if c='ш' then DoReplace('sh') else
   if c='щ' then DoReplace('sch') else
   if c='ъ' then DoReplace('''') else
   if c='ы' then DoReplace('yi') else
   if c='ь' then DoReplace('i') else
   if c='э' then DoReplace('ye') else
   if c='ю' then DoReplace('yu') else
   if c='я' then DoReplace('ya') else
   if c='А' then DoReplace('A') else
   if c='Б' then DoReplace('B') else
   if c='В' then DoReplace('V') else
   if c='Г' then DoReplace('G') else
   if c='Д' then DoReplace('D') else
   if c='Е' then DoReplace('E') else
   if c='Ё' then DoReplace('E') else
   if c='Ж' then DoReplace('Zh') else
   if c='З' then DoReplace('Z') else
   if c='И' then DoReplace('I') else
   if c='Й' then DoReplace('Y') else
   if c='К' then DoReplace('K') else
   if c='Л' then DoReplace('L') else
   if c='М' then DoReplace('M') else
   if c='Н' then DoReplace('N') else
   if c='О' then DoReplace('O') else
   if c='П' then DoReplace('P') else
   if c='Р' then DoReplace('R') else
   if c='С' then DoReplace('S') else
   if c='Т' then DoReplace('T') else
   if c='У' then DoReplace('U') else
   if c='Ф' then DoReplace('F') else
   if c='Х' then DoReplace('H') else
   if c='Ц' then DoReplace('C') else
   if c='Ч' then DoReplace('Ch') else
   if c='Ш' then DoReplace('Sh') else
   if c='Щ' then DoReplace('Sch') else
   if c='Ъ' then DoReplace('''') else
   if c='Ы' then DoReplace('Yi') else
   if c='Ь' then DoReplace('i') else
   if c='Э' then DoReplace('Ye') else
   if c='Ю' then DoReplace('Yu') else
   if c='Я' then DoReplace('Ya');
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

FirstNameList.Add('Сергей');
FirstNameList.Add('Тимофей');
FirstNameList.Add('Вадим');
FirstNameList.Add('Рустам');
FirstNameList.Add('Кирилл');
FirstNameList.Add('Альберт');
FirstNameList.Add('Никита');
FirstNameList.Add('Марат');
FirstNameList.Add('Савелий');
FirstNameList.Add('Тимур');
FirstNameList.Add('Константин');
FirstNameList.Add('Юрий');
FirstNameList.Add('Артур');
FirstNameList.Add('Максим');
FirstNameList.Add('Геннадий');
FirstNameList.Add('Роман');
FirstNameList.Add('Владимир');
FirstNameList.Add('Владислав');
FirstNameList.Add('Анатолий');
FirstNameList.Add('Богдан');
FirstNameList.Add('Руслан');
FirstNameList.Add('Николай');
FirstNameList.Add('Виктор');
FirstNameList.Add('Густав');
FirstNameList.Add('Виталий');
FirstNameList.Add('Павел');
FirstNameList.Add('Матвей');
FirstNameList.Add('Роберт');
FirstNameList.Add('Василий');
FirstNameList.Add('Евгений');
FirstNameList.Add('Вячеслав');
FirstNameList.Add('Глеб');
FirstNameList.Add('Алексей');
FirstNameList.Add('Михаил');
FirstNameList.Add('Валерий');
FirstNameList.Add('Андрей');
FirstNameList.Add('Мурат');
FirstNameList.Add('Алан');
FirstNameList.Add('Александр');
FirstNameList.Add('Дмитрий');
FirstNameList.Add('Рафаэль');
FirstNameList.Add('Марк');
FirstNameList.Add('Эмиль');
FirstNameList.Add('Герман');
FirstNameList.Add('Игорь');
FirstNameList.Add('Станислав');
FirstNameList.Add('Ринат');
FirstNameList.Add('Артем');
FirstNameList.Add('Марсель');
FirstNameList.Add('Леонид');
FirstNameList.Add('Антон');
FirstNameList.Add('Семен');
FirstNameList.Add('Эрик');
FirstNameList.Add('Илья');
FirstNameList.Add('Олег');
FirstNameList.Add('Дамир');
FirstNameList.Add('Ярослав');
FirstNameList.Add('Лев');

LastNameList.Add('Смирнов');
LastNameList.Add('Иванов');
LastNameList.Add('Кузнецов');
LastNameList.Add('Соколов');
LastNameList.Add('Попов');
LastNameList.Add('Лебедев');
LastNameList.Add('Козлов');
LastNameList.Add('Новиков');
LastNameList.Add('Морозов');
LastNameList.Add('Петров');
LastNameList.Add('Волков');
LastNameList.Add('Соловьёв');
LastNameList.Add('Васильев');
LastNameList.Add('Зайцев');
LastNameList.Add('Павлов');
LastNameList.Add('Семёнов');
LastNameList.Add('Голубев');
LastNameList.Add('Виноградов');
LastNameList.Add('Богданов');
LastNameList.Add('Воробьёв');
LastNameList.Add('Фёдоров');
LastNameList.Add('Михайлов');
LastNameList.Add('Беляев');
LastNameList.Add('Тарасов');
LastNameList.Add('Белов');
LastNameList.Add('Комаров');
LastNameList.Add('Орлов');
LastNameList.Add('Киселёв');
LastNameList.Add('Макаров');
LastNameList.Add('Андреев');
LastNameList.Add('Ковалёв');
LastNameList.Add('Ильин');
LastNameList.Add('Гусев');
LastNameList.Add('Титов');
LastNameList.Add('Кузьмин');
LastNameList.Add('Кудрявцев');
LastNameList.Add('Баранов');
LastNameList.Add('Куликов');
LastNameList.Add('Алексеев');
LastNameList.Add('Степанов');
LastNameList.Add('Яковлев');
LastNameList.Add('Сорокин');
LastNameList.Add('Сергеев');
LastNameList.Add('Романов');
LastNameList.Add('Захаров');
LastNameList.Add('Борисов');
LastNameList.Add('Королёв');
LastNameList.Add('Герасимов');
LastNameList.Add('Пономарёв');
LastNameList.Add('Григорьев');
LastNameList.Add('Лазарев');
LastNameList.Add('Медведев');
LastNameList.Add('Ершов');
LastNameList.Add('Никитин');
LastNameList.Add('Соболев');
LastNameList.Add('Рябов');
LastNameList.Add('Поляков');
LastNameList.Add('Цветков');
LastNameList.Add('Данилов');
LastNameList.Add('Жуков');
LastNameList.Add('Фролов');
LastNameList.Add('Журавлёв');
LastNameList.Add('Николаев');
LastNameList.Add('Крылов');
LastNameList.Add('Максимов');
LastNameList.Add('Сидоров');
LastNameList.Add('Осипов');
LastNameList.Add('Белоусов');
LastNameList.Add('Федотов');
LastNameList.Add('Дорофеев');
LastNameList.Add('Егоров');
LastNameList.Add('Матвеев');
LastNameList.Add('Бобров');
LastNameList.Add('Дмитриев');
LastNameList.Add('Калинин');
LastNameList.Add('Анисимов');
LastNameList.Add('Петухов');
LastNameList.Add('Антонов');
LastNameList.Add('Тимофеев');
LastNameList.Add('Никифоров');
LastNameList.Add('Веселов');
LastNameList.Add('Филиппов');
LastNameList.Add('Марков');
LastNameList.Add('Большаков');
LastNameList.Add('Суханов');
LastNameList.Add('Миронов');
LastNameList.Add('Ширяев');
LastNameList.Add('Александров');
LastNameList.Add('Коновалов');
LastNameList.Add('Шестаков');
LastNameList.Add('Казаков');
LastNameList.Add('Ефимов');
LastNameList.Add('Денисов');
LastNameList.Add('Громов');
LastNameList.Add('Фомин');
LastNameList.Add('Давыдов');
LastNameList.Add('Мельников');
LastNameList.Add('Щербаков');
LastNameList.Add('Блинов');
LastNameList.Add('Колесников');
LastNameList.Add('Карпов');
LastNameList.Add('Афанасьев');
LastNameList.Add('Власов');
LastNameList.Add('Маслов');
LastNameList.Add('Исаков');
LastNameList.Add('Тихонов');
LastNameList.Add('Аксёнов');
LastNameList.Add('Гаврилов');
LastNameList.Add('Родионов');
LastNameList.Add('Котов');
LastNameList.Add('Горбунов');
LastNameList.Add('Кудряшов');
LastNameList.Add('Быков');
LastNameList.Add('Зуев');
LastNameList.Add('Третьяков');
LastNameList.Add('Савельев');
LastNameList.Add('Панов');
LastNameList.Add('Рыбаков');
LastNameList.Add('Суворов');
LastNameList.Add('Абрамов');
LastNameList.Add('Воронов');
LastNameList.Add('Мухин');
LastNameList.Add('Архипов');
LastNameList.Add('Трофимов');
LastNameList.Add('Мартынов');
LastNameList.Add('Емельянов');
LastNameList.Add('Горшков');
LastNameList.Add('Чернов');
LastNameList.Add('Овчинников');
LastNameList.Add('Селезнёв');
LastNameList.Add('Панфилов');
LastNameList.Add('Копылов');
LastNameList.Add('Михеев');
LastNameList.Add('Галкин');
LastNameList.Add('Назаров');
LastNameList.Add('Лобанов');
LastNameList.Add('Лукин');
LastNameList.Add('Беляков');
LastNameList.Add('Потапов');
LastNameList.Add('Некрасов');
LastNameList.Add('Хохлов');
LastNameList.Add('Жданов');
LastNameList.Add('Наумов');
LastNameList.Add('Шилов');
LastNameList.Add('Воронцов');
LastNameList.Add('Ермаков');
LastNameList.Add('Дроздов');
LastNameList.Add('Игнатьев');
LastNameList.Add('Савин');
LastNameList.Add('Логинов');
LastNameList.Add('Сафонов');
LastNameList.Add('Капустин');
LastNameList.Add('Кириллов');
LastNameList.Add('Моисеев');
LastNameList.Add('Елисеев');
LastNameList.Add('Кошелев');
LastNameList.Add('Костин');
LastNameList.Add('Горбачёв');
LastNameList.Add('Орехов');
LastNameList.Add('Ефремов');
LastNameList.Add('Исаев');
LastNameList.Add('Евдокимов');
LastNameList.Add('Калашников');
LastNameList.Add('Кабанов');
LastNameList.Add('Носков');
LastNameList.Add('Юдин');
LastNameList.Add('Кулагин');
LastNameList.Add('Лапин');
LastNameList.Add('Прохоров');
LastNameList.Add('Нестеров');
LastNameList.Add('Харитонов');
LastNameList.Add('Агафонов');
LastNameList.Add('Муравьёв');
LastNameList.Add('Ларионов');
LastNameList.Add('Федосеев');
LastNameList.Add('Зимин');
LastNameList.Add('Пахомов');
LastNameList.Add('Шубин');
LastNameList.Add('Игнатов');
LastNameList.Add('Филатов');
LastNameList.Add('Крюков');
LastNameList.Add('Рогов');
LastNameList.Add('Кулаков');
LastNameList.Add('Терентьев');
LastNameList.Add('Молчанов');
LastNameList.Add('Владимиров');
LastNameList.Add('Артемьев');
LastNameList.Add('Гурьев');
LastNameList.Add('Зиновьев');
LastNameList.Add('Гришин');
LastNameList.Add('Кононов');
LastNameList.Add('Дементьев');
LastNameList.Add('Ситников');
LastNameList.Add('Симонов');
LastNameList.Add('Мишин');
LastNameList.Add('Фадеев');
LastNameList.Add('Комиссаров');
LastNameList.Add('Мамонтов');
LastNameList.Add('Носов');
LastNameList.Add('Гуляев');
LastNameList.Add('Шаров');
LastNameList.Add('Устинов');
LastNameList.Add('Вишняков');
LastNameList.Add('Евсеев');
LastNameList.Add('Лаврентьев');
LastNameList.Add('Брагин');
LastNameList.Add('Константинов');
LastNameList.Add('Корнилов');
LastNameList.Add('Авдеев');
LastNameList.Add('Зыков');
LastNameList.Add('Бирюков');
LastNameList.Add('Шарапов');
LastNameList.Add('Никонов');
LastNameList.Add('Щукин');
LastNameList.Add('Дьячков');
LastNameList.Add('Одинцов');
LastNameList.Add('Сазонов');
LastNameList.Add('Якушев');
LastNameList.Add('Красильников');
LastNameList.Add('Гордеев');
LastNameList.Add('Самойлов');
LastNameList.Add('Князев');
LastNameList.Add('Беспалов');
LastNameList.Add('Уваров');
LastNameList.Add('Шашков');
LastNameList.Add('Бобылёв');
LastNameList.Add('Доронин');
LastNameList.Add('Белозёров');
LastNameList.Add('Рожков');
LastNameList.Add('Самсонов');
LastNameList.Add('Мясников');
LastNameList.Add('Лихачёв');
LastNameList.Add('Буров');
LastNameList.Add('Сысоев');
LastNameList.Add('Фомичёв');
LastNameList.Add('Русаков');
LastNameList.Add('Стрелков');
LastNameList.Add('Гущин');
LastNameList.Add('Тетерин');
LastNameList.Add('Колобов');
LastNameList.Add('Субботин');
LastNameList.Add('Фокин');
LastNameList.Add('Блохин');
LastNameList.Add('Селиверстов');
LastNameList.Add('Пестов');
LastNameList.Add('Кондратьев');
LastNameList.Add('Силин');
LastNameList.Add('Меркушев');
LastNameList.Add('Лыткин');
LastNameList.Add('Туров');



MiddleNameList.Add('Александрович');
MiddleNameList.Add('Адамович');
MiddleNameList.Add('Анатольевич');
MiddleNameList.Add('Аркадьевич');
MiddleNameList.Add('Алексеевич');
MiddleNameList.Add('Андреевич');
MiddleNameList.Add('Артемович');
MiddleNameList.Add('Альбертович');
MiddleNameList.Add('Антонович');
MiddleNameList.Add('Богданович');
MiddleNameList.Add('Богуславович');
MiddleNameList.Add('Борисович');
MiddleNameList.Add('Вадимович');
MiddleNameList.Add('Васильевич');
MiddleNameList.Add('Владимирович');
MiddleNameList.Add('Валентинович');
MiddleNameList.Add('Вениаминович');
MiddleNameList.Add('Вячеславович');
MiddleNameList.Add('Валерьевич');
MiddleNameList.Add('Викторович');
MiddleNameList.Add('Геннадиевич');
MiddleNameList.Add('Георгиевич');
MiddleNameList.Add('Геннадьевич');
MiddleNameList.Add('Григорьевич');
MiddleNameList.Add('Давидович');
MiddleNameList.Add('Денисович');
MiddleNameList.Add('Данилович');
MiddleNameList.Add('Дмитриевич');
MiddleNameList.Add('Евгеньевич');
MiddleNameList.Add('Егорович');
MiddleNameList.Add('Ефимович');
MiddleNameList.Add('Иванович');
MiddleNameList.Add('Ильич');
MiddleNameList.Add('Игоревич');
MiddleNameList.Add('Иосифович');
MiddleNameList.Add('Кириллович');
MiddleNameList.Add('Константинович');
MiddleNameList.Add('Леонидович');
MiddleNameList.Add('Львович');
MiddleNameList.Add('Макарович');
MiddleNameList.Add('Максович');
MiddleNameList.Add('Миронович');
MiddleNameList.Add('Максимович');
MiddleNameList.Add('Матвеевич');
MiddleNameList.Add('Михайлович');
MiddleNameList.Add('Натанович');
MiddleNameList.Add('Наумович');
MiddleNameList.Add('Николаевич');
MiddleNameList.Add('Олегович');
MiddleNameList.Add('Оскарович');
MiddleNameList.Add('Павлович');
MiddleNameList.Add('Петрович');
MiddleNameList.Add('Платонович');
MiddleNameList.Add('Робертович');
MiddleNameList.Add('Ростиславович');
MiddleNameList.Add('Рудольфович');
MiddleNameList.Add('Романович');
MiddleNameList.Add('Рубенович');
MiddleNameList.Add('Русланович');
MiddleNameList.Add('Святославович');
MiddleNameList.Add('Сергеевич');
MiddleNameList.Add('Степанович');
MiddleNameList.Add('Семенович');
MiddleNameList.Add('Станиславович');
MiddleNameList.Add('Тарасович');
MiddleNameList.Add('Тимофеевич');
MiddleNameList.Add('Тимурович');
MiddleNameList.Add('Федорович');
MiddleNameList.Add('Феликсович');
MiddleNameList.Add('Филиппович');
MiddleNameList.Add('Харитонович');
MiddleNameList.Add('Эдуардович');
MiddleNameList.Add('Эмануилович');
MiddleNameList.Add('Эльдарович');
MiddleNameList.Add('Юрьевич');
MiddleNameList.Add('Юхимович');
MiddleNameList.Add('Яковлевич');
MiddleNameList.Add('Ярославович');

FirstNameList2.Add('Алевтина');
FirstNameList2.Add('Александра');
FirstNameList2.Add('Алина');
FirstNameList2.Add('Алла');
FirstNameList2.Add('Анастасия');
FirstNameList2.Add('Ангелина');
FirstNameList2.Add('Анжела');
FirstNameList2.Add('Анжелика');
FirstNameList2.Add('Анна');
FirstNameList2.Add('Антонина');
FirstNameList2.Add('Валентина');
FirstNameList2.Add('Валерия');
FirstNameList2.Add('Варвара');
FirstNameList2.Add('Василиса');
FirstNameList2.Add('Вера');
FirstNameList2.Add('Вероника');
FirstNameList2.Add('Виктория');
FirstNameList2.Add('Галина');
FirstNameList2.Add('Дана');
FirstNameList2.Add('Дарья');
FirstNameList2.Add('Евгения');
FirstNameList2.Add('Евдокия');
FirstNameList2.Add('Екатерина');
FirstNameList2.Add('Елена');
FirstNameList2.Add('Елизавета');
FirstNameList2.Add('Жанна');
FirstNameList2.Add('Зинаида');
FirstNameList2.Add('Злата');
FirstNameList2.Add('Зоя');
FirstNameList2.Add('Иванна');
FirstNameList2.Add('Инга');
FirstNameList2.Add('Инесса');
FirstNameList2.Add('Ирина');
FirstNameList2.Add('Карина');
FirstNameList2.Add('Каролина');
FirstNameList2.Add('Кира');
FirstNameList2.Add('Клавдия');
FirstNameList2.Add('Ксения');
FirstNameList2.Add('Лада');
FirstNameList2.Add('Лариса');
FirstNameList2.Add('Лидия');
FirstNameList2.Add('Лилия');
FirstNameList2.Add('Любовь');
FirstNameList2.Add('Людмила');
FirstNameList2.Add('Маргарита');
FirstNameList2.Add('Марина');
FirstNameList2.Add('Мария');
FirstNameList2.Add('Марфа');
FirstNameList2.Add('Матрёна');
FirstNameList2.Add('Мирослава');
FirstNameList2.Add('Надежда');
FirstNameList2.Add('Наина');
FirstNameList2.Add('Наталья');
FirstNameList2.Add('Нина');
FirstNameList2.Add('Нонна');
FirstNameList2.Add('Оксана');
FirstNameList2.Add('Ольга');
FirstNameList2.Add('Полина');
FirstNameList2.Add('Прасковья');
FirstNameList2.Add('Раиса');
FirstNameList2.Add('Светлана');
FirstNameList2.Add('Снежана');
FirstNameList2.Add('София');
FirstNameList2.Add('Таисия');
FirstNameList2.Add('Тамара');
FirstNameList2.Add('Татьяна');
FirstNameList2.Add('Ульяна');
FirstNameList2.Add('Фаина');
FirstNameList2.Add('Целестина');
FirstNameList2.Add('Юлия');
FirstNameList2.Add('Яна');
FirstNameList2.Add('Ярослава');

SecondNameList2.Add('Иванова');
SecondNameList2.Add('Смирнова');
SecondNameList2.Add('Кузнецова');
SecondNameList2.Add('Попова');
SecondNameList2.Add('Соколова');
SecondNameList2.Add('Лебедева');
SecondNameList2.Add('Козлова');
SecondNameList2.Add('Новикова');
SecondNameList2.Add('Морозова');
SecondNameList2.Add('Петрова');
SecondNameList2.Add('Волкова');
SecondNameList2.Add('Соловаьева');
SecondNameList2.Add('Васильева');
SecondNameList2.Add('Зайцева');
SecondNameList2.Add('Павлова');
SecondNameList2.Add('Семенова');
SecondNameList2.Add('Голубева');
SecondNameList2.Add('Виноградова');
SecondNameList2.Add('Богданова');
SecondNameList2.Add('Воробьева');
SecondNameList2.Add('Федорова');
SecondNameList2.Add('Михайлова');
SecondNameList2.Add('Беляева');
SecondNameList2.Add('Тарасова');
SecondNameList2.Add('Белова');
SecondNameList2.Add('Комарова');
SecondNameList2.Add('Орлова');
SecondNameList2.Add('Киселева');
SecondNameList2.Add('Макарова');
SecondNameList2.Add('Андреева');
SecondNameList2.Add('Ковалёва');
SecondNameList2.Add('Ильина');
SecondNameList2.Add('Гусева');
SecondNameList2.Add('Титова');
SecondNameList2.Add('Кузьмина');
SecondNameList2.Add('Кудрявцева');
SecondNameList2.Add('Баранова');
SecondNameList2.Add('Куликова');
SecondNameList2.Add('Алексеева');
SecondNameList2.Add('Степанова');
SecondNameList2.Add('Яковалева');
SecondNameList2.Add('Сорокина');
SecondNameList2.Add('Сергеева');
SecondNameList2.Add('Романова');
SecondNameList2.Add('Захарова');
SecondNameList2.Add('Борисова');
SecondNameList2.Add('Королева');
SecondNameList2.Add('Герасимова');
SecondNameList2.Add('Пономарёва');
SecondNameList2.Add('Григорьева');
SecondNameList2.Add('Лазарева');
SecondNameList2.Add('Медведева');
SecondNameList2.Add('Ершова');
SecondNameList2.Add('Никитина');
SecondNameList2.Add('Соболева');
SecondNameList2.Add('Рябова');
SecondNameList2.Add('Полякова');
SecondNameList2.Add('Цветкова');
SecondNameList2.Add('Данилова');
SecondNameList2.Add('Жукова');
SecondNameList2.Add('Фролова');
SecondNameList2.Add('Журавлева');
SecondNameList2.Add('Николаева');
SecondNameList2.Add('Крылова');
SecondNameList2.Add('Максимова');
SecondNameList2.Add('Сидорова');
SecondNameList2.Add('Осипова');
SecondNameList2.Add('Белоусова');
SecondNameList2.Add('Федотова');
SecondNameList2.Add('Дорофеева');
SecondNameList2.Add('Егорова');
SecondNameList2.Add('Матвеева');
SecondNameList2.Add('Боброва');
SecondNameList2.Add('Дмитриева');
SecondNameList2.Add('Калинина');
SecondNameList2.Add('Анисимова');
SecondNameList2.Add('Петухова');
SecondNameList2.Add('Антонова');
SecondNameList2.Add('Тимофеева');
SecondNameList2.Add('Никифорова');
SecondNameList2.Add('Веселова');
SecondNameList2.Add('Филиппова');
SecondNameList2.Add('Маркова');
SecondNameList2.Add('Большакова');
SecondNameList2.Add('Суханова');
SecondNameList2.Add('Миронова');
SecondNameList2.Add('Ширяева');
SecondNameList2.Add('Александрова');
SecondNameList2.Add('Коновалова');
SecondNameList2.Add('Шестакова');
SecondNameList2.Add('Казакова');
SecondNameList2.Add('Ефимова');
SecondNameList2.Add('Денисова');
SecondNameList2.Add('Громова');
SecondNameList2.Add('Фомина');
SecondNameList2.Add('Давыдова');
SecondNameList2.Add('Мельникова');
SecondNameList2.Add('Щербакова');
SecondNameList2.Add('Блинова');
SecondNameList2.Add('Колесникова');
SecondNameList2.Add('Ерёмина');


MiddleNameList2.Add('Александровна');
MiddleNameList2.Add('Андреевна');
MiddleNameList2.Add('Архиповна');
MiddleNameList2.Add('Алексеевна');
MiddleNameList2.Add('Антоновна');
MiddleNameList2.Add('Аскольдовна');
MiddleNameList2.Add('Альбертовна');
MiddleNameList2.Add('Аркадьевна');
MiddleNameList2.Add('Афанасьевна');
MiddleNameList2.Add('Анатольевна');
MiddleNameList2.Add('Артемовна');
MiddleNameList2.Add('Богдановна');
MiddleNameList2.Add('Болеславовна');
MiddleNameList2.Add('Борисовна');
MiddleNameList2.Add('Вадимовна');
MiddleNameList2.Add('Васильевна');
MiddleNameList2.Add('Владимировна');
MiddleNameList2.Add('Валентиновна');
MiddleNameList2.Add('Вениаминовна');
MiddleNameList2.Add('Владиславовна');
MiddleNameList2.Add('Валериевна');
MiddleNameList2.Add('Викторовна');
MiddleNameList2.Add('Вячеславовна');
MiddleNameList2.Add('Геннадиевна');
MiddleNameList2.Add('Георгиевна');
MiddleNameList2.Add('Геннадьевна');
MiddleNameList2.Add('Григорьевна');
MiddleNameList2.Add('Даниловна');
MiddleNameList2.Add('Дмитриевна');
MiddleNameList2.Add('Евгеньевна');
MiddleNameList2.Add('Егоровна');
MiddleNameList2.Add('Ефимовна');
MiddleNameList2.Add('Ждановна');
MiddleNameList2.Add('Захаровна');
MiddleNameList2.Add('Ивановна');
MiddleNameList2.Add('Игоревна');
MiddleNameList2.Add('Ильинична');
MiddleNameList2.Add('Кирилловна');
MiddleNameList2.Add('Кузминична');
MiddleNameList2.Add('Константиновна');
MiddleNameList2.Add('Кузьминична');
MiddleNameList2.Add('Леонидовна');
MiddleNameList2.Add('Леоновна');
MiddleNameList2.Add('Львовна');
MiddleNameList2.Add('Макаровна');
MiddleNameList2.Add('Матвеевна');
MiddleNameList2.Add('Михайловна');
MiddleNameList2.Add('Максимовна');
MiddleNameList2.Add('Мироновна');
MiddleNameList2.Add('Натановна');
MiddleNameList2.Add('Никифоровна');
MiddleNameList2.Add('Ниловна');
MiddleNameList2.Add('Наумовна');
MiddleNameList2.Add('Николаевна');
MiddleNameList2.Add('Олеговна');
MiddleNameList2.Add('Оскаровна');
MiddleNameList2.Add('Павловна');
MiddleNameList2.Add('Петровна');
MiddleNameList2.Add('Робертовна');
MiddleNameList2.Add('Рубеновна');
MiddleNameList2.Add('Руслановна');
MiddleNameList2.Add('Романовна');
MiddleNameList2.Add('Рудольфовна');
MiddleNameList2.Add('Святославовна');
MiddleNameList2.Add('Сергеевна');
MiddleNameList2.Add('Степановна');
MiddleNameList2.Add('Семеновна');
MiddleNameList2.Add('Станиславовна');
MiddleNameList2.Add('Тарасовна');
MiddleNameList2.Add('Тимофеевна');
MiddleNameList2.Add('Тимуровна');
MiddleNameList2.Add('Федоровна');
MiddleNameList2.Add('Феликсовна');
MiddleNameList2.Add('Филипповна');
MiddleNameList2.Add('Харитоновна');
MiddleNameList2.Add('Эдуардовна');
MiddleNameList2.Add('Эльдаровна');
MiddleNameList2.Add('Юльевна');
MiddleNameList2.Add('Юрьевна');
MiddleNameList2.Add('Яковлевна');


finalization
 FirstNameList.Free;
 LastNameList.Free;
 MiddleNameList.Free;

 FirstNameList2.Free;
 SecondNameList2.Free;
 MiddleNameList2.Free;

end.


