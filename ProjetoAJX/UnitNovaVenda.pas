unit UnitNovaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, System.ImageList, Vcl.ImgList, RLReport;

type
  TFormVendas = class(TForm)
    GBCliente: TGroupBox;
    GBProdutos: TGroupBox;
    GBCarrinho: TGroupBox;
    DBGridCarrinho: TDBGrid;
    lblPago: TLabel;
    Label4: TLabel;
    EditBuscaCliente: TEdit;
    EditBuscaProdutos: TEdit;
    RadioGroupCriterio: TRadioGroup;
    EditQuantidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblNomeCliente: TLabel;
    DBGridProdutos: TDBGrid;
    ZQueryClientes: TZQuery;
    ZQueryProdutos: TZQuery;
    DataSourceClientes: TDataSource;
    DataSourceProdutos: TDataSource;
    DBGridClientes: TDBGrid;
    ZQueryClientesid_cliente: TIntegerField;
    ZQueryClientesnome_cliente: TWideStringField;
    ZQueryClientesemail_cliente: TWideStringField;
    ZQueryClientescpf_cliente: TWideStringField;
    ZQueryProdutosid_produto: TIntegerField;
    ZQueryProdutoscodigo_produto: TWideStringField;
    ZQueryProdutosnome_produto: TWideStringField;
    ZQueryProdutosqtd_produto: TIntegerField;
    ZQueryProdutosvalor_produto: TFloatField;
    ZQueryCarrinho: TZQuery;
    DataSourceCarrinho: TDataSource;

    DataSourceVendas: TDataSource;
    ZQueryVenda: TZQuery;
    ZQueryVendaid_venda: TIntegerField;
    ZQueryVendadata_venda: TDateField;
    ZQueryVendavalor_venda: TFloatField;
    ZQueryVendaid_clientev: TIntegerField;
    ZQueryPedido: TZQuery;
    DataSourcePedido: TDataSource;
    ZQueryPedidoid_pedido: TIntegerField;
    ZQueryPedidoid_vendap: TIntegerField;
    ZQueryPedidoid_produtop: TIntegerField;
    ZQueryPedidoid_qtdp: TIntegerField;
    editValor: TEdit;
    ZQueryCarrinhovalor_produtos: TFloatField;
    ZQueryCarrinhoid_produtoc: TIntegerField;
    ZQueryCarrinhoid_carrinho: TIntegerField;
    ZQueryCarrinhoqtd: TLargeintField;
    ZQueryCarrinhoNomeProduto: TStringField;
    ZQueryCarrinhoid_qtdc: TIntegerField;
    ZQueryDelC: TZQuery;
    ZQueryDelCid_carrinho: TIntegerField;
    ZQueryDelCvalor_produtos: TFloatField;
    ZQueryDelCid_qtdc: TIntegerField;
    ZQueryDelCid_produtoc: TIntegerField;
    EditPago: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    lblTroco: TLabel;
    btnRemover: TButton;
    RadioGroupCriterioCli: TRadioGroup;
    ImageList1: TImageList;
    btnAddProduto: TButton;
    btnPagar: TButton;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditBuscaClienteChange(Sender: TObject);
    procedure EditBuscaProdutosChange(Sender: TObject);
    procedure ZQueryClientesAfterScroll(DataSet: TDataSet);
    procedure btnAddProdutoClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure EditQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EditPagoKeyPress(Sender: TObject; var Key: Char);
    procedure btnRemoverClick(Sender: TObject);
    procedure editValorChange(Sender: TObject);
    procedure removeDoEstoque(idp, qtd: integer);
    function verificaEstoque(qtd: integer): boolean;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormVendas: TFormVendas;
  ValorP: Double;

implementation

{$R *.dfm}

uses UnitDataModule, UnitCliente, UnitCarrinho, UnitProduto;

// Cria um objeto carrinho. Verifica se h� produto suficiente em estoque. Se n�o
// houver, aparece um aviso. Se houver, coloca a ZQuery em modo de inser��o e
// associa ao objeto criado, para ent�o salvar na tabela Carrinho do banco de dados.
procedure TFormVendas.btnAddProdutoClick(Sender: TObject);
  var carrinho : TCarrinho;
      valor: double;
      conta, estoque: integer;
begin
  carrinho := TCarrinho.Create;
  carrinho.ID_Produto := ZQueryProdutosid_produto.Value;
  carrinho.Qtd := StrToInt(EditQuantidade.Text);
  carrinho.Valor := ZQueryProdutosvalor_produto.Value;

  estoque := ZQueryProdutosqtd_produto.Value;

  if not verificaEstoque(carrinho.Qtd) then
    begin
      ShowMessage('Esse produto possui ' + estoque.ToString + ' unidades em estoque');
      exit;
    end;

  ZQueryCarrinho.Insert;

  ZQueryCarrinho.FieldByName('id_qtdc').AsInteger := carrinho.Qtd;
  ZQueryCarrinho.FieldByName('id_produtoc').AsInteger := carrinho.ID_Produto;
  ZQueryCarrinho.FieldByName('valor_produtos').AsFloat := carrinho.Valor;

  valor :=  StrToFloat(editValor.Text) + (carrinho.Valor * carrinho.Qtd);
  editValor.Text := FormatFloat('#0.00', valor);

  ZQueryCarrinho.Post;

  EditQuantidade.Text := '1';
  EditBuscaProdutos.Text := '';
  btnPagar.Enabled := true;
  btnRemover.Enabled := true;


  ZQueryCarrinho.Refresh;

end;

// Verifica se o valor pago � igual ou superior ao valor total da compra. Se for,
// retorna v�rios campos ao estado inicial, cria uma VENDA no banco de dados, cria
// um PEDIDO no BD pra cada item no carrinho, associando cada pedido � venda criada,
// e limpa o carrinho.
procedure TFormVendas.btnPagarClick(Sender: TObject);
  var valor, pago : double;
begin
  if (ValorP = null) then
    ValorP := 0;

  pago := StrToFloat(EditPago.Text);
  valor := StrToFloat(editValor.Text);

  ValorP := ValorP + pago;

  lblPago.Caption := FormatFloat('#0.00', ValorP);

  if (ValorP >= valor) then
    begin

      lblTroco.Caption := FormatFloat('#0.00', ValorP - valor);

      ShowMessage('Valor pago com sucesso!');

      btnPagar.Enabled := false;
      btnRemover.Enabled := false;

      ValorP := 0;

      ZQueryVenda.Insert;
      ZQueryVendadata_venda.Value := NOW;
      ZQueryVendavalor_venda.Value := StrToFloat(editValor.Text);
      ZQueryVendaid_clientev.Value := ZQueryClientesid_cliente.Value;
      ZQueryVenda.Post;

      editValor.Text := '0,00';
      lblPago.Caption := '0,00';
      lblTroco.Caption := '0,00';

      ZQueryDelC.Refresh;

      while ZQueryDelC.RecordCount > 0 do
        begin
          ZQueryPedido.Insert;
          ZQueryPedidoid_vendap.Value := ZQueryVendaid_venda.Value;
          ZQueryPedidoid_produtop.Value := ZQueryDelCid_produtoc.Value;
          ZQueryPedidoid_qtdp.Value := ZQueryDelCid_qtdc.Value;
          ZQueryPedido.Post;

          removeDoEstoque(ZQueryDelCid_produtoc.Value, ZQueryDelCid_qtdc.Value);

          ZQueryDelC.Delete;
        end;

        ZQueryCarrinho.Refresh;
    end;

end;

//Remove um produto do carrinho. Busca os produtos com o id_produtoc selecionado,
//deleta todos os que encontrar, retorna a ZQuery ao seu SQL original e subtrai
//o valor do produto removido, do valor total da compra.
procedure TFormVendas.btnRemoverClick(Sender: TObject);
  var idproduto, qtd : integer;
      val: double;
begin
  idproduto := ZQueryCarrinhoid_produtoc.Value;
  val := ZQueryCarrinhovalor_produtos.Value;
  qtd := ZQueryCarrinhoqtd.Value;

  with ZQueryDelC do
    begin
      Close;
      SQL.Text := 'select * from carrinho where id_produtoc = :id';
      ParamByName('id').Value := idproduto;
      Open;
    end;

    ZQueryDelC.Refresh;
    while ZQueryDelC.RecordCount>0 do
      begin
        ZQueryDelC.Delete;
      end;

  with ZQueryDelC do
    begin
      Close;
      SQL.Text := 'select * from carrinho';
      Open;
    end;

  editValor.Text := FormatFloat('##0.00', (StrToFloat(editValor.Text) - (qtd * val)));
  ZQueryCarrinho.Refresh;
end;

//Usu�rio seleciona se quer realizar a busca por Nome ou CPF do Cliente. Cada
//tecla pressionada traz os resultados que coincidem com o que foi digitado at�
//o momento.
procedure TFormVendas.EditBuscaClienteChange(Sender: TObject);
begin
  with ZQueryClientes do
    begin
      Close;
      if (RadioGroupCriterioCli.ItemIndex=0) then
        SQL.Text := 'select * from clientes where nome_cliente like :nome'
      else
        SQL.Text := 'select * from clientes where cpf_cliente like :nome';
      ParamByName('nome').Value := '%' + EditBuscaCliente.Text + '%';
      Open;
    end;
end;

//Usu�rio seleciona se quer realizar a busca por C�digo ou Nome do produto. Cada
//tecla pressionada traz os resultados que coincidem com o que foi digitado at�
//o momento.
procedure TFormVendas.EditBuscaProdutosChange(Sender: TObject);
begin
  with ZQueryProdutos do
    begin
      Close;
      if RadioGroupCriterio.ItemIndex=0 then
        begin
          SQL.Text := 'select * from produtos where codigo_produto like :nome';
        end
      else
        begin
          SQL.Text := 'select * from produtos where nome_produto like :nome';
        end;

      ParamByName('nome').Value := '%' + EditBuscaProdutos.Text + '%';
      Open;
    end;
end;

//Usu�rio s� pode digitar n�mero e v�rgula.
procedure TFormVendas.EditPagoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', ',',#8]) then
    key:=#0;
end;

//Usu�rio s� pode digitar n�meros.
procedure TFormVendas.EditQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#8]) then
    key:=#0;
end;

//Essa procedure evitar� que, ao remover algo do carrinho, o usu�rio ainda possa
//pagar uma conta zerada ou remover "nada" do carrinho.}
procedure TFormVendas.editValorChange(Sender: TObject);
begin
  if editValor.Text = '0,00' then
    begin
      btnPagar.Enabled := false;
      btnRemover.Enabled := false;
    end;
end;

//Ao fechar o formul�rio, apaga todos os itens da tabela carrinho.
procedure TFormVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ZQueryDelC.Refresh;
  while not ZQueryDelC.Eof do
    begin
      ZQueryDelC.Delete;
    end;
  FormVendas := NIL;
  Action := caFree;
end;

//Evita que, se o programa for fechado pelo gerenciador de tarefas, o carrinho
//j� comece populado.
procedure TFormVendas.FormCreate(Sender: TObject);
begin
  ZQueryDelC.Refresh;
  while not ZQueryDelC.Eof do
    begin
      ZQueryDelC.Delete;
    end;
end;

//Ao completar uma venda, retira a quantia vendida do estoque.
procedure TFormVendas.removeDoEstoque(idp, qtd: integer);
begin
  with ZQueryProdutos do
      begin
        Close;
        SQL.Text := 'select * from produtos where id_produto = :prod';
        ParamByName('prod').Value := idp;
        Open;
      end;
    ZQueryProdutos.Edit;
    ZQueryProdutosqtd_produto.Value := ZQueryProdutosqtd_produto.Value - qtd;
    ZQueryProdutos.Post;

  with ZQueryProdutos do
    begin
      Close;
      SQL.Text := 'select * from produtos';
      Open;
    end;
end;

//Seleciona produtos no carrinho com o mesmo id que o selecionado no estoque,
//verifica se h� produtos suficientes, retorna a Zquery ao seu estado original e
//retorna um verdadeiro ou falso.
function TFormVendas.verificaEstoque(qtd: integer): boolean;
  var estoque, somacar: integer;
begin

  estoque := ZQueryProdutosqtd_produto.Value;


  with ZQueryCarrinho do
    begin
      Close;
      SQL.Text := 'select id_qtdc, valor_produtos, id_produtoc, id_carrinho,  sum(id_qtdc) as qtd from carrinho where id_produtoc = :prod';
      ParamByName('prod').Value := ZQueryProdutosid_produto.Value;
      Open;
    end;

      somacar := qtd + ZQueryCarrinhoqtd.Value;

  if (estoque < qtd) OR (estoque < somacar)  then
    begin
      Result := false;
    end
  else
    begin
      Result := true;
    end;

  with ZQueryCarrinho do
    begin
      Close;
      SQL.Text := 'select id_qtdc, valor_produtos, id_produtoc, id_carrinho,  sum(id_qtdc) as qtd from carrinho group by id_produtoc';
      Open;
    end;


end;

//Ao selecionar um cliente no DBGrid, exibe seu nome abaixo do carrinho.
procedure TFormVendas.ZQueryClientesAfterScroll(DataSet: TDataSet);
  var cliente : TCliente;
begin
  cliente := TCliente.Create;
  cliente.Nome := ZQueryClientesnome_cliente.Text;
  lblNomeCliente.Caption := cliente.Nome;
end;

end.
