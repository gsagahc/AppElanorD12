object frmMensagens: TfrmMensagens
  Left = 368
  Top = 280
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 203
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object pnlIcones: TPanel
    Left = 0
    Top = 0
    Width = 70
    Height = 163
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object imgDeletar: TImage
      Left = 0
      Top = 0
      Width = 70
      Height = 49
      Align = alTop
      Center = True
      Visible = False
    end
    object imgErro: TImage
      Left = 0
      Top = 49
      Width = 70
      Height = 49
      Align = alTop
      Center = True
      Visible = False
    end
    object imgCuidado: TImage
      Left = 0
      Top = 98
      Width = 70
      Height = 49
      Align = alTop
      Center = True
      Visible = False
    end
    object imgQuestao: TImage
      Left = 0
      Top = 196
      Width = 70
      Height = 49
      Align = alTop
      Center = True
      Visible = False
    end
    object imgInformacao: TImage
      Left = 0
      Top = 147
      Width = 70
      Height = 49
      Align = alTop
      Center = True
      Visible = False
    end
  end
  object pnlMensagem: TPanel
    Left = 70
    Top = 0
    Width = 272
    Height = 163
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 10
    TabOrder = 1
    object lblMensagem: TLabel
      Left = 10
      Top = 10
      Width = 252
      Height = 143
      Align = alClient
      Caption = 'lblMensagem'
      WordWrap = True
      ExplicitWidth = 62
      ExplicitHeight = 13
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 163
    Width = 342
    Height = 40
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object btnSim: TBitBtn
      Left = 96
      Top = 6
      Width = 75
      Height = 29
      Caption = '&Sim'
      ModalResult = 6
      TabOrder = 0
      Visible = False
    end
    object btnNao: TBitBtn
      Left = 176
      Top = 6
      Width = 75
      Height = 29
      Caption = '&N'#227'o'
      ModalResult = 7
      TabOrder = 1
      Visible = False
    end
    object btnOK: TBitBtn
      Left = 256
      Top = 6
      Width = 75
      Height = 29
      Caption = '&OK'
      Default = True
      ModalResult = 7
      TabOrder = 2
      Visible = False
    end
  end
end
