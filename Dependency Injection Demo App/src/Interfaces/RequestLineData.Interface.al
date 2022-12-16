interface "Request Line Data"
{
    /// <summary>
    /// Fills the request line data based on the type of line.
    /// </summary>
    /// <param name="RequestLine">The request line data that needs to be populated.</param>
    procedure FillLineData(var RequestLine: Record "Request Line")

    /// <summary>
    /// Runs the procedures required for validation of the Quantity field
    /// </summary>
    /// <param name="RequestLine">The request line that the quantity needs to be validated for.</param>
    /// <param name="xRecQuantity">The value of quantity the last time the request line record was retrieved from the database.</param>
    procedure ValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal)

    /// <summary>
    /// Runs the procedures required for validation of the Unit Price field
    /// </summary>
    /// <param name="RequestLine">The request line that the unit price needs to be validated for.</param>
    /// <param name="xRecQuantity">The value of the unit price the last time the request line record was retrieved from the database.</param>
    procedure ValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal)
}
