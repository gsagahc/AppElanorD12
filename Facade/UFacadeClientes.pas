unit UFacadeClientes;

interface
Uses DB,UFacade;
type
  { Façade }
  TFacadeClientes = class(TFacade)
  public
    // operação do Façade
   function returnDataSetByID(Id:String):TDataSet;
   function ReturnDataSetClientsWithLike(sTable,sField,sText:string):TDataSet;
   procedure insertClient(strSql:string);
   procedure updateClientByID(strUpdate:String);
  end;


implementation
Uses UControllerClientes;
{ TFacadeClientes }

procedure TFacadeClientes.insertClient(strSql: string);
var Controller:TControllerClientes;
begin
  Controller:=TControllerClientes.Create;
  Controller.insertClient(StrSql);
  Controller.Destroy;

end;

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

procedure TFacadeClientes.updateClientByID(strUpdate: String);
var Controller:TControllerClientes;
begin
  Controller:=TControllerClientes.Create;
  Controller.updateClientByID(strUpdate);
  Controller.Destroy;

end;

end.
