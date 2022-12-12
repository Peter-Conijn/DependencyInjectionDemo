tableextension 50120 "Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50120; "Request Nos."; Code[20])
        {
            Caption = 'Request Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}
