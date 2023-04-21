codeunit 50123 "Text Request Line" implements "Request Line Data"
{
    #region Interface Procedures

    procedure FillLineData(var RequestLine: Record "Request Line")
    begin
        RunRequestLineTypeEvents.RunBeforeFillLineData(RequestLine);

        FillLineWithTextData(RequestLine);

        RunRequestLineTypeEvents.RunAfterFillLineData(RequestLine);
    end;

    procedure ValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal);
    begin
        RunRequestLineTypeEvents.RunBeforeValidateQuantity(RequestLine, xRecQuantity);

        RunRequestLineTypeEvents.RunAfterValidateQuantity(RequestLine, xRecQuantity);
    end;

    procedure ValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal);
    begin
        RunRequestLineTypeEvents.RunBeforeValidateUnitPrice(RequestLine, xRecUnitPrice);

        RunRequestLineTypeEvents.RunAfterValidateUnitPrice(RequestLine, xRecUnitPrice);
    end;
    #endregion Interface Procedures

    local procedure FillLineWithTextData(var RequestLine: Record "Request Line")
    var
        StandardText: Record "Standard Text";
    begin
        if StandardText.Get(RequestLine."No.") then
            RequestLine.Description := StandardText.Description;
    end;

    var
        RunRequestLineTypeEvents: Codeunit "Run Request Line Type Events";
}
