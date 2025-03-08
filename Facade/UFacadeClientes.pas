unit UFacadeClientes;

interface
Uses DB;
type
  { Fa�ade }
  TFacadeClientes = class
  public
    // opera��o do Fa�ade
   function ConsultarClientes:TDataSet;
  end;


implementation
Uses UControllerClientes;
{ TFacadeClientes }

function TFacadeClientes.ConsultarClientes:TDataSet;
var Controller:TControllerClientes;
begin
   Controller:=TControllerClientes.Create;
   Result:=Controller.ConsultarClientes;
end;

end.
