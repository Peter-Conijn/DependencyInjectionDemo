codeunit 50146 "Test Amount Calculation"
{
    Subtype = Test;

    [Test]
    procedure TestAmountCalculation()
    var
        RequestHeader: Record "Request Header";
        RequestLine: Record "Request Line";
    begin
        // [Scenario #001] Test Amount Calculation
        Initialize();

        // [GIVEN] A Request Header
        RequestHeader := CreateARequestHeader();

        // [WHEN] Initialize Item Line and enter item no. on line
        RequestLine := InitializeItemLineAndEnterItemNoOnLine(RequestHeader);

        // [THEN] Unit Price is filled
        VerifyUnitPriceIsFilled(RequestLine);
        // [THEN] Quantity is filled
        VerifyQuantityIsFilled(RequestLine);
        // [THEN] Amount Equals Quantity Times Unit Price
        VerifyAmountEqualsQuantityTimesUnitPrice(RequestLine);
    end;

    local procedure Initialize()
    begin

    end;

    local procedure CreateARequestHeader(): Record "Request Header"
    begin
        exit(LibraryRequest.CreateRequestHeader());
    end;

    local procedure InitializeItemLineAndEnterItemNoOnLine(RequestHeader: Record "Request Header") RequestLine: Record "Request Line"
    var
        FillRequestLine: Codeunit "Fill Request Line";
        MockItemRequestLine: Codeunit "Mock Item Request Line";
    begin
        RequestLine.Init();
        RequestLine."Document No." := RequestHeader."No.";
        RequestLine."Line No." := 10000;
        RequestLine.Insert();

        RequestLine."Type" := Enum::"Request Line Type"::Item;
        RequestLine."No." := GetItemNo();

        FillRequestLine.FillRequestLine(RequestLine, MockItemRequestLine);
        RequestLine.Modify();
    end;

    local procedure GetItemNo(): Code[20]
    var
        Item: Record Item;
    begin
        Item.SetLoadFields("No.");
        Item.SetRange(Blocked, false);
        Item.FindFirst();

        exit(Item."No.");
    end;

    local procedure VerifyUnitPriceIsFilled(var RequestLine: Record "Request Line")
    var
        UnitPriceValueErr: Label 'Unit price should have a value.', Locked = true;
    begin
        LibraryAssert.AreNotEqual(0, RequestLine."Unit Price", UnitPriceValueErr);
    end;

    local procedure VerifyQuantityIsFilled(var RequestLine: Record "Request Line")
    var
        QuantityValueErr: Label 'Quantity should have a value.', Locked = true;
    begin
        LibraryAssert.AreNotEqual(0, RequestLine.Quantity, QuantityValueErr);
    end;

    local procedure VerifyAmountEqualsQuantityTimesUnitPrice(var RequestLine: Record "Request Line")
    var
        AmountValueErr: Label 'Amount was expected to equal Quantity times Unit Price.', Locked = true;
        ExpectedQuantity: Decimal;
    begin
        ExpectedQuantity := RequestLine.Quantity * RequestLine."Unit Price";
        LibraryAssert.AreEqual(ExpectedQuantity, RequestLine.Amount, AmountValueErr);
    end;

    var
        LibraryAssert: Codeunit "Library Assert";
        LibraryRequest: Codeunit "Library - Request";
}