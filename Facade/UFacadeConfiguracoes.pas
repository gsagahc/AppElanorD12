unit UFacadeConfiguracoes;

interface
Uses DB, System.Classes, UControllerConfiguracoes;
type
  { Façade }
  TFacadeConfiguracoes = class
  public
    // operação do Façade
   function ConsultarTextoStatusBar:TStringList;

  end;


implementation
Uses UPrincipal;



{ TFacadeConfiguracoes }

function TFacadeConfiguracoes.ConsultarTextoStatusBar: TStringList;
var ControllerConfiguracoes:TControllerConfiguracoes;
    slResult:TStringList;
begin
  ControllerConfiguracoes:=TControllerConfiguracoes.Create;
  slResult:=ControllerConfiguracoes.ConsultarTextoStatusBar;
  Result:=slResult;
end;



end.

