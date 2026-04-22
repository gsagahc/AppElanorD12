unit URepositoryEstoque;

interface
  Uses
   URepository, IBX.IBQuery,DB, System.Classes,System.SysUtils ;
Type
{ Repository }
  TRepositoryProdutos = class(TRepository)
   private
   public
   function AtualizarEstoque(CDSItens:TDataSet; sTipo:String):Boolean;
end;
implementation
uses uMensagens;
{ TRepositoryProdutos }

function TRepositoryProdutos.AtualizarEstoque(CDSItens: TDataSet; sTipo:String): Boolean;
var IBQueryResult:TIBQuery;
begin
   CDSItens.First;
   while not CDSItens.Eof do
   begin
     try
       IBQueryResult:=initQuery;
       IBQueryResult.Sql.Add('UPDATE TB_ESTOQUE ' +
                             ' SET ' );
       if sTipo='S' then
         IBQueryResult.Sql.Add(' TBES_QUANTI =TBES_QUANTI - :pQuantidade ' )
       Else
         IBQueryResult.Sql.Add(' TBES_QUANTI =TBES_QUANTI + :pQuantidade ' );
       IBQueryResult.Sql.Add('WHERE ID_PRODUTO=:pIdProduto ' +
                             ' AND ID_ESTOQUE= :pIdEstoque ');
       IBQueryResult.ParamByName('pIdProduto').AsInteger  := CDSItens.FieldByName('ID_PRODUTO').AsInteger  ;
       IBQueryResult.ParamByName('pIdEstoque').AsInteger  := CDSItens.FieldByName('ID_ESTOQUE').AsInteger ;
       IBQueryResult.ParamByName('pQuantidade').AsInteger := CDSItens.FieldByName('TBITPED_QUANT').AsInteger;
       IBQueryResult.ExecSQL;
       Result:=True;
     except
       on E: EDatabaseError do
       begin
         tFrmMensagens.Mensagem('Erro ao tentar alterar estoque. unit:URepositoryEstoque, Metodo:AtualizarEstoque','E',[mbOK], E.Message);
       end;
     end;
     CDSItens.Next;
   end;
end;

end.
