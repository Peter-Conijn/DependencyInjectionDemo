codeunit 50120 "Item Request Line" implements "Request Line Data"
{
    Access = Internal;

    procedure FillLineData(var RequestLine: Record "Request Line")
    begin
        FillLineWithItemData(RequestLine);
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

    local procedure FillLineWithItemData(var RequestLine: Record "Request Line")
    var
        Item: Record Item;
    begin
        Item.SetLoadFields(Description, "Sales Unit of Measure", "Base Unit of Measure");
        if not Item.Get(RequestLine."No.") then
            exit;
        RequestLine."Requested Date" := GetRequestedDateFromHeader(RequestLine."Document No.");
        RequestLine.Quantity := GetDefaultQuantity();
        RequestLine.Description := Item.Description;
        RequestLine."Unit of Measure Code" := GetUnitOfMeasure(Item);
        RequestLine."Unit Price" := GetItemPrice(Item, RequestLine."Requested Date");
        CalculateRequestLineAmount(RequestLine);
    end;

    local procedure GetUnitOfMeasure(var Item: Record Item): Code[10]
    begin
        if Item."Sales Unit of Measure" <> '' then
            exit(Item."Sales Unit of Measure");
        exit(Item."Base Unit of Measure");
    end;

    local procedure GetDefaultQuantity(): Decimal
    begin
        exit(1);
    end;

    local procedure GetItemPrice(Item: Record Item; RequestDate: Date): Decimal
    var
        RequestLineUnitPrice: Codeunit "Request Line Unit Price";
    begin
        exit(RequestLineUnitPrice.RequestItemUnitPrice(Item, RequestDate));
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
