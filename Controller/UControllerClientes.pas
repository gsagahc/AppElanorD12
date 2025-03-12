unit UControllerClientes;

interface
Uses   DB, uController;
Type
{ Controller }
  TControllerClientes = class(TController)
  public
    Function returnDataSetByID(id:String):TDataSet;
    function returnDataSetClientsWithLike(sTable,sField,sText:string):TDataSet;
    procedure insertClient(strSql:string);
    procedure updateClientByID(strSql: String);
 end;

implementation
Uses  URepositoryClientes;
{ TControllerClientes }

procedure TControllerClientes.insertClient(strSql: string);
Var Repositorio:TRepositoryClientes;
begin
  Repositorio:=TRepositoryClientes.Create;
  Repositorio.insertClientes(strSql);
  Repositorio.Destroy;
end;

function TControllerClientes.returnDataSetByID(id:String):TDataSet;
Var Repositorio:TRepositoryClientes;
begin
  Repositorio:=TRepositoryClientes.Create;
  Result:=Repositorio.returnDataSetByID(id);
  Repositorio.Destroy;
end;

function TControllerClientes.returnDataSetClientsWithLike(sTable, sField,
  sText: string): TDataSet;
Var Repositorio:TRepositoryClientes;
begin
  Repositorio:=TRepositoryClientes.Create;
  Result:=Repositorio.returnDataSetClientsWithLike(sTable, sField, sText);
  Repositorio.Destroy;
end;

procedure TControllerClientes.updateClientByID(strSql: String);
Var Repositorio:TRepositoryClientes;
begin
  Repositorio:=TRepositoryClientes.Create;
  Repositorio.updateClientByID(strSql);
  Repositorio.Destroy;
end;

end.
