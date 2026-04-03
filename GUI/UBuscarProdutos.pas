unit UBuscarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Data.DB, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton, Vcl.Grids, Vcl.DBGrids, uBuscarPadrao;

type
  TFrmBuscarProdutos = class(TFrmBuscarPrd)
    procedure PngSdBBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarProdutos: TFrmBuscarProdutos;

implementation
Uses UFacadeProducts,UMensagens;
{$R *.dfm}

procedure TFrmBuscarProdutos.PngSdBBuscarClick(Sender: TObject);
var StrSQL:String;
    Facade:TFacadeProducts;
begin
 //  inherited;
  if Trim(EditNome.Text)<>EmptyStr  Then
  Begin
    StrSQL:= ' LIKE ''%'+EditNome.Text+'%''';
    DSGrid.DataSet:=TDataSet(Facade.ReturnDataSetProductsWithLike('TB_PRODUTOS', 'TBPRD_NOME',StrSQL));
  End
  Else
    DSGrid.DataSet:=TDataSet(Facade.ReturnDataSetProductsWithLike('TB_PRODUTOS', 'TBPRD_NOME',''));
end;

end.
