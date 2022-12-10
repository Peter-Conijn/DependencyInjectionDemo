interface "Request Line Data"
{
    /// <summary>
    /// Fills the request line data based on the type of line.
    /// </summary>
    /// <param name="RequestLine">The request line data that needs to be populated.</param>
    procedure FillLineData(var RequestLine: Record "Request Line")

    procedure ValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal)

    procedure ValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal);
}
