unit UBuscarPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Buttons, PngSpeedButton, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormBuscarpedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    PnlBotoes: TPanel;
    PngSdBLocalizar: TPngSpeedButton;
    PngSdBDeletar: TPngSpeedButton;
    PngSdBSalvar: TPngSpeedButton;
    PngSdBCancelar: TPngSpeedButton;
    PngSdBVoltar: TPngSpeedButton;
    GBoxPeriodo: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBuscarpedidos: TFormBuscarpedidos;

implementation

{$R *.dfm}

end.
