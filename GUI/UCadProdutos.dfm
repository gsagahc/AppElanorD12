inherited FrmCadProdutos: TFrmCadProdutos
  Caption = 'FrmCadProdutos'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 13
  inherited PnlBottom: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited PnlBotoes: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited PngSdBDeletar: TPngSpeedButton
        OnClick = PngSdBDeletarClick
      end
    end
  end
  inherited PnlMain: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label2: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label3: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label4: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label5: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label6: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Label7: TLabel
      StyleElements = [seFont, seClient, seBorder]
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
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited Id: TIdEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited NumEditncm: TNumEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited NumEdit1: TNumEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited NumEdit2: TNumEdit
      StyleElements = [seFont, seClient, seBorder]
    end
  end
end
