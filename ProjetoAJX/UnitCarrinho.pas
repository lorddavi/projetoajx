unit UnitCarrinho;

interface
  type
    TCarrinho = class

      private
        FID_Produto: integer;
        FQtd: integer;
        FID: integer;
    FValor: Double;
        procedure SetID(const Value: integer);
        procedure SetID_Produto(const Value: integer);
        procedure SetQtd(const Value: integer);
        function getID: integer;
        function getID_Produto: integer;
        function getQtd: integer;
    procedure SetValor(const Value: Double);
    function getValor: Double;

      published
        property ID: integer read getID write SetID;
        property Qtd: integer read getQtd write SetQtd;
        property ID_Produto: integer read getID_Produto write SetID_Produto;
        property Valor: Double read getValor write SetValor;

    end;

implementation

{ TCarrinho }

function TCarrinho.getID: integer;
begin
  Result := FID;
end;

function TCarrinho.getID_Produto: integer;
begin
  Result := FID_Produto;
end;

function TCarrinho.getQtd: integer;
begin
  Result := FQtd;
end;

function TCarrinho.getValor: Double;
begin
  Result := FValor;
end;

procedure TCarrinho.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TCarrinho.SetID_Produto(const Value: integer);
begin
  FID_Produto := Value;
end;

procedure TCarrinho.SetQtd(const Value: integer);
begin
  FQtd := Value;
end;

procedure TCarrinho.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
