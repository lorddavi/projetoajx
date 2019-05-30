unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormPrincipal = class(TForm)
    btnNovoCliente: TBitBtn;
    btnNovoProduto: TBitBtn;
    btnNovaVenda: TBitBtn;
    btnRelatorios: TBitBtn;
    procedure btnNovoClienteClick(Sender: TObject);
    procedure btnNovoProdutoClick(Sender: TObject);
    procedure btnNovaVendaClick(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UnitCadastroClientes, UnitCadastroProdutos, UnitNovaVenda,
  UnitFormRelatorio, UnitFormHistorico;

procedure TFormPrincipal.btnNovaVendaClick(Sender: TObject);
begin
  FormVendas := TFormVendas.Create(self);
  FormVendas.ShowModal;
end;

procedure TFormPrincipal.btnNovoClienteClick(Sender: TObject);
begin
  FormCadastroClientes := TFormCadastroClientes.Create(self);
  FormCadastroClientes.ShowModal;
end;

procedure TFormPrincipal.btnNovoProdutoClick(Sender: TObject);
begin
  FormCadastroProdutos := TFormCadastroProdutos.Create(self);
  FormCadastroProdutos.ShowModal;
end;

procedure TFormPrincipal.btnRelatoriosClick(Sender: TObject);
begin
  FormHistorico := TFormHistorico.Create(self);
  FormHistorico.ShowModal;
end;

end.
