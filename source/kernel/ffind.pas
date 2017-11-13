{
Projeto FolhaLivre - Folha de Pagamento Livre
Formulário para Pesquisa em um DataSet

Copyright (c) 2002-2005 Allan Lima

Este programa é um software de livre distribuição, que pode ser copiado e
distribuído sob os termos da Licença Pública Geral GNU, conforme publicada
pela Free Software Foundation, versão 2 da licença ou qualquer versão posterior.

Este programa é distribuído na expectativa de ser útil aos seus usuários,
porém  NÃO TEM NENHUMA GARANTIA, EXPLÍCITAS OU IMPLÍCITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licença Pública Geral GNU para maiores detalhes.

Histórico das modificações

* 19/07/2005 - Adicionado suporte para o campo de seleção 'X'
* 14/07/2006 - Adicionado função kFindTable()
}

unit ffind;

{$I flivre.inc}

interface

uses
  {$IFDEF CLX}
  Qt, QGraphics, QControls, QForms, QDialogs, QStdCtrls, QMask, QExtCtrls,
  QDBGrids, QGrids,
  {$ENDIF}
  {$IFDEF VCL}
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  ExtCtrls, DBGrids, Grids,
  {$ENDIF}
  {$IFDEF FL_MIDASLIB}MidasLib,{$ENDIF}
  SysUtils, Classes, DB, DBClient, Variants, Types;

type

  TFrmFindOption = (foNoPanel, foNoTitle);
  TFrmFindOptions = set of TFrmFindOption;

  TFrmFind = class(TForm)
  protected
    procedure GridDrawColumnCell( Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState); virtual;
  private
    FPanel: TPanel;
    FLabel: TLabel;
    FMaskEdit: TMaskEdit;
    FGrid: TDBGrid;
    FDataSource: TDataSource;
    FOK: TButton;
    FCancelar: TButton;
    Rate: Double;
    FFindField: String;
    FOptions: TFrmFindOptions;
    procedure CreateControls;
    procedure MaskEditChange(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridTitleClick( Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow( Sender: TObject);
    procedure SetOptions(Value: TFrmFindOptions);
  published
    property Grid: TDBGrid read FGrid write FGrid;
    property DataSource: TDataSource read FDataSource write FDataSource;
    property Options: TFrmFindOptions read FOptions write SetOptions;
      public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
  end;

const
  FORM_INDENT = 14;

function kFindTable(
  Table: String; {Tabela a ser pesquisada}
  Title: String; {Titulo da janela de pesquisa}
  ValueFind: Variant; {Valor a pesquisar}
  FieldFind: String; {Campo a pesquisar}
  const ResultFields: Array of String; {Nome dos campos a serem retornados}
  var ResultValues: Variant; {Valores dos campos retornados}
  DisplayFields: array of String;{Campos a serem exibidos na janela de pesquisa}
  IniciarTransacao: Boolean = True):Boolean;

function kFindDataSet( DataSet1: TDataSet; FindValue: Variant;
  const FindField: String; var ResultValue: Variant;
  const ResultField: String = ''; Warning: Boolean = True):Boolean; overload;

function kFindDataSet( DataSet1: TDataSet; Title: String; FindField: String;
  var ResultValue: Variant; Options1: TFrmFindOptions = [];
  ResultField: String = ''):Boolean; overload;

implementation

uses fsuporte, ftext, fdb, fcolor;

function kFindTable(
  Table: String; {Tabela a ser pesquisada}
  Title: String; {Titulo da janela de pesquisa}
  ValueFind: Variant; {Valor a pesquisar}
  FieldFind: String; {Campo a pesquisar}
  const ResultFields: Array of String; {Nome dos campos a serem retornados}
  var ResultValues: Variant; {Valores dos campos retornados}
  DisplayFields: array of String;{Campos a serem exibidos na janela de pesquisa}
  IniciarTransacao: Boolean = True):Boolean;
var
  i: Integer;
  Value: Variant;
  DataSet1: TClientDataSet;
begin

  DataSet1 := TClientDataSet.Create(NIL);
  Result := False;

  try

    if not kOpenTable( DataSet1, Table, '', IniciarTransacao) then
      Exit;

    if (DataSet1.RecordCount = 0) then
    begin
      kErro('Não há registros para pesquisar. Verifique');
      Exit;
    end;

    if VarIsNull(ValueFind) or (VarIsStr(ValueFind) and (VarToStr(ValueFind)='')) then
    begin

      if Length(DisplayFields) > 0 then
      begin
        for i := 0 to DataSet1.FieldCount-1 do
          DataSet1.Fields[i].Visible := False;
        for i := 0 to Length(DisplayFields)-1 do
          DataSet1.FieldByName(DisplayFields[i]).Visible := True;
      end;

      if not kFindDataSet( DataSet1, Title, FieldFind, Value, [foNoPanel,foNoTitle]) then
        Exit;

    end else
    begin

      if not DataSet1.Locate( FieldFind, ValueFind, []) then
      begin
        kErro('Valor informado não encontrado. Verifique e tente novamente.');
        Exit;
      end;

   end;

   if (Length(ResultFields) = 1) then
     ResultValues := DataSet1.FieldByName(ResultFields[0]).Value
   else
     for i :=  0 to Length(ResultFields)-1 do
       ResultValues[i] := DataSet1.FieldByName(ResultFields[i]).Value;

   Result := True;

  finally
    DataSet1.Free;
  end;

end;

function kFindDataSet( DataSet1: TDataSet;
  Title: String;
  FindField: String; { Nome do campo a ser pesquisado }
  var ResultValue: Variant; { Valor do campo a ser retornado }
  Options1: TFrmFindOptions = []; { Opçoes }
  ResultField: String = '' { Nome do campo a ser retornado }
  ):Boolean;
begin

  Result := False;

  if (DataSet1.RecordCount = 0) then
    Exit;

  if (ResultField = '') then
    ResultField := FindField;

  if (DataSet1.RecordCount = 1) then
  begin
    ResultValue := DataSet1.FieldByName(ResultField).Value;
    Result := True;
    Exit;
  end;

  with TFrmFind.CreateNew(Application) do
    try

      if (Title = '') then
        Title := 'Pesquisando...';

      Caption := Title;

      DataSource.DataSet := DataSet1;

      FFindField := FindField;
      Options    := Options1;

      ShowModal;

      if (ModalResult = {$IFDEF CLX}mrYes{$ENDIF}
                       {$IFDEF VCL}idOK{$ENDIF}) then
      begin
        ResultValue := FDataSource.DataSet.FieldByName(ResultField).Value;
        Result := True;
      end;

    finally
      Free;
    end;

end;

function kFindDataSet( DataSet1: TDataSet; FindValue: Variant;
  const FindField: String; var ResultValue: Variant;
  const ResultField: String = ''; Warning: Boolean = True):Boolean;
begin

  Result := DataSet1.Locate( FindField, VarArrayOf(FindValue), []);

  if (not Result) and Warning then
     kErro( 'O valor procurado '+VarToStr(FindValue)+' não foi encontrado. Tente novamente.')

  else if (not Result) then
    Result := kFindDataSet( DataSet1, '', FindField, FindValue,
                            [foNoPanel, foNoTitle], ResultField);

  if Result and (ResultField = '') then
    ResultValue := DataSet1.FieldByName(FindField).Value
  else if Result then
    ResultValue := DataSet1.FieldByName(ResultField).Value;

end;

{ TFrmFind }

constructor TFrmFind.CreateNew(AOwner: TComponent; Dummy: Integer = 0);
begin

  inherited CreateNew( AOwner, Dummy);

  KeyPreview  := TRUE;

  OnKeyDown   := FormKeyDown;
  OnShow      := FormShow;

  FDataSource := TDataSource.Create(Owner);

  {$IFDEF CLX}
  BorderStyle := fbsDialog;
  {$ENDIF}
  {$IFDEF VCL}
  Ctl3D := False;
  BorderStyle := bsDialog;
  {$ENDIF}
  Color := kGetColor();
  Rate := Canvas.TextWidth('W') / 11;
  Position := poScreenCenter;
  if Assigned(Application.MainForm) then
  begin
    ClientHeight := Round(Application.MainForm.Height * 0.70);
    ClientWidth := Round(Application.MainForm.Width * 0.85);
  end;
  CreateControls;

end;

procedure TFrmFind.CreateControls;
begin

  FPanel := TPanel.Create(Self);
  with FPanel do
  begin
    Parent      := Self;
    Caption     := '';
    Height      := Round(Rate * 40);
    Align       := alTop;
    ParentColor := True;
  end;  // with FPanel

  FLabel := TLabel.Create(Self);
  with FLabel do
  begin
    Parent  := FPanel;
    Caption := 'Conteudo a pesquisar';
    Left    := Round(Rate * 8);
    Top     := Round(Rate * 8);
  end;

  FMaskEdit := TMaskEdit.Create(Self);
  with FMaskEdit do
  begin
    Parent   := FPanel;
    CharCase := ecUpperCase;
    Left     := FLabel.Left + FLabel.Width + Round(Rate * FORM_INDENT);
    Top      := Round(Rate * 8);
    Width    := Round(Rate * 200);
    OnChange := MaskEditChange;
  end;

  FOK := TButton.Create(Self);
  with FOK do
  begin
    Parent  := FPanel;
    Default := True;
    ModalResult := mrOK;
    Caption := 'OK';
    Left := FMaskEdit.Left + FMaskEdit.Width + Round(Rate * FORM_INDENT);
    Top := Round(Rate * FORM_INDENT);
    Visible := False;
  end;

  FCancelar := TButton.Create(Self);
  with FCancelar do
  begin
    Parent := FPanel;
    Default := True;
    ModalResult := mrCancel;
    Caption := 'Cancelar';
    Left := FOK.Left + FOK.Width + Round(Rate * FORM_INDENT);
    Top := FOK.Top;
    Visible := False;
  end;

  FGrid := TDBGrid.Create(Self);

  with FGrid do
  begin
    Parent := Self;
    Align := alClient;
    DataSource := FDataSource;
    Options := Options - [dgEditing];
    Options := Options + [dgRowSelect];
    Options := Options + [dgAlwaysShowSelection];
    if (foNoTitle in FOptions) then
      FGrid.Options := FGrid.Options - [dgTitles];
    OnDblClick := GridDblClick;
    OnDrawColumnCell := GridDrawColumnCell;
    OnTitleClick := GridTitleClick;
    ParentColor := True;
  end;

end;

procedure TFrmFind.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if (Key = VK_DOWN) and (ActiveControl = FMaskEdit) then
  begin
    Key := 0;
    FDataSource.DataSet.Next;

  end else if (Key = VK_UP) and (ActiveControl = FMaskEdit) then
  begin
    Key := 0;
    FDataSource.DataSet.Prior;

  end else if (Key = VK_RETURN) then
    FOK.Click

  else if (Key = VK_ESCAPE) then
    FCancelar.Click

  { Adicionado em 19/07/2005 por Allan Lima }

  else if (Key = VK_SPACE) and (ActiveControl = FGrid) and
          Assigned(FDataSource.DataSet.FindField('X')) then
  begin

    Key := 0;
    FDataSource.DataSet.Edit;

    if (FDataSource.DataSet.FieldByName('X').DataType in [ftSmallInt, ftInteger, ftWord]) then
    begin
      if FDataSource.DataSet.FieldByName('X').AsInteger = 0 then
        FDataSource.DataSet.FieldByName('X').AsInteger := 1
      else FDataSource.DataSet.FieldByName('X').AsInteger := 0;

    end else if (FDataSource.DataSet.FieldByName('X').DataType = ftString) then
    begin
      if FDataSource.DataSet.FieldByName('X').AsString = '' then
        FDataSource.DataSet.FieldByName('X').AsString := 'X'
      else
        FDataSource.DataSet.FieldByName('X').AsString := '';

    end else if (FDataSource.DataSet.FieldByName('X').DataType = ftBoolean) then
      FDataSource.DataSet.FieldByName('X').AsBoolean := not FDataSource.DataSet.FieldByName('X').AsBoolean;

    FDataSource.DataSet.Post;

  end;

end;

procedure TFrmFind.MaskEditChange(Sender: TObject);
begin
  FDataSource.DataSet.Locate( FFindField, TMaskEdit(Sender).Text,
                              [loCaseInsensitive,loPartialKey]);
end;

procedure TFrmFind.GridDblClick(Sender: TObject);
begin
  FOK.Click;
end;

procedure TFrmFind.GridDrawColumnCell( Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  kDrawColumnCell( Sender, Rect, DataCol, Column, State);

  if (Column.Field.FieldName = FFindField) then
  begin
    TDBGrid(Sender).Canvas.Font.Style := TDBGrid(Sender).Canvas.Font.Style + [fsBold];
    TDBGrid(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, State);
  end;

  if Assigned(Column.Field.DataSet.FindField('X')) and
     ( (Column.Field.DataSet.FieldByName('X').AsString = '1') or
       (Column.Field.DataSet.FieldByName('X').AsString = 'X') or
       (Column.Field.DataSet.FieldByName('X').AsString = 'True') ) then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlue;
    TDBGrid(Sender).DefaultDrawColumnCell( Rect, DataCol, Column, State);
  end;

end;

procedure TFrmFind.GridTitleClick( Column: TColumn);
begin
  kTitleClick( Column.Grid, Column, nil);
end;

procedure TFrmFind.FormShow(Sender: TObject);
begin
  Width := kMaxWidthColumn( FGrid.Columns, Rate);
end;

procedure TFrmFind.SetOptions(Value: TFrmFindOptions);
begin

  if (FOptions <> Value) then
  begin

    if foNoPanel in Value then
      Include( FOptions, foNoPanel);

    if foNoTitle in Value then
      Include( FOptions, foNoTitle);

    FPanel.Visible := not (foNoPanel in FOptions);

    if foNoTitle in FOptions then
      FGrid.Options := FGrid.Options - [dgTitles]
    else
      FGrid.Options := FGrid.Options + [dgTitles];

  end;

end;


end.
