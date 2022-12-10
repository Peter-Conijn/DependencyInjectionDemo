codeunit 50121 "Resource Request Line" implements "Request Line Data"
{
    Access = Internal;

    procedure FillLineData(var RequestLine: Record "Request Line")
    begin
        FillLineWithResourceData(RequestLine);
    end;

    procedure ValidateQuantity(var RequestLine: Record "Request Line"; xRecQuantity: Decimal);
    begin
        if RequestLine.Quantity <> xRecQuantity then
            CalculateRequestLineAmount(RequestLine);
    end;

    procedure ValidateUnitPrice(var RequestLine: Record "Request Line"; xRecUnitPrice: Decimal);
    begin
        if RequestLine."Unit Price" <> xRecUnitPrice then
            CalculateRequestLineAmount(RequestLine);
    end;

    local procedure FillLineWithResourceData(var RequestLine: Record "Request Line")
    var
        Resource: Record Resource;
    begin
        Resource.SetLoadFields(Name, "Base Unit of Measure");
        if not Resource.Get(RequestLine."No.") then
            exit;
        RequestLine."Requested Date" := GetRequestedDateFromHeader(RequestLine."Document No.");
        RequestLine.Description := Resource.Name;
        RequestLine.Quantity := GetDefaultQuantity();
        RequestLine."Unit of Measure Code" := Resource."Base Unit of Measure";
        RequestLine."Unit Price" := GetResourcePrice(Resource, RequestLine."Requested Date");
        CalculateRequestLineAmount(RequestLine);
    end;

    local procedure GetDefaultQuantity(): Decimal
    begin
        exit(2);
    end;

    local procedure GetResourcePrice(Resource: Record Resource; RequestDate: Date): Decimal
    var
        RequestLineUnitPrice: Codeunit "Request Line Unit Price";
    begin
        exit(RequestLineUnitPrice.RequestResourceUnitPrice(Resource, RequestDate));
    end;

    local procedure CalculateRequestLineAmount(var RequestLine: Record "Request Line")
    var
        RequestAmountCalculation: Codeunit "Request Amount Calculation";
    begin
        RequestAmountCalculation.CalculateRequestLineAmount(RequestLine);
    end;


    local procedure GetRequestedDateFromHeader(RequestHeaderNo: Code[20]): Date
    var
        RequestHeader: Record "Request Header";
    begin
        RequestHeader.SetLoadFields("Requested Date");
        if RequestHeader.Get(RequestHeaderNo) then
            exit(RequestHeader."Requested Date");
    end;
}