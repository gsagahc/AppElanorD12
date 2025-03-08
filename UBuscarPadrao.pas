unit UBuscarPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls,  StdCtrls, DB,
  Vcl.Buttons, PngSpeedButton;

type
  TFrmBuscarPrd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    EditNome: TEdit;
    DSGrid: TDataSource;
    Label1: TLabel;
    TimerBusca: TTimer;
    PngSdBBuscar: TPngSpeedButton;
    PngSdBVoltar: TPngSpeedButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure EditDescricaoChange(Sender: TObject);
    procedure PngSdBVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    IdItem:Integer;
    NomeItem:String;
  end;

var
  FrmBuscarPrd: TFrmBuscarPrd;

implementation
Uses  UMensagens, UPrincipal;

{$R *.dfm}






procedure TFrmBuscarPrd.PngSdBVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscarPrd.DBGrid1DblClick(Sender: TObject);
begin
  IdItem:=DBGrid1.Fields[0].AsInteger ;
  NomeItem:=DBGrid1.Fields[1].AsString;
  Close;
end;



procedure TFrmBuscarPrd.TimerBuscaTimer(Sender: TObject);
begin

  TimerBusca.Enabled := False;
end;

procedure TFrmBuscarPrd.EditDescricaoChange(Sender: TObject);
begin
  TimerBusca.Enabled :=True; 
end;

procedure TFrmBuscarPrd.FormCreate(Sender: TObject);
begin
  IdItem:=0;
  NomeItem:=EmptyStr;
end;

end.
