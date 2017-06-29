unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel4: TBevel;
    MediaPlayer1: TMediaPlayer;
    Button1: TButton;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    TrackBar1: TTrackBar;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    procedure TrackBar1Change(Sender: TObject);

    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
      var DoDefault: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;


implementation
uses Unit2;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
MediaPlayer1.Close;
MediaPlayer1.FileName:=OpenDialog1.FileName;
MediaPlayer1.Open;
TrackBar1.Max:= MediaPlayer1.Length;
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
form2.Show;
end;


procedure TForm1.MediaPlayer1Click(Sender: TObject; Button: TMPBtnType;
  var DoDefault: Boolean);
begin
case button of
btPlay: begin
TrackBar1.Max:= MediaPlayer1.Length;
if TrackBar1.Position<>MediaPlayer1.Position
then MediaPlayer1.Position:=TrackBar1.Position;
timer1.Enabled:=true;
label1.Caption:='Длинна: '+inttostr(MediaPlayer1.Length);end;
btPause:timer1.Enabled:=false;
btStop:begin timer1.Enabled:=false; TrackBar1.Position:=0; end;
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i: word;
begin

TrackBar1.Position:=MediaPlayer1.Position;


if form2.Memo1.Lines.Count=0
then RichEdit1.Text:='Текст песни для даного потока отсутствует, либо не подгружен.';
if form2.Memo2.Lines.Count=0
then RichEdit2.Text:='Текст песни для даного потока отсутствует, либо не подгружен.';
if form2.Memo3.Lines.Count=0
then RichEdit3.Text:='Текст песни для даного потока отсутствует, либо не подгружен.';

i:=1;
while form2.Memo1.lines[i]<>'' do
BEgin
if MediaPlayer1.Position=strtoint(form2.Memo1.Lines[i])
then RichEdit1.Text:=form2.RichEdit1.Lines[i];
i:=i+1;
ENd;
while form2.Memo2.lines[i]<>'' do
BEgin
if MediaPlayer1.Position=strtoint(form2.Memo2.Lines[i])
then RichEdit2.Text:=form2.RichEdit2.Lines[i];
i:=i+1;
ENd;
while form2.Memo3.lines[i]<>'' do
BEgin
if MediaPlayer1.Position=strtoint(form2.Memo3.Lines[i])
then RichEdit3.Text:=form2.RichEdit3.Lines[i];
i:=i+1;
ENd;

//button2.Caption:=form2.Memo1.Lines[1];
//'Нет текста на текущи момент проигрывания'
//label2.Caption:='Проигр.: '+inttostr(MediaPlayer1.Position);
end;





procedure TForm1.TrackBar1Change(Sender: TObject);
begin
label2.Caption:='Проигр.: '+inttostr(TrackBar1.Position);
end;

{timer1.Enabled:=false;
MediaPlayer1.Pause;
MediaPlayer1.Position:=TrackBar1.Position;
MediaPlayer1.Play;
timer1.Enabled:=true;}


end.
