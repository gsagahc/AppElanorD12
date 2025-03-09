unit UControllerPrazos;

interface
Uses DB,System.Generics.Collections, UController;
{ Controller }
Type
  TControllerPrazos = class (TController)
  private
  public
  function returnDataSetById(Id:String):TDataSet;
  procedure deletePrazoById(Id,StrSql:String);
  procedure insertPrazo(sTrSql:String);
  function checkPrazoSameName(sName:String):Boolean;
  function checkIfPrazoHasBeenUsed(Id:String):Boolean;
  procedure updatePrazo(strSql:String);
  function returnDataSetAllPrazos:TDataSet;
 end;

implementation
Uses URepositoryPrazos;
{ TControllerPrazos }

function TControllerPrazos.checkIfPrazoHasBeenUsed(Id: String): Boolean;
begin

end;

function TControllerPrazos.checkPrazoSameName(sName: String): Boolean;
begin

end;

procedure TControllerPrazos.deletePrazoById(Id, StrSql: String);
begin

end;

procedure TControllerPrazos.insertPrazo(sTrSql: String);
begin

end;

function TControllerPrazos.returnDataSetAllPrazos:TDataSet;
Var Repositorio:TRepositoryPrazos;
begin
  Repositorio:=TRepositoryPrazos.Create;
  Result:=Repositorio.returnDataSetAllPrazos;
  Repositorio.Destroy;
end;

function TControllerPrazos.returnDataSetById(Id: String): TDataSet;
begin

end;

procedure TControllerPrazos.updatePrazo(strSql: String);
begin

end;

end.
