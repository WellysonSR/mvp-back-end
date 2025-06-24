unit TriTere.frmTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList;

type
  TfrmTelaPrincipal = class(TForm)
    pnlMenu: TPanel;
    sbtnCadastroClientes: TSpeedButton;
    pnlGrupos: TPanel;
    lblCadastros: TLabel;
    lblSeparadorUm: TLabel;
    imgTelaInicial: TImage;
    lblOpcoes: TLabel;
    sbtnSair: TSpeedButton;
    sbtnFazerLogoff: TSpeedButton;
    pnlRodapeTelaInicial: TPanel;
    sbtnCadastroProfessores: TSpeedButton;
    sbtnTrilhas: TSpeedButton;
    imglTelaPrincipal: TImageList;
    tmrMensagemBoasVindas: TTimer;
    lblMensagemBoasVindas: TLabel;
    procedure sbtnSairClick(Sender: TObject);
    procedure sbtnCadastroClientesClick(Sender: TObject);
    procedure sbtnCadastroProfessoresClick(Sender: TObject);
    procedure sbtnFazerLogoffClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrMensagemBoasVindasTimer(Sender: TObject);
  private
    procedure AbrirCadastroClientes;
    procedure AbrirCadastroProfessores;
    procedure RealizarLogoff;
  end;

implementation

{$R *.dfm}

uses
  TriTere.frmLogin, TriTere.frmCadastroProfessores, TriTere.frmCadastroClientes;

procedure TfrmTelaPrincipal.AbrirCadastroClientes;
var
  lfrmCadastroClientes: TfrmCadastroClientes;
begin
  lfrmCadastroClientes := TfrmCadastroClientes.Create(nil);
  try
    lfrmCadastroClientes.ShowModal();
  finally
    FreeAndNil(lfrmCadastroClientes);
  end;
end;

procedure TfrmTelaPrincipal.AbrirCadastroProfessores;
var
  lfrmCadastroProfessores: TfrmCadastroProfessores;
begin
  lfrmCadastroProfessores := TfrmCadastroProfessores.Create(nil);
  try
    lfrmCadastroProfessores.ShowModal();
  finally
    FreeAndNil(lfrmCadastroProfessores);
  end;
end;

procedure TfrmTelaPrincipal.tmrMensagemBoasVindasTimer(Sender: TObject);
begin
  lblMensagemBoasVindas.Left := lblMensagemBoasVindas.Left - 2;

  if lblMensagemBoasVindas.Left + lblMensagemBoasVindas.Width < 0 then
    lblMensagemBoasVindas.Left := pnlRodapeTelaInicial.Width;
end;

procedure TfrmTelaPrincipal.FormCreate(Sender: TObject);
begin
  lblMensagemBoasVindas.AutoSize := True;
  lblMensagemBoasVindas.Caption := '     Hoje foi avistado uma Onça pintada na trilha 360 PARNASO     |     A trilha Mozart Catão está ótima para ser feita hoje!     |     Acampe na Pedra da Tartaruga     |       Projeto de estudos MVP (Wellyson S. Rocha | João Pedro Fabbri)     ';

  lblMensagemBoasVindas.Left := pnlRodapeTelaInicial.Width;
end;

procedure TfrmTelaPrincipal.RealizarLogoff;
var
  lfrmLogin: TfrmLogin;
begin
  Self.Hide();
  lfrmLogin := TfrmLogin.Create(nil);
  try
    lfrmLogin.Show;
  finally
    FreeAndNil(lfrmLogin);
  end;
end;

procedure TfrmTelaPrincipal.sbtnCadastroClientesClick(Sender: TObject);
begin
  AbrirCadastroClientes();
end;

procedure TfrmTelaPrincipal.sbtnCadastroProfessoresClick(Sender: TObject);
begin
  AbrirCadastroProfessores();
end;

procedure TfrmTelaPrincipal.sbtnFazerLogoffClick(Sender: TObject);
begin
  RealizarLogoff();
end;

procedure TfrmTelaPrincipal.sbtnSairClick(Sender: TObject);
begin
  Application.Terminate();
end;

end.
