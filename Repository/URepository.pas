unit  URepository;

interface
 Uses
   IBX.IBQuery,  DB, DBClient,  IBX.IBDatabase, UConnectDataBase, UTextFile, System.SysUtils;
Type
{ Repository }
  TRepository = class
  private
   textFile:TTextFile;
  public
    Database:TIBDatabase;
    Conexao:TConnectDataBase;
    constructor  create;
     function ReturnDataSetWithLike(sTable,sField,sText:string):TDataSet;
     function LookupResult(Id,LookupTable,LookupField,ResultField:string):string;
  end;

implementation
Uses uMensagens;
{ TRepository }

constructor TRepository.create;
Var Conexao :TConnectDataBase;
    sCaminho:string;

begin

   sCaminho:=TTextFile.caminhoDaAplicacao;
   conexao:=TConnectDataBase.Create;
   Conexao.ConnectDataBase(sCaminho);
   Database:=Conexao.DbMain;

end;

function TRepository.LookupResult(Id, LookupTable, LookupField,
  ResultField: string): string;
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT '+ResultField+'FROM '+LookupTable+ ' WHERE '+LookupField+'=:pId' );
    IBQueryResult.ParamByName('pId').AsString:=Id;
    IBQueryResult.Open;

    Result:=IBQueryResult.FieldByName(ResultField).AsString;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta.','E',[mbOK], E.Message);

    end;
  end;
end;

function TRepository.ReturnDataSetWithLike(sTable,sField,sText: string): TDataSet;
var IBQueryResult:TIBQuery;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    if sText<> EmptyStr then
      IBQueryResult.SQL.Add('SELECT * FROM '+sTable+ ' WHERE '+sField+' '+sText )
    else
      IBQueryResult.SQL.Add('SELECT * FROM '+sTable);
    IBQueryResult.Open;

    Result:=IBQueryResult;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta.','E',[mbOK], E.Message);

    end;
  end;

end;

end.
