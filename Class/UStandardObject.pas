unit UStandardObject;

interface
type
  TStandardObject= Class
    id:Integer;
    Text:string;

    constructor Create(Id:Integer;Text:string);
  End;

implementation

{ TPrazo }

constructor TStandardObject.Create(Id: Integer; Text: string);
begin
  Self.id:=id;
  Self.Text:=Text;
end;

end.
