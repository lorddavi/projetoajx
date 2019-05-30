unit UnitFormHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.WinXPickers, Vcl.ExtCtrls;

type
  TFormHistorico = class(TForm)
    DataSourceVendas: TDataSource;
    btnHistorico: TButton;
    ImageList1: TImageList;
    GroupBoxHist: TGroupBox;
    DateTimePickerInicio: TDateTimePicker;
    btnImprimir: TButton;
    DateTimePickerFim: TDateTimePicker;
    RadioGroupBusca: TRadioGroup;
    ZQueryVendas: TZQuery;
    ZQueryVendasid_venda: TIntegerField;
    ZQueryVendasdata_venda: TDateField;
    ZQueryVendasvalor_venda: TFloatField;
    ZQueryVendasid_clientev: TIntegerField;
    ZQueryVendasCliente: TStringField;
    ZQueryCliente: TZQuery;
    ZQueryClienteid_cliente: TIntegerField;
    ZQueryClientenome_cliente: TWideStringField;
    ZQueryClienteemail_cliente: TWideStringField;
    ZQueryClientecpf_cliente: TWideStringField;
    procedure btnHistoricoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RadioGroupBuscaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistorico: TFormHistorico;

implementation

{$R *.dfm}

uses UnitDataModule, UnitFormRelatorio;

//Instancia o form relatório e abre as propriedades de impressão sem a necessidade
//de visualizar o relatório.
procedure TFormHistorico.btnImprimirClick(Sender: TObject);
begin
  FormRelatorio := TFormRelatorio.Create(self);
  FormRelatorio.RLReport1.Print();
end;

//Coloca a data do primeiro DateTimePicker para 1 mês atrás, e do segundo para Hoje.
procedure TFormHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormHistorico := NIL;
  Action := caFree;
end;

procedure TFormHistorico.FormShow(Sender: TObject);
begin
  DateTimePickerInicio.Date := Date - 30;
  DateTimePickerFim.Date := Date;
end;

//Desabilita os DateTimePicker caso a busca não seja entre datas específicas.
procedure TFormHistorico.RadioGroupBuscaClick(Sender: TObject);
begin
  if RadioGroupBusca.ItemIndex=0 then
    begin
      DateTimePickerInicio.Enabled := false;
      DateTimePickerFim.Enabled := false;
    end
  else
    begin
      DateTimePickerInicio.Enabled := true;
      DateTimePickerFim.Enabled := true;
    end;
end;

//Muda o SQL do ZQuery para o respectivo tipo de busca selecionado e exibe o relatório.
procedure TFormHistorico.btnHistoricoClick(Sender: TObject);
  begin
    with ZQueryVendas do
      begin
        Close;
        if (RadioGroupBusca.ItemIndex = 0) then
          begin
            SQL.Text := 'select * from vendas';
          end
        else
          begin
            SQL.Text := 'select * from vendas where data_venda between :data1 and :data2 order by data_venda';
            ParamByName('data1').AsDate := DateTimePickerInicio.Date;
            ParamByName('data2').AsDate := DateTimePickerFim.Date;
          end;
        Open;
      end;


    FormRelatorio := TFormRelatorio.Create(self);
    FormRelatorio.RLReport1.Preview();
  end;

end.
