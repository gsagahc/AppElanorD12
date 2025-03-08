unit UControllerClientes;

interface
Uses   DB;
Type
{ Controller }
  TControllerClientes = class
  public
    Function ConsultarClientes:TDataSet;
 end;

implementation
Uses  URepositoryClientes;
{ TControllerClientes }

function TControllerClientes.ConsultarClientes:TDataSet;
Var Repositorio:TRepositoryClientes;
begin
  Repositorio:=TRepositoryClientes.Create;
  Result:=Repositorio.ConsultarClientes;
end;

end.
 