object FrmPadrao: TFrmPadrao
  Left = 278
  Top = 183
  BorderIcons = []
  Caption = 'FormPadr'#227'o'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 13
  object PnlBottom: TPanel
    Left = 0
    Top = 364
    Width = 912
    Height = 77
    Align = alBottom
    TabOrder = 0
    object PnlBotoes: TPanel
      Left = 352
      Top = 0
      Width = 561
      Height = 73
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 24
        Top = 14
        Width = 81
        Height = 41
        Caption = 'Voltar'
        OnClick = SpeedButton1Click
      end
    end
  end
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 364
    Align = alClient
    TabOrder = 1
  end
  object IBTable1: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    PrecommittedReads = False
    UniDirectional = False
    Left = 120
    Top = 24
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    PrecommittedReads = False
    Left = 152
    Top = 24
  end
  object IBUpdateSQL1: TIBUpdateSQL
    Left = 120
    Top = 56
  end
  object IBSQL1: TIBSQL
    Left = 152
    Top = 56
  end
end
