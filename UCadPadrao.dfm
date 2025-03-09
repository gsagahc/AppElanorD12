object FrmCadPadrao: TFrmCadPadrao
  Left = 450
  Top = 148
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastro de produtos'
  ClientHeight = 420
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poDesigned
  OnKeyPress = FormKeyPress
  TextHeight = 13
  object PnlBottom: TPanel
    Left = 0
    Top = 343
    Width = 606
    Height = 77
    Align = alBottom
    TabOrder = 0
    object PnlBotoes: TPanel
      Left = 108
      Top = 1
      Width = 497
      Height = 75
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object PngSdBNovo: TPngSpeedButton
        Left = 32
        Top = 7
        Width = 65
        Height = 57
        ImageIndex = 0
        Images = FrmPrincipal.PngImageListBotoes
        StyleName = 'Windows'
        OnClick = PngSdBNovoClick
      end
      object PngSdBLocalizar: TPngSpeedButton
        Left = 97
        Top = 7
        Width = 65
        Height = 57
        ImageIndex = 1
        Images = FrmPrincipal.PngImageListBotoes
        StyleName = 'Windows'
        OnClick = PngSdBLocalizarClick
      end
      object PngSdBDeletar: TPngSpeedButton
        Left = 162
        Top = 7
        Width = 65
        Height = 57
        ImageIndex = 2
        Images = FrmPrincipal.PngImageListBotoes
        Enabled = False
        StyleName = 'Windows'
      end
      object PngSdBSalvar: TPngSpeedButton
        Left = 227
        Top = 7
        Width = 65
        Height = 57
        ImageIndex = 7
        Images = FrmPrincipal.PngImageListBotoes
        Enabled = False
        StyleName = 'Windows'
        OnClick = PngSdBSalvarClick
      end
      object PngSdBCancelar: TPngSpeedButton
        Left = 292
        Top = 7
        Width = 65
        Height = 57
        ImageIndex = 4
        Images = FrmPrincipal.PngImageListBotoes
        Enabled = False
        StyleName = 'Windows'
        OnClick = PngSdBCancelarClick
      end
      object PngSdBVoltar: TPngSpeedButton
        Left = 357
        Top = 7
        Width = 65
        Height = 57
        ImageIndex = 6
        Images = FrmPrincipal.PngImageListBotoes
        StyleName = 'Windows'
        OnClick = PngSdBVoltarClick
      end
    end
  end
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 343
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 105
      Height = 13
      Caption = 'C'#243'digo do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 98
      Height = 13
      Caption = 'Nome do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 210
      Width = 87
      Height = 13
      Caption = 'Pre'#231'o de custo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 250
      Width = 91
      Height = 13
      Caption = 'Pre'#231'o de venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 88
      Width = 58
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 128
      Width = 28
      Height = 13
      Caption = 'NCM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 168
      Width = 110
      Height = 13
      Caption = 'Unidade de medida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object FieldEdit1: TFieldEdit
      Left = 16
      Top = 23
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 0
      Field = 'TBPRD_CODIGO'
      Table = 'TB_PRODUTOS'
    end
    object FieldEdit2: TFieldEdit
      Left = 16
      Top = 63
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 1
      Field = 'TBPRD_NOME'
      Table = 'TB_PRODUTOS'
    end
    object FieldEdit3: TFieldEdit
      Left = 16
      Top = 104
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 2
      Field = 'TBPRD_DESCRICAO'
      Table = 'TB_PRODUTOS'
    end
    object FieldEdit5: TFieldEdit
      Left = 16
      Top = 185
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 4
      Field = 'TBPRD_UNIDADE'
      Table = 'TB_PRODUTOS'
    end
    object Id: TIdEdit
      Left = 16
      Top = 302
      Width = 121
      Height = 21
      TabOrder = 7
      Text = '0'
      Visible = False
      Table = 'TB_PRODUTOS'
      Field = 'ID_PRODUTO'
    end
    object NumEditncm: TNumEdit
      Left = 16
      Top = 144
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 3
      Text = '0'
      Numerico = True
      Field = 'TBPRD_NCM'
      Table = 'TB_PRODUTOS'
    end
    object NumEdit1: TNumEdit
      Left = 16
      Top = 226
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 5
      Text = '0'
      Numerico = True
      Field = 'TBPRD_PRECOCUSTO'
      Table = 'TB_PRODUTOS'
    end
    object NumEdit2: TNumEdit
      Left = 16
      Top = 266
      Width = 577
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 6
      Text = '0'
      Numerico = True
      Field = 'TBPRD_PRECOVENDA'
      Table = 'TB_PRODUTOS'
    end
  end
  object DSPadrao: TDataSource
    Left = 256
    Top = 88
  end
end
