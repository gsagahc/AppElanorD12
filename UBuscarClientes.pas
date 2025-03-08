unit UBuscarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBuscarPadrao, Data.DB, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, PngSpeedButton, Vcl.Grids, Vcl.DBGrids;

type
  TFrmBuscarCli = class(TFrmBuscarPrd)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarCli: TFrmBuscarCli;

implementation

{$R *.dfm}

end.
