unit UnitTelefone;

interface

  type

    TTelefone = class

    private
      FID_Cliente: integer;
      FID: integer;
      FNumero: string;
      procedure SetID(const Value: integer);
      procedure SetID_Cliente(const Value: integer);
      procedure SetNumero(const Value: string);
      function getID: integer;
      function getID_Cliente: integer;
      function getNumero: string;

    published
      property ID: integer read getID write SetID;
      property Numero: string read getNumero write SetNumero;
      property ID_Cliente: integer read getID_Cliente write SetID_Cliente;

    end;

implementation

{ TTelefone }

function TTelefone.getID: integer;
begin
  Result := FID;
end;

function TTelefone.getID_Cliente: integer;
begin
  Result := FID_Cliente;
end;

function TTelefone.getNumero: string;
begin
  Result := FNumero;
end;

procedure TTelefone.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TTelefone.SetID_Cliente(const Value: integer);
begin
  FID_Cliente := Value;
end;

procedure TTelefone.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

end.
