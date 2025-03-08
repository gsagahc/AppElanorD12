unit UTextFile;

interface

uses IniFiles, Classes, Forms ;
type TTextFile= class
  Function ConsultarBanco(sCaminho:string):String;
  function ConsultarUserNameAndPassword(sCaminho:string):TStringList;
   class function caminhoDaAplicacao:string;
end;  
implementation

{ TTextFile }

class function TTextFile.caminhoDaAplicacao: string;
var SCaminho:string;
begin
  sCaminho:=Application.ExeName;
  sCaminho:=Copy(sCaminho,1, pos('Elanor.exe',sCaminho)-1);
  Result:=sCaminho;
end;

function TTextFile.ConsultarBanco(sCaminho:string):String;
Var ArqIni: TIniFile;
    caminho:string;
    BancoDados:String;
begin

  ArqIni := TIniFile.Create(sCaminho+'Config.ini');
  try
    BancoDados := ArqIni.ReadString('Configuracoes', 'DATABASE', BancoDados);
    Result:=BancoDados;
  finally
    ArqIni.Free;
  end;

end;

function TTextFile.ConsultarUserNameAndPassword(sCaminho:string):TStringList;
Var ArqIni: TIniFile;
    caminho:string;
    sTexto:string;
    slResult:TStringList;
begin
  ArqIni := TIniFile.Create(sCaminho+'Config.ini');
  try
    slResult:=TStringList.Create;
    sTexto := ArqIni.ReadString('Configuracoes', 'USUARIO', sTexto);
    slResult.Add(sTexto);
    sTexto := ArqIni.ReadString('Configuracoes', 'SENHA', sTexto);
    slResult.Add(sTexto);
    Result:=slResult;
  finally
    ArqIni.Free;
   
  end;

end;

end.
