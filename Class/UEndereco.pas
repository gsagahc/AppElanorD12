unit UEndereco;

interface
Type TEndereco = Class
      Public
      Rua:String;
      Bairro:String;
      Cidade:String;
      Estado:String;
      constructor Create(Rua,Bairro,Cidade,Estado:string);
End;

implementation

{ TEndereco }

constructor TEndereco.Create(Rua, Bairro, Cidade, Estado: string);
begin
  Self.Rua:=Rua;
  Self.Bairro:=Bairro;
  Self.Cidade:=Cidade;
  Self.Estado:=Estado;
end;

end.
