program TriTere;

uses
  Vcl.Forms,
  TriTere.frmLogin in 'src\TriTere.frmLogin.pas' {frmLogin},
  TriTere.frmCadastroProfessores in 'src\TriTere.frmCadastroProfessores.pas' {frmCadastroProfessores},
  DataModule in 'src\dm\DataModule.pas' {dmConexao: TDataModule},
  TriTere.frmTelaPrincipal in 'src\TriTere.frmTelaPrincipal.pas' {frmTelaPrincipal},
  TriTere.frmNovoUsuario in 'src\TriTere.frmNovoUsuario.pas' {frmNovoUsuario},
  TriTere.frmCadastroClientes in 'src\TriTere.frmCadastroClientes.pas' {frmCadastroClientes},
  TriTere.frmLoginBanco in 'src\TriTere.frmLoginBanco.pas' {frmLoginBanco},
  TriTere.frmNovoCadastroClientes in 'src\TriTere.frmNovoCadastroClientes.pas' {frmNovoCadastroClientes},
  TriTere.frmNovoCadastroProfessores in 'src\TriTere.frmNovoCadastroProfessores.pas' {frmNovoCadastroProfessores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLoginBanco, frmLoginBanco);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.

