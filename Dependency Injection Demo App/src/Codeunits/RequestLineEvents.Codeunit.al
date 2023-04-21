codeunit 50128 "Request Line Events"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Run Request Line Type Events", OnAfterFillLineData, '', false, false)]
    local procedure HandleOnAfterFillLineData(var RequestLine: Record "Request Line")
    begin
        RequestLine.Description += ' (C)';
    end;
}
