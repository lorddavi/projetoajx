object FormRelatorio: TFormRelatorio
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Projeto AJX - Relat'#243'rioio'
  ClientHeight = 384
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataSourceVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de Vendas'
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 19
      BandType = btHeader
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 79
        Height = 16
        Align = faLeftTop
        Caption = 'Projeto AJX'
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 339
        Top = 0
        Width = 40
        Height = 16
        Align = faCenterTop
        Info = itTitle
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 590
        Top = 0
        Width = 128
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'P'#225'g.:'
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 81
      Width = 718
      Height = 32
      object RLDBTextCliente: TRLDBText
        Left = 40
        Top = 6
        Width = 297
        Height = 16
        DataField = 'Cliente'
        DataSource = DataSourceVendas
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 361
        Top = 3
        Width = 90
        Height = 16
        DataField = 'valor_venda'
        DataSource = DataSourceVendas
        DisplayMask = '##0.00'
        Text = 'R$ '
      end
      object RLDBText3: TRLDBText
        Left = 570
        Top = 1
        Width = 145
        Height = 16
        DataField = 'data_venda'
        DataSource = DataSourceVendas
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 24
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 605
        Top = 0
        Width = 74
        Height = 16
        Align = faRightTop
        Text = 'Data: '
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 679
        Top = 0
        Width = 39
        Height = 24
        Align = faRight
        Info = itHour
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 57
      Width = 718
      Height = 24
      BandType = btColumnHeader
      object RLLabel2: TRLLabel
        Left = 40
        Top = 2
        Width = 57
        Height = 16
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 361
        Top = 2
        Width = 42
        Height = 16
        Caption = 'Valor: '
      end
      object RLLabel4: TRLLabel
        Left = 570
        Top = 3
        Width = 35
        Height = 16
        Caption = 'Data:'
      end
    end
  end
  object DataSourceVendas: TDataSource
    DataSet = FormHistorico.ZQueryVendas
    Left = 504
    Top = 176
  end
end
