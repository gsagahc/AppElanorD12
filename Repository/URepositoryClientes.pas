unit URepositoryClientes;

Interface
 Uses
   URepository, IBX.IBQuery,DB, System.Classes,System.SysUtils ;

Type
{ Repository }
  TRepositoryClientes = class(TRepository)
    private
    public
   function returnDataSetById(Id:String):TDataSet;
   procedure deleteClienteById(Id,StrSql:String);
   procedure insertClientes(sTrSql:String);
   function checkProductSameName(sName:String):Boolean;
   function checkIfClienteHasBeenUsed(Id:String):Boolean;
   procedure updateCliente(strSql:String);
   function returnDataSetClientsWithLike(sTable, sField,sText:String):TDataSet;
  End;

implementation
Uses uMensagens;



{ TRepositoryClientes }

function TRepositoryClientes.checkIfClienteHasBeenUsed(Id: String): Boolean;
begin

end;

function TRepositoryClientes.checkProductSameName(sName: String): Boolean;
begin

end;

procedure TRepositoryClientes.deleteClienteById(Id, StrSql: String);
begin

end;

procedure TRepositoryClientes.insertClientes(sTrSql: String);
begin

end;

function TRepositoryClientes.returnDataSetById(Id: String): TDataSet;
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT * FROM TB_CLIENTES WHERE ID_CLIENTE='''+Id+'''' );
    IBQueryResult.Open;

    Result:=IBQueryResult;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta.unit:URepositoryClientes, Metodo:returnDataSetById','E',[mbOK], E.Message);

    end;
  end;

end;

function TRepositoryClientes.returnDataSetClientsWithLike(sTable, sField,
  sText:String): TDataSet;
begin
  Result:=Self.returnDataSetWithLike(sTable, sField,   sText);
end;

procedure TRepositoryClientes.updateCliente(strSql: String);
begin

end;

end.
