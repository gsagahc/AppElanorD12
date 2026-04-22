unit URepositoryPedidos;

interface
 Uses
   URepository, IBX.IBQuery,DB, System.Classes,System.SysUtils ;

Type
{ Repository }
  TRepositoryClientes = class(TRepository)
    private
    public
  procedure salvarPedido(CDSPedido,CDSItens:TDataSet);
  end;

implementation
  Uses uMensagens;

{ TRepositoryClientes }


{ TRepositoryClientes }

procedure TRepositoryClientes.salvarPedido(CDSPedido, CDSItens: TDataSet);
var IBQueryResult:TIBQuery;
begin
   IBQueryResult:=initQuery;

end;

end.
