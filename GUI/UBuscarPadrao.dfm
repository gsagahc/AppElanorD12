object FrmBuscarPrd: TFrmBuscarPrd
  Left = 267
  Top = 231
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 355
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 88
    Width = 611
    Height = 267
    Align = alBottom
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 609
      Height = 265
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      DataSource = DSGrid
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_PRODUTO'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRD_NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 251
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRD_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 221
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBPRD_PRECOVENDA'
          Title.Caption = 'Pre'#231'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 89
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 15
      Top = 25
      Width = 37
      Height = 13
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PngSdBBuscar: TPngSpeedButton
      Left = 464
      Top = 16
      Width = 65
      Height = 57
      ImageIndex = 1
      Images = FrmPrincipal.PngImageListBotoes
      StyleName = 'Windows'
    end
    object PngSdBVoltar: TPngSpeedButton
      Left = 535
      Top = 16
      Width = 65
      Height = 57
      ImageIndex = 6
      Images = FrmPrincipal.PngImageListBotoes
      StyleName = 'Windows'
      OnClick = PngSdBVoltarClick
    end
    object EditNome: TEdit
      Left = 16
      Top = 41
      Width = 440
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object DSGrid: TDataSource
    Left = 440
    Top = 80
  end
  object TimerBusca: TTimer
    Interval = 2000
    OnTimer = TimerBuscaTimer
    Left = 496
    Top = 64
  end
end
