unit UCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCadPadrao, Data.DB, NumEdit, IdEdit,
  Vcl.StdCtrls, FieldEdit, Vcl.Buttons, PngSpeedButton, Vcl.ExtCtrls,
  FieldComboBox, FieldSNRadioGroup, System.ImageList, Vcl.ImgList, PngImageList;

type
  TFrmCadClientes = class(TFrmCadPadrao)
    FieldComboBoxPrazos: TFieldComboBox;
    Label8: TLabel;
    Label9: TLabel;
    FieldEdit4: TFieldEdit;
    Label10: TLabel;
    FieldEdit6: TFieldEdit;
    Label11: TLabel;
    FieldEdit7: TFieldEdit;
    FieldSNRadioGroup1: TFieldSNRadioGroup;
    FieldSNRadioGroup2: TFieldSNRadioGroup;
    PngSpeedButton1: TPngSpeedButton;
    PngImageList1: TPngImageList;
    procedure PngSdBLocalizarClick(Sender: TObject);
    procedure loadComboboxPrazos;
    procedure FormCreate(Sender: TObject);
    procedure PngSdBSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadClientes: TFrmCadClientes;

implementation
Uses UFacadePrazos, UBuscarClientes, uFacadeClientes, uMensagens, UStandardObject;
{$R *.dfm}

procedure TFrmCadClientes.FormCreate(Sender: TObject);
begin
  inherited;
  loadComboboxPrazos;
end;

procedure TFrmCadClientes.loadComboboxPrazos;
var FacadePrz:TFacadePrazos;
    DataSetPrz:TDataSet;
    ObjetoPrz:TStandardObject;
begin
  try
    FacadePrz:=TFacadePrazos.Create;
    DataSetPrz:=FacadePrz.returnDataSetAllPrazos;
    //Preencher combobox
    While not DataSetPrz.Eof do
    begin
      ObjetoPrz:=TStandardObject.Create(DataSetPrz.FieldByName('ID_PRAZO').AsInteger,
                                     DataSetPrz.FieldByName('TBPRZ_NOME').AsString);
      FieldComboBoxPrazos.Items.AddObject(ObjetoPrz.Text, ObjetoPrz);
      DataSetPrz.Next;
    end;
  except

    tFrmMensagens.Mensagem('Erro ao efetuar carregamento do combobox de prazos.unit:uCadClientes, Metodo:loadComboboxPrazos','E',[mbOK]);

  end;
end;

procedure TFrmCadClientes.PngSdBLocalizarClick(Sender: TObject);
Var Facade:TFacadeClientes;
begin
  inherited;
  Application.CreateForm(TFrmBuscarCli, FrmBuscarCli);
  FrmBuscarCli.Caption := 'Localizar cliente';
  FrmBuscarCli.ShowModal;
  If FrmBuscarCli.IdItem <> 0  Then
  begin
    DSPadrao.DataSet:=Facade.returnDataSetById(IntToStr(FrmBuscarCli.IdItem));
    getFieldData(DSPadrao.DataSet);
    StatusBotoes;

  End;
  FrmBuscarCli.Free;
end;

procedure TFrmCadClientes.PngSdBSalvarClick(Sender: TObject);
var Facade:TFacadeClientes;
    strSql:String;
begin

  if Status='I' then
  begin
    strSql:=generateInsertSQlFields;
    Facade.insertClient(strSql);
  end;
  if Status='A' then
  begin
    strSql:=generateUpdateSQlFields;
    Facade.updateClientByID(StrSql);
  end;
  inherited;

end;

end.
