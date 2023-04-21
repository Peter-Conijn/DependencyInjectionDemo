/// <summary>
/// Codeunit to trigger events from the Request Line Type interface implementation
/// </summary>
codeunit 50129 "Run Request Line Type Events"
{
    Access = Public;

    /// <summary>
    /// Trigges OnBeforeFillLineData integration event
    /// </summary>
    /// <param name="RequestLine">The request line record that will be passed to the event</param>
    procedure RunBeforeFillLineData(var RequestLine: Record "Request Line")
    begin
        OnBeforeFillLineData(RequestLine);
    end;

    /// <summary>
    /// Trigges OnAfterFillLineData integration event
    /// </summary>
    /// <param name="RequestLine">The request line record that will be passed to the event</param>
    procedure RunAfterFillLineData(var RequestLine: Record "Request Line")
    begin
        OnAfterFillLineData(RequestLine);
    end;

    /// <summary>
    /// Triggers the OnBeforeValidateQuantity integration event
    /// </summary>
    /// <param name="RequestLine">The request line record that will be passed to the event</param>
    /// <param name="xRecQuantity">The value of the quantity field of the request line when it was retrieved from the database</param>
    procedure RunBeforeValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal)
    begin
        OnBeforeValidateQuantity(RequestLine, xRecQuantity);
    end;

    /// <summary>
    /// Triggers the OnAfterValidateQuantity integration event
    /// </summary>
    /// <param name="RequestLine">The request line record that will be passed to the event</param>
    /// <param name="xRecQuantity">The value of the quantity field of the request line when it was retrieved from the database</param>
    procedure RunAfterValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal)
    begin
        OnAfterValidateQuantity(RequestLine, xRecQuantity);
    end;

    /// <summary>
    /// Triggers the OnBeforeValidateUnitPrice integration event
    /// </summary>
    /// <param name="RequestLine">The request line record that will be passed to the event</param>
    /// <param name="xRecUnitPrice">The value of the unit price field of the request line when it was retrieved from the database</param>
    procedure RunBeforeValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal)
    begin
        OnBeforeValidateUnitPrice(RequestLine, xRecUnitPrice);
    end;

    /// <summary>
    /// Triggers the OnAfterValidateUnitPrice integration event
    /// </summary>
    /// <param name="RequestLine">The request line record that will be passed to the event</param>
    /// <param name="xRecUnitPrice">The value of the unit price field of the request line when it was retrieved from the database</param>
    procedure RunAfterValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal)
    begin
        OnAfterValidateUnitPrice(RequestLine, xRecUnitPrice);
    end;

    #region Event publishers
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
    #endregion Event publishers
}
