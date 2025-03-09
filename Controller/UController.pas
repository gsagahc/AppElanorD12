unit UController;

interface
uses System.SysUtils, DB;
Type
{ Repository }
  TController = class
  private

  public

  function LookupResult(Id,LookupTable,LookupField,ResultField:string):string;
  end;
implementation
Uses URepository;
{ TController }

function TController.LookupResult(Id, LookupTable, LookupField,
  ResultField: string): string;
var Repository:TRepository;
begin
  Repository:=TRepository.create;
  Result:=Repository.LookupResult(Id, LookupTable, LookupField, ResultField);
  Repository.Destroy;

end;

end.
