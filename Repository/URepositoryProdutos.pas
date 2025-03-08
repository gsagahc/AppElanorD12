unit URepositoryProdutos;

Interface
 Uses
   URepository, IBX.IBQuery,DB, System.Classes,System.SysUtils ;

Type
{ Repository }
  TRepositoryProdutos = class(TRepository)
    private
    public
   function returnDataSetById(Id:String):TDataSet;
   procedure deleteProductById(Id,StrSql:String);
   procedure insertProducts(sTrSql:String);
   function generateCodProduct:String;
   function checkProductSameName(sName:String):Boolean;
   function checkIfProductHasBeenUsed(Id:String):Boolean;

  End;

implementation
Uses uMensagens;



{ TRepositoryProdutos }


{ TRepositoryProdutos }

function TRepositoryProdutos.checkIfProductHasBeenUsed(Id: String): Boolean;
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult.Close;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT ID_PRODUTO FROM TB_ITENSPEDIDO '+
                           'WHERE ID_PRODUTO=:pId_produto');


    IBQueryResult.ParamByName('pId_produto').AsString :=id;
    IBQueryResult.Open;
    If Not IBQueryResult.IsEmpty then
      Result:=True
    else
      Result:=False;
     except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta. unit:URepositoryProdutos, Metodo:checkIfProductHasBeenUsed','E',[mbOK], E.Message);

    end;

  end;

end;

function TRepositoryProdutos.checkProductSameName(sName:String): Boolean;
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT TBPRD_NOME '+
                             'FROM TB_PRODUTOS '+
                           'WHERE TBPRD_NOME=:pNome');
    IBQueryResult.ParamByName('pNome').AsString:=sName;
    IBQueryResult.Open;
    if not IBQueryResult.IsEmpty then
      Result:=True
    else
      Result:=False;

   except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta. unit:URepositoryProdutos, Metodo:checkProductSameName','E',[mbOK], E.Message);

    end;
  end;
end;

procedure TRepositoryProdutos.deleteProductById(Id,StrSql: String);
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add(StrSql+Id);
    Self.Database.DefaultTransaction.StartTransaction;
    IBQueryResult.ExecSQL;
    Self.Database.DefaultTransaction.Commit;
    Self.Database.CloseDataSets;
   except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao deletar item. unit:URepositoryProdutos, Metodo:deleteProductById','E',[mbOK], E.Message);

    end;
  end;
end;

function TRepositoryProdutos.generateCodProduct: String;
var IBQueryResult:TIBQuery;
    Cont:String;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT ID_PRODUTO FROM VIEW_IDPRODUTO');
    IBQueryResult.Open;
    Cont:=IntToStr(IBQueryResult.FieldByName('ID_PRODUTO').AsInteger+1);
    If Length (Cont)=1 Then
      Cont:='000' + Cont;
    If Length (Cont)=2 Then
      Cont:='00' + Cont;
    If Length (Cont)=3 Then
      Cont:='0' + Cont;

    Result:=Cont;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao tentar gerar novo código de produto. unit:URepositoryProdutos, Metodo:generateCodProduct','E',[mbOK], E.Message);

    end;
   end;
end;


procedure TRepositoryProdutos.insertProducts(sTrSql: string);
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add(sTrSql);
    Self.Database.DefaultTransaction.StartTransaction;
    IBQueryResult.ExecSQL;
    Self.Database.DefaultTransaction.Commit;
    Self.Database.CloseDataSets;

  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao tentar inserir produto. unit:URepositoryProdutos, Metodo:insertProducts','E',[mbOK], E.Message);

    end;
  end;
end;

function TRepositoryProdutos.returnDataSetById(Id: String): TDataSet;
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT * FROM TB_PRODUTOS WHERE ID_PRODUTO='''+Id+'''' );
    IBQueryResult.Open;

    Result:=IBQueryResult;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta.unit:URepositoryProdutos, Metodo:returnDataSetById','E',[mbOK], E.Message);

    end;
  end;
end;

end.

