codeunit 50126 "Price Request Handler"
{
    internal procedure GetItemPriceFromAPI(ItemNo: Code[20]; PriceDate: Date; var UnitPrice: Decimal): Boolean
    begin
        exit(false);
    end;

    internal procedure GetResourcePriceFromAPI(ItemNo: Code[20]; PriceDate: Date; var UnitPrice: Decimal): Boolean
    begin
        exit(false);
    end;
}
