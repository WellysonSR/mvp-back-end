unit TriTere.frmCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TfrmCadastroClientes = class(TForm)
    pnlTituloCadastroClientes: TPanel;
    pnlLocalizarClientes: TPanel;
    lblLocalizarClientes: TLabel;
    edtLocalizarClientes: TEdit;
    pnlInformacoesClientes: TPanel;
    lblNome: TLabel;
    lblProfessor: TLabel;
    dbedtNome: TDBEdit;
    dbedtProfessorVinculado: TDBEdit;
    dbgClientes: TDBGrid;
    SpeedButton1: TSpeedButton;
    procedure edtLocalizarClientesChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    procedure Atualizar;
  end;

implementation

{$R *.dfm}

uses
  DataModule, TriTere.frmNovoCadastroClientes;

procedure TfrmCadastroClientes.Atualizar;
begin
  if not dmConexao.tbClientes.Active then
    Exit();

  dmConexao.tbClientes.Close();
  dmConexao.tbClientes.Open();
end;

procedure TfrmCadastroClientes.edtLocalizarClientesChange(Sender: TObject);
begin
  dmConexao.tbClientes.Locate('nome', edtLocalizarClientes.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TfrmCadastroClientes.SpeedButton1Click(Sender: TObject);
var
  lfrmNovoCadastroClientes: TfrmNovoCadastroClientes;
begin
  lfrmNovoCadastroClientes := TfrmNovoCadastroClientes.Create(nil);
  try
    lfrmNovoCadastroClientes.ShowModal();

    Atualizar();
  finally
    FreeAndNil(lfrmNovoCadastroClientes);
  end;
end;

end.
