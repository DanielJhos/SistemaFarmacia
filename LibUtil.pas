unit LibUtil;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Rtti,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.DatS;

CONST
  varTpDouble = 271;
  varTpDateTime = 272;
  varTpReal = 273;

type
  TArrayFieldType = Array of TFieldType;

  TCaptionHelper = record Helper for TCaption
  public
    function ToString: String;
    function ToIntDef(const AValue: Integer = 0): Integer;
    function ToFloatDef(const AValue: Double = 0): Double;
  end;

  BooleanHelper = Boolean;

  TLTBooleanHelper = record Helper for BooleanHelper
  public
    function IfThen<T>(const AValueTrue, AValueFalse: T): T; overload;
  end;

  TWinControlHelper = class Helper for TWinControl
  public
    procedure ToFocus;
  end;

  TFDQueryHelper = class Helper for TFDQuery
  public
    function Open(const AParams: Array of Variant; const ATypes: TArrayFieldType = []): TFDQuery; overload;
  end;

  TFDDatSRowListBaseProcedure<T: class> = reference to procedure(const AObject: T);

  TFDDatSListHelper = class Helper for TFDDatSList
  public
    function ToArray<T: class>: TArray<T>; overload;
  end;

  TLTFDDatSRowHelper = class Helper for TFDDatSRow
  public
    function AsValue<T>(const AColumn: Integer): T; overload;
  end;


procedure Informa(const AMensagem: String);
procedure Alerta(const AMensagem: String);

implementation

{ TCaptionHelper }

function TCaptionHelper.ToString: String;
begin
  Result := String(Self);
end;

function TCaptionHelper.ToIntDef(const AValue: Integer): Integer;
begin
  Result := StrToIntDef(Self.ToString, AValue);
end;

function TCaptionHelper.ToFloatDef(const AValue: Double): Double;
begin
  Result := StrToFloatDef(Self.ToString, AValue);
end;

{ TLTBooleanHelper }

function TLTBooleanHelper.IfThen<T>(const AValueTrue, AValueFalse: T): T;
begin
  if Self then
    Result := AValueTrue
  else
    Result := AValueFalse;
end;

procedure Informa(const AMensagem: String);
begin
  MessageDlg(AMensagem, mtInformation, [mbOk], 0);
end;

procedure Alerta(const AMensagem: String);
begin
  MessageDlg(AMensagem, mtWarning, [mbOk], 0);
end;

{ TCustomEditHelper }

procedure TWinControlHelper.ToFocus;
begin
  if Self.CanFocus then
    Self.SetFocus;
end;

{ TFDQueryHelper }

function TFDQueryHelper.Open(const AParams: array of Variant; const ATypes: TArrayFieldType): TFDQuery;
begin
  Result := Self;

  Self.Open(EmptyStr, AParams, ATypes);
end;

{ TFDDatSListHelper }

function TFDDatSListHelper.ToArray<T>: TArray<T>;
begin
  SetLength(Result, Self.Count);
  for var i := 0 to Self.Count - 1 do
    Result[i] := T(Self.ItemsI[i]);
end;

{ TLTFDDatSRowHelper }

function TLTFDDatSRowHelper.AsValue<T>(const AColumn: Integer): T;
begin
  const lVariant = Self.GetData(AColumn);

  if VarIsNull(lVariant) or VarIsEmpty(lVariant) then
    Exit(Default(T))
  else if (TVarData(lVariant).VType = varTpDouble) or (TVarData(lVariant).VType = varTpReal) then
    Exit(TValue.From<Double>(lVariant).AsType<T>)
  else if (TVarData(lVariant).VType = varTpDateTime) then
    Exit(TValue.From<TDateTime>(lVariant).AsType<T>)
  else
    Exit(TValue.FromVariant(lVariant).AsType<T>);
end;

end.
