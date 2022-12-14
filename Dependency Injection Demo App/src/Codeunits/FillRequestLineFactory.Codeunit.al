codeunit 50125 "Fill Request Line Factory"
{
    internal procedure SetFillRequestLineImplementation(RequestLineType: Enum "Request Line Type") RequestLineDataImplementation: Interface "Request Line Data"
    begin
        RequestLineDataImplementation := RequestLineType;
    end;
}
