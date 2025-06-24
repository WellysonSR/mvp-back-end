unit TriTere.frmNovoCadastroProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Comp.Client,
  Data.DB;

type
  TfrmNovoCadastroProfessores = class(TForm)
    lblUsuario: TLabel;
    lblNome: TLabel;
    sbtnGravar: TSpeedButton;
    sbtnCancelar: TSpeedButton;
    edtNome: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    chkMostrarSenha: TCheckBox;
    edtUsuario: TEdit;
    procedure chkMostrarSenhaClick(Sender: TObject);
    procedure sbtnGravarClick(Sender: TObject);
  private
    procedure MostrarSenha;
    procedure LimparCampos;
    procedure ValidarCadastro;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  DataModule;

procedure TfrmNovoCadastroProfessores.LimparCampos;
begin
  edtNome.Clear();
  edtUsuario.Clear();
  edtSenha.Clear();
end;

procedure TfrmNovoCadastroProfessores.ValidarCadastro;
begin
  if (edtNome.Text = '') or (edtSenha.Text = '') or (edtUsuario.Text = '') then
    begin
      ShowMessage('Preencha todos os campos!');
      Abort;
    end;

  dmConexao.CadastrarUsuario(edtNome.Text, edtUsuario.Text, edtSenha.Text);
  ShowMessage('Usuário cadastrado com sucesso!');
  ModalResult := mrOk;
end;

procedure TfrmNovoCadastroProfessores.MostrarSenha;
begin
  if chkMostrarSenha.Checked then
    begin
      edtSenha.PasswordChar := #0;
      Exit();
    end;

  edtSenha.PasswordChar := '*';
end;

procedure TfrmNovoCadastroProfessores.sbtnGravarClick(Sender: TObject);
begin
  ValidarCadastro();
  LimparCampos();
end;

procedure TfrmNovoCadastroProfessores.chkMostrarSenhaClick(Sender: TObject);
begin
  MostrarSenha();
end;

end.
