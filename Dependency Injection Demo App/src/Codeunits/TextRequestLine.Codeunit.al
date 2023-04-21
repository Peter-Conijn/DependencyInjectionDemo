codeunit 50123 "Text Request Line" implements "Request Line Data"
{
    #region Interface Procedures
    procedure FillLineData(var RequestLine: Record "Request Line")
    begin
        OnBeforeFillLineData(RequestLine);

        FillLineWithTextData(RequestLine);

        OnAfterFillLineData(RequestLine);
    end;

    procedure ValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal);
    begin
        OnBeforeValidateQuantity(RequestLine, xRecQuantity);

        OnAfterValidateQuantity(RequestLine, xRecQuantity);
    end;

    procedure ValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal);
    begin
        OnBeforeValidateUnitPrice(RequestLine, xRecUnitPrice);

        OnAfterValidateUnitPrice(RequestLine, xRecUnitPrice);
    end;
    #endregion Interface Procedures

    local procedure FillLineWithTextData(var RequestLine: Record "Request Line")
    var
        StandardText: Record "Standard Text";
    begin
        if StandardText.Get(RequestLine."No.") then
            RequestLine.Description := StandardText.Description;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFillLineData(var RequestLine: Record "Request Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFillLineData(var RequestLine: Record "Request Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal)
    begin
    end;
}
