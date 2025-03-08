unit UFacadeClientes;

interface
Uses DB;
type
  { Façade }
  TFacadeClientes = class
  public
    // operação do Façade
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
