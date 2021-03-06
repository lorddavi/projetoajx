unit UnitProduto;

interface
  type
    TProduto = class

    private
      FQtd: integer;
      FValor: double;
      FCodigo: string;
      FID: integer;
      FNome: string;
      procedure SetCodigo(const Value: string);
      procedure SetID(const Value: integer);
      procedure SetNome(const Value: string);
      procedure SetQtd(const Value: integer);
      procedure SetValor(const Value: double);
      function getCodigo: string;
      function getID: integer;
      function getNome: string;
      function getQtd: integer;
      function getValor: double;

    published
      property ID: integer read getID write SetID;
      property Codigo: string read getCodigo write SetCodigo;
      property Nome: string read getNome write SetNome;
      property Qtd: integer read getQtd write SetQtd;
      property Valor: double read getValor write SetValor;

    end;

implementation

{ TProduto }

function TProduto.getCodigo: string;
begin
  Result := FCodigo;
end;

function TProduto.getID: integer;
begin
  Result := FID;
end;

function TProduto.getNome: string;
begin
  Result := FNome;
end;

function TProduto.getQtd: integer;
begin
  Result := FQtd;
end;

function TProduto.getValor: double;
begin
  Result := FValor;
end;

procedure TProduto.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TProduto.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TProduto.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TProduto.SetQtd(const Value: integer);
begin
  FQtd := Value;
end;

procedure TProduto.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.
