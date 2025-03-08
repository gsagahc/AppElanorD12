unit UControllerConfiguracoes;

interface
Uses   DB, System.Classes;
Type
{ Controller }
  TControllerConfiguracoes = class
  public
    function ConsultarTextoStatusBar:TStringList;
 end;

implementation
Uses  URepositoryConfiguracoes;



{ TControllerConfiguracoes }

function TControllerConfiguracoes.ConsultarTextoStatusBar: TStringList;
var RepositoryConfig:TRepositoryConfiguracoes;
    slResult:TStringList;
begin
   RepositoryConfig:=TRepositoryConfiguracoes.Create;
   slResult:=RepositoryConfig.ConsultarTextoStatusBar;
   Result:=slResult;
end;

end.

