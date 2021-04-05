unit untFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFrmMain = class(TForm)
    lblNaslov: TLabel;
    btnZatvori: TButton;
    procedure btnZatvoriClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}

procedure TFrmMain.btnZatvoriClick(Sender: TObject);
begin
  Close;
end;

end.
