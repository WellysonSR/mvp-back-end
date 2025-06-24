unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Datasnap.DBClient, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Dialogs;

type
  TdmConexao = class(TDataModule)
    fdConexao: TFDConnection;
    fdDriverLink: TFDPhysPgDriverLink;
    tbProfessores: TFDTable;
    dsProfessores: TDataSource;
    tbClientes: TFDTable;
    dsClientes: TDataSource;
    tbProfessoresid: TIntegerField;
    tbProfessoresnome: TWideStringField;
    tbProfessoresusuario: TWideStringField;
    tbProfessoressenha: TWideStringField;
    tbClientesid: TIntegerField;
    tbClientesnome: TWideStringField;
    tbClientesprofessor_id: TIntegerField;
    tbClientesnome_professor: TStringField;
  private
    procedure CriarSchemaETabelas;
    procedure ConfigurarTabelas;
  public
    procedure CadastrarUsuario(const pNome: string; const pUsuario: string; const pSenha: string);

    function AutenticarBanco(host: string; banco: string): Boolean;
    function AutenticarUsuario(const pUsuario: string; const pSenha: string): Boolean;
  end;

var
  dmConexao: TdmConexao;

implementation

{$R *.dfm}

function TdmConexao.AutenticarBanco(host: string; banco: string): Boolean;
begin
  Result := False;

  try
    if (Trim(banco) = '') or (Trim(host) = '') then
      begin
        ShowMessage('O nome do banco de dados e/ou o host não podem estar vazios.');
        Abort();
      end;

    fdConexao.Connected := False;
    fdConexao.Params.Clear();
    fdConexao.DriverName := 'PG';
    fdConexao.Params.Add('Server=' + host);
    fdConexao.Params.Add('Database=' + banco);
    fdConexao.Params.Add('User_Name=postgres');
    fdConexao.Params.Add('Password=#abc123#');
    fdConexao.Params.Add('Port=5432');
    fdConexao.LoginPrompt := False;
    fdConexao.Connected := True;

    Result := fdConexao.Connected;

    if Result then
      begin
        CriarSchemaETabelas();
        ConfigurarTabelas();
      end;

  except
    on E: Exception do
      raise Exception.Create('Erro ao conectar: ' + E.Message);
  end;
end;

procedure TdmConexao.CriarSchemaETabelas;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    fdConexao.StartTransaction;

    try
      Q.Connection := fdConexao;

      Q.SQL.Clear();
      Q.SQL.Add('SELECT schema_name FROM information_schema.schemata WHERE schema_name = ''tritere'';');
      Q.Open();

      if not Q.IsEmpty() then
        begin
          fdConexao.Commit();
          Exit();
        end;

      fdConexao.ExecSQL('CREATE SCHEMA tritere;');

      Q.SQL.Clear();
      Q.SQL.Add('CREATE TABLE IF NOT EXISTS tritere.clientes (');
      Q.SQL.Add('  id serial PRIMARY KEY,');
      Q.SQL.Add('  nome varchar(100),');
      Q.SQL.Add('  professor_id integer NOT NULL');
      Q.SQL.Add(');');
      Q.ExecSQL();

      Q.SQL.Clear();
      Q.SQL.Add('CREATE TABLE IF NOT EXISTS tritere.trilhas (');
      Q.SQL.Add('  id serial PRIMARY KEY,');
      Q.SQL.Add('  trilha varchar(100),');
      Q.SQL.Add('  valor double precision,');
      Q.SQL.Add('  data timestamp without time zone,');
      Q.SQL.Add('  cliente_id integer NOT NULL');
      Q.SQL.Add(');');
      Q.ExecSQL();

      Q.SQL.Clear();
      Q.SQL.Add('CREATE TABLE IF NOT EXISTS tritere.professores (');
      Q.SQL.Add('  id serial PRIMARY KEY,');
      Q.SQL.Add('  nome varchar(100),');
      Q.SQL.Add('  usuario varchar(50) NOT NULL UNIQUE,');
      Q.SQL.Add('  senha varchar(255) NOT NULL');
      Q.SQL.Add(');');
      Q.ExecSQL();

      fdConexao.Commit();

      ShowMessage('Schema "tritere" e suas tabelas criados com sucesso!');

    except
      on E: Exception do
        begin
          fdConexao.Rollback;
          raise Exception.Create('Erro ao criar schema e tabelas: ' + E.Message);
        end;
    end;

  finally
    Q.Free();
  end;
end;

procedure TdmConexao.ConfigurarTabelas;
begin
  if tbProfessores.Active then
    tbProfessores.Close();

  tbProfessores.TableName := 'tritere.professores';
  tbProfessores.Open();

  if tbClientes.Active then
    tbClientes.Close();

  tbClientes.TableName := 'tritere.clientes';
  tbClientes.Open();
end;

function TdmConexao.AutenticarUsuario(const pUsuario: string; const pSenha: string): Boolean;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := fdConexao;
    Q.SQL.Text := 'SELECT nome FROM tritere.professores WHERE usuario = :usuario AND senha = :senha';
    Q.ParamByName('usuario').AsString := pUsuario;
    Q.ParamByName('senha').AsString := pSenha;
    Q.Open();

    Result := not Q.IsEmpty();
  finally
    Q.Free();
  end;
end;

procedure TdmConexao.CadastrarUsuario(const pNome: string; const pUsuario: string; const pSenha: string);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := fdConexao;
    Q.SQL.Text := 'INSERT INTO tritere.professores (nome, usuario, senha) VALUES (:nome, :usuario, :senha)';
    Q.ParamByName('nome').AsString := pNome;
    Q.ParamByName('usuario').AsString := pUsuario;
    Q.ParamByName('senha').AsString := pSenha;
    Q.ExecSQL();
  finally
    Q.Free();
  end;
end;

end.

