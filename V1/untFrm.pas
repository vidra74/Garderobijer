unit untFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TFrmMain = class(TForm)
    lblNaslov: TLabel;
    lblBrojPokretanja: TLabel;
    edtBrojPokretanja: TEdit;
    sbZatvori: TSpeedButton;
    procedure btnZatvoriClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FBrojPokretanja: Integer;
  public
    { Public declarations }
    property BrojPokretanja: Integer read FBrojPokretanja write FBrojPokretanja;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}

uses System.IniFiles
  , CCR.PrefsIniFile;

procedure TFrmMain.btnZatvoriClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmMain.FormDestroy(Sender: TObject);
var
  Settings: TCustomIniFile;
  Broj: Integer;
begin
  Settings := CreateUserPreferencesIniFile;
  try
    Broj := edtBrojPokretanja.Text.ToInteger + 1;
    Settings.WriteInteger('General', 'BrojPokretanja', Broj);
  finally
    Settings.Free;
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  Settings: TCustomIniFile;
  Broj: Integer;
begin
  Settings := CreateUserPreferencesIniFile;
  try
    Broj := Settings.ReadInteger('General', 'BrojPokretanja', 0);
    edtBrojPokretanja.Text := Broj.ToString;
  finally
    Settings.Free;
  end;
end;

end.
