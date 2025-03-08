unit UPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB,  Buttons, ExtCtrls,  IBX.IBQuery,
  IBX.IBCustomDataSet, IBX.IBTable, IBX.IBSQL, IBX.IBUpdateSQL;

type
  TFrmPadrao = class(TForm)
    PnlBottom: TPanel;
    PnlMain: TPanel;
    PnlBotoes: TPanel;
    IBTable1: TIBTable;
    IBQuery1: TIBQuery;
    IBUpdateSQL1: TIBUpdateSQL;
    IBSQL1: TIBSQL;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure StatusBotoes ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}

procedure TFrmPadrao.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;



procedure TFrmPadrao.StatusBotoes;
Var Botao: TSpeedButton;
    i:Integer;
begin
   For i:=0 To Self.ComponentCount -1 do
     Begin
       If (Self.Components[i] is TSpeedButton) Then
         Begin
           Botao:=(Self.Components[i] as TSpeedButton);
           Botao.Enabled := not Botao.Enabled;
         End;
     End;
end;

end.
