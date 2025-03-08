unit UConnectDataBase;

interface
 Uses Forms,IBX.IBStoredProc, IBX.IBCustomDataSet, IBX.IBQuery,
      IBX.IBSQL, IBX.IBDatabase, DB, DBClient,  Classes;
Type
 TConnectDataBase = class
  public
    DbMain:TIBDatabase;
    DefaultTRansaction:TIBTransaction;

    procedure ConnectDataBase(sCaminho:string);
    procedure StartTrasaction;
  end;

implementation
 Uses UTextFile, uMensagens;
{ TConnectDataBase }

procedure TConnectDataBase.ConnectDataBase(sCaminho:string);
var sConfig:TTextFile;
    slParams:TStringList;
begin
  try
    DbMain:=TIBDatabase.Create(nil);
    DbMain.DatabaseName:=sConfig.ConsultarBanco(sCaminho);
    DbMain.LoginPrompt:=False;
    slParams:=sConfig.ConsultarUserNameAndPassword(sCaminho);
    DbMain.Params.Add(slParams[0]);
    DbMain.Params.Add(slParams[1]);
    DefaultTRansaction:=TIBTransaction.Create(nil);
    DbMain.DefaultTransaction:=DefaultTRansaction;
    DbMain.Connected:=True;
  Except
     tFrmMensagens.Mensagem('Não é possível conectar ao banco de dados, '+
                            'verifique sua conexão de rede ou o arquivo Config.ini e em '+
                             'seguida tente novamente.','E',[mbOK]);

  end;
end;


procedure TConnectDataBase.StartTrasaction;
begin
  if Assigned(DbMain) then
    DbMain.DefaultTransaction.StartTransaction;
end;

end.
