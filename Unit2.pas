unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Unit1;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    RichEdit1: TRichEdit;
    Button3: TButton;
    Timer1: TTimer;
    RadioGroup2: TRadioGroup;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    GroupBox2: TGroupBox;
    Memo2: TMemo;
    RichEdit2: TRichEdit;
    GroupBox3: TGroupBox;
    Memo3: TMemo;
    RichEdit3: TRichEdit;
    Button6: TButton;
    FontDialog1: TFontDialog;
    Bevel2: TBevel;
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


procedure TForm2.Timer1Timer(Sender: TObject);
begin
if RadioGroup2.ItemIndex=-1
then
begin
Button1.Enabled:=false;
Button2.Enabled:=false;
Button3.Enabled:=false;
Button4.Enabled:=false;
Button5.Enabled:=false;
Button6.Enabled:=false;
end
else
begin
Button1.Enabled:=true;
Button2.Enabled:=true;
Button3.Enabled:=true;
Button4.Enabled:=true;
Button5.Enabled:=true;
Button6.Enabled:=true;
end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
case RadioGroup2.ItemIndex of
0:memo1.Lines.LoadFromFile(OpenDialog1.FileName);
1:memo2.Lines.LoadFromFile(OpenDialog1.FileName);
2:memo3.Lines.LoadFromFile(OpenDialog1.FileName);
end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
if OpenDialog2.Execute then
case RadioGroup2.ItemIndex of
0:RichEdit1.Lines.LoadFromFile(OpenDialog2.FileName);
1:RichEdit2.Lines.LoadFromFile(OpenDialog2.FileName);
2:RichEdit3.Lines.LoadFromFile(OpenDialog2.FileName);
end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
case RadioGroup2.ItemIndex of
0:Memo1.Lines.Add(inttostr(form1.MediaPlayer1.Position));
1:Memo2.Lines.Add(inttostr(form1.MediaPlayer1.Position));
2:Memo3.Lines.Add(inttostr(form1.MediaPlayer1.Position));
end;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
if SaveDialog1.Execute then
case RadioGroup2.ItemIndex of
0:memo1.Lines.SaveToFile(SaveDialog1.FileName);
1:memo2.Lines.SaveToFile(SaveDialog1.FileName);
2:memo3.Lines.SaveToFile(SaveDialog1.FileName);
end;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
if SaveDialog2.Execute then
case RadioGroup2.ItemIndex of
0:RichEdit1.Lines.SaveToFile(SaveDialog2.FileName);
1:RichEdit2.Lines.SaveToFile(SaveDialog2.FileName);
2:RichEdit3.Lines.SaveToFile(SaveDialog2.FileName);
end;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
if FontDialog1.Execute then
case RadioGroup2.ItemIndex of
0:RichEdit1.Font:=FontDialog1.Font;
1:RichEdit1.Font:=FontDialog1.Font;
2:RichEdit1.Font:=FontDialog1.Font;
end;
end;

end.
