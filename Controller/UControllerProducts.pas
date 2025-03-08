unit UControllerProducts;

interface
Uses   DB, System.Classes;
Type
{ Controller }
  TControllerProducts = class
  private
  public
   function ReturnDataSetProductsWithLike(sTable,sField,sText:string):TDataSet;
   function returnDataSetById(Id: String): TDataSet;
   procedure deleteProductById(Id,StrSql:String);
   procedure insertProducts(sTrSql:String);
   function generateCodProduct:String;
   function checkProductSameName(sName:String):Boolean;
   function checkIfProductHasBeenUsed(Id:String):Boolean;
   procedure updateProduct(strSql:String);
 end;

implementation
Uses  URepositoryProdutos;






{ TControllerProducts }

function TControllerProducts.checkIfProductHasBeenUsed(Id: String): Boolean;
var Repository:TRepositoryProdutos;
begin
   Repository:=TRepositoryProdutos.Create;
   Result:= Repository.checkIfProductHasBeenUsed(Id);
   Repository.Destroy;
end;

function TControllerProducts.checkProductSameName(sName: String): Boolean;
var Repository:TRepositoryProdutos;
begin
   Repository:=TRepositoryProdutos.Create;
   Result:= Repository.checkProductSameName(sName);
   Repository.Destroy;
end;

procedure TControllerProducts.deleteProductById(Id, StrSql: String);
var Repository:TRepositoryProdutos;
begin
   Repository:=TRepositoryProdutos.Create;
   Repository.deleteProductById(Id,StrSql);
   Repository.Destroy;
end;

function TControllerProducts.generateCodProduct: String;
var Repository:TRepositoryProdutos;
begin
   Repository:=TRepositoryProdutos.Create;
   Result:= Repository.generateCodProduct;
   Repository.Destroy;
end;

procedure TControllerProducts.insertProducts(sTrSql: String);
var Repository:TRepositoryProdutos;
begin
   Repository:=TRepositoryProdutos.Create;
   Repository.insertProducts(StrSql);
   Repository.Destroy;
end;

function TControllerProducts.returnDataSetById(Id: String): TDataSet;
var Repository:TRepositoryProdutos;
begin
   Repository:=TRepositoryProdutos.Create;
   Result:=Repository.returnDataSetById(Id);
   Repository.Destroy;
end;

function TControllerProducts.ReturnDataSetProductsWithLike(sTable, sField,
  sText: string): TDataSet;
var Repository:TRepositoryProdutos;
begin
   Repository:=TRepositoryProdutos.Create;
   Result:=Repository.ReturnDataSetWithLike(sTable,sField,sText);

end;

procedure TControllerProducts.updateProduct(strSql: String);
var Repository:TRepositoryProdutos;
begin
//   Repository:=TRepositoryProdutos.Create;
//   Repository.updateProduct(StrSql);
//   Repository.Destroy;

end;

end.
