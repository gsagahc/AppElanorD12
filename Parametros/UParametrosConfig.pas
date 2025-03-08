unit UParametrosConfig;

interface
uses   DB ,DBGrids,IBX.IBStoredProc, IBX.IBCustomDataSet, IBX.IBQuery,
       IBX.IBSQL, IBX.IBDatabase, DBClient, Classes,
       Controls,SysUtils, Variants, Provider,UConnectDataBase;


type
  TParametros= Class
  public
    function returnValParametro(sNomeParametro:String):String;


  end;
implementation
uses uMensagens, uPrincipal, Math ;

function TParametros.returnValParametro(sNomeParametro:String):String;
var QueryResult:TIBQuery;

begin
  try
    QueryResult:=TIBQuery.Create(nil);
    QueryResult.Database   :=FrmPrincipal.Conexao.DbMain;
    QueryResult.Transaction:=FrmPrincipal.Conexao.DefaultTRansaction;
    QueryResult.Close;
    QueryResult.SQL.Clear;
    QueryResult.SQL.add('SELECT VAL_PARAMETRO FROM TB_CONFIG WHERE PARAMETRO='''+sNomeParametro+'''');

    QueryResult.Open;
    Result:=Trim(QueryResult.FieldByName('VAL_PARAMETRO').AsString);
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao retornar configuração ' +'returnValParametro '+ E.message,'E',[mbOK]);

    end;

  end;

end;


end.
 