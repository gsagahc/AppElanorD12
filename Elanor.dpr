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
  Unit1 in 'Unit1.pas',
  UControllerPrazos in 'Controller\UControllerPrazos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
