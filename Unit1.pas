unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, math;

type
  //объ€вление класса формы
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  //ќписание класса
  //TMyObject-им€ нового класса. TObject-им€ класса родител€
  TMyObject = class(TObject) //эквивалентна€ запись   TMyObject = class. так как родитель TObject
  //свойство нового класса
  MyField: Integer;
  //объ€вл€ем свой конструктор класса
  Constructor Create;
  //объ€вл€ем свой деструктор класса
  Destructor Destroy;
  //метод нового класса(ќбъ€вление)
  function MyMethod:integer;
  end;

var
  //объ€вление экземпл€ра формы
  Form1: TForm1;
  //объ€вл€ем переменную дл€ создани€ объекта
  myObj:TMyObject;
implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
//создание объекта. «апуск конструктора метода.
myObj:=TMyObject.Create;
//присвоение свойству объекта значени€
//myObj.MyField:=110;
memo1.Lines.Add(IntToStr(myObj.MyField));
memo1.Lines.Add(IntToStr(myObj.MyMethod));
//уничтожение объекта. —начала провер€ем что объект был создан(указатель).
//потом вызываем метод destroy
myObj.Destroy;  //при вызове рекомендуемого метода Free.
end;

//ќпределение функции объекта
function TMyObject.MyMethod():integer;
begin
result:=1;
end;

constructor TMyObject.Create;
begin
//вызовем из конструктора класса.  онструктор родител€.
inherited Create;
randomize;
//далее можем инициализировать новый экземпл€р класса как хотим
MyField:=Random(100);

end;

destructor TMyObject.Destroy;
begin
//вызовем из деструктора класса. ƒеструктор родител€.
inherited Destroy;
ShowMessage('«акрылось');
end;



end.
