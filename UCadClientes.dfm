inherited FrmCadClientes: TFrmCadClientes
  Caption = 'FrmCadClientes'
  ClientHeight = 469
  ClientWidth = 616
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 632
  ExplicitHeight = 508
  TextHeight = 13
  inherited PnlBottom: TPanel
    Top = 392
    Width = 616
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 392
    ExplicitWidth = 616
    inherited PnlBotoes: TPanel
      Left = 118
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 118
      object PngSpeedButton1: TPngSpeedButton
        Left = 422
        Top = 7
        Width = 65
        Height = 57
        ImageIndex = 1
        Images = FrmPrincipal.PngImageListBotoes
        StyleName = 'Windows'
        OnClick = PngSdBLocalizarClick
      end
    end
  end
  inherited PnlMain: TPanel
    Width = 616
    Height = 392
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 616
    ExplicitHeight = 392
    inherited Label1: TLabel
      Width = 93
      Caption = 'Nome do cliente'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 93
    end
    inherited Label2: TLabel
      Width = 32
      Caption = 'CNPJ'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 32
    end
    inherited Label3: TLabel
      Left = 384
      Top = 442
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 384
      ExplicitTop = 442
    end
    inherited Label4: TLabel
      Left = 384
      Top = 482
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 384
      ExplicitTop = 482
    end
    inherited Label5: TLabel
      Width = 55
      Caption = 'Endere'#231'o'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 55
    end
    inherited Label6: TLabel
      Left = 384
      Top = 360
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 384
      ExplicitTop = 360
    end
    inherited Label7: TLabel
      Top = 165
      Width = 34
      Caption = 'Bairro'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 165
      ExplicitWidth = 34
    end
    object Label8: TLabel [7]
      Left = 18
      Top = 283
      Width = 117
      Height = 13
      Caption = 'Prazo de pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel [8]
      Left = 16
      Top = 126
      Width = 76
      Height = 13
      Caption = 'Complemento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel [9]
      Left = 16
      Top = 205
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
    object Label11: TLabel [10]
      Left = 16
      Top = 244
      Width = 51
      Height = 13
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited FieldEdit1: TFieldEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited FieldEdit2: TFieldEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited FieldEdit3: TFieldEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited FieldEdit5: TFieldEdit
      Top = 182
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 182
    end
    inherited Id: TIdEdit
      Left = 537
      Top = 5
      Width = 59
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 537
      ExplicitTop = 5
      ExplicitWidth = 59
    end
    inherited NumEditncm: TNumEdit
      Left = 384
      Top = 376
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 384
      ExplicitTop = 376
    end
    inherited NumEdit1: TNumEdit
      Left = 384
      Top = 458
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 384
      ExplicitTop = 458
    end
    inherited NumEdit2: TNumEdit
      Left = 384
      Top = 498
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 384
      ExplicitTop = 498
    end
    object FieldComboBox1: TFieldComboBox
      Left = 16
      Top = 299
      Width = 577
      Height = 21
      TabOrder = 8
      Text = 'FieldComboBox1'
    end
    object FieldEdit4: TFieldEdit
      Left = 16
      Top = 141
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 9
      Field = 'TBPRD_CODIGO'
      Table = 'TB_PRODUTOS'
    end
    object FieldEdit6: TFieldEdit
      Left = 16
      Top = 220
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 10
      Field = 'TBPRD_CODIGO'
      Table = 'TB_PRODUTOS'
    end
    object FieldEdit7: TFieldEdit
      Left = 16
      Top = 259
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 11
      Field = 'TBPRD_CODIGO'
      Table = 'TB_PRODUTOS'
    end
    object FieldSNRadioGroup1: TFieldSNRadioGroup
      Left = 16
      Top = 326
      Width = 264
      Height = 52
      Caption = 'Utiliza Boleto'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'SIM'
        'N'#195'O')
      ParentFont = False
      TabOrder = 12
    end
    object FieldSNRadioGroup2: TFieldSNRadioGroup
      Left = 329
      Top = 326
      Width = 264
      Height = 52
      Caption = 'Utiliza controle de lotes'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'SIM'
        'N'#195'O')
      ParentFont = False
      TabOrder = 13
    end
  end
end
