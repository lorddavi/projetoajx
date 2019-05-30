program ProjetoAJX;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitCadastroClientes in 'UnitCadastroClientes.pas' {FormCadastroClientes},
  UnitCadastroProdutos in 'UnitCadastroProdutos.pas' {FormCadastroProdutos},
  UnitNovaVenda in 'UnitNovaVenda.pas' {FormVendas},
  UnitCliente in 'UnitCliente.pas',
  UnitProduto in 'UnitProduto.pas',
  UnitVenda in 'UnitVenda.pas',
  UnitEndereco in 'UnitEndereco.pas',
  UnitDataModule in 'UnitDataModule.pas' {DM: TDataModule},
  UnitTelefone in 'UnitTelefone.pas',
  UnitCarrinho in 'UnitCarrinho.pas',
  UnitFormRelatorio in 'UnitFormRelatorio.pas' {FormRelatorio},
  UnitFormHistorico in 'UnitFormHistorico.pas' {FormHistorico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
