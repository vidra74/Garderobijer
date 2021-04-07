program Garderobijer;

uses
  System.StartUpCopy,
  FMX.Forms,
  untFrm in 'untFrm.pas' {FrmMain},
  CCR.PrefsIniFile.Android in 'CCR\CCR.PrefsIniFile.Android.pas',
  CCR.PrefsIniFile.Apple in 'CCR\CCR.PrefsIniFile.Apple.pas',
  CCR.PrefsIniFile in 'CCR\CCR.PrefsIniFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
