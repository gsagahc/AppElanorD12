unit uFacadePrazos;

interface
uses DB, uFacade;
type TFacadePrazos =class(TFacade)
  private
  public
   function returnDataSetById(Id:String):TDataSet;
   procedure deletePrazoById(Id,StrSql:String);
   procedure insertPrazo(sTrSql:String);
   function checkPrazoSameName(sName:String):Boolean;
   function checkIfPrazoHasBeenUsed(Id:String):Boolean;
   procedure updatePrazo(strSql:String);
   function returnDataSetAllPrazos:TDataSet;
   function ReturnDataSetPrazosWithLike(sTable,sField,sText:string):TDataSet;
   function calculPrazos (idPrazo:integer):TDataSet;
   function resultPrazoName(id:Integer):String;
end;

implementation
Uses UControllerPrazos;

{ TFacadePrazos }

function TFacadePrazos.calculPrazos(idPrazo: integer): TDataSet;
var Controller:TControllerPrazos;
begin
  Controller:=TControllerPrazos.Create;
  Result:=Controller.calculaPrazos(idPrazo);
  Controller.Destroy;

end;

function TFacadePrazos.checkIfPrazoHasBeenUsed(Id: String): Boolean;
begin

end;

function TFacadePrazos.checkPrazoSameName(sName: String): Boolean;
begin

end;

procedure TFacadePrazos.deletePrazoById(Id, StrSql: String);
begin

end;

procedure TFacadePrazos.insertPrazo(sTrSql: String);
begin

end;

function TFacadePrazos.resultPrazoName(id: Integer): String;
var Controller:TControllerPrazos;
begin
   Controller:=TControllerPrazos.Create;
   Result:=Controller.resultPrazoName(Id);
   Controller.Destroy;
end;

function TFacadePrazos.returnDataSetAllPrazos: TDataSet;
var Controller:TControllerPrazos;
begin
   Controller:=TControllerPrazos.Create;
   Result:=Controller.returnDataSetAllPrazos;
   Controller.Destroy;

end;

function TFacadePrazos.returnDataSetById(Id: String): TDataSet;
begin

end;

function TFacadePrazos.ReturnDataSetPrazosWithLike(sTable, sField,
  sText: string): TDataSet;
var Controller:TControllerPrazos;
begin
   Controller:=TControllerPrazos.Create;
   Result:=Controller.ReturnDataSetPrazosWithLike(sTable, sField, sText);
   Controller.Destroy;
end;


procedure TFacadePrazos.updatePrazo(strSql: String);
begin

end;

end.
