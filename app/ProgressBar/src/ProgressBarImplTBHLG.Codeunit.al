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
        FillCount: integer;
        ProgressBarTxt: Label '%1 %2%3', Comment = '%1 = First Half of Progress Bar; %2 Percentage Text; %3 Second Half of Progress Bar ';
    begin
        FillCount := round(Percentage / 2.777777778, 1);
        ReturnValue := PadStr('', FillCount, '█');
        ReturnValue := PadStr(ReturnValue, 36, '▒');
        ReturnValue := StrSubstNo(ProgressBarTxt, CopyStr(ReturnValue, 1, 18), Format(Percentage, 4, '<Integer>') + '% ', CopyStr(ReturnValue, 19, 18));
    end;

}
