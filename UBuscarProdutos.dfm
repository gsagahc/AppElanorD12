inherited FrmBuscarProdutos: TFrmBuscarProdutos
  Caption = 'FrmBuscarProdutos'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 13
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited Panel2: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited EditNome: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
  end
end
