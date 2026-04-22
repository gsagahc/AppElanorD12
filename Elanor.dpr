program Elanor;

uses
  Vcl.Forms,
  uMensagens in 'GUI\uMensagens.pas' {frmMensagens},
  UPrincipal in 'GUI\UPrincipal.pas' {FrmPrincipal},
  URepositoryProdutos in 'Repository\URepositoryProdutos.pas',
  UControllerProducts in 'Controller\UControllerProducts.pas',
  UFacadeProducts in 'Facade\UFacadeProducts.pas',
  UCadProdutos in 'GUI\UCadProdutos.pas' {FrmCadProdutos},
  UCadPadrao in 'GUI\UCadPadrao.pas' {FrmCadPadrao},
  UCadClientes in 'GUI\UCadClientes.pas' {FrmCadClientes},
  UBuscarClientes in 'GUI\UBuscarClientes.pas' {FrmBuscarCli},
  URepositoryClientes in 'Repository\URepositoryClientes.pas',
  UBuscarPadrao in 'GUI\UBuscarPadrao.pas' {FrmBuscarPrd},
  UBuscarProdutos in 'GUI\UBuscarProdutos.pas' {FrmBuscarProdutos},
  uRepositoryPrazos in 'Repository\uRepositoryPrazos.pas',
  UControllerPrazos in 'Controller\UControllerPrazos.pas',
  uFacadePrazos in 'Facade\uFacadePrazos.pas',
  UPrazo in 'Class\UPrazo.pas',
  UController in 'Controller\UController.pas',
  UFacade in 'Facade\UFacade.pas',
  UStandardObject in 'Class\UStandardObject.pas',
  UCadPrazos in 'GUI\UCadPrazos.pas' {FrmCadPrazos},
  UBuscarPrazos in 'GUI\UBuscarPrazos.pas' {FrmBuscarPrd1},
  UBuscarPedidos in 'GUI\UBuscarPedidos.pas' {FormBuscarpedidos},
  UCadPedido in 'GUI\UCadPedido.pas' {FrmNPedido},
  UFacadePedidos in 'Facade\UFacadePedidos.pas',
  UControllerPedidos in 'Controller\UControllerPedidos.pas',
  URepositoryPedidos in 'Repository\URepositoryPedidos.pas',
  UEstoque in 'Class\UEstoque.pas',
  UEndereco in 'Class\UEndereco.pas',
  UFacadeClientes in 'Facade\UFacadeClientes.pas',
  UControllerClientes in 'Controller\UControllerClientes.pas',
  URepositoryEstoque in 'Repository\URepositoryEstoque.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
