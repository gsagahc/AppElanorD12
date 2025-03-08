unit UCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCadPadrao, Data.DB, NumEdit, IdEdit,
  Vcl.StdCtrls, FieldEdit, Vcl.Buttons, PngSpeedButton, Vcl.ExtCtrls;

type
  TFrmCadProdutos = class(TFrmCadPadrao)
    procedure PngSdBSalvarClick(Sender: TObject);
    procedure PngSdBNovoClick(Sender: TObject);
    procedure PngSdBLocalizarClick(Sender: TObject);
    procedure PngSdBDeletarClick(Sender: TObject);
  private
   function gerarCod:String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProdutos: TFrmCadProdutos;

implementation
Uses uFacadeProducts,UBuscarProdutos, uMensagens, UBuscarPadrao;
{$R *.dfm}

function TFrmCadProdutos.gerarCod: String;
var Facade:TFacadeProducts;
begin
 inherited;
  Result:=Facade.generateCodProduct;

end;

procedure TFrmCadProdutos.PngSdBDeletarClick(Sender: TObject);

var StrSql:string;
    Facade:TFacadeProducts;
begin
  if (tFrmMensagens.Mensagem('Deleja deletar o produto exibido?','Q',[mbSim, mbNao])) then
  begin
    if Facade.checkIfProductHasBeenUsed(Id.Id) then
       tFrmMensagens.Mensagem('Existem pedidos relacionados a este produto, ele não pode ser deletado?','I',[mbOK])
    else
    begin
      StrSql:=generateDeleteSQlFields;
      Facade.deleteProductById(Id.Id, StrSql);
      clearFields;
    End;
    StatusBotoes;
  end;
end;

procedure TFrmCadProdutos.PngSdBLocalizarClick(Sender: TObject);
var  Facade:TFacadeProducts;
begin
  inherited;
  Application.CreateForm(TFrmBuscarProdutos, FrmBuscarProdutos);
  FrmBuscarProdutos.Caption := 'Localizar produto';
  FrmBuscarProdutos.ShowModal;
  If FrmBuscarProdutos.IdItem <> 0  Then
  begin
    DSProdutos.DataSet:=Facade.returnDataSetById(IntToStr(FrmBuscarProdutos.IdItem));
    getFieldData(DSProdutos.DataSet);
    StatusBotoes;

  End;
  FrmBuscarProdutos.Free;
end;

procedure TFrmCadProdutos.PngSdBNovoClick(Sender: TObject);
begin
  inherited;
  FieldEdit1.Text:=gerarCod;
end;

procedure TFrmCadProdutos.PngSdBSalvarClick(Sender: TObject);
Var  Facade:TFacadeProducts;
     strSql:String;
begin

  if Status='I' then
  begin
    strSql:=generateInsertSQlFields;
    Facade.insertProducts(strSql);
  end;
  if Status='A' then
  begin
    strSql:=generateUpdateSQlFields;
    Facade.updateProductByID(StrSql);
  end;
 inherited;


end;

end.
