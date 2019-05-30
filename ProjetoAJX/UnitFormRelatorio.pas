unit UnitFormRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UnitDataModule;

type
  TFormRelatorio = class(TForm)
    RLReport1: TRLReport;
    DataSourceVendas: TDataSource;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLDBTextCliente: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLBand4: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelatorio: TFormRelatorio;

implementation

{$R *.dfm}

uses UnitFormHistorico;

procedure TFormRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormRelatorio := NIL;
  Action := caFree;
end;

procedure TFormRelatorio.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FormHistorico.ZQueryVendas.Open;
  FormHistorico.ZQueryCliente.Open;
end;

end.
