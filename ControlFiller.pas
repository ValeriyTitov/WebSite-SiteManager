unit ControlFiller;

interface
 Uses DAC.XDataSet, DB, Classes, SysUtils, cxDBEdit, cxImageComboBox, Variants;

 type
   TControlFiller=class
    public
     class procedure FillDropDownStatic(DropDown:TcxDBImageComboBox;const Text:String);
     class procedure FillDropDown(DropDown:TcxDBImageComboBox;ProviderName,DBName:String);
     class procedure FillDropDownEx(DropDown:TcxDBImageComboBox;ProviderName,ParamName:String;ParamValue:Variant; DBName:String);
     class procedure FillDropDownDataSet(DropDown:TcxDBImageComboBox; DataSet:TDataSet);
     class procedure AddDropDownItem(DropDown:TcxDBImageComboBox; const ImageIndex:Integer; const Description:String; Value:Variant);
   end;

implementation

{ TControlFiller }

class procedure TControlFiller.FillDropDownDataSet(DropDown: TcxDBImageComboBox; DataSet: TDataSet);
var
 Item:TcxImageComboBoxItem;
begin
 while not DataSet.Eof do
  begin
    Item:=DropDown.Properties.Items.Add;
    Item.ImageIndex:=DataSet.FieldByName('ImageIndex').AsInteger;
    Item.Value:=DataSet.FieldByName('Value').Value;
    Item.Description:=DataSet.FieldByName('Description').AsString;
    DataSet.Next;
  end;
end;

class procedure TControlFiller.FillDropDownEx(DropDown:TcxDBImageComboBox; ProviderName, ParamName: String;  ParamValue: Variant; DBName: String);
var
 Tmp:TxDataSet;
begin
 Tmp:=TxDataSet.Create(nil);
  try
   Tmp.ProviderName:=ProviderName;
   Tmp.DBName:=DBName;
   if ParamName<>'' then
    Tmp.SetParameter(ParamName,ParamValue);
   Tmp.Open;
   FillDropDownDataSet(DropDown, Tmp);
  finally
   Tmp.Free;
  end;
end;

class procedure TControlFiller.FillDropDownStatic(DropDown: TcxDBImageComboBox;  const Text: String);
var
 List:TStringList;
 X:Integer;
 Item:TcxImageComboBoxItem;
begin
 List:=TStringList.Create;
  try
   List.Text:=Text;
    for x:=0 to List.Count-1 do
     begin
      Item:=DropDown.Properties.Items.Add;
      Item.Description:=List[x];
     end;

  finally
   List.Free;
  end;

end;

class procedure TControlFiller.AddDropDownItem(DropDown: TcxDBImageComboBox; const ImageIndex: Integer; const Description: String; Value: Variant);
var
 Item:TcxImageComboBoxItem;
begin
  Item:=DropDown.Properties.Items.Add;
  Item.ImageIndex:=ImageIndex;
  Item.Value:=Value;
  Item.Description:=Description;
end;

class procedure TControlFiller.FillDropDown(DropDown:TcxDBImageComboBox;ProviderName:String; DBName: String);
begin
 FillDropDownEx(DropDown,ProviderName,'',0,DBName);
end;

end.
