unit UCadPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DBCtrls, StdCtrls, Mask, DB,  Provider, DBClient,
  UParametrosConfig, IBX.IBSQL, IBX.IBQuery, IBX.IBCustomDataSet, IBX.IBTable,UEstoque, UEndereco,
  Vcl.Buttons, PngSpeedButton, FieldEdit, FieldComboBox,UComboboxItem;


type
  TFrmNPedido = class(TForm)
    PanelCliente: TPanel;
    PanelProdutos: TPanel;
    PanelBotoesProd: TPanel;
    DBGrid1: TDBGrid;
    DsPedido: TDataSource;
    Label1: TLabel;
    DSPrazos: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DsProdutos: TDataSource;
    CDSItensPedido: TClientDataSet;
    DsItensPedido: TDataSource;
    CDSItensPedidoID_PRODUTO: TIntegerField;
    CDSItensPedidoTBITPED_VALUNI: TCurrencyField;
    CDSItensPedidoTBITPED_VALTOT: TCurrencyField;
    CDSItensPedidoID_PEDIDO: TIntegerField;
    CDSItensPedidoTBITPED_UNIDADE: TStringField;
    CDSItensPedidoNOME_PRODUTO: TStringField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CDSItensPedidoFORMATO: TStringField;
    DBLookupListBox1: TDBLookupListBox;
    Label8: TLabel;
    CDSItensPedidoTAMANHO: TStringField;
    CDSItensPedidoTBITPED_QUANT: TBCDField;
    Panel1: TPanel;
    Label9: TLabel;
    EdtValorTotal: TEdit;
    Label10: TLabel;
    CDSItensPedidoID_ESTOQUE: TIntegerField;
    RadioGroupBoleto: TRadioGroup;
    dsCDSPedido: TClientDataSet;
    PngSdBCancelar: TPngSpeedButton;
    dsCDSCliente: TClientDataSet;
    FieldEditCliente: TFieldEdit;
    FieldEditEndereco: TFieldEdit;
    FieldEditCEP: TFieldEdit;
    FieldEditBairro: TFieldEdit;
    FieldEditCidade: TFieldEdit;
    FieldEditUF: TFieldEdit;
    FieldComboBoxPrazo: TFieldComboBox;
    fldtPrazo: TFieldEdit;
    fldtPrazo1: TFieldEdit;
    fldtPrazo2: TFieldEdit;
    fldtPrazo3: TFieldEdit;
    fldtOBS: TFieldEdit;
    PngSdBSalvar: TPngSpeedButton;
    PngSBAdicionarItens: TPngSpeedButton;
    PngSBRemoverItens: TPngSpeedButton;
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure PNGButton5Click(Sender: TObject);
    procedure PNGBNovoProdClick(Sender: TObject);
    Function AtualizaEstoque(pEstoque:TObject ; Quantidade:Real; Operacao:String):Boolean;
    procedure FormShow(Sender: TObject);
    Function NumPed:String;
    procedure PNGBRemoverProdClick(Sender: TObject);
    procedure DBEditCliExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1Exit(Sender: TObject);
    procedure CDSItensPedidoTBITPED_VALUNIChange(Sender: TField);
    procedure CalculaPrazos(Item: TComboboxItem);
    procedure CDSItensPedidoTBITPED_QUANTChange(Sender: TField);
    procedure atualizarTotal;
    procedure CDSItensPedidoAfterEdit(DataSet: TDataSet);
    procedure PNGBAtualizarClick(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LimparDBEdits;
    procedure PngSdBCancelarClick(Sender: TObject);
    procedure FieldEditClienteExit(Sender: TObject);
    procedure carregarComboboxPrazos;
    procedure FormCreate(Sender: TObject);
    procedure FieldComboBoxPrazoCloseUp(Sender: TObject);
    procedure PngSBAdicionarItensClick(Sender: TObject);
  private
    { Private declarations }
    QuantItens:Integer;
    IdPedido:Integer;
    IsNumber :Boolean;
    Estoque:TEstoque;
    bVisualizaImpressao,
    bGerarContaRec: Boolean;
  public
     StrFormato:String;
     StrTamanho:String;
    { Public declarations }
  end;

var
  FrmNPedido: TFrmNPedido;

implementation
Uses UFacadeClientes,uFacadePrazos,uFacadeProducts,uMensagens, Math,UBuscarProdutos, UPrincipal;


{$R *.dfm}

procedure TFrmNPedido.PNGButton4Click(Sender: TObject);
begin
//  IBTbPedidos.Cancel;
//  IBTbItensPedido.Cancel;
//  CDSItensPedido.EmptyDataSet;
//  If FrmPrincipal.IBTMain.InTransaction  Then
//    FrmPrincipal.IBTMain.Rollback;
//  Close;
end;

procedure TFrmNPedido.PNGButton1Click(Sender: TObject);
begin
//  Application.CreateForm(TFrmBuscarCliente, FrmBuscarCliente);
//  FrmBuscarCliente.ShowModal;
//  If  FrmBuscarCliente.Cliente <>Nil  then
//  Begin
//     FrmPrincipal.IdCliente             := FrmBuscarCliente.Cliente.IdCliente;
//     IBTbPedidosID_CLIENTE.AsInteger    := FrmBuscarCliente.Cliente.IdCliente;
//     IBTbPedidosTBPED_NOME.AsString     := FrmBuscarCliente.Cliente.NomeCliente;
//     IBTbPedidosTBPED_ENDERECO.AsString := FrmBuscarCliente.Cliente.Endereco ;
//     IBTbPedidosTBPED_BAIRRO.AsString   := FrmBuscarCliente.Cliente.Bairro ;
//     IBTbPedidosTBPED_CIDADE.AsString   := FrmBuscarCliente.Cliente.Cidade ;
//     IBTbPedidosID_PRAZO.AsInteger      := FrmBuscarCliente.Cliente.Id_Prazo ;
//     IBTbPedidosTBPED_CEP.AsString      := FrmBuscarCliente.Cliente.Cep;
//     IBTbPedidosTBPED_ESTADO.AsString   := FrmBuscarCliente.Cliente.Estado ;
//
//     If FrmBuscarCliente.Cliente.Boleto='S' then
//       RadioGroupBoleto.ItemIndex :=0
//     else
//       RadioGroupBoleto.ItemIndex :=1;
//
//  End;
// FrmBuscarCliente.Free;
   CalculaPrazos(TComboboxItem(FieldComboBoxPrazo.Items.Objects[FieldComboBoxPrazo.Items.IndexOf(FieldComboBoxPrazo.Text)]));
end;

procedure TFrmNPedido.PNGButton5Click(Sender: TObject);
var ValTotal:Currency;
    NumParcelas:Integer;
begin
//  if (tFrmMensagens.Mensagem('Deseja confirmar este pedido? Favor verificar os '+
//                              ' dados inseridos','Q',[mbSim, mbNao])) then
//  Begin
//    try
//      NumParcelas :=0;
//      If (DBEditCli.Text=EmptyStr) Or (DBLookupComboBox1.Text=EmptyStr) Or
//         (CDSItensPedido.IsEmpty ) Then
//        tFrmMensagens.Mensagem('Pedido incompleto, favor verificar.' ,'E',[mbOK])
//      Else
//      Begin
//        If  not IBTbItensPedido.Active then
//            IBTbItensPedido.Open;
//       //Atualizae itens Pedido
//        ValTotal :=0;
//        CDSItensPedido.First;
//        While Not CDSItensPedido.Eof do
//        Begin
//          IBTbItensPedido.Append;
//          IBTbItensPedidoID_PEDIDO.AsInteger:=IdPedido;
//          IBTbItensPedidoTBITPED_UNIDADE.AsString:=CDSItensPedidoTBITPED_UNIDADE.AsString;
//          IBTbItensPedidoTBITPED_TAMANHO.AsString:=CDSItensPedidoTAMANHO.AsString;
//          IBTbItensPedidoID_PRODUTO.AsInteger:=CDSItensPedidoID_PRODUTO.AsInteger;
//          IBTbItensPedidoTBITPED_QUANT.Value :=CDSItensPedidoTBITPED_QUANT.Value ;
//          IBTbItensPedidoTBITPED_VALUNI.AsCurrency:=CDSItensPedidoTBITPED_VALUNI.AsCurrency;
//          IBTbItensPedidoTBITPED_VALTOT.AsCurrency:=CDSItensPedidoTBITPED_VALTOT.AsCurrency;
//          IBTbItensPedidoTBITPED_TIPO.AsString    :=CDSItensPedidoFORMATO.AsString;
//          ValTotal:=ValTotal+CDSItensPedidoTBITPED_VALTOT.AsCurrency;
//          IBTbItensPedido.Post;
//
//          FrmPrincipal.atualizaMovimentacao(CDSItensPedidoID_PRODUTO.AsInteger,IdPedido,CDSItensPedidoTBITPED_QUANT.Value,0,'S',CDSItensPedidoFORMATO.AsString);
//          CDSItensPedido.Next;
//        End;
//
//        //Não gerar contarec se for boleto.
//        If RadioGroupBoleto.ItemIndex = 1 Then
//        Begin
//          IBTbPedidosTBPED_BOLETO.AsString:='N';
//          if IBTbPedidosTBPED_VENC01.AsDateTime <> 0 then
//             NumParcelas:=NumParcelas+1;
//          if IBTbPedidosTBPED_VENC02.AsDateTime <> 0 then
//              NumParcelas:=NumParcelas+1;
//          if IBTbPedidosTBPED_VENC03.AsDateTime <> 0 then
//             NumParcelas:=NumParcelas+1;
//          if bGerarContaRec Then
//          begin
//            if IBTbPedidosTBPED_VENC01.AsDateTime <> 0 then
//              GerarContaRec(idpedido, ValTotal, (ValTotal/NumParcelas) , IBTbPedidosTBPED_VENC01.AsDateTime );
//            if IBTbPedidosTBPED_VENC02.AsDateTime <> 0 then
//              GerarContaRec(idpedido, ValTotal, (ValTotal/NumParcelas) , IBTbPedidosTBPED_VENC02.AsDateTime);
//            if IBTbPedidosTBPED_VENC03.AsDateTime <> 0 then
//              GerarContaRec(idpedido, ValTotal, (ValTotal/NumParcelas) , IBTbPedidosTBPED_VENC03.AsDateTime);
//          end;
//        end
//        else
//          IBTbPedidosTBPED_BOLETO.AsString:='S';
//
//
//        IBTbPedidosTBPED_VALTOTAL.AsCurrency:=ValTotal;
//        IBTbPedidosID_USUARIO.AsInteger:=FrmPrincipal.IdUsuario;
//        IBTbPedidosTBPED_NUMPED.AsString:=NumPed;
//        IBTbPedidosTBPED_DATA.AsString :=FormatDateTime('DD/MM/YYYY',Now());
//        IBTbPedidos.Post;
//
//        CDSItensPedido.EmptyDataSet;
//        FrmPrincipal.IBTMain.Commit;
//        FrmPrincipal.IBDMain.CloseDataSets;
//        Application.CreateForm(TFrmImprePedidos, FrmImprePedidos);
//        FrmImprePedidos.IBQImpressaoPed.ParamByName('pIDPedido').AsInteger:=IdPedido;
//        FrmImprePedidos.IBQImpressaoPed.Open;
//        FrmImprePedidos.MontarCDs;
//        if bVisualizaImpressao Then
//          FrmImprePedidos.QuickRepEmpresa.Preview
//        else
//          FrmImprePedidos.QuickRepEmpresa.Print;
//        Close;
//      End;
//    Except
//      on E: EDatabaseError do
//      begin
//        FrmPrincipal.IBTMain.Rollback;
//        tFrmMensagens.Mensagem('Erro ao salvar pedido. : '+'PNGButton5Click ' ,'E',[mbOK], E.Message)
//      End;
//    end;
//
//  End;

end;

procedure TFrmNPedido.PngSBAdicionarItensClick(Sender: TObject);
var  Facade:TFacadeProducts;

begin
  inherited;
  Application.CreateForm(TFrmBuscarProdutos, FrmBuscarProdutos);
  FrmBuscarProdutos.Caption := 'Localizar produtos';
  FrmBuscarProdutos.ShowModal;
  If FrmBuscarProdutos.IdItem <> 0  Then
  begin
    CDSItensPedido.Insert;
    CDSItensPedidoID_PRODUTO.AsInteger      := TClientDataSet(Facade.returnDataSetById(
                                                 IntToStr(FrmBuscarProdutos.IdItem))).FieldByName('ID_PRODUTO').AsInteger;
    CDSItensPedidoNOME_PRODUTO.AsString     := TClientDataSet(Facade.returnDataSetById(
                                                 IntToStr(FrmBuscarProdutos.IdItem))).FieldByName('TBPRD_NOME').AsString;
    CDSItensPedidoTBITPED_VALUNI.AsCurrency := TClientDataSet(Facade.returnDataSetById(
                                                 IntToStr(FrmBuscarProdutos.IdItem))).FieldByName('TBPRD_PRECOVENDA').AsCurrency;
    CDSItensPedidoTBITPED_UNIDADE.AsString := TClientDataSet(Facade.returnDataSetById(
                                                 IntToStr(FrmBuscarProdutos.IdItem))).FieldByName('TBPRD_UNIDADE').AsString;
    CDSItensPedido.Post;




  End;
  FrmBuscarProdutos.Free;
end;

procedure TFrmNPedido.PngSdBCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNPedido.PNGBNovoProdClick(Sender: TObject);
var StrUnidade, StrQuant:String;
    Quantidade:Real;
    IsNumber:Boolean;
Begin
//  if QuantItens < 7 Then
//  Begin
//    IsNumber :=False;
//    FrmPrincipal.IdProduto  :=0;
//    Application.CreateForm(TFrmSelecionarProd, FrmSelecionarProd);
//    FrmSelecionarProd.Caption := 'Localizar produto';
//    FrmSelecionarProd.ShowModal;
//    Estoque:=TEstoque.Create;
//    Estoque.Id_produto := FrmSelecionarProd.IBQProdutos.FieldByName('ID_PRODUTO').AsInteger;
//    Estoque.Id_estoque := FrmSelecionarProd.IBQProdutos.FieldByName('ID_ESTOQUE').AsInteger;
//    Estoque.Nome       := FrmSelecionarProd.IBQProdutos.FieldByName('TBPRD_NOME').AsString;
//    Estoque.Tamanho    := FrmSelecionarProd.IBQProdutos.FieldByName('TBES_TAMANHO').AsString;
//    Estoque.Formato    := FrmSelecionarProd.IBQProdutos.FieldByName('TBES_FORMATO').AsString;
//    Estoque.Quantidade := FrmSelecionarProd.IBQProdutos.FieldByName('TBES_QUANTI').AsFloat;
//    Estoque.Unidade    := FrmSelecionarProd.IBQProdutos.FieldByName('TBPRD_UNIDADE').AsString;
//    If  Estoque.Id_produto <>0 then
//    begin
//      IBQProdutos.Close;
//      IBQProdutos.ParamByName('pIDPRODUTO').AsInteger:=FrmPrincipal.IdProduto;
//      IBQProdutos.Open;
//      try
//      Begin
//        Application.CreateForm(TFrmQuantidade, FrmQuantidade);
//        FrmQuantidade.ShowModal;
//        Quantidade := StrToFloat(FrmQuantidade.NumEdtQuant.Text);
//        FreeAndNil(FrmQuantidade);
//        If Quantidade > 0 Then
//        Begin
//          IsNumber :=True;
//          If AtualizaEstoque(Estoque, Quantidade, 'D') Then
//          Begin
//            QuantItens:=QuantItens+1;
//            CDSItensPedido.Append;
//            CDSItensPedidoTBITPED_QUANT.Value  := Quantidade;
//            CDSItensPedidoID_PEDIDO.AsInteger  :=IdPedido;
//            CDSItensPedidoNOME_PRODUTO.AsString:= IBQProdutos.FieldbyName('TBPRD_NOME').AsString;
//            CDSItensPedidoFORMATO.AsString     := Trim(Estoque.Formato);
//            CDSItensPedidoID_PRODUTO.AsInteger := FrmPrincipal.IdProduto;
//            CDSItensPedidoID_ESTOQUE.AsInteger := Estoque.Id_estoque;
//            If Estoque.Tamanho <> EmptyStr Then
//            Begin
//              CDSItensPedidoTAMANHO.AsString :=Estoque.Tamanho;
//              CDSItensPedidoTBITPED_UNIDADE.AsString:='UN';
//            End
//            Else
//              CDSItensPedidoTBITPED_UNIDADE.AsString:=IBQProdutos.FieldbyName('TBPRD_UNIDADE').AsString;
//
//
//            //Verificar se tem preço especial
//            IBSQLUTIL.Close;
//            IBSQLUTIL.SQL.Clear;
//            IBSQLUTIL.SQL.Add('SELECT * FROM TB_PRECOSCLI '+
//                               'WHERE ID_CLIENTE=:pIdCliente '+
//                               'AND ID_PRODUTO=:IdPoduto');
//            IBSQLUTIL.ParamByName('pIdCliente').AsInteger:=FrmPrincipal.IdCliente;
//            IBSQLUTIL.ParamByName('IdPoduto').AsInteger:=FrmPrincipal.IdProduto;
//            IBSQLUTIL.ExecQuery;
//            If Not IBSQLUTIL.Eof Then
//              CDSItensPedidoTBITPED_VALUNI.AsCurrency :=IBSQLUTIL.FieldByName('TBPRECLI_PRECO').AsCurrency
//            Else
//              CDSItensPedidoTBITPED_VALUNI.AsCurrency    :=  IBQProdutos.FieldbyName('TBPRD_PRECOVENDA').AsCurrency   ;
//            CDSItensPedidoTBITPED_VALTOT.AsCurrency      :=  CDSItensPedidoTBITPED_VALUNI.AsCurrency * Quantidade;
//          End;
//        End;
//      End;
//      except
//        on E: EDatabaseError do
//        begin
//          tFrmMensagens.Mensagem('Erro ao adicionar produto ' +'PNGBNovoProdClick ','E',[mbOK],  E.message);
//          FrmPrincipal.IBTMain.Rollback;
//        end;
//        on E: EConvertError do
//        Begin
//         (tFrmMensagens.Mensagem('Favor digitar apenas números','I',[mbOK]));
//        End;
//      end;
//
//    End;
//    FrmSelecionarProd.Free;
//    Estoque.Free;
//  end
//  Else
//     (tFrmMensagens.Mensagem('Quantidade máxima de itens por pedido não pode ser superior a 7 (sete)','E',[mbOK]));

  atualizarTotal;
//  PNGBRemoverProd.Enabled :=True;
//  PNGBAtualizar.Enabled   := True;

end;



Function TFrmNPedido.AtualizaEstoque(pEstoque:TObject; Quantidade:Real; Operacao:String):Boolean;
var lEstoque: TEstoque;
    sMensagem:string;
begin
  Result:=False;
//  lEstoque:= TEstoque.Create;
//  lEstoque:=(pEstoque as TEstoque)  ;
//  //Se não for cadarço atualizar estoque
//  if Copy(lEstoque.Nome, 0,5)<>'CADAR' then
//  begin
//    try
//      If Operacao ='D' Then
//      Begin
//        If Quantidade <= Estoque.Quantidade    Then
//        Begin
//          IBSQLUTIL.Close;
//          IBSQLUTIL.SQL.Clear;
//          IBSQLUTIL.Sql.Add('UPDATE TB_ESTOQUE ' +
//                            ' SET ' +
//                            ' TBES_QUANTI =TBES_QUANTI - :pQuantidade ' +
//                            'WHERE ID_PRODUTO=:pIdProduto ' +
//                            ' AND ID_ESTOQUE= :pIdEstoque ');
//          IBSQLUTIL.ParamByName('pIdProduto').AsInteger := lEstoque.Id_produto  ;
//          IBSQLUTIL.ParamByName('pIdEstoque').AsInteger :=lEstoque.Id_estoque ;
//          IBSQLUTIL.ParamByName('pQuantidade').Value := Quantidade;
//          IBSQLUTIL.ExecQuery;
//          Result:=True;
//        End
//        Else
//        Begin
//          If Quantidade > Estoque.Quantidade  Then
//          begin
//           // Se produto for elástico então Result True
//
//            IBQUtil.Close;
//            IBQUtil.SQL.Clear;
//            IBQUtil.Sql.Add('SELECT TBPRD_NOME '+
//                            ' FROM TB_PRODUTOS '+
//                            ' WHERE ID_PRODUTO='+IntToStr(Estoque.Id_produto));
//            IBQUtil.Open;
//            sMensagem:= 'A quantidade informada é maior do que o estoque '+
//                       'atual deste produto, o estoque ficará negativo.' +
//                       'Deseja continuar?' ;
//            if  tFrmMensagens.Mensagem(sMensagem,'Q',[mbSIM, mbNAO]) Then
//            Begin
//              IBSQLUTIL.Close;
//              IBSQLUTIL.SQL.Clear;
//              IBSQLUTIL.Sql.Add('UPDATE TB_ESTOQUE ' +
//                                ' SET ' +
//                                ' TBES_QUANTI = :pQuantidade ' +
//                                ' WHERE ID_PRODUTO=:pIdProduto ' +
//                                ' AND ID_ESTOQUE= :pIdEstoque ');
//              IBSQLUTIL.ParamByName('pIdProduto').AsInteger := lEstoque.Id_produto  ;
//              IBSQLUTIL.ParamByName('pIdEstoque').AsInteger :=lEstoque.Id_estoque ;
//              IBSQLUTIL.ParamByName('pQuantidade').Value := Estoque.Quantidade - Quantidade;
//              IBSQLUTIL.ExecQuery;
//              Result:=True;
//            end;
//
//
//          end;
//
//        End;
//      end;
//      If Operacao ='S' Then
//      Begin
//        IBSQLUTIL.Close;
//        IBSQLUTIL.SQL.Clear;
//        IBSQLUTIL.Sql.Add('UPDATE TB_ESTOQUE ' +
//                          ' SET ' +
//                          ' TBES_QUANTI = TBES_QUANTI + :pQuantidade ' +
//                          'WHERE ID_ESTOQUE=:pIdEstoque ' );
//        IBSQLUTIL.ParamByName('pIdEstoque').AsInteger :=lEstoque.Id_estoque;
//        IBSQLUTIL.ParamByName('pQuantidade').Value := lEstoque.Quantidade ;
//        IBSQLUTIL.ExecQuery;
//        Result:=True;
//      End;
//    except
//      on E: EDatabaseError do
//      begin
//        tFrmMensagens.Mensagem('Erro ao atualizar estoque ' +'AtualizaEstoque ','E',[mbOK], E.message);
//           FrmPrincipal.IBTMain.Rollback;
//      end;
//      on E: EConvertError do
//      Begin
//        (tFrmMensagens.Mensagem('Favor digitar apenas números','I',[mbOK]));
//      End;
//    end;
//  end
//  else
//    Result:=True;
//
//


end;

procedure TFrmNPedido.FormShow(Sender: TObject);
var Parametro:TParametros;
begin
//  try
//    if not FrmPrincipal.IBTMain.Active Then
//      FrmPrincipal.IBTMain.StartTransaction;
//    If  not  FrmNPedido.IBTbPedidos.Active then
//      IBTbPedidos.Open;
//    IBTbPedidos.Append;
    CDSItensPedido.Close;
    CDSItensPedido.CreateDataSet;
    CDSItensPedido.Open;
//    QuantItens :=0;
//    IBQPrazos.Open;
//    IBSQLUTIL.Close;
//    IBSQLUTIL.SQL.Clear;
//    IBSQLUTIL.SQL.Add('SELECT MAX(ID_PEDIDO) FROM TB_PEDIDOS');
//    IBSQLUTIL.ExecQuery;
//    IdPedido:= IBSQLUTIL.FieldByName('MAX').AsInteger+1;
//    DSPrazos.DataSet.First;
//
//    bVisualizaImpressao:=Parametro.returnValParametro('SN_VIS_IMPRESSAO_PED') ='S';
//    bGerarContaRec     :=Parametro.returnValParametro('SN_GERACONTASREC')     ='S';
//                                                         -
//  except
//    on E: EDatabaseError do
//       tFrmMensagens.Mensagem('Erro ao inicializer pedido.: "FormShow"' ,'E',[mbOK], E.Message);
//  end;
end;
//
function TFrmNPedido.NumPed: String;
Var StrNumPed:String;
    Tamanho:Integer;
    NumPed:Integer;
Const ZEROS ='00000';
begin
////
//  IBSQLUTIL.Close;
//  IBSQLUTIL.Sql.Clear;
//  IBSQLUTIL.Sql.Add('SELECT NUMPED FROM TB_NUMPED');
//  IBSQLUTIL.ExecQuery;
//  NumPed:=  IBSQLUTIL.FieldByName('NUMPED').AsInteger;
//  StrNumPed := IBSQLUTIL.FieldByName('NUMPED').AsString;
//  Tamanho:= Length (StrNumPed);
//  StrNumPed:= 'DO' +Copy (ZEROS, Tamanho, Length(ZEROS))+StrNumPed;
//  IBSQLUTIL.Close;
//  IBSQLUTIL.Sql.Clear;
//  IBSQLUTIL.Sql.Add('UPDATE TB_NUMPED '+
//                    ' SET NUMPED='+IntTosTr(NumPed+1) +
//                    ' WHERE NUMPED=:pNumero');
//  IBSQLUTIL.ParamByName('pNumero').AsString:=IntToStr(NumPed);
//  IBSQLUTIL.ExecQuery;
  Result:=StrNumPed;

end;

procedure TFrmNPedido.PNGBRemoverProdClick(Sender: TObject);
var lEstoque: TEstoque;
begin
//  If Not CDSItensPedido.IsEmpty Then
//  Begin
//
//    if (tFrmMensagens.Mensagem('Deleja deletar este produto?','Q',[mbSim, mbNao])) then
//    Begin
//      Try
//
//        lEstoque := TEstoque.Create;
//        lEstoque.Id_estoque:=CDSItensPedidoID_ESTOQUE.AsInteger;
//        lEstoque.Quantidade:=CDSItensPedidoTBITPED_QUANT.Value;
//
//        AtualizaEstoque(lEstoque ,lEstoque.Quantidade ,'S');
//        CDSItensPedido.Delete;
//        QuantItens:=QuantItens-1;
//
//
//       atualizarTotal;
//      finally
//        lEstoque.Free;
//        if QuantItens <= 0 then
//        begin
//           PNGBRemoverProd.Enabled := False;
//           PNGBAtualizar.Enabled   := False;
//        end;
//       End;
//    End;
//  End;
end;

procedure TFrmNPedido.DBEditCliExit(Sender: TObject);
begin


//  If DBEditCli.Text <> EmptyStr then
//  Begin
//
//
//       CalculaPrazos;
//    End
//    Else
//    Begin
//      IBTbPedidosID_CLIENTE.AsInteger := 0 ;
//      IBTbPedidosTBPED_ENDERECO.AsString :='' ;
//      IBTbPedidosTBPED_CIDADE.AsString :=''  ;
//      IBTbPedidosTBPED_ESTADO.AsString:='';
//      IBTbPedidosTBPED_VENC01.AsString:='';
//      IBTbPedidosTBPED_VENC02.AsString:='';
//      IBTbPedidosTBPED_VENC03.AsString:='';
//    End;
//
//    if (Pos(' ',DBEditCli.Text) =0) Or (Pos(' ', DBEditCli.Text) = Length(DBEditCli.Text))   then
//    begin
//      tFrmMensagens.Mensagem('Preencher com ao menos nome e sobrenome','E',[mbOK]);
//      TDBEdit(Sender).SetFocus;
//    end;
//  end
//  else
 //   LimparDBEdits;
end;

procedure TFrmNPedido.FieldComboBoxPrazoCloseUp(Sender: TObject);
begin
   CalculaPrazos(TComboboxItem(FieldComboBoxPrazo.Items.Objects[FieldComboBoxPrazo.Items.IndexOf(FieldComboBoxPrazo.Text)]));
end;

procedure TFrmNPedido.FieldEditClienteExit(Sender: TObject);
var FacadeCli:TFacadeClientes;
    FacadePrazo:TFacadePrazos;
begin
  if FieldEditCliente.Text<> EmptyStr then
  begin
    dsCDSCliente:=TClientDataSet(FacadeCli.retornaDadosCliente(FieldEditCliente.Text));
    if not dsCDSCliente.IsEmpty then
    begin
      FieldEditCliente.Text        :=dsCDSCliente.FieldByName('TBCLI_NOME').AsString;
      FieldEditEndereco.Text       :=dsCDSCliente.FieldByName('TBCLI_ENDERECO').AsString;
      FieldEditCEP.Text            :=dsCDSCliente.FieldByName('CEP').AsString;
      FieldEditBairro.Text         :=dsCDSCliente.FieldByName('TBCLI_BAIRRO').AsString;
      FieldEditCidade.Text         :=dsCDSCliente.FieldByName('TBCLI_CIDADE').AsString;
      FieldEditUF.Text             :=dsCDSCliente.FieldByName('TBCLI_ESTADO').AsString;
      FieldComboBoxPrazo.ItemIndex :=
                                   FieldComboBoxPrazo.Items.IndexOf(FacadePrazo.resultPrazoName(
                                   dsCDSCliente.FieldByName('ID_PRAZO').AsInteger));

     if  FieldComboBoxPrazo.ItemIndex>-1 then
      CalculaPrazos(TComboboxItem(FieldComboBoxPrazo.Items.Objects
                   [FieldComboBoxPrazo.Items.IndexOf(FieldComboBoxPrazo.Text)]));

    end;
  end;
end;

procedure TFrmNPedido.FormCreate(Sender: TObject);
begin
  carregarComboboxPrazos;
end;

procedure TFrmNPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else if (ActiveControl is TDBGrid) then
      with TDBGrid(ActiveControl) do
        if selectedindex < (fieldcount -1) then
          selectedindex := selectedindex +1
        else
          selectedindex := 0;
end;

procedure TFrmNPedido.DBEdit1Exit(Sender: TObject);
var Endereco:TEndereco;
begin
//  if DBEdit1.Text <> EmptyStr Then
//  Begin
//    Endereco:=TEndereco.Create;
//    Endereco:=FrmPrincipal.RetornaEndereco(DBEdit1.Text);
//    If Endereco.Rua <>EmptyStr  Then
//      IBTbPedidosTBPED_ENDERECO.AsString := AnsiUpperCase(Endereco.Rua);
//    If Endereco.Bairro  <>EmptyStr  Then
//       IBTbPedidosTBPED_BAIRRO.AsString  :=AnsiUpperCase(Endereco.Bairro);
//    If Endereco.Cidade  <>EmptyStr  Then
//      IBTbPedidosTBPED_CIDADE.AsString   :=AnsiUpperCase( Endereco.Cidade) ;
//    If Endereco.Estado  <>EmptyStr  Then
//      IBTbPedidosTBPED_ESTADO.AsString   :=AnsiUpperCase( Endereco.Estado) ;
//   End;

end;

procedure TFrmNPedido.CDSItensPedidoTBITPED_VALUNIChange(Sender: TField);
begin
  try
    CDSItensPedidoTBITPED_VALTOT.AsCurrency :=CDSItensPedidoTBITPED_VALUNI.AsCurrency*CDSItensPedidoTBITPED_QUANT.Value ;
   
  except
    on  E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao ajustar valor unitário.: CDSItensPedidoTBITPED_VALUNIChange ' ,'E',[mbOK], E.Message);

    end;
  end
end;

procedure TFrmNPedido.CalculaPrazos(Item: TComboboxItem);
begin
  fldtPrazo.Clear;
  fldtPrazo1.Clear;
  fldtPrazo2.Clear;
  fldtPrazo3.Clear;
  if Item.Prazo1 > 0  then
    fldtPrazo.Text:=DateToStr(now()+ Item.Prazo1);
  if Item.Prazo2 >0 then
    fldtPrazo1.Text:=DateToStr(now()+ Item.Prazo2);
  if Item.Prazo3>0 then
    fldtPrazo2.Text:=DateToStr(now()+ Item.Prazo3);
  if Item.Prazo4>0 then
    fldtPrazo3.Text:=DateToStr(now()+ Item.Prazo4);
end;

procedure TFrmNPedido.carregarComboboxPrazos;
var Facade:TFacadePrazos;
    DsPrazos:TDataSet;
    ItemCombobox:TComboboxItem;
begin
  FieldComboBoxPrazo.Clear;
  DsPrazos:=Facade.returnDataSetAllPrazos;
  if not DsPrazos.IsEmpty then
  begin
    while not DsPrazos.Eof do
    begin
      ItemCombobox:= TComboboxItem.Create(DsPrazos.FieldByName('ID_PRAZO').AsInteger,
                                          DsPrazos.FieldByName('TBPRZ_PRAZO01').AsInteger,
                                          DsPrazos.FieldByName('TBPRZ_PRAZO02').AsInteger,
                                          DsPrazos.FieldByName('TBPRZ_PRAZO03').AsInteger,
                                          DsPrazos.FieldByName('TBPRZ_PRAZO04').AsInteger,
                                          DsPrazos.FieldByName('TBPRZ_NOME').AsString);

      FieldComboBoxPrazo.Items.AddObject(ItemCombobox.Nome, ItemCombobox);
      DsPrazos.Next;
    end;

  end;
end;

procedure TFrmNPedido.CDSItensPedidoTBITPED_QUANTChange(Sender: TField);
begin

   CDSItensPedidoTBITPED_VALTOT.AsCurrency :=CDSItensPedidoTBITPED_VALUNI.AsCurrency*CDSItensPedidoTBITPED_QUANT.Value ;
end;

procedure TFrmNPedido.atualizarTotal;
Var ValTotal: Currency;
    StrTotal:String;
  
begin
  ValTotal:=0;

  CDSItensPedido.DisableControls;
  CDSItensPedido.First;
  while not CDSItensPedido.Eof do
  begin
    ValTotal:=ValTotal + CDSItensPedidoTBITPED_VALTOT.AsCurrency;
    CDSItensPedido.Next;
  end;
  CDSItensPedido.Last;
  CDSItensPedido.EnableControls;

  EdtValorTotal.Text :='R$ ' + FormatFloat('#,,0.00',ValTotal);


end;

procedure TFrmNPedido.CDSItensPedidoAfterEdit(DataSet: TDataSet);
begin
  AtualizarTotal;
end;

procedure TFrmNPedido.PNGBAtualizarClick(Sender: TObject);
begin
  AtualizarTotal;
end;



procedure TFrmNPedido.DBLookupComboBox1CloseUp(Sender: TObject);
begin

//  if DBLookupComboBox1.KeyValue<> Null Then
//  begin
//    IBTbPedidosID_PRAZO.AsInteger := DBLookupComboBox1.KeyValue;
//    If  DBLookupComboBox1.Text <> 'À VISTA' Then
//      CalculaPrazos;
//  end;
end;

procedure TFrmNPedido.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  Case Key of
////   113: PNGButton1Click(Self);  //Localizar  Cliente   F2
////   114: PNGButton4Click(Self);  //Cancelar ou Voltar   F3
////   115: PNGBNovoProdClick(Self); //Adicionar produto   F4
////   116: if PNGBRemoverProd.Enabled then  //Remover produto  F5
////           PNGBRemoverProdClick(Self);
////   117: PNGButton5Click(Self);    //Salvar    F6
////   118: PNGBAtualizarClick(Self); // Atualizar valores F7
// end;
end;

procedure TFrmNPedido.LimparDBEdits;
Var CompNo: Integer;
begin
  for CompNo:=0 to FrmNPedido.ComponentCount-1 do
  begin
    if FrmNPedido.Components[CompNo] is TDBEdit then
       (FrmNPedido.Components[CompNo] as TDBEdit).Clear;

  end;

end;

End.
