unit uRepositoryPrazos;

Interface
 Uses
   URepository, IBX.IBQuery,DB, System.Classes,System.SysUtils ;

Type
{ Repository }
  TRepositoryPrazos = class(TRepository)
   private
   public
   function returnDataSetById(Id:String):TDataSet;
   procedure deletePrazoById(Id,StrSql:String);
   procedure insertPrazo(sTrSql:String);
   function checkPrazoSameName(sName:String):Boolean;
   function checkIfPrazoHasBeenUsed(Id:String):Boolean;
   procedure updatePrazo(strSql:String);
   function returnDataSetAllPrazos:TDataSet;
   function resultPrazoName(Id:Integer):string;
   function ReturnDataSetPrazosWithLike(sTable,sField,sText:string):TDataSet;
   function calculaPrazos(idPrazo:Integer):TDataSet;

  End;
implementation
Uses UMensagens;

{ TRepositoryPrazos }

function TRepositoryPrazos.calculaPrazos(idPrazo: Integer): TDataSet;
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT  TBPRZ_PRAZO01,'+
                                  'TBPRZ_PRAZO02, '+
                                  'TBPRZ_PRAZO03, '+
                                  'TBPRZ_PRAZO04,  '+
                                  'TBPRZ_NOME  '+
                          ' FROM TB_PRAZOS' );
    IBQueryResult.Open;

    Result:=IBQueryResult;
  except

    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta.unit:URepositoryPrazos, Metodo:calculaPrazos','E',[mbOK], E.Message);

    end;
  end;

end;


function TRepositoryPrazos.checkIfPrazoHasBeenUsed(Id: String): Boolean;
begin

end;

function TRepositoryPrazos.checkPrazoSameName(sName: String): Boolean;
begin

end;

procedure TRepositoryPrazos.deletePrazoById(Id, StrSql: String);
begin

end;

procedure TRepositoryPrazos.insertPrazo(sTrSql: String);
begin

end;

function TRepositoryPrazos.resultPrazoName(Id:Integer): string;
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT TBPRZ_NOME FROM TB_PRAZOS WHERE ID_PRAZO=:pId_prazo' );
    IBQueryResult.ParamByName('pId_prazo').AsInteger:=id;
    IBQueryResult.Open;

    Result:=IBQueryResult.FieldByName('TBPRZ_NOME').AsString;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta.unit:URepositoryPrazos, Metodo:resultPrazoName','E',[mbOK], E.Message);

    end;
  end;

end;

function TRepositoryPrazos.returnDataSetAllPrazos: TDataSet;
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT * FROM TB_PRAZOS ORDER BY ID_PRAZO' );
    IBQueryResult.Open;

    Result:=IBQueryResult;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta.unit:URepositoryPrazos, Metodo:returnDataSetAllPrazos','E',[mbOK], E.Message);

    end;
  end;
end;

function TRepositoryPrazos.returnDataSetById(Id: String): TDataSet;
begin

end;

function TRepositoryPrazos.ReturnDataSetPrazosWithLike(sTable, sField,
  sText: string): TDataSet;
begin
  Result:=Self.returnDataSetWithLike(sTable, sField,   sText);
end;


procedure TRepositoryPrazos.updatePrazo(strSql: String);
begin

end;

end.
