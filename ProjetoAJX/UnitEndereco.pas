unit UnitEndereco;

interface

  type

    TEndereco = class

    private
      FBairro: string;
      FUF: string;
      FCEP: string;
      FID: integer;
      FNumero: string;
      FCidade: string;
      FRua: string;
    FID_Cliente: integer;
      procedure SetBairro(const Value: string);
      procedure SetCEP(const Value: string);
      procedure SetCidade(const Value: string);
      procedure SetID(const Value: integer);
      procedure SetNumero(const Value: string);
      procedure SetRua(const Value: string);
      procedure SetUF(const Value: string);
      function getBairro: string;
      function getCEP: string;
      function getCidade: string;
      function getID: integer;
      function getNumero: string;
      function getRua: string;
      function getUF: string;
    procedure SetID_Cliente(const Value: integer);
    function getID_Cliente: integer;

    published
      property ID: integer read getID write SetID;
      property Rua: string read getRua write SetRua;
      property Numero: string read getNumero write SetNumero;
      property Bairro: string read getBairro write SetBairro;
      property Cidade: string read getCidade write SetCidade;
      property CEP: string read getCEP write SetCEP;
      property UF: string read getUF write SetUF;
      property ID_Cliente: integer read getID_Cliente write SetID_Cliente;

    end;

implementation

{ TEndereco }

function TEndereco.getBairro: string;
begin
  Result := FBairro;
end;

function TEndereco.getCEP: string;
begin
  Result := FCEP;
end;

function TEndereco.getCidade: string;
begin
  Result := FCidade;
end;

function TEndereco.getID: integer;
begin
  Result := FID;
end;

function TEndereco.getID_Cliente: integer;
begin
  Result := FID_Cliente;
end;

function TEndereco.getNumero: string;
begin
  Result := FNumero;
end;

function TEndereco.getRua: string;
begin
  Result := FRua;
end;

function TEndereco.getUF: string;
begin
  Result := FUF;
end;

procedure TEndereco.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TEndereco.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TEndereco.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TEndereco.SetID_Cliente(const Value: integer);
begin
  FID_Cliente := Value;
end;

procedure TEndereco.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TEndereco.SetRua(const Value: string);
begin
  FRua := Value;
end;

procedure TEndereco.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
