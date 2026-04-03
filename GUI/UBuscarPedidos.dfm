object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 458
  ClientWidth = 885
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 317
    Width = 885
    Height = 141
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitTop = 312
    object DBGrid2: TDBGrid
      Left = 1
      Top = 1
      Width = 883
      Height = 139
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 104
    Width = 885
    Height = 213
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 883
      Height = 211
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 885
    Height = 113
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 376
    ExplicitWidth = 185
    object PnlBotoes: TPanel
      Left = 528
      Top = 1
      Width = 356
      Height = 111
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object PngSdBLocalizar: TPngSpeedButton
        Left = 25
        Top = 23
        Width = 65
        Height = 57
        ImageIndex = 1
        Images = FrmPrincipal.PngImageListBotoes
        StyleName = 'Windows'
      end
      object PngSdBDeletar: TPngSpeedButton
        Left = 90
        Top = 23
        Width = 65
        Height = 57
        ImageIndex = 2
        Images = FrmPrincipal.PngImageListBotoes
        Enabled = False
        StyleName = 'Windows'
      end
      object PngSdBSalvar: TPngSpeedButton
        Left = 155
        Top = 23
        Width = 65
        Height = 57
        ImageIndex = 7
        Images = FrmPrincipal.PngImageListBotoes
        Enabled = False
        StyleName = 'Windows'
      end
      object PngSdBCancelar: TPngSpeedButton
        Left = 220
        Top = 23
        Width = 65
        Height = 57
        ImageIndex = 4
        Images = FrmPrincipal.PngImageListBotoes
        Enabled = False
        StyleName = 'Windows'
      end
      object PngSdBVoltar: TPngSpeedButton
        Left = 285
        Top = 23
        Width = 65
        Height = 57
        ImageIndex = 6
        Images = FrmPrincipal.PngImageListBotoes
        StyleName = 'Windows'
      end
    end
    object GBoxPeriodo: TGroupBox
      Left = 280
      Top = 8
      Width = 257
      Height = 91
      Caption = 'Per'#237'odo'
      TabOrder = 1
      object DateTimePicker1: TDateTimePicker
        Left = 16
        Top = 50
        Width = 97
        Height = 23
        Date = 46111.000000000000000000
        Time = 0.421940717591496700
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 137
        Top = 50
        Width = 97
        Height = 23
        Date = 46111.000000000000000000
        Time = 0.422059398151759500
        TabOrder = 1
      end
    end
  end
end
