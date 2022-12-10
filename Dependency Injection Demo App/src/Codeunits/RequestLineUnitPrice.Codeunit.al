codeunit 50127 "Request Line Unit Price"
{
    procedure RequestItemUnitPrice(Item: Record Item; RequestDate: Date): Decimal
    var
        UnitPrice: Decimal;
    begin
        SetRequestDate(RequestDate);
        if PriceRequestHandler.GetItemPriceFromAPI(Item."No.", WorkDate(), UnitPrice) then
            exit(UnitPrice);
        exit(Item.CalcUnitPriceExclVAT());
    end;

    procedure RequestResourceUnitPrice(Resource: Record Resource; RequestDate: Date): Decimal
    var
        UnitPrice: Decimal;
    begin
        SetRequestDate(RequestDate);
        if PriceRequestHandler.GetResourcePriceFromAPI(Resource."No.", WorkDate(), UnitPrice) then
            exit(UnitPrice);

        if Resource."Sales (Price)" <> 0 then
            exit(Resource."Sales (Price)");
        exit(Resource."Unit Price");
    end;

    local procedure SetRequestDate(var RequestDate: Date)
    begin
        if RequestDate = 0D then
            RequestDate := WorkDate();
    end;

    var
        PriceRequestHandler: Codeunit "Price Request Handler";
}
