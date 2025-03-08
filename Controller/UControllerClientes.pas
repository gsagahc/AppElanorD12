unit UControllerClientes;

interface
Uses   DB;
Type
{ Controller }
  TControllerClientes = class
  public
    Function returnDataSetByID(id:String):TDataSet;
    function returnDataSetClientsWithLike(sTable,sField,sText:string):TDataSet;
 end;

implementation
Uses  URepositoryClientes;
{ TControllerClientes }

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

end.
 