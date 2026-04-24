unit URepositoryPedidos;

interface
 Uses
   URepository, IBX.IBQuery,DB, System.Classes,System.SysUtils ;

Type
{ Repository }
  TRepositoryClientes = class(TRepository)
    private
    public
  procedure salvarPedido(CDSPedido,CDSItens:TDataSet);
  end;

implementation
  Uses uMensagens;

{ TRepositoryClientes }


{ TRepositoryClientes }

procedure TRepositoryClientes.salvarPedido(CDSPedido, CDSItens: TDataSet);
var IBQueryResult:TIBQuery;
    id_pedido:Integer;

begin
   IBQueryResult:=initQuery;
   try
     IBQueryResult.Sql.Clear;
     IBQueryResult.SQL.add('INSERT INTO TB_PEDIDOS '+
                          '(TBPED_DATA, ID_CLIENTE, TBPED_NOME, TBPED_ENDERECO, TBPED_CIDADE, '+
                          ' TBPED_TELEFONE, ID_PRAZO, TBPED_VALTOTAL, TBPED_VENC01, TBPED_VENC02, '+
                          ' TBPED_VENC03,TBPED_VENC04, ID_USUARIO, TBPED_BAIRRO, TBPED_CNPJ, TBPED_NUMPED, TBPED_ESTADO, '+
                          ' TBPED_CEP,  OBS, TBPED_BOLETO) '+
                           'VALUES '+
                         ' (:TBPED_DATA, :ID_CLIENTE, :TBPED_NOME, :TBPED_ENDERECO, '+
                          ' :TBPED_CIDADE, :TBPED_TELEFONE, :ID_PRAZO, :TBPED_VALTOTAL, :TBPED_VENC01, '+
                          ' :TBPED_VENC02, :TBPED_VENC03, :TBPED_VENC04, :ID_USUARIO, :TBPED_BAIRRO, :TBPED_CNPJ, '+
                          ' :TBPED_NUMPED, :TBPED_ESTADO, :TBPED_CEP,  :OBS, :TBPED_BOLETO)');
     IBQueryResult.ParamByName('TBPED_DATA').AsDate         := CDSPedido.FieldByname('TBPED_DATA').AsDateTime ;
     IBQueryResult.ParamByName('ID_CLIENTE').AsInteger      := CDSPedido.FieldByname('ID_CLIENTE').Asinteger ;
     IBQueryResult.ParamByName('TBPED_NOME').AsString       := CDSPedido.FieldByname('TBPED_NOME').AsString  ;
     IBQueryResult.ParamByName('TBPED_ENDERECO').AsString   := CDSPedido.FieldByname('TBPED_ENDERECO').AsString ;
     IBQueryResult.ParamByName('TBPED_CIDADE').AsString     := CDSPedido.FieldByname('TBPED_CIDADE').AsString ;
     IBQueryResult.ParamByName('TBPED_TELEFONE').AsString   := CDSPedido.FieldByname('TBPED_TELEFONE').AsString ;
     IBQueryResult.ParamByName('ID_PRAZO').AsInteger        := CDSPedido.FieldByname('ID_PRAZO').AsInteger ;
     IBQueryResult.ParamByName('TBPED_VALTOTAL').AsCurrency := CDSPedido.FieldByname('TBPED_VALTOTAL').AsCurrency ;
     IBQueryResult.ParamByName('TBPED_VENC01').AsDate       := CDSPedido.FieldByname('TBPED_VENC01').AsDateTime ;
     IBQueryResult.ParamByName('TBPED_VENC02').AsDate       := CDSPedido.FieldByname('TBPED_VENC02').AsDateTime ;
     IBQueryResult.ParamByName('TBPED_VENC03').AsDate       := CDSPedido.FieldByname('TBPED_VENC03').AsDateTime ;
     IBQueryResult.ParamByName('TBPED_VENC04').AsDate       := CDSPedido.FieldByname('TBPED_VENC04').AsDateTime ;
     IBQueryResult.ParamByName('ID_USUARIO').AsInteger      := CDSPedido.FieldByname('ID_USUARIO').AsInteger ;
     IBQueryResult.ParamByName('TBPED_BAIRRO').AsString     := CDSPedido.FieldByname('TBPED_BAIRRO').AsString ;
     IBQueryResult.ParamByName('TBPED_CNPJ').AsString       := CDSPedido.FieldByname('TBPED_CNPJ').AsString ;
     IBQueryResult.ParamByName('TBPED_NUMPED').AsString     := CDSPedido.FieldByname('TBPED_NUMPED').AsString ;
     IBQueryResult.ParamByName('TBPED_ESTADO').AsString     := CDSPedido.FieldByname('TBPED_ESTADO').AsString ;
     IBQueryResult.ParamByName('TBPED_CEP').AsString        := CDSPedido.FieldByname('TBPED_CEP').AsString ;
     IBQueryResult.ParamByName('OBS').AsString              := CDSPedido.FieldByname('OBS').AsString ;
     IBQueryResult.ParamByName('TBPED_BOLETO').AsString     := CDSPedido.FieldByname('TBPED_BOLETO').AsString ;
     IBQueryResult.ExecSQL;
     IBQueryResult.close;
     IBQueryResult.Sql.Clear;
     IBQueryResult.Sql.Add('SELECT MAX(ID_PEDIDO)  AS ID_PEDIDO FROM TB_PEDIDOS');
     IBQueryResult.Open;
     id_pedido:=IBQueryResult.FieldByName('ID_PEDIDO').AsInteger;
     IBQueryResult.close;
     IBQueryResult.Sql.Clear;
     IBQueryResult.Sql.Add('INSERT INTO TB_ITENSPEDIDO  '+
                            '(ID_PRODUTO, TBITPED_QUANT, TBITPED_VALUNI, TBITPED_VALTOT, '+
                             'ID_PEDIDO, ID_PRAZO, ID_CLIENTE, ID_USUARIO, TBITPED_UNIDADE, TBITPED_TIPO, '+
                             'TBITPED_TAMANHO) '+
                          'VALUES '+
                            '(:ID_PRODUTO, :TBITPED_QUANT, :TBITPED_VALUNI, :TBITPED_VALTOT, '+
                            ':ID_PEDIDO, :ID_PRAZO, :ID_CLIENTE, :ID_USUARIO, :TBITPED_UNIDADE, :TBITPED_TIPO, '+
                            ':TBITPED_TAMANHO)');
     IBQueryResult.ParamByName('ID_PRODUTO').AsDate         := CDSPedido.FieldByname('ID_PRODUTO').AsDateTime ;
     IBQueryResult.ParamByName('TBITPED_QUANT').AsInteger      := CDSPedido.FieldByname('TBITPED_QUANT').Asinteger ;
     IBQueryResult.ParamByName('TBITPED_VALUNI').AsString       := CDSPedido.FieldByname('TBITPED_VALUNI').AsString  ;
     IBQueryResult.ParamByName('TBITPED_VALTOT').AsString   := CDSPedido.FieldByname('TBITPED_VALTOT').AsString ;
     IBQueryResult.ParamByName('ID_PEDIDO').AsString     := CDSPedido.FieldByname('ID_PEDIDO').AsString ;
     IBQueryResult.ParamByName('ID_PRAZO').AsString   := CDSPedido.FieldByname('ID_PRAZO').AsString ;
     IBQueryResult.ParamByName('ID_CLIENTE').AsInteger        := CDSPedido.FieldByname('ID_CLIENTE').AsInteger ;
     IBQueryResult.ParamByName('ID_USUARIO').AsCurrency := CDSPedido.FieldByname('ID_USUARIO').AsCurrency ;
     IBQueryResult.ParamByName('ID_USUARIO').AsDate       := CDSPedido.FieldByname('TBPED_VENC01').AsDateTime ;
     IBQueryResult.ParamByName('TBITPED_UNIDADE').AsDate       := CDSPedido.FieldByname('TBITPED_UNIDADE').AsDateTime ;
     IBQueryResult.ParamByName('TBITPED_TIPO').AsDate       := CDSPedido.FieldByname('TBITPED_TIPO').AsDateTime ;
     IBQueryResult.ParamByName('TBITPED_TAMANHO').AsDate       := CDSPedido.FieldByname('TBITPED_TAMANHO').AsDateTime ;
     IBQueryResult.ExecSQL;



   except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao tentar cadastrar pedido unit:URepositoryPedidos, Metodo:salvarPedido','E',[mbOK], E.Message);

    end;

   end;

end;

end.
