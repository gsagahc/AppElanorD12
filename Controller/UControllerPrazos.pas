unit UControllerPrazos;

interface
Uses DB;
{ Controller }
Type
  TControllerPrazos = class
  private
  public
  function returnDataSetAllPrazos:TDataSet;
 end;

implementation
Uses URepositoryPrazos;
{ TControllerPrazos }

function TControllerPrazos.returnDataSetAllPrazos: TDataSet;
Var Repositorio:TRepositoryPrazos;
begin
  Repositorio:=TRepositoryPrazos.Create;
  Result:=Repositorio.returnDataSetAllPrazos;
  Repositorio.Destroy;
end;

end.
