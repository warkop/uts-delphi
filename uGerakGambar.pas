unit uGerakGambar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.MPlayer, Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmGerakGambar = class(TForm)
    imgA: TImage;
    labelMulai: TLabel;
    imgB: TImage;
    imgC: TImage;
    TimerA1: TTimer;
    TimerA2: TTimer;
    TimerA3: TTimer;
    TimerB1: TTimer;
    TimerB2: TTimer;
    TimerB3: TTimer;
    TimerC1: TTimer;
    TimerC2: TTimer;
    TimerC3: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerA1Timer(Sender: TObject);
    procedure TimerA2Timer(Sender: TObject);
    procedure TimerA3Timer(Sender: TObject);
    procedure TimerB1Timer(Sender: TObject);
    procedure TimerB2Timer(Sender: TObject);
    procedure TimerB3Timer(Sender: TObject);
    procedure TimerC1Timer(Sender: TObject);
    procedure TimerC2Timer(Sender: TObject);
    procedure TimerC3Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerakGambar: TfrmGerakGambar;

implementation

var
  serongAtas,serongBawah,lurusKiri,lurusKanan,turun : Boolean;

{$R *.dfm}

procedure TfrmGerakGambar.FormCreate(Sender: TObject);
begin
  TimerA1.Enabled := False;
  TimerB1.Enabled := False;
  TimerC1.Enabled := False;
end;

procedure TfrmGerakGambar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
  begin
    {agar tiap kali tekan Virtual Keyboard kembali keposisi awal}
    labelMulai.Visible := False;
    imgA.Left := 0;
    imgA.Top := 448;
    imgB.Left := 264;
    imgB.Top := 0;
    imgC.Left := 568;
    imgC.Top := 0;
    TimerA1.Enabled  := True;
    TimerA2.Enabled  := False;
    TimerA3.Enabled  := False;

    TimerB1.Enabled  := True;
    TimerB2.Enabled  := False;
    TimerB3.Enabled  := False;

    TimerC1.Enabled  := True;
    TimerC2.Enabled  := False;
    TimerC3.Enabled  := False;
  end;
end;


procedure TfrmGerakGambar.TimerA1Timer(Sender: TObject);
begin
  if (imgA.Top >= 30) then
  begin
    imgA.Left := imgA.Left + 5;
    imgA.Top := imgA.Top - 5;
  end else
  begin
    TimerA1.Enabled := False;
    TimerA2.Enabled := True;
  end;

end;

procedure TfrmGerakGambar.TimerA2Timer(Sender: TObject);
begin
  if (imgA.Top <= 448) then
  begin
    imgA.Top := imgA.Top + 5;
  end else
  begin
    TimerA2.Enabled := False;
    TimerA3.Enabled := True;
  end;
end;

procedure TfrmGerakGambar.TimerA3Timer(Sender: TObject);
begin
  if imgA.Left >= 0 then
  begin
    imgA.Left := imgA.Left - 5;
  end else
  begin
    TimerA3.Enabled := False;
    TimerA1.Enabled := False;
  end;

end;



procedure TfrmGerakGambar.TimerB1Timer(Sender: TObject);
begin
  if imgB.Top <= 448 then
  begin
    imgB.Top := imgB.Top + 5
  end else
  begin
    TimerB1.Enabled := False;
    TimerB2.Enabled := True;
  end;
end;

procedure TfrmGerakGambar.TimerB2Timer(Sender: TObject);
begin
  if imgB.Top >= 220 then
  begin
    imgB.Top := imgB.Top - 5;
    imgB.Left := imgB.Left + 3;
  end else
  begin
    TimerB2.Enabled := False;
    TimerB3.Enabled := True;
  end;
end;

procedure TfrmGerakGambar.TimerB3Timer(Sender: TObject);
begin
  if imgB.Top >= 0 then
  begin
    imgB.Left := imgB.Left - 5;
    imgB.Top := imgB.Top - 5;
  end else
  begin
    TimerB3.Enabled := False;
  end;
end;

procedure TfrmGerakGambar.TimerC1Timer(Sender: TObject);
begin
  if imgC.Top <= 448 then
  begin
    imgC.Top := imgC.Top + 5;

  end else
  begin
    TimerC1.Enabled := False;
    TimerC2.Enabled := True;
  end;
end;

procedure TfrmGerakGambar.TimerC2Timer(Sender: TObject);
begin
  if imgC.Top >= 0 then
  begin
    imgC.Top := imgC.Top - 5;
    imgC.Left := imgC.Left - 3;
  end else
  begin
    TimerC2.Enabled := False;
    TimerC3.Enabled := True;
  end;
end;

procedure TfrmGerakGambar.TimerC3Timer(Sender: TObject);
begin
  if imgC.Top <= 448 then
  begin
    imgC.Top := imgC.Top + 5;
    imgC.Left := imgC.Left - 3;
  end else
  begin
    TimerC3.Enabled := False;
  end;
end;

end.
