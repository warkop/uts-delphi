unit ubebek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, GIFImg, pngimage, StdCtrls, Menus, MPlayer;

type
  TForm1 = class(TForm)
    a: TImage;
    Image2: TImage;
    bebek: TImage;
    mobil1: TImage;
    Timermobil1: TTimer;
    lbnyawa: TLabel;
    mobil2: TImage;
    mobil3: TImage;
    mobil5: TImage;
    mobil4: TImage;
    mobil6: TImage;
    mobil7: TImage;
    mobil8: TImage;
    mobil9: TImage;
    Timermobil3: TTimer;
    mobil11: TImage;
    mobil12: TImage;
    mobil10: TImage;
    Timermobil4: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbnilai: TLabel;
    kandang: TImage;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Start1: TMenuItem;
    Music1: TMenuItem;
    On1: TMenuItem;
    Off1: TMenuItem;
    MediaPlayer1: TMediaPlayer;
    Pause1: TMenuItem;
    Resume1: TMenuItem;
    Level1: TMenuItem;
    Exit1: TMenuItem;
    Easy1: TMenuItem;
    Normal1: TMenuItem;
    Hard1: TMenuItem;
    Unfair1: TMenuItem;
    gameover: TLabel;
    Restart1: TMenuItem;
    Label3: TLabel;
    lblevel: TLabel;
    timerlvl: TTimer;
    Timermobil2: TTimer;
    lbwin: TLabel;
    procedure Timermobil1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tabrakmobil();
    procedure tabrakkandang();
    procedure Timermobil2Timer(Sender: TObject);
    procedure Timermobil3Timer(Sender: TObject);
    procedure Timermobil4Timer(Sender: TObject);
    procedure On1Click(Sender: TObject);
    procedure Off1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure stop();
    procedure resume();
    procedure Pause1Click(Sender: TObject);
    procedure Restart1Click(Sender: TObject);
    procedure Resume1Click(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Easy1Click(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure Hard1Click(Sender: TObject);
    procedure Unfair1Click(Sender: TObject);
    procedure timerlvlTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var kiri : Boolean;
{$R *.dfm}

procedure TForm1.Easy1Click(Sender: TObject);
begin
  lblevel.Caption := 'Easy';
  Timermobil1.Interval := 90;
  Timermobil2.Interval := 60;
  Timermobil3.Interval := 90;
  Timermobil4.Interval := 60;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
kiri := false;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key = VK_RETURN) then     //Restart Game
begin
  bebek.Top:=576;
  bebek.Left := ClientWidth div 2 - bebek.Width div 2;
  lbnyawa.Caption := '5';
  lbnilai.Caption := '0';
  resume();
end;
if (Key = VK_SPACE) then    //Resume and Start Game
begin
  resume();
end;
if (Key = VK_F1) then   //pause game
begin
  stop();
end;
if (Timermobil1.Enabled = True) then    //bebek bisa digerakkan jika timermobil jalan
begin
if Key = VK_UP then
begin
tabrakkandang();
  bebek.Top := bebek.Top - 10;
end
else if Key = VK_DOWN then
begin
tabrakkandang();
  bebek.Top := bebek.Top + 10;
end
else if Key = VK_LEFT then
begin
tabrakkandang();
  bebek.Left := bebek.Left - 10;
end
else if Key = VK_RIGHT then
begin
tabrakkandang();
  bebek.Left := bebek.Left + 10;
end;
end;
end;

procedure TForm1.Hard1Click(Sender: TObject);
begin
  lblevel.Caption := 'Hard';
  Timermobil1.Interval := 40;
  Timermobil2.Interval := 20;
  Timermobil3.Interval := 40;
  Timermobil4.Interval := 20;
end;

procedure TForm1.Normal1Click(Sender: TObject);
begin
  lblevel.Caption := 'Normal';
  Timermobil1.Interval := 75;
  Timermobil2.Interval := 40;
  Timermobil3.Interval := 75;
  Timermobil4.Interval := 40;
end;

procedure TForm1.Off1Click(Sender: TObject);
begin
MediaPlayer1.Stop;
end;

procedure TForm1.On1Click(Sender: TObject);
begin
MediaPlayer1.Play;
end;

procedure TForm1.Pause1Click(Sender: TObject);
begin
stop();
end;

procedure TForm1.Restart1Click(Sender: TObject);
begin
lbnyawa.Caption := '5';
lbnilai.Caption := '0';
resume();
end;

procedure TForm1.Timermobil4Timer(Sender: TObject);
begin
tabrakmobil();
mobil10.Left := mobil10.Left + 5;
mobil11.Left := mobil11.Left + 5;
mobil12.Left := mobil12.Left + 5;
if (mobil10.Left >= ClientWidth) then
begin
  mobil10.Left := - mobil10.Width;
end
else if (mobil11.Left >= ClientWidth) then
begin
  mobil11.Left := - mobil11.Width;
end
else if (mobil12.Left >= ClientWidth) then
begin
  mobil12.Left := - mobil12.Width;
end;
end;

procedure TForm1.Timermobil1Timer(Sender: TObject);
begin
tabrakmobil();
mobil1.Left := mobil1.Left - 5;
mobil2.Left := mobil2.Left - 5;
mobil3.Left := mobil3.Left - 5;
if (mobil1.Left + mobil1.Width <= 0) then
begin
  mobil1.Left := ClientWidth;
end
else if (mobil2.Left + mobil2.Width <= 0) then
begin
  mobil2.Left := ClientWidth;
end
else if (mobil3.Left + mobil3.Width <= 0) then
begin
  mobil3.Left := ClientWidth;
end;
end;

procedure TForm1.Timermobil2Timer(Sender: TObject);
begin
tabrakmobil();
mobil4.Left := mobil4.Left - 5;
mobil5.Left := mobil5.Left - 5;
mobil6.Left := mobil6.Left - 5;
if (mobil4.Left + mobil4.Width <= 0) then
begin
  mobil4.Left := ClientWidth;
end
else if (mobil5.Left + mobil5.Width <= 0) then
begin
  mobil5.Left := ClientWidth;
end
else if (mobil6.Left + mobil6.Width <= 0) then
begin
  mobil6.Left := ClientWidth;
end;
end;

procedure TForm1.Timermobil3Timer(Sender: TObject);
begin
tabrakmobil();
mobil7.Left := mobil7.Left + 5;
mobil8.Left := mobil8.Left + 5;
mobil9.Left := mobil9.Left + 5;
if (mobil7.Left >= ClientWidth) then
begin
  mobil7.Left := - mobil7.Width;
end
else if (mobil8.Left >= ClientWidth) then
begin
  mobil8.Left := - mobil8.Width;
end
else if (mobil9.Left >= ClientWidth) then
begin
  mobil9.Left := - mobil9.Width;
end;
end;

procedure TForm1.Unfair1Click(Sender: TObject);
begin
  lblevel.Caption := 'Unfair';
  Timermobil1.Interval := 35;
  Timermobil2.Interval := 20;
  Timermobil3.Interval := 35;
  Timermobil4.Interval := 20;
end;

procedure TForm1.tabrakmobil();
begin
  if ((bebek.top + bebek.Height >=mobil1.top) and (bebek.top <= mobil1.top + mobil1.height)  and(bebek.Left + bebek.Width>=mobil1.Left) and (bebek.Left<=mobil1.Left+mobil1.Width)) or
     ((bebek.top + bebek.Height >=mobil2.top) and (bebek.top <= mobil2.top + mobil2.height)  and(bebek.Left + bebek.Width>=mobil2.Left) and (bebek.Left<=mobil2.Left+mobil2.Width)) or
     ((bebek.top + bebek.Height >=mobil3.top) and (bebek.top <= mobil3.top + mobil3.height)  and(bebek.Left + bebek.Width>=mobil3.Left) and (bebek.Left<=mobil3.Left+mobil3.Width)) or
     ((bebek.top + bebek.Height >=mobil4.top) and (bebek.top <= mobil4.top + mobil4.height)  and(bebek.Left + bebek.Width>=mobil4.Left) and (bebek.Left<=mobil4.Left+mobil4.Width)) or
     ((bebek.top + bebek.Height >=mobil5.top) and (bebek.top <= mobil5.top + mobil5.height)  and(bebek.Left + bebek.Width>=mobil5.Left) and (bebek.Left<=mobil5.Left+mobil5.Width)) or
     ((bebek.top + bebek.Height >=mobil6.top) and (bebek.top <= mobil6.top + mobil6.height)  and(bebek.Left + bebek.Width>=mobil6.Left) and (bebek.Left<=mobil6.Left+mobil6.Width)) or
     ((bebek.top + bebek.Height >=mobil7.top) and (bebek.top <= mobil7.top + mobil7.height)  and(bebek.Left + bebek.Width>=mobil7.Left) and (bebek.Left<=mobil7.Left+mobil7.Width)) or
     ((bebek.top + bebek.Height >=mobil8.top) and (bebek.top <= mobil8.top + mobil8.height)  and(bebek.Left + bebek.Width>=mobil8.Left) and (bebek.Left<=mobil8.Left+mobil8.Width)) or
     ((bebek.top + bebek.Height >=mobil9.top) and (bebek.top <= mobil9.top + mobil9.height)  and(bebek.Left + bebek.Width>=mobil9.Left) and (bebek.Left<=mobil9.Left+mobil9.Width)) or
     ((bebek.top + bebek.Height >=mobil10.top) and (bebek.top <= mobil10.top + mobil10.height)  and(bebek.Left + bebek.Width>=mobil10.Left) and (bebek.Left<=mobil10.Left+mobil10.Width)) or
     ((bebek.top + bebek.Height >=mobil11.top) and (bebek.top <= mobil11.top + mobil11.height)  and(bebek.Left + bebek.Width>=mobil11.Left) and (bebek.Left<=mobil11.Left+mobil11.Width)) or
     ((bebek.top + bebek.Height >=mobil12.top) and (bebek.top <= mobil12.top + mobil12.height)  and(bebek.Left + bebek.Width>=mobil12.Left) and (bebek.Left<=mobil12.Left+mobil12.Width))
  then
  begin
    lbnyawa.Caption:=IntToStr((StrToInt(lbnyawa.Caption)-1));
    bebek.Top:=576;
    bebek.Left := ClientWidth div 2 - bebek.Width div 2;
    if (StrToInt(lbnyawa.Caption)<=0) then
    begin
      gameover.Visible := True;
      stop();
    end;
  end;
end;

procedure TForm1.timerlvlTimer(Sender: TObject);
begin
if (kiri = false) and (lblevel.Left + lblevel.Width >= Panel1.Width - 100 ) then
begin
  kiri := true;
end
else if (kiri = true) and (lblevel.Left <= 100 ) then
begin
  kiri := false;
end;

if (kiri = true) then
begin
  lblevel.Left := lblevel.Left - 5;
end
else if (kiri = false) then
begin
  lblevel.Left := lblevel.Left + 5;
end;
end;

procedure TForm1.tabrakkandang();
begin
if ((bebek.top + bebek.Height>=kandang.top) and (bebek.top <= kandang.top + kandang.height div 2 + bebek.Height div 2)  and(bebek.Left + bebek.Width>=kandang.Left) and (bebek.Left<=kandang.Left+kandang.Width)) then
  begin
    lbnilai.Caption := IntToStr((StrToInt(lbnilai.Caption)+100));
    bebek.Top:=576;
    bebek.Left := ClientWidth div 2 - bebek.Width div 2;
    if (StrToInt(lbnilai.Caption) >= 100) then
    begin
    stop();
    lbwin.Visible := True;
    ShowMessage('Terima Kasih Telah Memasukkan Bebek ke-Kandangnya');
    end;
  end;
end;

procedure TForm1.stop();
begin
  Timermobil1.Enabled := False;
  Timermobil2.Enabled := False;
  Timermobil3.Enabled := False;
  Timermobil4.Enabled := False;
end;

procedure TForm1.resume();
begin
if (lbnyawa.Caption = '0') then
begin
  ShowMessage('Anda Harus Restart Game - Karena Kamu Sudah Kalah');
end
else if (lbnilai.Caption = '100') then
begin
  ShowMessage('Anda Telah Berhasil Memasukkan Bebek ke-Kandangnya, Jika ingin bermain lagi klik File Restart / Tekan Enter, Terimakasih :)');
end
else
begin
  MediaPlayer1.Play;
  gameover.Visible := False;
  lbwin.Visible := False;
  Timermobil1.Enabled := True;
  Timermobil2.Enabled := True;
  Timermobil3.Enabled := True;
  Timermobil4.Enabled := True;
end;
end;

procedure TForm1.Resume1Click(Sender: TObject);
begin
resume();
end;

procedure TForm1.Start1Click(Sender: TObject);
begin
resume();
end;

end.
