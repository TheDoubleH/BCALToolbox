/// <summary>
/// Codeunit Progress Bar Impl TBHLG (ID 81503).
/// Implementation Codeunit
/// </summary>
codeunit 81503 "Progress Bar Impl TBHLG"
{
    Access = Internal;

    procedure ProgressBar(Counter: Integer; MaxValue: Integer): Text
    var
        Percentage: Integer;
    begin
        if MaxValue = 0 then
            Percentage := 0
        else
            Percentage := round(Counter / MaxValue * 100, 1);

        exit(ProgressBar(Percentage));
    end;

    procedure ProgressBar(Percentage: Decimal) ReturnValue: Text;
    var
        FillPercentage: Integer;
        FillCount: integer;
    begin
        FillCount := round(Percentage / 2.777777778, 1);
        ReturnValue := PadStr('', FillCount, '█');
        ReturnValue := PadStr(ReturnValue, 36, '▒');
        ReturnValue := StrSubstNo('%1 %2%3', CopyStr(ReturnValue, 1, 18), Format(Percentage, 4, '<Integer>') + '% ', CopyStr(ReturnValue, 19, 18));
    end;

}
