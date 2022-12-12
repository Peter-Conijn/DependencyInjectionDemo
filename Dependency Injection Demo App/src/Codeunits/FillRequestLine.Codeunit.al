codeunit 50124 "Fill Request Line"
{
    #region direct interface selector
    internal procedure FillRequestLine(var RequestLine: Record "Request Line")
    var
        RequestLineData: Interface "Request Line Data";
    begin
        SetInterfaceImplementation(RequestLine."Type", RequestLineData);
        RequestLineData.FillLineData(RequestLine);
    end;

    internal procedure ValidateQuantityOnRequestLine(var RequestLine: Record "Request Line"; XRecQuantity: Decimal)
    var
        RequestLineData: Interface "Request Line Data";
    begin
        SetInterfaceImplementation(RequestLine."Type", RequestLineData);
        RequestLineData.ValidateQuantity(RequestLine, XRecQuantity);
    end;

    internal procedure ValidateUnitPriceOnRequestLine(var RequestLine: Record "Request Line"; XRecUnitPrice: Decimal)
    var
        RequestLineData: Interface "Request Line Data";
    begin
        SetInterfaceImplementation(RequestLine."Type", RequestLineData);
        RequestLineData.ValidateQuantity(RequestLine, XRecUnitPrice);
    end;

    local procedure SetInterfaceImplementation(RequestLineType: Enum "Request Line Type"; var RequestLineData: Interface "Request Line Data")
    begin
        RequestLineData := RequestLineType;
    end;
    #endregion direct interface selector

    #region interface injection
    internal procedure FillRequestLine(var RequestLine: Record "Request Line"; RequestLineData: Interface "Request Line Data")
    begin
        RequestLineData.FillLineData(RequestLine);
    end;

    internal procedure ValidateQuantityOnRequestLine(var RequestLine: Record "Request Line"; XRecQuantity: Decimal; RequestLineData: Interface "Request Line Data")
    begin
        RequestLineData.FillLineData(RequestLine);
    end;

    internal procedure ValidateUnitPriceOnRequestLine(var RequestLine: Record "Request Line"; XRecUnitPrice: Decimal; RequestLineData: Interface "Request Line Data")
    begin
        RequestLineData.FillLineData(RequestLine);
    end;

    #endregion interface injection
}