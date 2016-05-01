program prjGerakGambar;

uses
  Vcl.Forms,
  uGerakGambar in 'uGerakGambar.pas' {frmGerakGambar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGerakGambar, frmGerakGambar);
  Application.Run;
end.
