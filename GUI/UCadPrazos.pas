unit UCadPrazos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCadPadrao, Data.DB,
  IBX.IBCustomDataSet, IBX.IBTable, NumEdit, IdEdit, Vcl.StdCtrls, FieldEdit,
  Vcl.Buttons, PngSpeedButton, Vcl.ExtCtrls;

type
  TFrmCadPrazos = class(TFrmCadPadrao)
    procedure PngSdBLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPrazos: TFrmCadPrazos;

implementation
uses uFacadePrazos, UBuscarClientes;

{$R *.dfm}

procedure TFrmCadPrazos.PngSdBLocalizarClick(Sender: TObject);
Var Facade:TFacadePrazos;
begin
  inherited;
  Application.CreateForm(TFrmBuscarCli, FrmBuscarCli);
  FrmBuscarCli.Caption := 'Localizar cliente';
  FrmBuscarCli.ShowModal;
  If FrmBuscarCli.IdItem <> 0  Then
  begin
    try
      facade:=TFacadePrazos.Create;
      DSPadrao.DataSet:=Facade.returnDataSetById(IntToStr(FrmBuscarCli.IdItem));
      getFieldData(DSPadrao.DataSet);

    finally
      Facade.Free;
      StatusBotoes;
    end;

  End;
  FrmBuscarCli.Free;

end;

end.
