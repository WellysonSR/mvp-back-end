unit TriTere.frmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmLogin = class(TForm)
    imgLogin: TImage;
    edtLogin: TEdit;
    edtSenha: TEdit;
    sbtnLogin: TSpeedButton;
    lblNovoCadastro: TLabel;
    pnlRodape: TPanel;
    procedure lblNovoCadastroClick(Sender: TObject);
    procedure sbtnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure EntrarNoSistema;
    procedure CadastrarUsuario;
  end;

implementation

{$R *.dfm}

uses
  DataModule, TriTere.frmTelaPrincipal, TriTere.frmNovoUsuario,
  FireDAC.Comp.Client;

procedure TfrmLogin.CadastrarUsuario;
var
  lfrmNovoUsuario: TfrmNovoUsuario;
begin
  lfrmNovoUsuario := TfrmNovoUsuario.Create(nil);
  try
    lfrmNovoUsuario.ShowModal();
  finally
    FreeAndNil(lfrmNovoUsuario);
  end;
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      sbtnLogin.Click();
    end;
end;

procedure TfrmLogin.EntrarNoSistema;
var
  lfrmTelaPrincipal: TfrmTelaPrincipal;
begin
  if not dmConexao.AutenticarUsuario(edtLogin.Text, edtSenha.Text) then
    begin
      ShowMessage('Usuário ou senha inválido.');
      Abort();
    end;

  Hide();
  lfrmTelaPrincipal := TfrmTelaPrincipal.Create(nil);
  try
    lfrmTelaPrincipal.ShowModal();
  finally
    FreeAndNil(lfrmTelaPrincipal);
    Application.Terminate();
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  pnlRodape.SetFocus();
end;

procedure TfrmLogin.lblNovoCadastroClick(Sender: TObject);
begin
  CadastrarUsuario();
end;

procedure TfrmLogin.sbtnLoginClick(Sender: TObject);
begin
  EntrarNoSistema();
end;

end.

