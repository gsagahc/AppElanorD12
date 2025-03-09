unit UFacadeProducts;

interface
Uses DB, System.Classes, UControllerProducts, UFacade;
type
  { Façade }
  TFacadeProducts = class(TFacade)
  private
  public
   function ReturnDataSetProductsWithLike(sTable,sField,sText:string):TDataSet;
   function returnDataSetById(Id: String): TDataSet;
   procedure deleteProductById(Id,StrSql:String);
   procedure insertProducts(sTrSql:String);
   function generateCodProduct:String;
   function checkProductSameName(sName:String):Boolean;
   function checkIfProductHasBeenUsed(Id:String):Boolean;
   procedure updateProductByID(StrUpdate:String);
 end;
implementation
  { TFacadeProducts }

function TFacadeProducts.checkIfProductHasBeenUsed(Id: String): Boolean;
var Controller:TControllerProducts;
begin
  Controller:=TControllerProducts.Create;
  Result:=Controller.checkIfProductHasBeenUsed(Id);
  Controller.Destroy;
end;

function TFacadeProducts.checkProductSameName(sName: String): Boolean;
var Controller:TControllerProducts;
begin
  Controller:=TControllerProducts.Create;
  Result:=Controller.checkProductSameName(sName);
  Controller.Destroy;

end;

procedure TFacadeProducts.deleteProductById(Id, StrSql: String);
var Controller:TControllerProducts;
begin
  Controller:=TControllerProducts.Create;
  Controller.deleteProductById(Id, StrSql);
  Controller.Destroy;
end;

function TFacadeProducts.generateCodProduct: String;
var Controller:TControllerProducts;
begin
  Controller:=TControllerProducts.Create;
  Result:=Controller.generateCodProduct;
  Controller.Destroy;

end;

procedure TFacadeProducts.insertProducts(sTrSql: String);
var Controller:TControllerProducts;
begin
  Controller:=TControllerProducts.Create;
  Controller.insertProducts(StrSql);
  Controller.Destroy;
end;

function TFacadeProducts.returnDataSetById(Id: String): TDataSet;
var Controller:TControllerProducts;
begin
  Controller:=TControllerProducts.Create;
  Result:=Controller.returnDataSetById(Id);
  Controller.Destroy;

end;

function TFacadeProducts.ReturnDataSetProductsWithLike(sTable, sField,
  sText: string): TDataSet;
var Controller:TControllerProducts;
begin
  Controller:=TControllerProducts.Create;
  Result:=Controller.ReturnDataSetProductsWithLike(sTable,sField,sText);
  Controller.Destroy;
end;



procedure TFacadeProducts.updateProductByID(StrUpdate: String);
var Controller:TControllerProducts;
begin
  Controller:=TControllerProducts.Create;
  Controller.updateProductByID(StrUpdate);
  Controller.Destroy;

end;

end.







end.
