unit UCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCadPadrao, Data.DB, NumEdit, IdEdit,
  Vcl.StdCtrls, FieldEdit, Vcl.Buttons, PngSpeedButton, Vcl.ExtCtrls,
  FieldComboBox, FieldSNRadioGroup;

type
  TFrmCadClientes = class(TFrmCadPadrao)
    FieldComboBox1: TFieldComboBox;
    Label8: TLabel;
    Label9: TLabel;
    FieldEdit4: TFieldEdit;
    Label10: TLabel;
    FieldEdit6: TFieldEdit;
    Label11: TLabel;
    FieldEdit7: TFieldEdit;
    PngSpeedButton1: TPngSpeedButton;
    FieldSNRadioGroup1: TFieldSNRadioGroup;
    FieldSNRadioGroup2: TFieldSNRadioGroup;
    procedure PngSdBLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadClientes: TFrmCadClientes;

implementation
Uses UBuscarClientes, UFacadeClientes;
{$R *.dfm}

procedure TFrmCadClientes.PngSdBLocalizarClick(Sender: TObject);
Var Facade:TFacadeClientes;
begin
  inherited;
  Application.CreateForm(TFrmBuscarCli, FrmBuscarCli);
  FrmBuscarCli.Caption := 'Localizar cliente';
  FrmBuscarCli.ShowModal;
  If FrmBuscarCli.IdItem <> 0  Then
  begin
    DSProdutos.DataSet:=Facade.returnDataSetById(IntToStr(FrmBuscarCli.IdItem));
    getFieldData(DSProdutos.DataSet);
    StatusBotoes;

  End;
  FrmBuscarCli.Free;
end;

end.
