unit untFrm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, FMX.Controls.Presentation, FMX.Edit;

type
  TFrmMain = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    GestureManager1: TGestureManager;
    lblBrojPokretanja: TLabel;
    edtBrojPokretanja: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FBrojPokretanja: Integer;
    FRebatinke: String;
  public
    { Public declarations }
    property BrojPokretanja: Integer read FBrojPokretanja write FBrojPokretanja;
    property Rebatinke: String read FRebatinke write FRebatinke;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}

uses System.IniFiles
  , CCR.PrefsIniFile;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
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
    Settings.WriteString('Velièine', 'Rebatinke', Rebatinke);
  finally
    Settings.Free;
  end;

end;

procedure TFrmMain.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount-1] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  Settings: TCustomIniFile;
  Broj: Integer;
begin
  Settings := CreateUserPreferencesIniFile;
  try
    Broj := Settings.ReadInteger('General', 'BrojPokretanja', 0);
    Rebatinke := Settings.ReadString('Velièine', 'Rebatinke', '54');
    edtBrojPokretanja.Text := Broj.ToString;
  finally
    Settings.Free;
  end;

end;

end.
