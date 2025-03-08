unit UBuscarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBuscarPadrao, Data.DB, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton, Vcl.Grids, Vcl.DBGrids;

type
  TFrmBuscarCli = class(TFrmBuscarPrd)
    procedure PngSdBBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarCli: TFrmBuscarCli;

implementation
Uses UFacadeClientes;
{$R *.dfm}

procedure TFrmBuscarCli.PngSdBBuscarClick(Sender: TObject);
var StrSQL:String;
    Facade:TFacadeClientes;
begin
 //  inherited;
  if Trim(EditNome.Text)<>EmptyStr  Then
  Begin
    StrSQL:= ' LIKE ''%'+EditNome.Text+'%''';
    DSGrid.DataSet:=TDataSet(Facade.returnDataSetClientsWithLike('TB_CLIENTES', 'TBCLI_NOME',StrSQL));
  End
  Else
    DSGrid.DataSet:=TDataSet(Facade.returnDataSetClientsWithLike('TB_CLIENTES', 'TBCLI_NOME',''));
end;

end.
