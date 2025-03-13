unit UCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, Buttons, ExtCtrls,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  ComCtrls, DBClient, PngSpeedButton, FieldEdit, IdEdit, NumEdit, FieldComboBox,
  FieldSNRadioGroup;

type
  TFrmCadPadrao = class(TForm)
    PnlBottom: TPanel;
    PnlBotoes: TPanel;
    DSPadrao: TDataSource;
    PnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    PngSdBNovo: TPngSpeedButton;
    PngSdBLocalizar: TPngSpeedButton;
    PngSdBDeletar: TPngSpeedButton;
    PngSdBSalvar: TPngSpeedButton;
    PngSdBCancelar: TPngSpeedButton;
    PngSdBVoltar: TPngSpeedButton;
    FieldEdit1: TFieldEdit;
    FieldEdit2: TFieldEdit;
    FieldEdit3: TFieldEdit;
    FieldEdit5: TFieldEdit;
    Id: TIdEdit;
    NumEditncm: TNumEdit;
    NumEdit1: TNumEdit;
    NumEdit2: TNumEdit;
    procedure PNGButton4Click(Sender: TObject);
    procedure PNGButton2Click(Sender: TObject);
    procedure StatusBotoes ;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PngSdBVoltarClick(Sender: TObject);
    procedure PngSdBCancelarClick(Sender: TObject);
    procedure PngSdBNovoClick(Sender: TObject);
    procedure PngSdBSalvarClick(Sender: TObject);
    procedure PngSdBLocalizarClick(Sender: TObject);
    function generateInsertSQlFields:string;
    function generateUpdateSQlFields:string;
    function generateDeleteSQlFields:string;
    procedure getFieldData(DataSet:TDataSet);
    procedure clearFields;
  private

    { Private declarations }
  public
    Status:String;

    { Public declarations }
  end;

var
  FrmCadPadrao: TFrmCadPadrao;

implementation
Uses UPrincipal, UBuscarProdutos, uMensagens, Math, UFacade,UStandardObject, UTextFile;

{$R *.dfm}

procedure TFrmCadPadrao.PngSdBCancelarClick(Sender: TObject);
begin
  clearFields;
  StatusBotoes;
end;

procedure TFrmCadPadrao.PngSdBLocalizarClick(Sender: TObject);
begin
  Status:='A'
end;

procedure TFrmCadPadrao.PngSdBNovoClick(Sender: TObject);
begin
  clearFields;
  StatusBotoes;
  Status:='I';
end;

procedure TFrmCadPadrao.PngSdBSalvarClick(Sender: TObject);
Var StrSql:String;
begin
  clearFields;
  StatusBotoes;
end;

procedure TFrmCadPadrao.PngSdBVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPadrao.PNGButton4Click(Sender: TObject);
begin
  StatusBotoes;
end;

procedure TFrmCadPadrao.PNGButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPadrao.StatusBotoes;
Var Botao: TSpeedButton;
    NumEdit:TNumEdit;
    FieldEdit:TFieldEdit;
    FieldComboBox:TFieldComboBox;
    i:Integer;
begin
   For i:=0 To Self.ComponentCount -1 do
     Begin
       If (Self.Components[i] is TSpeedButton) Then
       Begin
         Botao:=(Self.Components[i] as TSpeedButton);
         Botao.Enabled := not Botao.Enabled;
       End;
       If (Self.Components[i] is TNumEdit) Then
       Begin
         NumEdit:=(Self.Components[i] as TNumEdit);
         NumEdit.ReadOnly := not NumEdit.ReadOnly;
       End;
       If (Self.Components[i] is TFieldEdit) Then
       Begin
         FieldEdit:=(Self.Components[i] as TFieldEdit);
         FieldEdit.ReadOnly := not FieldEdit.ReadOnly;
       End;
       If (Self.Components[i] is TFieldComboBox) Then
       Begin
         FieldComboBox:=(Self.Components[i] as TFieldComboBox);
         FieldComboBox.Enabled := not FieldComboBox.Enabled;
       End;
     End;
end;

procedure TFrmCadPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else if (ActiveControl is TDBGrid) then
      with TDBGrid(ActiveControl) do
        if selectedindex < (fieldcount -1) then
          selectedindex := selectedindex +1
        else
          selectedindex := 0;

end;

function TFrmCadPadrao.generateDeleteSQlFields: string;
var i:Integer;
    strSql:String;
begin

  For i:=0 to Self.ComponentCount -1 do
  begin
    If (Self.Components[i] is TIdEdit) Then
    Begin
      strSql:='DELETE FROM '+(Self.Components[i] as TIdEdit).Table + ' WHERE '+
      (Self.Components[i] as TIdEdit).Field+'=';
    End;
    Result:=strSql;


  end;


end;

function TFrmCadPadrao.generateInsertSQlFields: string;
var i:Integer;
    slFields:TStringList;
    slValues:TStringList;
    strSql:String;
    Combobox:TFieldComboBox;
    Objeto:TStandardObject;
begin
  slFields:=TStringList.Create;
  slFields.Delimiter:=',';
  slFields.StrictDelimiter:=True;
  slValues:=TStringList.Create;
  slValues.Delimiter:=',';
  slValues.StrictDelimiter:=True;
  For i:=0 to Self.ComponentCount -1 do
  begin
    If (Self.Components[i] is TFieldEdit)  Then
    Begin
      if (Self.Components[i] as TFieldEdit).Visible then
      begin
        slFields.Add((Self.Components[i] as TFieldEdit).Field);
        slValues.Add(''''+(Self.Components[i] as TFieldEdit).Text+'''');
      end;
    End;
    If (Self.Components[i] is TFieldComboBox) Then
    Begin
      if  (Self.Components[i] as TFieldComboBox).Visible then
      begin
        slFields.Add((Self.Components[i] as TFieldComboBox).Field);
        Combobox:=(Self.Components[i] as TFieldComboBox);
        Objeto:= (Combobox.Items.Objects[Combobox.Items.IndexOf(Combobox.Text)] as TStandardObject);
        slValues.Add(''''+IntToStr(Objeto.id)+'''');
      end;
    End;
    If (Self.Components[i] is TNumEdit) Then
    Begin
      if (Self.Components[i] as TNumEdit).Visible then
      begin
        slFields.Add((Self.Components[i] as TNumEdit).Field);
        if Pos(',',(Self.Components[i] as TNumEdit).Text) > 0 then
          (Self.Components[i] as TNumEdit).Text):=TTextFile.
        slValues.Add(''''+(Self.Components[i] as TNumEdit).Text+'''');
      end;
    End;
    If (Self.Components[i] is TFieldSNRadioGroup) Then
    Begin
      if (Self.Components[i] as TFieldSNRadioGroup).Visible then
      begin
        slFields.Add((Self.Components[i] as TFieldSNRadioGroup).Field);
        if (Self.Components[i] as TFieldSNRadioGroup).ItemIndex = 0 then
          slValues.Add('''S''')
        else
          slValues.Add('''N''');
      end;
    End;
  end;
  if slValues.DelimitedText <> EmptyStr then
  begin
    StrSql:='INSERT INTO '+Id.Table+' ('+slFields.DelimitedText+
             ') VALUES  ('+slValues.DelimitedText+')';
  end
  else
    sTrSql:=EmptyStr;
   Result:=StrSql;
end;

function TFrmCadPadrao.generateUpdateSQlFields: string;
var i:Integer;
    slFields:TStringList;
    StrId:String;
begin
  slFields:=TStringList.Create;
  slFields.Delimiter:=',';
  slFields.StrictDelimiter:=True;
  For i:=0 to Self.ComponentCount -1 do
  begin
    If (Self.Components[i] is TFieldEdit) Then
    Begin
      slFields.Add((Self.Components[i] as TFieldEdit).Field+'='''+(Self.Components[i] as TFieldEdit).Text+'''');
    End;
    If (Self.Components[i] is TIdEdit) Then
    begin
      StrId:=(Self.Components[i] as TIdEdit).Field+'=''' + (Self.Components[i] as TIdEdit).Id+'''';

    end;
  end;
  Result:='UPDATE '+Id.Table +' SET '+slFields.DelimitedText+' WHERE '+StrId;
end;

procedure TFrmCadPadrao.getFieldData(DataSet:TDataSet);
var i:Integer;
    FieldEdit:TFieldEdit;
    Id:TIdEdit;
    NumEdit:TNumEdit;
    FieldComboBox:TFieldComboBox;
    FieldRadioGroup:TFieldSNRadioGroup;
    Facade:TFacade;
    CBoxText:String;
begin
  For i:=0 to Self.ComponentCount -1 do
  begin
    If (Self.Components[i] is TFieldEdit) Then
    Begin
      FieldEdit:=  (Self.Components[i] as TFieldEdit);
      if FieldEdit.Visible then
        FieldEdit.Text:= DataSet.FieldByName(FieldEdit.Field).AsString;
    End;
    If (Self.Components[i] is TNumEdit) Then
    Begin
      NumEdit:= (Self.Components[i] as TNumEdit);
      if NumEdit.Visible then
        NumEdit.Text:= DataSet.FieldByName(NumEdit.Field).AsString;

    End;
    If (Self.Components[i] is TIdEdit) Then
    Begin
      Id := (Self.Components[i] as TIdEdit);
      Id.Text:=DataSet.FieldByName(Id.Field).AsString;
      Id.Id:=DataSet.FieldByName(Id.Field).AsString;

    End;
    If (Self.Components[i] is TFieldComboBox) Then
    Begin
      FieldComboBox:= (Self.Components[i] as TFieldComboBox);
      if FieldComboBox.Visible then
      begin
        Facade:=TFacade.Create;
        CBoxText:=Facade.LookupResult(DataSet.FieldByName(FieldComboBox.Field).AsString,
                                                FieldComboBox.LookupTable,
                                                FieldComboBox.Lookup,
                                                FieldComboBox.Result);

        FieldComboBox.ItemIndex:=FieldComboBox.Items.IndexOf(CBoxText);
      end;

    End;
    If (Self.Components[i] is TFieldSNRadioGroup) Then
    Begin
      FieldRadioGroup:= (Self.Components[i] as TFieldSNRadioGroup);
      if FieldRadioGroup.Visible then
      begin
        if DataSet.FieldByName(FieldRadioGroup.Field).AsString= 'S' then
          FieldRadioGroup.ItemIndex:=0
        else
          FieldRadioGroup.ItemIndex:=1;

      end;

    End;
   

  end;

end;

procedure TFrmCadPadrao.clearFields;
var i:Integer;
    FieldEdit:TFieldEdit;
    Id:TIdEdit;
    NumEdit:TNumEdit;
    FieldComboBox:TFieldComboBox;
begin
  For i:=0 to Self.ComponentCount -1 do
  begin
    If (Self.Components[i] is TFieldEdit) Then
    Begin
      FieldEdit:=  (Self.Components[i] as TFieldEdit);
      FieldEdit.Clear;
    End;
    If (Self.Components[i] is TNumEdit) Then
    Begin
      NumEdit:= (Self.Components[i] as TNumEdit);
      NumEdit.Clear;

    End;
    If (Self.Components[i] is TIdEdit) Then
    Begin
      Id := (Self.Components[i] as TIdEdit);
      Id.Clear;
      Id.Id:='0';

    End;
    If (Self.Components[i] is TFieldComboBox) Then
    Begin
      FieldComboBox:= (Self.Components[i] as TFieldComboBox);
      FieldComboBox.ItemIndex:=-1;

    End;

  end;
end;

end.
