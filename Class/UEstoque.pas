unit UEstoque;

interface
Type TEstoque = Class
     Public
     Nome:String;
     Id_produto:Integer;
     Id_estoque:Integer;
     Quantidade:Real;
     Tamanho:string;
     Formato:String;
     Unidade:String;
     constructor Create(Nome, Tamanho, Formato, Unidade: string;Id_produto,Id_estoque:integer);
End;

implementation

{ TPrazo }

constructor TEstoque.Create(Nome, Tamanho, Formato, Unidade: string;Id_produto,Id_estoque:integer );
begin
  Self.Nome:=Nome;
  Self.Tamanho:=Tamanho;
  Self.Formato:=Formato;
  Self.Unidade:=Unidade;
  Self.Id_produto:=Id_produto;
  Self.Id_estoque:=Id_estoque;
end;

end.


