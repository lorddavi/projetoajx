object FormVendas: TFormVendas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Projeto AJX - Venda'
  ClientHeight = 565
  ClientWidth = 779
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPago: TLabel
    Left = 679
    Top = 486
    Width = 39
    Height = 25
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 621
    Top = 496
    Width = 44
    Height = 13
    Caption = 'Pago: R$'
  end
  object Label5: TLabel
    Left = 618
    Top = 532
    Width = 47
    Height = 13
    Caption = 'Troco: R$'
  end
  object lblTroco: TLabel
    Left = 679
    Top = 523
    Width = 39
    Height = 25
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GBCliente: TGroupBox
    Left = 8
    Top = 16
    Width = 321
    Height = 209
    Caption = 'Cliente'
    TabOrder = 0
    object EditBuscaCliente: TEdit
      Left = 16
      Top = 73
      Width = 241
      Height = 21
      TabOrder = 0
      TextHint = 'Busque um cliente'
      OnChange = EditBuscaClienteChange
    end
    object DBGridClientes: TDBGrid
      Left = 16
      Top = 100
      Width = 289
      Height = 93
      DataSource = DataSourceClientes
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome_cliente'
          Title.Caption = 'Nome'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cpf_cliente'
          Title.Caption = 'CPF'
          Visible = True
        end>
    end
    object RadioGroupCriterioCli: TRadioGroup
      Left = 64
      Top = 16
      Width = 185
      Height = 51
      Caption = 'Crit'#233'rio de Busca'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Nome'
        'CPF')
      TabOrder = 2
    end
  end
  object GBProdutos: TGroupBox
    Left = 8
    Top = 240
    Width = 321
    Height = 305
    Caption = 'Produtos'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 271
      Width = 60
      Height = 13
      Caption = 'Quantidade:'
    end
    object EditBuscaProdutos: TEdit
      Left = 16
      Top = 77
      Width = 241
      Height = 21
      TabOrder = 0
      TextHint = 'Busque um produto'
      OnChange = EditBuscaProdutosChange
    end
    object RadioGroupCriterio: TRadioGroup
      Left = 72
      Top = 14
      Width = 185
      Height = 57
      Caption = 'Crit'#233'rio de Busca'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 1
    end
    object EditQuantidade: TEdit
      Left = 90
      Top = 271
      Width = 71
      Height = 21
      TabOrder = 2
      Text = '1'
      OnKeyPress = EditQuantidadeKeyPress
    end
    object DBGridProdutos: TDBGrid
      Left = 16
      Top = 104
      Width = 289
      Height = 153
      DataSource = DataSourceProdutos
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome_produto'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_produto'
          Title.Caption = 'Valor (R$)'
          Visible = True
        end>
    end
    object btnAddProduto: TButton
      Left = 167
      Top = 271
      Width = 138
      Height = 25
      Caption = 'Adicionar ao Carrinho'
      ImageIndex = 2
      Images = ImageList1
      TabOrder = 4
      OnClick = btnAddProdutoClick
    end
  end
  object GBCarrinho: TGroupBox
    Left = 344
    Top = 16
    Width = 425
    Height = 464
    Caption = 'Carrinho'
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 430
      Width = 37
      Height = 13
      Caption = 'Cliente:'
    end
    object lblNomeCliente: TLabel
      Left = 72
      Top = 430
      Width = 98
      Height = 13
      Caption = 'Selecione um Cliente'
    end
    object Label3: TLabel
      Left = 274
      Top = 430
      Width = 44
      Height = 13
      Caption = 'Valor: R$'
    end
    object DBGridCarrinho: TDBGrid
      Left = 16
      Top = 26
      Width = 401
      Height = 359
      DataSource = DataSourceCarrinho
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NomeProduto'
          Title.Caption = 'Produto:'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd'
          Title.Caption = 'Unidades:'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_produtos'
          Title.Caption = 'Valor (R$)'
          Visible = True
        end>
    end
    object btnRemover: TButton
      Left = 264
      Top = 391
      Width = 139
      Height = 25
      Caption = 'Remover do Carrinho'
      Enabled = False
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 1
      OnClick = btnRemoverClick
    end
  end
  object editValor: TEdit
    Left = 668
    Top = 438
    Width = 60
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = '0,00'
    OnChange = editValorChange
  end
  object EditPago: TEdit
    Left = 346
    Top = 493
    Width = 89
    Height = 21
    TabOrder = 4
    Text = '0'
    TextHint = 'Valor a ser pago'
    OnKeyPress = EditPagoKeyPress
  end
  object btnPagar: TButton
    Left = 451
    Top = 491
    Width = 66
    Height = 25
    Caption = 'Pagar'
    Enabled = False
    ImageIndex = 1
    Images = ImageList1
    TabOrder = 5
    OnClick = btnPagarClick
  end
  object ZQueryClientes: TZQuery
    Connection = DM.ZConnection
    AfterScroll = ZQueryClientesAfterScroll
    Active = True
    SQL.Strings = (
      'select * from clientes;')
    Params = <>
    Left = 384
    Top = 184
    object ZQueryClientesid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Required = True
    end
    object ZQueryClientesnome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Required = True
      Size = 50
    end
    object ZQueryClientesemail_cliente: TWideStringField
      FieldName = 'email_cliente'
      Size = 50
    end
    object ZQueryClientescpf_cliente: TWideStringField
      FieldName = 'cpf_cliente'
      Required = True
      Size = 15
    end
  end
  object ZQueryProdutos: TZQuery
    Connection = DM.ZConnection
    Active = True
    SQL.Strings = (
      'select * from produtos')
    Params = <>
    Left = 439
    Top = 200
    object ZQueryProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      Required = True
    end
    object ZQueryProdutoscodigo_produto: TWideStringField
      FieldName = 'codigo_produto'
      Required = True
      Size = 10
    end
    object ZQueryProdutosnome_produto: TWideStringField
      FieldName = 'nome_produto'
      Required = True
      Size = 30
    end
    object ZQueryProdutosqtd_produto: TIntegerField
      FieldName = 'qtd_produto'
    end
    object ZQueryProdutosvalor_produto: TFloatField
      FieldName = 'valor_produto'
      DisplayFormat = '##0.00'
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = ZQueryClientes
    Left = 391
    Top = 80
  end
  object DataSourceProdutos: TDataSource
    DataSet = ZQueryProdutos
    Left = 455
    Top = 96
  end
  object ZQueryCarrinho: TZQuery
    Connection = DM.ZConnection
    Active = True
    SQL.Strings = (
      
        'select id_qtdc, valor_produtos, id_produtoc, id_carrinho,  sum(i' +
        'd_qtdc) as qtd from carrinho group by id_produtoc;')
    Params = <>
    Left = 495
    Top = 184
    object ZQueryCarrinhovalor_produtos: TFloatField
      FieldName = 'valor_produtos'
      Required = True
      DisplayFormat = '##0.00'
    end
    object ZQueryCarrinhoid_produtoc: TIntegerField
      FieldName = 'id_produtoc'
      Required = True
    end
    object ZQueryCarrinhoid_carrinho: TIntegerField
      FieldName = 'id_carrinho'
      Required = True
    end
    object ZQueryCarrinhoqtd: TLargeintField
      FieldName = 'qtd'
      ReadOnly = True
    end
    object ZQueryCarrinhoNomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeProduto'
      LookupDataSet = ZQueryProdutos
      LookupKeyFields = 'id_produto'
      LookupResultField = 'nome_produto'
      KeyFields = 'id_produtoc'
      Lookup = True
    end
    object ZQueryCarrinhoid_qtdc: TIntegerField
      FieldName = 'id_qtdc'
      Required = True
    end
  end
  object DataSourceCarrinho: TDataSource
    DataSet = ZQueryCarrinho
    Left = 527
    Top = 80
  end
  object DataSourceVendas: TDataSource
    DataSet = ZQueryVenda
    Left = 591
    Top = 96
  end
  object ZQueryVenda: TZQuery
    Connection = DM.ZConnection
    Active = True
    SQL.Strings = (
      'select * from vendas')
    Params = <>
    Left = 551
    Top = 200
    object ZQueryVendaid_venda: TIntegerField
      FieldName = 'id_venda'
      Required = True
    end
    object ZQueryVendadata_venda: TDateField
      FieldName = 'data_venda'
      Required = True
    end
    object ZQueryVendavalor_venda: TFloatField
      FieldName = 'valor_venda'
    end
    object ZQueryVendaid_clientev: TIntegerField
      FieldName = 'id_clientev'
    end
  end
  object ZQueryPedido: TZQuery
    Connection = DM.ZConnection
    Active = True
    SQL.Strings = (
      'select * from pedido')
    Params = <>
    Left = 599
    Top = 184
    object ZQueryPedidoid_pedido: TIntegerField
      FieldName = 'id_pedido'
      Required = True
    end
    object ZQueryPedidoid_vendap: TIntegerField
      FieldName = 'id_vendap'
      Required = True
    end
    object ZQueryPedidoid_produtop: TIntegerField
      FieldName = 'id_produtop'
      Required = True
    end
    object ZQueryPedidoid_qtdp: TIntegerField
      FieldName = 'id_qtdp'
      Required = True
    end
  end
  object DataSourcePedido: TDataSource
    DataSet = ZQueryPedido
    Left = 655
    Top = 80
  end
  object ZQueryDelC: TZQuery
    Connection = DM.ZConnection
    Active = True
    SQL.Strings = (
      'select * from carrinho')
    Params = <>
    Left = 655
    Top = 200
    object ZQueryDelCid_carrinho: TIntegerField
      FieldName = 'id_carrinho'
      Required = True
    end
    object ZQueryDelCvalor_produtos: TFloatField
      FieldName = 'valor_produtos'
      Required = True
    end
    object ZQueryDelCid_qtdc: TIntegerField
      FieldName = 'id_qtdc'
      Required = True
    end
    object ZQueryDelCid_produtoc: TIntegerField
      FieldName = 'id_produtoc'
      Required = True
    end
  end
  object ImageList1: TImageList
    Left = 552
    Top = 408
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099CC99FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A5D5A5FFBEE5BEFFBDE2BDFFD8EBD8590000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004F5150FF484948FF0000000000000000000000005758
      57FF474847F50000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AFDD
      AFFFB8E3B8FFBBE2BBFFBCE2BCFFC2E4C2FFA8CF97E900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C2BFBFFFCCCACA99828384FF7C7C7DFFCBC9C997CDCCCB97C8C6C6978686
      87FF707071FDDCDBDA6000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C7E2C784B2E2B2FFB4E2
      B4FFB7E2B7FFBAE2BAFFBCE2BCFFBEE2BEFFD3E6BDFF43C7F6FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFEEEE2BC4C1C1C800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009ACD9AFFB1E5B1FFB2E2B2FFB4E2
      B4FFB8E2B8FFBAE2BAFFBCE2BCFFBFE2BFFFD1E6BCFF37ADE2FF499DCCFF60E4
      FF9F000000000000000000000000000000000000000000000000000000000000
      000000000000B4B1B1EEBFBCBBF0BFBCBBEFBFBCBBEFBFBCBBEFBFBCBBEFBFBC
      BBEFBFBCBBEFC3C0C0DC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5FA0AF1F1F80EF1F1F70EF1F1
      F70EF1F1F70EF1F1F70EF1F1F70EF1F1F70EF1F1F70EF1F1F70EF1F1F60EF1F1
      F60EF1F1F60EF1F1F60EF1F1F60EF7F7F908A9DEA9FFAFE2AFFFB2E2B2FFB5E2
      B5FFB5E1B5FFD9F5D9FFB5DEB5FFBDE2BDFFD0E6BBFF56BEEBFF51A7D2FF4794
      C6FF4BDEFFB40000000000000000000000000000000000000000000000000000
      000000000000B3B0AFFF8B898AFF919093FF9F9DA1FF716F7CFF9A999BFF5C5D
      6FFF9C9CA7FF6B6888FFFEFEFE01000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007373C1965757BBBF5656BABD5454
      B7BD5252B4BD5050B1BD4E4EAEBD4D4DABBD4B4BA9BD4A4AA6BD4949A3BD4747
      A0BD46469EBD45459BBD454598BC8282B27DA9DCA9FFB0E2B0FFB2E2B2FFAFDD
      AFFFD3F7D3FFDBF9DBFFDBF6DBFFC5E6C5FFCEE3BAFF7AD1F5FF7CBDDEFF65AC
      D5FF8FE3D7FFD2E8D26800000000000000000000000000000000000000000000
      0000DCDBDB52999695FF969496FF9A999EFF9B9AABFF949399FF7E7F8CFF8787
      A2FF7576ABFF8B89A8FFE1E0E04E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005252C5D96D6DEAFF6363E3FF5959
      DDFF4E4ED7FF4444D0FF3B3BCAFF3333C3FF2B2BBDFF2424B6FF1D1DB0FF1818
      A9FF1212A2FF0E0E9BFF0A0A94FD41418FC0A9DCA9FFAFE2AFFFAEDEAEFFCDF6
      CDFFE8FFE8FFEAFFEAFFEAFFEAFFCDEBCDFFF2F8DDFF9AE0FBFFACD4EAFF9BC7
      E2FF83E0D8FFC4E4C2FF99CB99F4000000000000000000000000000000000000
      0000B2AFAFBB898891FF97959AFF9C9BA1FFA2A1AFFF9897A1FF7878ACFF8F8D
      B4FF8E93C6FF9795B3FFC7C5C5A9000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006565D0D59595FAFF8989F2FF7A7A
      ECFF6C6CE6FF6060DFFF5454D8FF4949D2FF3F3FCBFF3535C4FF2D2DBDFF2525
      B6FF1E1EAFFF1818A8FF11119FFD494997B8A7DBA7FFB7E9B7FFC0F0C0FFE2FF
      E2FF93C093FFB7DDB7FFEBFFEBFFFFFFFDFF779FA1FFD7FCFFFFD9E8F3FFCADE
      EEFF7FDCD7FFC0E2BFFFC3E5C3FF97CB97FF0000000000000000000000000000
      0000B2AFAEFF918F91FD968B93FE908E9EFFA09FA3FF9A99B2CDA4A3B0FF7C72
      9AECA8A7B8FF6C6EACFFB8B5B5FB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005252C6D06262E2F75C5CDEF65454
      D9F64C4CD3F64545CEF63F3FC8F63838C4F63232BFF62C2CBAF62727B4F62323
      AEF61E1EAAF61B1BA5F618189FF44A4A99B7B2E5B2FFC1F4C1FFC6F6C6FFDBFF
      DBFFBBE4BBFFCDEECDFFFCFFF0FF63A9BCFFAEF6FFFFB3F0FFFFD7FAFFFFFFFB
      FBFF79DAD5FFC0E2BFFFC0E5C0FF98CB98FC0000000000000000000000000000
      0000BEBBBAFF606066FF89888FFF8C8B93FF7473B0FFA4A2A3FF48495AFFADAC
      ACFF404683FFB8B6B9FFB8B5B4FD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B6DF499797CC689898CC679898
      CB679898CA679898C9679898C9679898C8679898C7679898C7679898C6679898
      C5679898C4679898C4679999C366C7C7DE380000000092C592FFCFFFCFFFC0EE
      C0FFDDFFDCFFF2FEDAFF6BC1DAFF62E2FFFF7DE5FFFF9BEBFFFFBBF1FFFFF0FD
      FFFF6ED6D2FFBFE2BEFFC0E5C0FF98CB98FC000000000000000000000000FDFD
      FD03B3B0AFE685848DFF71718DFF706FABFF9D9BA8FF5C5C8DFFA6A3A2FF8988
      A0FFBAB8B8FFBCB9B8FFBAB8B7FD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4D6
      A2FFD7DFB7FF8BE2FAFF0DD0FFFF41DAFFFF63E0FFFF82E7FFFFABEFFFFF64E2
      FFFFD7E6C1FFCBE9CBFFC1E4C1FF98CB98FC000000000000000000000000D5D4
      D364B9B6B6FFB9B6B5FFB5B2B4FF8C88A5FF635F9BFF514E9FFF2C2B9CFF383B
      AEFF4B4EB2FF3332B7FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002FDCFFFF08CDFFFF00CCFFFF29D5FFFF48DBFFFF73E4FFFF76E2F4FFFBFA
      EBFFFBFFFAFFBDE0BDFFE2F7E2FF98CB98FC000000000000000000000000AEAC
      ABCFF7F6F61400000000864E80E58383BEAA2E2F65ECA8A9E484B382B6D44232
      6DF29495BF8D6F70BDCB00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000088E5FF7777E5FFFF00CDFFFF42DAFFFFBFF6F6FFFFFFF8FFFAFD
      FAFFB8DBB8FFF4FEF4FFA2D2A2FF00000000000000000000000000000000B9B6
      B6FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000015D2FFFFA7D4A4FFE7F9E2FFEEFBEEFFFFFF
      FFFFF0F9F0FF8DC68DFF000000000000000028282AFF414040FFB7B4B4DDD4D2
      D26E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CAE4CA74D4EED4FFB2D9
      B2FF00000000000000000000000000000000FDFDFD0200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFBFFFFFF0000FFFFF0FFFCE70000
      FFFFE07FF0030000FFFF803FF3FF0000FFFF000FF803000000000007F8010000
      00000003F001000000000001F001000000000000F001000000000000F0010000
      00008000E0010000FFFFE000E0030000FFFFF000E4030000FFFFF801EFFF0000
      FFFFFE030FFF0000FFFFFF8F7FFF000000000000000000000000000000000000
      000000000000}
  end
end
