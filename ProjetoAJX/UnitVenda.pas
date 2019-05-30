unit UnitVenda;

interface

  type

    TVenda = class

    private
      FID_Cliente: integer;
      FID: integer;
      FData: TDate;
      procedure SetData(const Value: TDate);
      procedure SetID(const Value: integer);
      procedure SetID_Cliente(const Value: integer);
      function getData: TDate;
      function getID: integer;
      function getID_Cliente: integer;

    published
      property ID: integer read getID write SetID;
      property Data: TDate read getData write SetData;
      property ID_Cliente: integer read getID_Cliente write SetID_Cliente;
      //property ID_Carrinho

    end;
implementation

{ TVenda }

function TVenda.getData: TDate;
begin
  Result := FData;
end;

function TVenda.getID: integer;
begin
  Result := FID;
end;

function TVenda.getID_Cliente: integer;
begin
  Result := FID_Cliente;
end;

procedure TVenda.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TVenda.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TVenda.SetID_Cliente(const Value: integer);
begin
  FID_Cliente := Value;
end;

end.
