unit URepositoryConfiguracoes;

Interface
 Uses
   URepository, IBX.IBQuery, System.Classes, DB;

Type
{ Repository }
  TRepositoryConfiguracoes = class(TRepository)
    private
    public
       function ConsultarTextoStatusBar:TStringList;

  end;

implementation
Uses uMensagens;
{ TRepositoryClientes }



{ TRepositoryConfiguracoes }

function TRepositoryConfiguracoes.ConsultarTextoStatusBar: TStringList;
var IBQueryResult:TIBQuery;
    slResult:TStringList;
begin
  try
    IBQueryResult:=TIBQuery.Create(nil);
    IBQueryResult.BufferChunks:=10000;
    IBQueryResult.FetchAll;
    IBQueryResult.Database:=Self.Database;
    IBQueryResult.SQL.Clear;
    IBQueryResult.SQL.Add('SELECT * FROM TB_BASE');
    IBQueryResult.Open;
    if not IBQueryResult.IsEmpty then
    begin
      slResult:=TStringList.Create;
      slResult.Add(IBQueryResult.FieldByName('NOME').AsString);
       if (Copy(Self.Database.Name ,1,12) = 'C:\AppElanor')  Then
          slResult.Add('(LOCAL)')
       else
          slResult.Add('(REMOTO)');
    end;

    Result:=slResult;
  except
    on E: EDatabaseError do
    begin
      tFrmMensagens.Mensagem('Erro ao realizar consulta.','E',[mbOK], E.Message);

    end;
  end;

end;

end.
