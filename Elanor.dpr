program Elanor;

uses
  Vcl.Forms,
  uMensagens in 'uMensagens.pas' {frmMensagens},
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  URepositoryProdutos in 'Repository\URepositoryProdutos.pas',
  UControllerProducts in 'Controller\UControllerProducts.pas',
  UFacadeProducts in 'Facade\UFacadeProducts.pas',
  UCadProdutos in 'UCadProdutos.pas' {FrmCadProdutos},
  UCadPadrao in 'UCadPadrao.pas' {FrmCadPadrao},
  UCadClientes in 'UCadClientes.pas' {FrmCadClientes},
  UBuscarClientes in 'UBuscarClientes.pas' {FrmBuscarCli},
  URepositoryClientes in 'Repository\URepositoryClientes.pas',
  UBuscarPadrao in 'UBuscarPadrao.pas' {FrmBuscarPrd},
  UBuscarProdutos in 'UBuscarProdutos.pas' {FrmBuscarProdutos},
  uRepositoryPrazos in 'Repository\uRepositoryPrazos.pas',
  UControllerPrazos in 'Controller\UControllerPrazos.pas',
  uFacadePrazos in 'Facade\uFacadePrazos.pas',
  UPrazo in 'Class\UPrazo.pas',
  UController in 'Controller\UController.pas',
  UFacade in 'Facade\UFacade.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
