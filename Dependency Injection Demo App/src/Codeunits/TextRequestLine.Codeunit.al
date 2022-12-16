codeunit 50123 "Text Request Line" implements "Request Line Data"
{
    #region Interface Procedures
    procedure FillLineData(var RequestLine: Record "Request Line")
    begin
        FillLineWithTextData(RequestLine);
    end;

    procedure ValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal);
    begin
    end;

    procedure ValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal);
    begin
    end;
    #endregion Interface Procedures

    local procedure FillLineWithTextData(var RequestLine: Record "Request Line")
    var
        StandardText: Record "Standard Text";
    begin
        if StandardText.Get(RequestLine."No.") then
            RequestLine.Description := StandardText.Description;
    end;
}
