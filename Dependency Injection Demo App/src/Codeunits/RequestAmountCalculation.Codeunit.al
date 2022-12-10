codeunit 50122 "Request Amount Calculation"
{
    procedure CalculateRequestLineAmount(var RequestLine: Record "Request Line")
    begin
        RequestLine.Amount := RequestLine.Quantity * RequestLine."Unit Price";
    end;
}
