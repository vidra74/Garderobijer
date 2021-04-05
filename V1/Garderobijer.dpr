program Garderobijer;

uses
  System.StartUpCopy,
  FMX.Forms,
  untFrm in 'untFrm.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
