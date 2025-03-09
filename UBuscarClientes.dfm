inherited FrmBuscarCli: TFrmBuscarCli
  Caption = 'FrmBuscarCli'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 13
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_CLIENTE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TBCLI_NOME'
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
          FieldName = 'TBCLI_ENDERECO'
          Title.Caption = 'Endere'#231'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBCLI_TELEFONE'
          Title.Caption = 'Telefone'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TBCLI_CNPJ'
          Title.Caption = 'CNPJ'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 221
          Visible = True
        end>
    end
  end
  inherited Panel2: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Label1: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited PngSdBBuscar: TPngSpeedButton
      OnClick = PngSdBBuscarClick
    end
    inherited EditNome: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited DSGrid: TDataSource
    Left = 392
    Top = 120
  end
  inherited TimerBusca: TTimer
    Left = 488
    Top = 128
  end
end
