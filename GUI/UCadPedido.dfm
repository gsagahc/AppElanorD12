object FrmNPedido: TFrmNPedido
  Left = 265
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Novo pedido'
  ClientHeight = 511
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  TextHeight = 13
  object PanelCliente: TPanel
    Left = 0
    Top = 0
    Width = 843
    Height = 265
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 168
      Width = 73
      Height = 13
      Caption = 'Vencimentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 128
      Width = 64
      Height = 13
      Caption = 'Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 48
      Width = 55
      Height = 13
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 88
      Width = 34
      Height = 13
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 307
      Top = 88
      Width = 40
      Height = 13
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 687
      Top = 88
      Width = 17
      Height = 13
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 632
      Top = 48
      Width = 25
      Height = 13
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 24
      Top = 208
      Width = 30
      Height = 13
      Caption = 'OBS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PngSdBCancelar: TPngSpeedButton
      Left = 769
      Top = 184
      Width = 65
      Height = 57
      ImageIndex = 4
      Images = FrmPrincipal.PngImageListBotoes
      StyleName = 'Windows'
      OnClick = PngSdBCancelarClick
    end
    object PngSdBSalvar: TPngSpeedButton
      Left = 769
      Top = 121
      Width = 65
      Height = 57
      ImageIndex = 7
      Images = FrmPrincipal.PngImageListBotoes
      Enabled = False
      StyleName = 'Windows'
    end
    object RadioGroupBoleto: TRadioGroup
      Left = 576
      Top = 168
      Width = 169
      Height = 41
      Caption = 'Boleto'
      Columns = 2
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'N'#227'o')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 11
      TabStop = True
    end
    object FieldEditCliente: TFieldEdit
      Left = 24
      Top = 26
      Width = 721
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = FieldEditClienteExit
    end
    object FieldEditEndereco: TFieldEdit
      Left = 24
      Top = 64
      Width = 602
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object FieldEditCEP: TFieldEdit
      Left = 631
      Top = 64
      Width = 114
      Height = 21
      TabOrder = 2
    end
    object FieldEditBairro: TFieldEdit
      Left = 24
      Top = 104
      Width = 277
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
    end
    object FieldEditCidade: TFieldEdit
      Left = 307
      Top = 104
      Width = 374
      Height = 21
      TabOrder = 4
    end
    object FieldEditUF: TFieldEdit
      Left = 687
      Top = 104
      Width = 58
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object FieldComboBoxPrazo: TFieldComboBox
      Left = 24
      Top = 146
      Width = 721
      Height = 21
      Style = csDropDownList
      TabOrder = 6
      OnCloseUp = FieldComboBoxPrazoCloseUp
    end
    object fldtPrazo: TFieldEdit
      Left = 24
      Top = 184
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 7
    end
    object fldtPrazo1: TFieldEdit
      Left = 151
      Top = 184
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
    end
    object fldtPrazo2: TFieldEdit
      Left = 278
      Top = 184
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 9
    end
    object fldtPrazo3: TFieldEdit
      Left = 405
      Top = 184
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 10
    end
    object fldtOBS: TFieldEdit
      Left = 24
      Top = 223
      Width = 721
      Height = 21
      TabOrder = 12
    end
  end
  object PanelProdutos: TPanel
    Left = 0
    Top = 265
    Width = 843
    Height = 246
    Align = alClient
    TabOrder = 1
    object PanelBotoesProd: TPanel
      Left = 787
      Top = 1
      Width = 55
      Height = 203
      Align = alRight
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 786
      Height = 203
      Align = alClient
      Ctl3D = False
      DataSource = DsItensPedido
      ParentCtl3D = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_PRODUTO'
          Title.Caption = 'Nome'
          Width = 362
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBITPED_UNIDADE'
          Title.Caption = 'Unidade'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAMANHO'
          Title.Caption = 'Tamanho'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBITPED_QUANT'
          ReadOnly = True
          Title.Caption = 'Quantidade'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBITPED_VALUNI'
          Title.Caption = 'Valor unit'#225'rio'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBITPED_VALTOT'
          Title.Caption = 'Valor total'
          Width = 86
          Visible = True
        end>
    end
    object DBLookupListBox1: TDBLookupListBox
      Left = 112
      Top = 40
      Width = 185
      Height = 147
      DataField = 'ID_PRAZO'
      DataSource = DsPedido
      KeyField = 'ID_PRAZO'
      ListField = 'TBPRZ_NOME'
      ListSource = DSPrazos
      TabOrder = 2
      Visible = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 204
      Width = 841
      Height = 41
      Align = alBottom
      TabOrder = 3
      object Label9: TLabel
        Left = 536
        Top = 8
        Width = 100
        Height = 24
        Caption = 'Valor total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtValorTotal: TEdit
        Left = 640
        Top = 5
        Width = 145
        Height = 28
        AutoSize = False
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object DsPedido: TDataSource
    Left = 320
    Top = 350
  end
  object DSPrazos: TDataSource
    Left = 248
    Top = 350
  end
  object DsProdutos: TDataSource
    Left = 400
    Top = 359
  end
  object CDSItensPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 176
    Top = 288
    object CDSItensPedidoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object CDSItensPedidoTBITPED_VALUNI: TCurrencyField
      FieldName = 'TBITPED_VALUNI'
      OnChange = CDSItensPedidoTBITPED_VALUNIChange
      DisplayFormat = 'R$ #0.000'
    end
    object CDSItensPedidoTBITPED_VALTOT: TCurrencyField
      FieldName = 'TBITPED_VALTOT'
      DisplayFormat = 'R$ #,,0.00'
    end
    object CDSItensPedidoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object CDSItensPedidoTBITPED_UNIDADE: TStringField
      FieldName = 'TBITPED_UNIDADE'
      Size = 4
    end
    object CDSItensPedidoNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 60
    end
    object CDSItensPedidoFORMATO: TStringField
      FieldName = 'FORMATO'
      Size = 16
    end
    object CDSItensPedidoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 5
    end
    object CDSItensPedidoTBITPED_QUANT: TBCDField
      FieldName = 'TBITPED_QUANT'
      OnChange = CDSItensPedidoTBITPED_QUANTChange
      DisplayFormat = '###,###,##0.000'
      Size = 19
    end
    object CDSItensPedidoID_ESTOQUE: TIntegerField
      FieldName = 'ID_ESTOQUE'
    end
  end
  object DsItensPedido: TDataSource
    DataSet = CDSItensPedido
    Left = 176
    Top = 350
  end
  object dsCDSPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 289
  end
  object dsCDSCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 297
  end
end
