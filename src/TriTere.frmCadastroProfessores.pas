unit TriTere.frmCadastroProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCadastroProfessores = class(TForm)
    lblLogin: TLabel;
    lblNome: TLabel;
    lblCodigo: TLabel;
    lblLocalizar: TLabel;
    pnlLocalizarProfessor: TPanel;
    pnlTituloCadastroProfessores: TPanel;
    dbgProfessores: TDBGrid;
    dbedtCodigoProfessor: TDBEdit;
    dbedtNomeProfessor: TDBEdit;
    dbedtLoginProfessor: TDBEdit;
    edtLocalizarProfessor: TEdit;
    pnlInformacoesProfessor: TPanel;
    sbtnNovo: TSpeedButton;
    procedure edtLocalizarProfessorChange(Sender: TObject);
    procedure sbtnNovoClick(Sender: TObject);
  private
    procedure Atualizar;
  end;

implementation

uses
  DataModule, TriTere.frmNovoCadastroProfessores;

{$R *.dfm}

procedure TfrmCadastroProfessores.sbtnNovoClick(Sender: TObject);
var
  lfrmNovoCadastroProfessores: TfrmNovoCadastroProfessores;
begin
  lfrmNovoCadastroProfessores := TfrmNovoCadastroProfessores.Create(nil);
  try
    lfrmNovoCadastroProfessores.ShowModal();

    Atualizar();
  finally
    FreeAndNil(lfrmNovoCadastroProfessores);
  end;
end;

procedure TfrmCadastroProfessores.Atualizar;
begin
  if not dmConexao.tbProfessores.Active then
    Exit();

  dmConexao.tbProfessores.Close();
  dmConexao.tbProfessores.Open();
end;

procedure TfrmCadastroProfessores.edtLocalizarProfessorChange(Sender: TObject);
begin
  dmConexao.tbProfessores.Locate('nome', edtLocalizarProfessor.Text, [loPartialKey, loCaseInsensitive]);
end;

end.
