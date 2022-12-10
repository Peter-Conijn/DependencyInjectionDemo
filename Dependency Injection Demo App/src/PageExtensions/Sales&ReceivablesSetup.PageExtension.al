pageextension 50120 "Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addbefore("Reminder Nos.")
        {
            field("Request Nos."; Rec."Request Nos.")
            {
                ApplicationArea = Suite;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to request.';
            }
        }
    }
}