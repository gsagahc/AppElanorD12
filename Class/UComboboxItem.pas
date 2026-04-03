unit UComboboxItem;

interface
type
  TComboboxItem= Class
    id:Integer;
    Nome:string;
    Prazo1,
    Prazo2,
    Prazo3,
    Prazo4:Integer;
    constructor Create(Id,Prazo1, Prazo2, Prazo3, Prazo4:Integer; Nome: string);
  End;

implementation

{ TPrazo }

constructor TComboboxItem.Create(Id,Prazo1, Prazo2, Prazo3, Prazo4:Integer; Nome: string);
begin
  Self.id:=id;
  Self.Nome:=Nome;
  Self.Prazo1:=Prazo1;
  Self.Prazo2:=Prazo2;
  Self.Prazo3:=Prazo3;
  Self.Prazo4:=Prazo4;
end;

end.


End;
