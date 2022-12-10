table 50120 "Request Header"
{
    Caption = 'Request Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                TestForManualNoSeries();
            end;
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer where(Blocked = const(" "));
        }
        field(3; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(4; "Requested Date"; Date)
        {
            Caption = 'Requested Date';
            DataClassification = ToBeClassified;
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." <> '' then
            exit;
        TestNoSeries();
        NoSeriesMgt.InitSeries(GetNoSeriesCode(), xRec."No. Series", WorkDate(), "No.", "No. Series");
    end;

    trigger OnDelete()
    begin
        DeleteLines();
    end;


    local procedure TestForManualNoSeries()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if Rec."No." = xRec."No." then
            exit;

        NoSeriesMgt.TestManual(GetNoSeriesCode());
        "No. Series" := '';
    end;

    local procedure GetNoSeriesCode(): Code[20]
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
    begin
        SalesReceivablesSetup.SetLoadFields("Request Nos.");
        SalesReceivablesSetup.Get();
        SalesReceivablesSetup.TestField("Request Nos.");
        exit(SalesReceivablesSetup."Request Nos.");
    end;

    local procedure TestNoSeries()
    var
        NoSeries: Record "No. Series";
    begin
        NoSeries.Get(GetNoSeriesCode());
        NoSeries.TestField("Default Nos.", true);
    end;

    local procedure DeleteLines()
    var
        RequestLine: Record "Request Line";
    begin
        RequestLine.SetRange("Document No.", Rec."No.");
        if not RequestLine.IsEmpty() then
            RequestLine.DeleteAll(true);
    end;
}
