unit laba12;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    NameEdit: TEdit;
    AgeEdit: TEdit;
    PassFile: TEdit;
    MathEdit: TEdit;
    AngEdit: TEdit;
    InfEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
type
  student = record
    name : string[20];
    age : integer;
    marks : array[1..3] of integer;
  end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label5Click(Sender: TObject);
begin

end;

procedure TForm1.NameEditChange(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  f:file of student;
  stud:student;
begin
  if (PassFile.text = '') then
     MessageDlg('Вы не ввели путь к файлу!', mtError, mbOKCancel, 0)
  else if  (NameEdit.text = '') then
     MessageDlg('Вы не ввели имя!', mtError, mbOKCancel, 0)
  else if  (AgeEdit.text = '') then
     MessageDlg('Вы не ввели возраст!', mtError, mbOKCancel, 0)
  else if  ((MathEdit.text = '') or (AngEdit.text = '') or (InfEdit.text = '')) then
     MessageDlg('Вы не ввели оценки!', mtError, mbOKCancel, 0)
  else
      begin
        stud.name := NameEdit.text;
        stud.age := StrToInt(AgeEdit.text);
        stud.marks[1] := StrToInt(MathEdit.text);
        stud.marks[2] := StrToInt(AngEdit.text);
        stud.marks[3] := StrToInt(InfEdit.text);

        assignfile(f, Passfile.text);
        rewrite(f);
        write(f, stud);
        closefile(f);
        MessageDlg('Успешная запись!', mtCustom, mbOKCancel, 0);
      end;
end;
end.

