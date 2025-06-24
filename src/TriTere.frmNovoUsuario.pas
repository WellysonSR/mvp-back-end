unit TriTere.frmNovoUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmNovoUsuario = class(TForm)
    lblNome: TLabel;
    Label1: TLabel;
    lblSenha: TLabel;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    chkMostrarSenha: TCheckBox;
    btnGravar: TButton;
    btnCancelar: TButton;
    imgLogo: TImage;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure chkMostrarSenhaClick(Sender: TObject);
  private
    procedure ValidarCadastro;
    procedure ExibirSenha;
  end;

implementation

{$R *.dfm}

uses
  DataModule;

procedure TfrmNovoUsuario.ValidarCadastro;
begin
  if (edtNome.Text = '') or (edtSenha.Text = '') or (edtLogin.Text = '') then
    begin
     ShowMessage('Preencha todos os campos!');
     Abort;
    end;

  dmConexao.CadastrarUsuario(edtNome.Text, edtLogin.Text, edtSenha.Text);
  ShowMessage('Usuário cadastrado com sucesso!');
  ModalResult := mrOk;
end;

procedure TfrmNovoUsuario.ExibirSenha;
begin
  if chkMostrarSenha.Checked then
    begin
      edtSenha.PasswordChar := #0;
      Exit();
    end;

  edtSenha.PasswordChar := '*';
end;

procedure TfrmNovoUsuario.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmNovoUsuario.btnGravarClick(Sender: TObject);
begin
  ValidarCadastro();
end;

procedure TfrmNovoUsuario.chkMostrarSenhaClick(Sender: TObject);
begin
  ExibirSenha();
end;
end.
