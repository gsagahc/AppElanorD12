unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ToolWin, ComCtrls,  DB, ImgList,   jpeg,
  ExtCtrls, IniFiles, IdBaseComponent, IdComponent,
  IdTCPServer, IdCustomHTTPServer, IdHTTPServer, IdTCPConnection,
  IdTCPClient, IdHTTP, InvokeRegistry, Rio, SOAPHTTPClient, Printers,
  StdCtrls,     ComObj, StrUtils,  Buttons, DBClient, System.Net.URLClient,
  System.ImageList, IBX.IBStoredProc, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBSQL, IBX.IBDatabase, UConnectDataBase, PngImageList;

type
  TPagamentosPHoje = class
  Vencimento: TDate;
  Emissao:TDate;
  Fornecedor:String;
  Valor: Currency;
  NumNota:string;
  ValorNota:Currency;
end;

type TRecebimentoHoje= class
     public
     Numped:string;
     Vencimento:TDate;
     ValorTotal:Currency;
     Valor:Currency;
     NomeCli:String;
     DataPedido:TDate;
end;
Type TProduto= class
     public
     Nome:String;
     Id:Integer;
     Preco:currency;
     Unidade:String;
end;

Type TCliente= class
     public
     Nome:String;
     Id:Integer;
     Endereco:String;
     Cidade:String;
     Estado:String;
end;

Type TPedido = Class
     public
     NomeCli:String;
     Id_pedido:Integer;
     NomeProd:String;
     Id_produto:Integer;  
End;
Type TPrazos = Class
     public
     Nome:String;
     Id_prazo:Integer;
     Prazo1:TDate;
     Prazo2:TDate;
     Prazo3:TDate;
End;
Type TEstoque = Class
     Public
     Nome:String;
     Id_produto:Integer;
     Id_estoque:Integer;
     Quantidade:Real;
     Tamanho:string;
     Formato:String;
     Unidade:String; 
End;

Type TEndereco = Class
      Public
      Rua:String;
      Bairro:String;
      Cidade:String;
      Estado:String;

End;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    Cadastros1: TMenuItem;
    Estoque1: TMenuItem;
    Pedidos1: TMenuItem;
    Produtos1: TMenuItem;
    Entrada1: TMenuItem;
    Usurios1: TMenuItem;
    Novo1: TMenuItem;
    Consultar2: TMenuItem;
    Relatrios1: TMenuItem;
    ImageList1: TImageList;
    Clientes1: TMenuItem;
    Prazos1: TMenuItem;
    Reimprimir1: TMenuItem;
    Image1: TImage;
    Saldoatual2: TMenuItem;
    Entradas1: TMenuItem;
    Porcliente1: TMenuItem;
    Geral1: TMenuItem;
    Nmerodopedido1: TMenuItem;
    Vendas1: TMenuItem;
    HTTPRIO1: THTTPRIO;
    Cheques1: TMenuItem;
    Ferramentas1: TMenuItem;
    Impressodeetiquetas1: TMenuItem;
    Pedidosporperodo1: TMenuItem;
    ImpressodeetiquetasNProdutos1: TMenuItem;
    Pedidosaprazo1: TMenuItem;
    Cancelarumpedido1: TMenuItem;
    Impressodecheques1: TMenuItem;
    abeladepreos1: TMenuItem;
    Pedidosavista1: TMenuItem;
    PanelContaRec: TPanel;
    Panel2: TPanel;
    TViewContas: TTreeView;
    MemoDados: TMemo;
    Panel3: TPanel;
    ImageList2: TImageList;
    Pedidoscancelados1: TMenuItem;
    Financeiro1: TMenuItem;
    Exibirrecebimentosemaberto1: TMenuItem;
    Baixar1: TMenuItem;
    Panel1: TPanel;
    Panel4: TPanel;
    TreeViewContaPag: TTreeView;
    MemoDadosPag: TMemo;
    Panel5: TPanel;
    Cadastrodefornecedores1: TMenuItem;
    Contasapagar1: TMenuItem;
    BaixarContaapagar1: TMenuItem;
    MenuItem5: TMenuItem;
    imprimircontasapagaremaberto1: TMenuItem;
    Imprimircontaspagas1: TMenuItem;
    Exportarparaexcel1: TMenuItem;
    DsContasPagar: TDataSource;
    Pedidosporclienteperodo1: TMenuItem;
    DsPedidos: TDataSource;
    DSItens: TDataSource;
    Estoquegeral1: TMenuItem;
    PedidosporOC1: TMenuItem;
    Incluirobservao1: TMenuItem;
    Faturamentodirio1: TMenuItem;
    Pedidos2: TMenuItem;
    Contasapagar2: TMenuItem;
    Entradadegasto1: TMenuItem;
    Consultardespesas1: TMenuItem;
    ConsultaSQL1: TMenuItem;
    Faturamentoestimado1: TMenuItem;
    DsPedidos_OBS: TDataSource;
    Porproduto1: TMenuItem;
    Romaneiodeentrega1: TMenuItem;
    Produo1: TMenuItem;
    Controledeperdas1: TMenuItem;
    Consultarlanamentos1: TMenuItem;
    Reimpressopordata1: TMenuItem;
    Despesas1: TMenuItem;
    Despesas2: TMenuItem;
    Qualidade1: TMenuItem;
    Localizarlote1: TMenuItem;
    EStoquenegativo1: TMenuItem;
    CorrigirAlerar1: TMenuItem;
    Reimpressoromaneio1: TMenuItem;
    Skin1: TMenuItem;
    IBSPATUALIZAMOVI: TIBStoredProc;
    Enroladores1: TMenuItem;
    Configuraes1: TMenuItem;
    ToolBar1: TToolBar;
    PngImageListBotoes: TPngImageList;
    procedure Produtos1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Prazos1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
    procedure PNGButton6Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Reimprimir1Click(Sender: TObject);
    procedure Saldoatual2Click(Sender: TObject);
    procedure Porcliente1Click(Sender: TObject);
    procedure Entradas1Click(Sender: TObject);
    procedure Nmerodopedido1Click(Sender: TObject);
    procedure ransfernciapararolo1Click(Sender: TObject);
    procedure Geral1Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGButton7Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Cheques1Click(Sender: TObject);
    procedure PNGButton8Click(Sender: TObject);
    procedure Impressodeetiquetas1Click(Sender: TObject);
    procedure Pedidosporperodo1Click(Sender: TObject);
    procedure ImpressodeetiquetasNProdutos1Click(Sender: TObject);
    procedure Pedidosaprazo1Click(Sender: TObject);
    procedure Cancelarumpedido1Click(Sender: TObject);
    procedure Impressodecheques1Click(Sender: TObject);
    procedure OnMessageOwn(var Msg: TMsg; var Handled: Boolean);
    procedure abeladepreos1Click(Sender: TObject);
    procedure Pedidosavista1Click(Sender: TObject);
    procedure AtualizarTvContaRec;
    procedure TViewContasDblClick(Sender: TObject);
    procedure Pedidoscancelados1Click(Sender: TObject);
    procedure Exibirrecebimentosemaberto1Click(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);
    procedure WMNCLButtonDblClk(var Message: TWMNCLButtonDblClk); message WM_NCLButtonDblClk;
    procedure ExportarPExcel;
    procedure CriarContasPagTemp;
    procedure Cadastrodefornecedores1Click(Sender: TObject);
    procedure Contasapagar1Click(Sender: TObject);
    procedure BaixarContaapagar1Click(Sender: TObject);
    procedure imprimircontasapagaremaberto1Click(Sender: TObject);
    procedure Exportarparaexcel1Click(Sender: TObject);
    procedure TreeViewContaPagDblClick(Sender: TObject);
    procedure Pedidosporclienteperodo1Click(Sender: TObject);
    procedure Estoquegeral1Click(Sender: TObject);
    procedure PedidosporOC1Click(Sender: TObject);
    procedure Incluirobservao1Click(Sender: TObject);
    procedure Faturamentodirio1Click(Sender: TObject);
    procedure Entradadegasto1Click(Sender: TObject);
    procedure Consultardespesas1Click(Sender: TObject);
    procedure PNGButton9Click(Sender: TObject);
    procedure ExibirEstoqueAtual;
    procedure ConsultaSQL1Click(Sender: TObject);
    procedure Faturamentoestimado1Click(Sender: TObject);
    procedure Porproduto1Click(Sender: TObject);
    procedure PNGButton10Click(Sender: TObject);
    procedure Romaneiodeentrega1Click(Sender: TObject);
    procedure SkinClick(Sender: TObject);
    procedure Controledeperdas1Click(Sender: TObject);
    procedure Consultarlanamentos1Click(Sender: TObject);
    procedure PNGButton11Click(Sender: TObject);
    procedure Reimpressopordata1Click(Sender: TObject);
    procedure Despesas1Click(Sender: TObject);
    procedure Despesas2Click(Sender: TObject);
    procedure PNGButton12Click(Sender: TObject);
    procedure Localizarlote1Click(Sender: TObject);
    procedure EStoquenegativo1Click(Sender: TObject);
    procedure CorrigirAlerar1Click(Sender: TObject);
    procedure Reimpressoromaneio1Click(Sender: TObject);
    procedure Skin1Click(Sender: TObject);
    procedure Enroladores1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
  private
       TotalGeral:Currency;
    { Private declarations }
  public
    Usuario:String;
    IdUsuario:Integer;
    UserAdm:string;
    IdCliente:Integer;
    IdCheque: Integer;
    IdProduto :Integer;
    NomeCliente:String;
    NomeProduto:String;
    BancoDados:String;
    id_fornecedor: Integer;
    Cliente:TCliente;
    id_contapagar:Integer;
    bUtilizaContaRec:Boolean;
    Conexao:TConnectDataBase;
    sCaminho:String;
    Procedure Memo_Print(Conteudo:TStrings);
    Function RetornaEndereco(CEP:String): TEndereco;
    function  AbreviarNome(Nome:string):String;
    function retornaMespExtenso(mes:string):string;
    procedure atualizarTreeView;
    procedure atualizaMovimentacao(idProduto,IdPedido:integer;
            Quantidade, Tamanho:Real;Tipo,Formato:String);

    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses uMensagens, Math,UParametrosConfig, UFacadeConfiguracoes, UCadPadrao,UCadProdutos;
   

{$R *.dfm}

procedure TFrmPrincipal.Produtos1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCadProdutos, FrmCadProdutos);
  StatusBar1.Panels.Items[5].Text:= FrmCadProdutos.Caption;
  FrmCadProdutos.ShowModal;
  FreeAndNil(FrmCadProdutos);
  StatusBar1.Panels.Items[5].Text:=EmptyStr;
end;

procedure TFrmPrincipal.ToolButton1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadProd, FrmCadProd);
//  StatusBar1.Panels.Items[5].Text:= FrmCadProd.Caption;
//  FrmCadProd.ShowModal;
//  FreeAndNil(FrmCadProd);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.ToolButton4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.Entrada1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmEntEstoque, FrmEntEstoque);
//  StatusBar1.Panels.Items[5].Text:= FrmEntEstoque.Caption;
//  FrmEntEstoque.ShowModal;
//  FreeAndNil(FrmEntEstoque);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Usurios1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadUser, FrmCadUser);
//  StatusBar1.Panels.Items[5].Text:= FrmCadUser.Caption;
//  FrmCadUser.ShowModal;
//  FreeAndNil(FrmCadUser);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var Parametros:TParametros;
    sParametro:String;
begin
  StatusBar1.Panels.Items[0].Text:='Login: ' + Usuario;
  If UserAdm ='S' Then
  begin
     Usurios1.Enabled    :=True;


  end
  Else
   begin
     Usurios1.Enabled :=False;


   end;
  try
     sParametro:='SN_GERACONTASREC';

    bUtilizaContaRec:= Parametros.returnValParametro(sParametro)='S';

  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao consultar configura��es. : '+'FormShow' ,'E',[mbOK], E.Message);
    End;
  end;

end;

procedure TFrmPrincipal.Novo1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmNPedido,FrmNPedido);
//  StatusBar1.Panels.Items[5].Text:= FrmNPedido.Caption;
//  FrmNPedido.ShowModal;
//  FreeAndNil(FrmNPedido);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadCli,FrmCadCli);
//  StatusBar1.Panels.Items[5].Text:= FrmCadCli.Caption;
//  FrmCadCli.ShowModal;
//  FreeAndNil(FrmCadCli);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Prazos1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadPrazos, FrmCadPrazos);
//  StatusBar1.Panels.Items[5].Text:= FrmCadPrazos.Caption;
//  FrmCadPrazos.ShowModal;
//  FreeAndNil(FrmCadPrazos);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.ToolButton2Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadCli,FrmCadCli);
//  StatusBar1.Panels.Items[5].Text:= FrmCadCli.Caption;
//  FrmCadCli.ShowModal;
//  FreeAndNil(FrmCadCli);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.ToolButton3Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadPrazos, FrmCadPrazos);
//  StatusBar1.Panels.Items[5].Text:= FrmCadPrazos.Caption;
//  FrmCadPrazos.ShowModal;
//  FreeAndNil(FrmCadPrazos);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.PNGButton2Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadProd, FrmCadProd);
//  StatusBar1.Panels.Items[5].Text:= FrmCadProd.Caption;
//  FrmCadProd.ShowModal;
//  FreeAndNil(FrmCadProd);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.PNGButton4Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadCli,FrmCadCli);
//  StatusBar1.Panels.Items[5].Text:= FrmCadCli.Caption;
//  FrmCadCli.ShowModal;
//  FreeAndNil(FrmCadCli);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.PNGButton3Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmEntEstoque, FrmEntEstoque);
//  StatusBar1.Panels.Items[5].Text:= FrmEntEstoque.Caption;
//  FrmEntEstoque.ShowModal;
//  FreeAndNil(FrmEntEstoque);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.PNGButton6Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmNPedido,FrmNPedido);
//  StatusBar1.Panels.Items[5].Text:= FrmNPedido.Caption;
//  if not IBTMain.Active Then
//    IBTMain.StartTransaction;
//    If  not  FrmNPedido.IBTbPedidos.Active then
//       FrmNPedido.IBTbPedidos.Open;
//  FrmNPedido.IBTbPedidos.Append;
//  FrmNPedido.CDSItensPedido.CreateDataSet;
//  FrmNPedido.CDSItensPedido.Open;
//  FrmNPedido.ShowModal;
//  FreeAndNil(FrmNPedido);
//  StatusBar1.Panels.Items[5].Text:='';
end;



procedure TFrmPrincipal.PNGButton1Click(Sender: TObject);
Begin
  Application.Terminate;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var slStatusBar:TStringList;
    FacadeConfig:TFacadeConfiguracoes;
begin
  sCaminho:=Application.ExeName;
  sCaminho:=Copy(sCaminho,1, pos('Elanor.exe',sCaminho)-1);
  Conexao:=TConnectDataBase.Create;
  Conexao.ConnectDataBase(FrmPrincipal.sCaminho);
  SendMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  Application.OnMessage := OnMessageOwn;
  IdUsuario:=11;
  Usuario:='MASTER';
  UserAdm :='S';
  FacadeConfig:=TFacadeConfiguracoes.Create;
  slStatusBar:=FacadeConfig.ConsultarTextoStatusBar;
  if slStatusBar.Count > 0 then
  begin
    StatusBar1.Panels.Items[1].Text:=StatusBar1.Panels.Items[1].Text+slStatusBar[0];
    StatusBar1.Panels.Items[2].Text:=StatusBar1.Panels.Items[2].Text+slStatusBar[1];
  end;

end;

procedure TFrmPrincipal.Reimprimir1Click(Sender: TObject);
var idPedido:Integer;
    StrNumPed:String;
begin
//  Application.CreateForm(TFrmNumPed,FrmNumPed);
//
//  FrmNumPed.ShowModal;
//  StrNumped:=FrmNumPed.NumPed1.Text;
//  FreeAndNil(FrmNumPed);
//
//  if not IBTMain.Active Then
//    IBTMain.StartTransaction;
//  IBSQLUTIL.Close;
//  IBSQLUTIL.Sql.Clear;
//  IBSQLUTIL.SQL.add('SELECT ID_PEDIDO '+
//                    'FROM TB_PEDIDOS '+
//                     'WHERE TBPED_NUMPED=:pNumPed');
//  IBSQLUTIL.ParamByName('pNumPed').AsString:=AnsiUpperCase(StrNumPed);
//  IBSQLUTIL.ExecQuery;
//  If Not IBSQLUTIL.Eof Then
//  Begin
//
//    Application.CreateForm(TFrmImprePedidos, FrmImprePedidos);
//    StatusBar1.Panels.Items[5].Text:= FrmImprePedidos.Caption;
//    FrmImprePedidos.IBQImpressaoPed.ParamByName('pIDPedido').AsInteger:=IBSQLUTIL.FieldByName('ID_PEDIDO').AsInteger;
//    FrmImprePedidos.IBQImpressaoPed.Open;
//    FrmImprePedidos.MontarCDs;
//
//    //FrmImprePedidos.QuickRepEmpresa.Prepare;
//    FrmImprePedidos.QuickRepEmpresa.PreviewModal; //Empresa
//    {if (tFrmMensagens.Mensagem('Deleja imprimir a via do cliente?','Q',[mbSim, mbNao])) then
//      FrmImprePedidos.QuickRepCliente.PreviewModal; //Cliente}
//  End
//  Else
//    tFrmMensagens.Mensagem('Pedido n�o localizado, favor confirmar o n�mero da DO. '+
//                           'O mesmo dever� ser digitado conforme est� no pedido.','Q',[mbOK]);

end;

procedure TFrmPrincipal.Saldoatual2Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarEstoque,FrmConsultarEstoque);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarEstoque.Caption;
//  FrmConsultarEstoque.ShowModal;
//  FreeAndNil(FrmConsultarEstoque);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Porcliente1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarPedCli,FrmConsultarPedCli);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarPedCli.Caption;
//  FrmConsultarPedCli.ShowModal;
//  FreeAndNil(FrmConsultarPedCli);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Entradas1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsMovEntrada, FrmConsMovEntrada);
//  StatusBar1.Panels.Items[5].Text:= FrmConsMovEntrada.Caption;
//  FrmConsMovEntrada.ShowModal;
//  FreeAndNil(FrmConsMovEntrada);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Nmerodopedido1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmNumProxPed,FrmNumProxPed);
//  StatusBar1.Panels.Items[5].Text:= FrmNumProxPed.Caption;
//  FrmNumProxPed.ShowModal;
//  FreeAndNil(FrmNumProxPed);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.ransfernciapararolo1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmEnfestadoPRolo, FrmEnfestadoPRolo);
//  StatusBar1.Panels.Items[5].Text:= FrmEnfestadoPRolo.Caption;
//  FrmEnfestadoPRolo.ShowModal;
//  FreeAndNil(FrmEnfestadoPRolo);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Geral1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarPedData, FrmConsultarPedData);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarPedData.Caption;
//  FrmConsultarPedData.ShowModal;
//  FreeAndNil(FrmConsultarPedData);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.PNGButton5Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadUser, FrmCadUser);
//  StatusBar1.Panels.Items[5].Text:= FrmCadUser.Caption;
//  FrmCadUser.ShowModal;
//  FreeAndNil(FrmCadUser);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.PNGButton7Click(Sender: TObject);
begin
//    if (tFrmMensagens.Mensagem('Deseja efetuar logoff?','Q',[mbSim, mbNao])) then
//    Begin
//      Usuario:='';
//      StatusBar1.Panels.Items[0].Text:='Login: ' + Usuario;
//      PanelContaRec.Visible:=False;
//      Panel1.Visible:=False;
//      Application.CreateForm(TFrmLogin, FrmLogin);
//      FrmLogin.ShowModal;
//      FreeAndNil(FrmLogin);
//    End;
//   If UserAdm ='S' Then
//   begin
//     Usurios1.Enabled   :=True;
//     PNGButton5.Enabled := True;
//     Financeiro1.Enabled:=True;
//   end
//   Else
//   begin
//     Usurios1.Enabled :=False;
//     PNGButton5.Enabled := False;
//     Financeiro1.Enabled:=False;
//   end;
//   StatusBar1.Panels.Items[0].Text:='Login: ' + Usuario;
end;


function TFrmPrincipal.RetornaEndereco(CEP: String): TEndereco;
begin
end;

procedure TFrmPrincipal.Vendas1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmGraficoVenProd,FrmGraficoVenProd);
//  StatusBar1.Panels.Items[5].Text:= FrmGraficoVenProd.Caption;
//  FrmGraficoVenProd.ShowModal;
//  FreeAndNil(FrmGraficoVenProd);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Cheques1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadCheque,FrmCadCheque);
//  StatusBar1.Panels.Items[5].Text:= FrmCadCheque.Caption;
//  FrmCadCheque.ShowModal;
//  FreeAndNil(FrmCadCheque);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.PNGButton8Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadCheque,FrmCadCheque);
//  StatusBar1.Panels.Items[5].Text:= FrmCadCheque.Caption;
//  FrmCadCheque.ShowModal;
//  FreeAndNil(FrmCadCheque);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Impressodeetiquetas1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmImpEtiquetas, FrmImpEtiquetas);
//  StatusBar1.Panels.Items[5].Text:= FrmImpEtiquetas.Caption;
//  FrmImpEtiquetas.ShowModal;
//  FreeAndNil(FrmImpEtiquetas);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Pedidosporperodo1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmRelatorioPedData, FrmRelatorioPedData);
//  StatusBar1.Panels.Items[5].Text:= FrmRelatorioPedData.Caption;
//  FrmRelatorioPedData.ShowModal;
//  FreeAndNil(FrmRelatorioPedData);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.ImpressodeetiquetasNProdutos1Click(
  Sender: TObject);
begin
//  Application.CreateForm(TFrmImpEtiquetasNProd, FrmImpEtiquetasNProd);
//  StatusBar1.Panels.Items[5].Text:= FrmImpEtiquetasNProd.Caption;
//  FrmImpEtiquetasNProd.ShowModal;
//  FreeAndNil(FrmImpEtiquetasNProd);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Pedidosaprazo1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarPedPrazo, FrmConsultarPedPrazo);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarPedPrazo.Caption;
//  FrmConsultarPedPrazo.ShowModal;
//  FreeAndNil(FrmConsultarPedPrazo);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Cancelarumpedido1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCancelPedidos, FrmCancelPedidos);
//  StatusBar1.Panels.Items[5].Text:= FrmCancelPedidos.Caption;
//  FrmCancelPedidos.ShowModal;
//  FreeAndNil(FrmCancelPedidos);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Impressodecheques1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmBuscarCheques, FrmBuscarCheques);
//  StatusBar1.Panels.Items[5].Text:= FrmBuscarCheques.Caption;
//  FrmBuscarCheques.ShowModal;
//  FreeAndNil(FrmBuscarCheques);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Memo_Print(Conteudo: TStrings);
//   MemoFile :TextFile;
//   P :Integer;
begin
//  AssignPrn(MemoFile);
//  Rewrite(MemoFile);
//  Writeln(MemoFile,'');
//  Writeln(MemoFile,'');
//   For P := 0 to Conteudo.Count-1 do
//     Writeln(MemoFile,'            '+Conteudo.Strings[P]);
//   CloseFile(MemoFile);
end;

procedure TFrmPrincipal.OnMessageOwn(var Msg: TMsg; var Handled: Boolean);
var
  KeyState: TKeyboardState;
begin
  GetKeyboardState(KeyState);
  if KeyState[VK_NUMLOCK] = 0 then
    StatusBar1.Panels[3].Text:= ''
  else
    StatusBar1.Panels[3].Text:= 'Num';
  if KeyState[VK_CAPITAL] = 0 then
    StatusBar1.Panels[4].Text:= ''
  else
    StatusBar1.Panels[4].Text:= 'Caps';
  if KeyState[VK_INSERT] = 0 then
    StatusBar1.Panels[5].Text:= ''
  else
    StatusBar1.Panels[5].Text:= 'Ins';

end;

procedure TFrmPrincipal.abeladepreos1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmTabelaPrecos, FrmTabelaPrecos);
//  FrmTabelaPrecos.QuickRep1.PreviewModal;
//  FreeAndNil(FrmTabelaPrecos);
end;

function TFrmPrincipal.AbreviarNome(Nome: string): String;
Var NovoNome:string;
begin
  NovoNome :=StringReplace(Nome, 'INDUSTRIA', 'IND.',[rfReplaceAll, rfIgnoreCase]);
  NovoNome :=StringReplace(NovoNome, 'COM�RCIO', 'COM.',[rfReplaceAll, rfIgnoreCase]);
  NovoNome :=StringReplace(NovoNome, 'COMERCIO', 'COM.', [rfReplaceAll, rfIgnoreCase]);
  NovoNome :=StringReplace(NovoNome, 'EXPORTA��O', 'EXP.',[rfReplaceAll, rfIgnoreCase]);
  NovoNome :=StringReplace(NovoNome, 'CONFEC��ES', 'CONFEC.',[rfReplaceAll, rfIgnoreCase]);
  NovoNome :=StringReplace(NovoNome, 'CONFEC��O', 'CONFEC.',[rfReplaceAll, rfIgnoreCase]);
  NovoNome :=StringReplace(NovoNome, 'IMPORTA��O', 'IMP.',[rfReplaceAll, rfIgnoreCase]);

  result:=NovoNome;

end;

procedure TFrmPrincipal.Pedidosavista1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarPedVista,FrmConsultarPedVista);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarPedVista.Caption;
//  FrmConsultarPedVista.ShowModal;
//  FreeAndNil(FrmConsultarPedVista);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.AtualizarTvContaRec;
Var RecebimentosHoje:TRecebimentoHoje;
begin
//  if Not IBTMain.Active then
//    IBTMain.StartTransaction;
//  TViewContas.Items.Clear;
//  IBSQLUTIL.Close;
//  IBSQLUTIL.SQL.Clear;
//  IBSQLUTIL.SQL.Add('SELECT * FROM TB_CONTAREC '+
//                    ' INNER JOIN TB_PEDIDOS '+
//                     ' ON TB_PEDIDOS.ID_PEDIDO=TB_CONTAREC.id_pedido '+
//                    ' WHERE TBCONTAREC_VENCIMENTO <= :pHoje '+
//                      ' AND (TBCONTAREC_STATUS <> ''PG'' )');
//  IBSQLUTIL.Close;
//  IBSQLUTIL.ParamByName('pHoje').AsString:=FormatDateTime('dd/mm/yyyy', Now());
//  IBSQLUTIL.ExecQuery;
//  While not IBSQLUTIL.Eof do
//  begin
//      RecebimentosHoje :=TRecebimentoHoje.Create;
//      RecebimentosHoje.Numped     := IBSQLUTIL.FieldByName('TBPED_NUMPED').AsString ;
//      RecebimentosHoje.Vencimento := IBSQLUTIL.FieldByName('TBCONTAREC_VENCIMENTO').AsDate ;
//      RecebimentosHoje.ValorTotal := IBSQLUTIL.FieldByName('TBCONTAREC_VALORTOTAL').AsCurrency ;
//      RecebimentosHoje.Valor      := IBSQLUTIL.FieldByName('TBCONTAREC_VALOR').AsCurrency ;
//      RecebimentosHoje.NomeCli    := IBSQLUTIL.FieldByName('TBPED_NOME').AsString  ;
//      RecebimentosHoje.DataPedido := IBSQLUTIL.FieldByName('TBPED_DATA').AsDate ;
//      TViewContas.Items.AddObject(Nil,RecebimentosHoje.Numped +' '+RecebimentosHoje.NomeCli  ,RecebimentosHoje);
//      IBSQLUTIL.Next;
//    end;
//  If TViewContas.Items.Count > 0 Then
//    PanelContaRec.Visible :=True
//  else
//    PanelContaRec.Visible :=False;
end;

procedure TFrmPrincipal.TViewContasDblClick(Sender: TObject);
begin
//   if TViewContas.Selected.Data <> Nil   then
//   Begin
//      MemoDados.Lines.Clear;
//      MemoDados.Visible:=True;
//      MemoDados.Lines.Add ('Pedido: '          +TRecebimentoHoje (TViewContas.Selected.Data).Numped  );
//      MemoDados.Lines.Add ('Cliente: '         +TRecebimentoHoje(TViewContas.Selected.Data).NomeCli  );
//      MemoDados.Lines.Add ('Emiss�o: '         +DateToStr(TRecebimentoHoje(TViewContas.Selected.Data).DataPedido));
//      MemoDados.Lines.Add ('Valor do pedido: ' +FormatCurr('R$ #,###.00',TRecebimentoHoje(TViewContas.Selected.Data).ValorTotal ) );
//      MemoDados.Lines.Add ('Valor     :  '     +FormatCurr('R$ #,###.00',TRecebimentoHoje(TViewContas.Selected.Data).Valor  ));
//      MemoDados.Lines.Add ('Vencimento  :  '   +DateToStr(TRecebimentoHoje (TViewContas.Selected.Data).Vencimento));
//   End;
end;

procedure TFrmPrincipal.Pedidoscancelados1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarPedCancelado,FrmConsultarPedCancelado);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarPedCancelado.Caption;
//  FrmConsultarPedCancelado.ShowModal;
//  FreeAndNil(FrmConsultarPedCancelado);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Exibirrecebimentosemaberto1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarContaRec,FrmConsultarContaRec);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarContaRec.Caption;
//  FrmConsultarContaRec.ShowModal;
//  FreeAndNil(FrmConsultarContaRec);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Baixar1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarContaRecPaga, FrmConsultarContaRecPaga);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarContaRecPaga.Caption;
//  FrmConsultarContaRecPaga.ShowModal;
//  FreeAndNil(FrmConsultarContaRecPaga);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.WMNCLButtonDblClk(var Message: TWMNCLButtonDblClk);
begin
   //Desativando o duplo clique na barra de titulo
   Message.Result := 0;
end;

procedure TFrmPrincipal.atualizarTreeView;
Var PagamentosHoje:TPagamentosPHoje;
begin
//  TreeViewContaPag.Items.Clear;
//  IBQUtil1.Close;
//  IBQUtil1.SQL.Clear;
//  IBQUtil1.SQL.Add(' SELECT   ID_CONTASPAGAR, '+
//                             'TBCONT_NUMNOTA, '+
//                             'TBCONT_EMISSAO, '+
//                             'TB_CONTASPAGAR.ID_FORNECEDOR, '+
//                             'TBCONT_VALORNOTA, '+
//                             'TBCONT_VENCIMENTO,  '+
//                             'TBCONT_VALOR,  '+
//                             'TBFOR_NOME  '+
//                   ' FROM TB_CONTASPAGAR '+
//                   ' INNER JOIN TB_FORNECEDORES '+
//                   ' ON TB_FORNECEDORES.ID_FORNECEDOR= TB_CONTASPAGAR.ID_FORNECEDOR '+
//                   ' WHERE TBCONT_VENCIMENTO <=:pHoje '+
//                   ' AND (TBCONT_STATUS<>''PG'' or TBCONT_STATUS IS NULL) ');
//
//  IBQUtil1.ParamByName('pHoje').AsString:=FormatDateTime('dd/mm/yyyy', Now());
//  IBQUtil1.Open;
// // Panel1.Visible:=False;
//  if Not IBQUtil1.IsEmpty then
//  begin
//    IBQUtil1.First;
//    While not IBQUtil1.Eof do
//    begin
//      PagamentosHoje :=TPagamentosPHoje.Create;
//      PagamentosHoje.Emissao    := IBQUtil1.FieldByName('TBCONT_EMISSAO').AsDateTime;
//      PagamentosHoje.NumNota    := IBQUtil1.FieldByName('TBCONT_NUMNOTA').AsString;
//      PagamentosHoje.Fornecedor := IBQUtil1.FieldByName('TBFOR_NOME').AsString;
//      PagamentosHoje.Vencimento := IBQUtil1.FieldByName('TBCONT_VENCIMENTO').AsDateTime;
//      PagamentosHoje.Valor      := IBQUtil1.FieldByName('TBCONT_VALOR').AsCurrency ;
//      PagamentosHoje.ValorNota  := IBQUtil1.FieldByName('TBCONT_VALORNOTA').AsCurrency ;
//      TreeViewContaPag.Items.AddObject(Nil,PagamentosHoje.Fornecedor,PagamentosHoje);
//      IBQUtil1.Next;
//    end;
//    Panel1.Visible:=True;
//  end;
end;

function TFrmPrincipal.retornaMespExtenso(mes: string): string;
begin
 case AnsiIndexStr(UpperCase(mes), ['01', '02','03','04','05','06','07','08','09','10','11','12' ]) of
    0 : result:='JANEIRO';
    1 : result:='FEVEREIRO';
    2 : result:='MAR�O';
    3 : result:='ABRIL';
    4 : result:='MAIO';
    5 : result:='JUNHO';
    6 : result:='JULHO';
    7 : result:='AGOSTO';
    8 : result:='SETEMBRO';
    9 : result:='OUTUBRO';
    10 : result:='NOVEMBRO';
    11 : result:='DEZEMBRO';
 end;
end;

procedure TFrmPrincipal.CriarContasPagTemp;
 Var MesAnterior:string;
      Meses:TStringList;
      Total:Currency;
      I:Integer;
      Registro:Integer;
begin



end;

procedure TFrmPrincipal.ExportarPExcel;
var objExcel,Sheet,Chart,s : Variant;
    cTitulo : string;
    i, l : integer;
    ExcApp: OleVariant;
begin
//  Try
//    CriarContasPagTemp;
//    cTitulo := 'T�tulos a pagar pendentes';
//    ExcApp := CreateOleObject('Excel.Application');
//    ExcApp.Visible := True;
//    ExcApp.WorkBooks.Add;
//    ExcApp.Caption := cTitulo;
//    // Adiciona planilha(sheet)
//
//
//    ExcApp.Workbooks[1].WorkSheets[1].Name := cTitulo;
//    Sheet := ExcApp.Workbooks[1].WorkSheets[cTitulo];
//
//    //Criando cabe�alho
//    Sheet.Range['A1'] := 'M�s';
//    Sheet.Range['B1'] := 'Nota';
//    Sheet.Range['C1'] := 'Data de emiss�o';
//    Sheet.Range['D1'] := 'Fornecedor';
//    Sheet.Range['F1'] := 'Vencimento';
//    Sheet.Range['E1'] := 'Valor da Nota';
//    Sheet.Range['G1'] := 'Valor a ser pago';
//    Sheet.Range['H1'] := 'Total';
//
//   //Formatando cabe�alho
//   // Formatando o Cabe�alho
//    Sheet.Range['A1','H1'].font.name := 'Verdana'; // Fonte
//    Sheet.Range['A1','H1'].font.size := 12; // Tamanho da Fonte
//    Sheet.Range['A1','H1'].font.bold := true; // Negrito
//    Sheet.Range['A1','H1'].font.italic := true; // Italico
//    Sheet.Range['A1','H1'].font.color := clYellow; // Cor da Fonte
//    Sheet.Range['A1','H1'].Interior.Color := $00ffcf9c; // Cor da C�lula
//    // Define o tamanho das Colunas (basta fazer em uma delas e as demais ser�o alteradas)
//    Sheet.Range['B1','C1' ].ColumnWidth := 27;
//    Sheet.Range['B1','C1' ].RowHeight := 25;
//    Sheet.Range['D1'] .ColumnWidth := 16;
//
//
//    // Alinhando as C�lulas
//    Sheet.Range['A2','H100' ].HorizontalAlignment := 3; // 3=Center - 4=Right
//
//    IBQContasPag.First;
//    l := 2;
//    While not IBQContasPag.Eof do
//    begin
//      for i := 0 to IBQContasPag.Fields.Count - 1 do
//      begin
//        If IBQContasPag.Fields[i].DisplayText<>'R$ 0,00' Then
//          ExcApp.WorkBooks[1].Sheets[1].Cells[l,i + 1] :=
//           IBQContasPag.Fields[i].DisplayText;
//        if (IBQContasPag.Fields[i].Name='IBQContasPagTBCONT_VALORNOTA') or  (IBQContasPag.Fields[i].Name='IBQContasPagTBCONT_VALOR')
//           or (IBQContasPag.Fields[i].Name='IBQContasPagTBCONT_VALOR')  then
//           Sheet.Cells[l,i + 1].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
//      end;
//      IBQContasPag.Next;
//      l := l + 1;
//    end;
//    Sheet.Cells[l+1,7] := 'Total R$';
//    // Na linha abaixo inclui uma soma e converti para Moeda atravez do NUMBERFORMAT
//  //  Sheet.Cells[i,4].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
//    Sheet.Cells[l+1,8].formula := '=SUM(G2:'+'G'+IntToStr(l)+')';
//
//    ExcApp.WorkBooks[1].SaveAs('C:\AppElanor\Excel\Contas'+FormatDateTime('ddmmyyyyhhnnss',Now())+'.xlsx');
//    IBTMain.Rollback;
//  except
//   on E: EOleSysError do
//   begin
//     tFrmMensagens.Mensagem('Erro executar excel, verifique se est� instalado.','E',[mbOK], E.Message);
//
//   end;
//
//  end;
end;

procedure TFrmPrincipal.Cadastrodefornecedores1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadFornec,FrmCadFornec);
//  StatusBar1.Panels.Items[5].Text:= FrmCadFornec.Caption;
//  FrmCadFornec.ShowModal;
//  FreeAndNil(FrmCadFornec);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Contasapagar1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadContasaPagar,FrmCadContasaPagar);
//  StatusBar1.Panels.Items[5].Text:= FrmCadContasaPagar.Caption;
//  FrmCadContasaPagar.ShowModal;
//  FreeAndNil(FrmCadContasaPagar);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.BaixarContaapagar1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmBaixarContasPag, FrmBaixarContasPag);
//  StatusBar1.Panels.Items[5].Text:= FrmBaixarContasPag.Caption;
//  FrmBaixarContasPag.ShowModal;
//  FreeAndNil(FrmBaixarContasPag);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.imprimircontasapagaremaberto1Click(
  Sender: TObject);
begin
//  CriarContasPagTemp;
//  Application.CreateForm(TFrmRelContasAberto,FrmRelContasAberto);
//  FrmRelContasAberto.IBQContasPag.Open;
//  FrmRelContasAberto.QRLabel9.Caption := 'Total de d�bitos em aberto: ' + formatfloat('R$ #.##0,##', TotalGeral);
//  FrmRelContasAberto.QuickRep1.PreViewModal;
//  FreeAndNil(FrmRelContasAberto);
//  IBTMain.Rollback;
end;

procedure TFrmPrincipal.Exportarparaexcel1Click(Sender: TObject);
begin
//  CriarContasPagTemp;
//  IBQContasPag.Open;
//  ExportarPExcel;
end;

procedure TFrmPrincipal.TreeViewContaPagDblClick(Sender: TObject);
begin
//  if TreeViewContaPag.Selected.Data <> Nil   then
//   Begin
//      MemoDadosPag.Lines.Clear;
//      MemoDadosPag.Visible:=True;
//      MemoDadosPag.Lines.Add ('Fornecedor: '     +TPagamentosPHoje(TreeViewContaPag.Selected.Data).Fornecedor );
//      MemoDadosPag.Lines.Add ('N�mero da nota: ' +TPagamentosPHoje(TreeViewContaPag.Selected.Data).NumNota );
//      MemoDadosPag.Lines.Add ('Emiss�o: '        +DateToStr(TPagamentosPHoje(TreeViewContaPag.Selected.Data).Emissao));
//      MemoDadosPag.Lines.Add ('Valor da nota:   '+CurrToStr (TPagamentosPHoje(TreeViewContaPag.Selected.Data).ValorNota ));
//      MemoDadosPag.Lines.Add ('Vencimento: '     +DateToStr(TPagamentosPHoje(TreeViewContaPag.Selected.Data).Vencimento ));
//      MemoDadosPag.Lines.Add ('Valor: '          +CurrToStr(TPagamentosPHoje(TreeViewContaPag.Selected.Data).Valor));
//
//   End;
end;

procedure TFrmPrincipal.Pedidosporclienteperodo1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmRelatorioPedDataCli, FrmRelatorioPedDataCli);
//  StatusBar1.Panels.Items[5].Text:= FrmRelatorioPedDataCli.Caption;
//  FrmRelatorioPedDataCli.ShowModal;
//  FreeAndNil(FrmRelatorioPedDataCli);
//  StatusBar1.Panels.Items[5].Text:='';

end;

procedure TFrmPrincipal.Estoquegeral1Click(Sender: TObject);
begin
  ExibirEstoqueAtual; 
end;

procedure TFrmPrincipal.PedidosporOC1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarPedOrdemCompra, FrmConsultarPedOrdemCompra);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarPedOrdemCompra.Caption;
//  FrmConsultarPedOrdemCompra.ShowModal;
//  FreeAndNil(FrmConsultarPedOrdemCompra);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Incluirobservao1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmIncluirObsPedidos, FrmIncluirObsPedidos);
//  StatusBar1.Panels.Items[5].Text:= FrmIncluirObsPedidos.Caption;
//  FrmIncluirObsPedidos.ShowModal;
//  FreeAndNil(FrmIncluirObsPedidos);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Faturamentodirio1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarPedDia, FrmConsultarPedDia);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarPedDia.Caption;
//  FrmConsultarPedDia.ShowModal;
//  FreeAndNil(FrmConsultarPedDia);
//  StatusBar1.Panels.Items[5].Text:='';

end;

procedure TFrmPrincipal.Entradadegasto1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadGastos, FrmCadGastos);
//  StatusBar1.Panels.Items[5].Text:= FrmCadGastos.Caption;
//  FrmCadGastos.ShowModal;
//  FreeAndNil(FrmCadGastos);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Consultardespesas1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarDespesas,FrmConsultarDespesas);
//  FrmConsultarDespesas.ShowModal;
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarDespesas.Caption;
//  FreeAndNil(FrmConsultarDespesas);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.PNGButton9Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarEstoque,FrmConsultarEstoque);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarEstoque.Caption;
//  FrmConsultarEstoque.ShowModal;
//  FreeAndNil(FrmConsultarEstoque);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.ExibirEstoqueAtual;
Var ValTotal:Currency;
begin
//  Application.CreateForm(TFrmRelEstoqueAtual, FrmRelEstoqueAtual);
//  FrmRelEstoqueAtual.IBQEstoque.Open;
//  FrmRelEstoqueAtual.CDSEstoque.CreateDataSet;
//  ValTotal:=0;
//  FrmRelEstoqueAtual.IBQEstoque.First;
//  While Not FrmRelEstoqueAtual.IBQEstoque.Eof do
//  begin
//    if  FrmRelEstoqueAtual.IBQEstoqueTBES_QUANTI.AsFloat > 0 then
//    begin
//      FrmRelEstoqueAtual.CDSEstoque.Append;
//      FrmRelEstoqueAtual.CDSEstoqueCODIGO.AsInteger        :=FrmRelEstoqueAtual.IBQEstoqueID_PRODUTO1.AsInteger;
//      FrmRelEstoqueAtual.CDSEstoqueNOME.AsString           :=FrmRelEstoqueAtual.IBQEstoqueTBPRD_NOME.AsString ;
//      FrmRelEstoqueAtual.CDSEstoqueTIPO.AsString           :=FrmRelEstoqueAtual.IBQEstoqueTBES_FORMATO.AsString ;
//      FrmRelEstoqueAtual.CDSEstoqueUNDADE.AsString         :=FrmRelEstoqueAtual.IBQEstoqueTBPRD_UNIDADE.AsString;
//      FrmRelEstoqueAtual.CDSEstoqueQUANTIDADE.AsFloat      :=FrmRelEstoqueAtual.IBQEstoqueTBES_QUANTI.AsFloat;
//      FrmRelEstoqueAtual.CDSEstoquePRECO.AsCurrency        :=FrmRelEstoqueAtual.IBQEstoqueTBPRD_PRECOVENDA.AsCurrency;
//      FrmRelEstoqueAtual.CDSEstoqueVALOR.AsCurrency        :=FrmRelEstoqueAtual.IBQEstoqueTBES_QUANTI.AsFloat*FrmRelEstoqueAtual.IBQEstoqueTBPRD_PRECOVENDA.AsCurrency;
//      ValTotal:=ValTotal+(FrmRelEstoqueAtual.IBQEstoqueTBES_QUANTI.AsInteger*FrmRelEstoqueAtual.IBQEstoqueTBPRD_PRECOVENDA.AsCurrency);
//      FrmRelEstoqueAtual.CDSEstoque.Post;
//    end;
//    FrmRelEstoqueAtual.IBQEstoque.Next;
//  end;
//  FrmRelEstoqueAtual.CDSEstoque.First;
//   //:=FmtStr  CurrToStr(ValTotal);
//  FrmRelEstoqueAtual.QRLValTotal.Caption:='R$ '+  formatfloat('##,###,###.##',ValTotal);
//
//  FrmRelEstoqueAtual.QuickRep1.PreviewModal;
//   FrmRelEstoqueAtual.Free;
end;

procedure TFrmPrincipal.ConsultaSQL1Click(Sender: TObject);
begin
//  Application.CreateForm(TFormConsultaSQL, FormConsultaSQL);
//  StatusBar1.Panels.Items[5].Text:= FormConsultaSQL.Caption;
//  FormConsultaSQL.IBDMain.Close;
//  FormConsultaSQL.IBDMain.DatabaseName := IBDMain.DatabaseName;
//  FormConsultaSQL.IBDMain.Open;
//  FormConsultaSQL.ShowModal;
//  FreeAndNil(FormConsultaSQL);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Faturamentoestimado1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarFatMensal, FrmConsultarFatMensal);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarFatMensal.Caption;
//  FrmConsultarFatMensal.ShowModal;
//  FreeAndNil(FrmConsultarFatMensal);
end;


procedure TFrmPrincipal.Porproduto1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarPedProduto, FrmConsultarPedProduto);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarPedProduto.Caption;
//  FrmConsultarPedProduto.ShowModal;
//  FreeAndNil(FrmConsultarPedProduto);
//  StatusBar1.Panels.Items[5].Text:='';

end;

procedure TFrmPrincipal.PNGButton10Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmRomaneioEntrega, FrmRomaneioEntrega  );
//  StatusBar1.Panels.Items[5].Text:= FrmRomaneioEntrega.Caption;
//  FrmRomaneioEntrega.ShowModal;
//  FreeAndNil(FrmRomaneioEntrega);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Romaneiodeentrega1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmRomaneioEntrega, FrmRomaneioEntrega  );
//  StatusBar1.Panels.Items[5].Text:= FrmRomaneioEntrega.Caption;
//  FrmRomaneioEntrega.ShowModal;
//  FreeAndNil(FrmRomaneioEntrega);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.SkinClick(Sender: TObject);
begin
//  Application.CreateForm(TFrmSelectSkin,FrmSelectSkin);
//  FrmSelectSkin.ShowModal;
//  FreeAndNil(FrmSelectSkin);
end;

procedure TFrmPrincipal.Controledeperdas1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmControlePerdas,FrmControlePerdas);
//  StatusBar1.Panels.Items[5].Text:= FrmControlePerdas.Caption;
//  FrmControlePerdas.ShowModal;
//  FreeAndNil(FrmControlePerdas);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Consultarlanamentos1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarPerdas,FrmConsultarPerdas);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarPerdas.Caption;
//  FrmConsultarPerdas.ShowModal;
//  FreeAndNil(FrmConsultarPerdas);
//  StatusBar1.Panels.Items[5].Text:='';

end;

procedure TFrmPrincipal.PNGButton11Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmControlePerdas,FrmControlePerdas);
//  StatusBar1.Panels.Items[5].Text:= FrmControlePerdas.Caption;
//  FrmControlePerdas.ShowModal;
//  FreeAndNil(FrmControlePerdas);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Reimpressopordata1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConsultarLancamentos,FrmConsultarLancamentos);
//  StatusBar1.Panels.Items[5].Text:= FrmConsultarLancamentos.Caption;
//  FrmConsultarLancamentos.ShowModal;
//  FreeAndNil(FrmConsultarLancamentos);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Despesas1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadDespesas,FrmCadDespesas);
//  StatusBar1.Panels.Items[5].Text:= FrmCadDespesas.Caption;
//  FrmCadDespesas.ShowModal;
//  FreeAndNil(FrmCadDespesas);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Despesas2Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmSelecionaDespesas,FrmSelecionaDespesas);
//  StatusBar1.Panels.Items[5].Text:= FrmSelecionaDespesas.Caption;
//  FrmSelecionaDespesas.ShowModal;
//  FreeAndNil(FrmSelecionaDespesas);
//  StatusBar1.Panels.Items[5].Text:='';

end;

procedure TFrmPrincipal.PNGButton12Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadGastos, FrmCadGastos);
//  StatusBar1.Panels.Items[5].Text:= FrmCadGastos.Caption;
//  FrmCadGastos.ShowModal;
//  FreeAndNil(FrmCadGastos);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Localizarlote1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmBuscarLote, FrmBuscarLote);
//  StatusBar1.Panels.Items[5].Text:= FrmBuscarLote.Caption;
//  FrmBuscarLote.ShowModal;
//  FreeAndNil(FrmBuscarLote);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.EStoquenegativo1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmEstoqueNegativo, FrmEstoqueNegativo);
//  StatusBar1.Panels.Items[5].Text:= FrmEstoqueNegativo.Caption;
//  FrmEstoqueNegativo.ShowModal;
//  FreeAndNil(FrmEstoqueNegativo);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.CorrigirAlerar1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmAlterarControlePerdas,FrmAlterarControlePerdas);
//  StatusBar1.Panels.Items[5].Text:= FrmAlterarControlePerdas.Caption;
//  FrmAlterarControlePerdas.ShowModal;
//  FreeAndNil(FrmAlterarControlePerdas);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Reimpressoromaneio1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmReimpressaoRomaneio, FrmReimpressaoRomaneio);
//  StatusBar1.Panels.Items[5].Text:= FrmReimpressaoRomaneio.Caption;
//  FrmReimpressaoRomaneio.ShowModal;
//  FreeAndNil(FrmReimpressaoRomaneio);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Skin1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmSelectSkin,FrmSelectSkin);
//  FrmSelectSkin.ShowModal;
//  FreeAndNil(FrmSelectSkin);
end;

procedure TFrmPrincipal.atualizaMovimentacao(idProduto,  idPedido: Integer;
Quantidade, Tamanho: Real; Tipo, Formato: String);
begin
//  try
//    IBSPATUALIZAMOVI.Close;
//    IBSPATUALIZAMOVI.Params.Items[0].AsInteger := idProduto;
//    IBSPATUALIZAMOVI.Params.Items[1].Value     := IdUsuario;
//    IBSPATUALIZAMOVI.Params.Items[2].AsString  := Trim(Tipo);
//    IBSPATUALIZAMOVI.Params.Items[3].AsString  := Trim(Formato) ;
//    IBSPATUALIZAMOVI.Params.Items[4].Value     := idPedido;
//    IBSPATUALIZAMOVI.Params.Items[5].Value     := Tamanho;
//    IBSPATUALIZAMOVI.Params.Items[6].Value     := Quantidade;
//    IBSPATUALIZAMOVI.Prepare;
//    IBSPATUALIZAMOVI.ExecProc;
//  except
//   on E: EDatabaseError do
//   begin
//     tFrmMensagens.Mensagem('Erro ao atualizar movimenta��o do estoque.','E',[mbOK], E.Message);
//
//   end;
//  end;
end;

procedure TFrmPrincipal.Enroladores1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmCadEnrolador, FrmCadEnrolador);
//  StatusBar1.Panels.Items[5].Text:= FrmCadEnrolador.Caption;
//  FrmCadEnrolador.ShowModal;
//  FreeAndNil(FrmCadEnrolador);
//  StatusBar1.Panels.Items[5].Text:='';
end;

procedure TFrmPrincipal.Configuraes1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmConfiguracoes, FrmConfiguracoes);
//  StatusBar1.Panels.Items[5].Text:= FrmConfiguracoes.Caption;
//  FrmConfiguracoes.ShowModal;
//  FreeAndNil(FrmConfiguracoes);
//  StatusBar1.Panels.Items[5].Text:='';

end;

end.
