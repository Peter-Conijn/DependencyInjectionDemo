page 50122 "Sales Requests"
{
    ApplicationArea = All;
    Caption = 'Sales Requests';
    PageType = List;
    Editable = false;
    DataCaptionFields = "No.";
    SourceTable = "Request Header";
    UsageCategory = Documents;
    CardPageId = "Sales Request";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Requested Date"; Rec."Requested Date")
                {
                    ToolTip = 'Specifies the value of the Requested Date field.';
                }
            }
        }
    }
}
