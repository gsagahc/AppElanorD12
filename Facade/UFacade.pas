unit UFacade;

interface
uses System.SysUtils;

type
  TFacade = class
    private
    public
    function LookupResult(Id,LookupTable,LookupField,ResultField:string):string;
  end;

{ TFacade }
implementation
Uses UController;
function TFacade.LookupResult(Id, LookupTable, LookupField,
  ResultField: string): string;
var Controller:TController;
begin
  Controller:=TController.Create;
  Result:=Controller.LookupResult(Id,LookupTable,LookupField,ResultField);
  Controller.Destroy;
end;

end.
