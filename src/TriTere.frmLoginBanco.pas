unit TriTere.frmLoginBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmLoginBanco = class(TForm)
    pnlLoginBanco: TPanel;
    edtNomeBanco: TEdit;
    edtHost: TEdit;
    btnLoginBanco: TButton;
    lblHost: TLabel;
    lblBanco: TLabel;
    rgHost: TRadioGroup;
    imgLogo: TImage;
    procedure btnLoginBancoClick(Sender: TObject);
    procedure rgHostClick(Sender: TObject);

  private
    procedure AbrirLogin();
    procedure ValidarHost();

    function TipoHost(): string;
  end;

var
  frmLoginBanco: TfrmLoginBanco;

implementation

{$R *.dfm}

uses
  DataModule, TriTere.frmLogin;

procedure TfrmLoginBanco.AbrirLogin;
var
  lfrmLogin: TfrmLogin;
begin
  if not dmConexao.AutenticarBanco(TipoHost, edtNomeBanco.Text) then
    Abort();

  Hide();
  lfrmLogin := TfrmLogin.Create(nil);
  try
    lfrmLogin.ShowModal();
  finally
    FreeAndNil(lfrmLogin);
  end;
end;

function TfrmLoginBanco.TipoHost: string;
begin
  if rgHost.ItemIndex = 0 then
    Exit('localhost');

  Result := edtHost.Text;
end;

procedure TfrmLoginBanco.ValidarHost;
begin
  if rgHost.ItemIndex = 1 then
    begin
      edtHost.Enabled := True;
      edtHost.SetFocus();
      Exit();
    end;

  edtHost.Enabled := False;
  edtNomeBanco.SetFocus();
end;

procedure TfrmLoginBanco.rgHostClick(Sender: TObject);
begin
  ValidarHost();
end;

procedure TfrmLoginBanco.btnLoginBancoClick(Sender: TObject);
begin
  AbrirLogin();
end;

end.
