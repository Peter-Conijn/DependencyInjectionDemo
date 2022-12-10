codeunit 50148 "Mock Item Request Line" implements "Request Line Data"
{

    procedure FillLineData(var RequestLine: Record "Request Line")
    begin
        RequestLine.Validate(Quantity, GetQuantity());
        RequestLine.Validate("Unit Price", GetUnitPrice());
    end;

    procedure ValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal)
    begin
        UpdateAmount(RequestLine);
    end;

    procedure ValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal)
    begin
    end;

    local procedure GetQuantity(): Decimal
    begin
        Randomize();
        exit(Random(8));
    end;

    local procedure GetUnitPrice(): Decimal
    begin
        Randomize();
        exit(Random(50));
    end;

    local procedure UpdateAmount(var RequestLine: Record "Request Line")
    var
        RequestAmountCalculation: Codeunit "Request Amount Calculation";
    begin
        RequestAmountCalculation.CalculateRequestLineAmount(RequestLine);
    end;

}
