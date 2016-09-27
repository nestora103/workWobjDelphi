unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, math;

type
  //���������� ������ �����
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  //�������� ������
  //TMyObject-��� ������ ������. TObject-��� ������ ��������
  TMyObject = class(TObject) //������������� ������   TMyObject = class. ��� ��� �������� TObject
  //�������� ������ ������
  MyField: Integer;
  //��������� ���� ����������� ������
  Constructor Create;
  //��������� ���� ���������� ������
  Destructor Destroy;
  //����� ������ ������(����������)
  function MyMethod:integer;
  end;

var
  //���������� ���������� �����
  Form1: TForm1;
  //��������� ���������� ��� �������� �������
  myObj:TMyObject;
implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
//�������� �������. ������ ������������ ������.
myObj:=TMyObject.Create;
//���������� �������� ������� ��������
//myObj.MyField:=110;
memo1.Lines.Add(IntToStr(myObj.MyField));
memo1.Lines.Add(IntToStr(myObj.MyMethod));
//����������� �������. ������� ��������� ��� ������ ��� ������(���������).
//����� �������� ����� destroy
myObj.Destroy;  //��� ������ �������������� ������ Free.
end;

//����������� ������� �������
function TMyObject.MyMethod():integer;
begin
result:=1;
end;

constructor TMyObject.Create;
begin
//������� �� ������������ ������. ����������� ��������.
inherited Create;
randomize;
//����� ����� ���������������� ����� ��������� ������ ��� �����
MyField:=Random(100);

end;

destructor TMyObject.Destroy;
begin
//������� �� ����������� ������. ���������� ��������.
inherited Destroy;
ShowMessage('���������');
end;



end.
