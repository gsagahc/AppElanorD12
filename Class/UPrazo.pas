unit UPrazo;

interface
type
  TPrazo= Class
    id:Integer;
    Nome:string;
    Prazo1:Integer;
    Prazo2:Integer;
    Prazo3:Integer;
    constructor Create(Id,Prazo1,Prazo2,Prazo3:Integer;Nome:string);
  End;

implementation

{ TPrazo }

constructor TPrazo.Create(Id, Prazo1, Prazo2, Prazo3: Integer; Nome: string);
begin
  Self.id:=id;
  Self.Nome:=Nome;
  Self.Prazo1:=Prazo1;
  Self.Prazo2:=Prazo2;
  Self.Prazo3:=Prazo3;
end;

end.
