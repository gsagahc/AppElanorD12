unit UFacadeClientes;

interface
Uses DB;
type
  { Façade }
  TFacadeClientes = class
  public
    // operação do Façade
   function returnDataSetByID(Id:String):TDataSet;
   function ReturnDataSetClientsWithLike(sTable,sField,sText:string):TDataSet;
  end;


implementation
Uses UControllerClientes;
{ TFacadeClientes }

function TFacadeClientes.returnDataSetByID(Id:String):TDataSet;
var Controller:TControllerClientes;
begin
   Controller:=TControllerClientes.Create;
   Result:=Controller.returnDataSetByID(Id);
   Controller.Destroy;
end;

function TFacadeClientes.ReturnDataSetClientsWithLike(sTable, sField,
  sText: string): TDataSet;
var Controller:TControllerClientes;
begin
   Controller:=TControllerClientes.Create;
   Result:=Controller.ReturnDataSetClientsWithLike(sTable, sField, sText);
   Controller.Destroy;

end;

end.
