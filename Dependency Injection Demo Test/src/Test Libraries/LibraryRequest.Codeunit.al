codeunit 50147 "Library - Request"
{
    procedure CreateRequestHeader() RequestHeader: Record "Request Header"
    begin
        RequestHeader.Init();
        RequestHeader."No." := '';
        RequestHeader.Insert(true);

        RequestHeader.Validate("Sell-to Customer No.", FindCustomerNo());
        RequestHeader."Requested Date" := WorkDate();
        RequestHeader."Location Code" := FindLocationCode();
        RequestHeader.Modify();
    end;

    local procedure FindLocationCode(): Code[20]
    var
        Location: Record Location;
    begin
        Location.SetLoadFields(Code);
        Location.SetRange("Use As In-Transit", false);
        Location.FindFirst();
        exit(Location.Code);
    end;

    local procedure FindCustomerNo(): Code[20]
    var
        Customer: Record Customer;
    begin
        Customer.SetLoadFields("No.");
        Customer.SetRange(Blocked, "Customer Blocked"::" ");
        Customer.FindFirst();
        exit(Customer."No.");
    end;
}
