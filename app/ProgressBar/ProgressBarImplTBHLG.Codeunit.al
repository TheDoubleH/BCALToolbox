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
        FirstHalf: Text[10];
        LastHalf: Text[10];
        FillPercentage: Integer;
        FillCount: integer;
    begin
        FillPercentage := round(Percentage, 5);
        FillCount := round(FillPercentage / 5);
        ReturnValue := PadStr('', FillCount, '█');
        ReturnValue := PadStr(ReturnValue, 20 - FillCount, '▒');

        ReturnValue := StrSubstNo('%1 %2%3', CopyStr(ReturnValue, 1, 10), Format(Percentage, 4, '<Integer>') + '%', CopyStr(ReturnValue, 11, 10));


        /* if FillPercentage > 50 then begin
            FillCount := FillCount - MaxStrLen(LastHalf);
            FirstHalf := PadStr('', MaxStrLen(FirstHalf), '█');
            LastHalf := PadStr('', MaxStrLen(LastHalf), '▒');


        end else
            LastHalf := PadStr('', MaxStrLen(LastHalf), '▒');



        case round(Percentage, 5) of
            0:
                ReturnValue := '[▒▒▒▒▒▒▒▒▒▒  0% ▒▒▒▒▒▒▒▒▒▒]';
            5:
                ReturnValue := '[█▒▒▒▒▒▒▒▒▒  5% ▒▒▒▒▒▒▒▒▒▒]';
            10:
                ReturnValue := '[██▒▒▒▒▒▒▒▒ 10% ▒▒▒▒▒▒▒▒▒▒]';
            15:
                ReturnValue := '[███▒▒▒▒▒▒▒ 15% ▒▒▒▒▒▒▒▒▒▒]';
            20:
                ReturnValue := '[████▒▒▒▒▒▒ 20% ▒▒▒▒▒▒▒▒▒▒]';
            25:
                ReturnValue := '[█████▒▒▒▒▒ 25% ▒▒▒▒▒▒▒▒▒▒]';
            30:
                ReturnValue := '[██████▒▒▒▒ 30% ▒▒▒▒▒▒▒▒▒▒]';
            35:
                ReturnValue := '[███████▒▒▒ 35% ▒▒▒▒▒▒▒▒▒▒]';
            40:
                ReturnValue := '[████████▒▒ 40% ▒▒▒▒▒▒▒▒▒▒]';
            45:
                ReturnValue := '[█████████▒ 45% ▒▒▒▒▒▒▒▒▒▒]';
            50:
                ReturnValue := '[██████████ 50% ▒▒▒▒▒▒▒▒▒▒]';
            55:
                ReturnValue := '[██████████ 55% █▒▒▒▒▒▒▒▒▒]';
            60:
                ReturnValue := '[██████████ 60% ██▒▒▒▒▒▒▒▒]';
            65:
                ReturnValue := '[██████████ 65% ███▒▒▒▒▒▒▒]';
            70:
                ReturnValue := '[██████████ 70% ████▒▒▒▒▒▒]';
            75:
                ReturnValue := '[██████████ 75% █████▒▒▒▒▒]';
            80:
                ReturnValue := '[██████████ 80% ██████▒▒▒▒]';
            85:
                ReturnValue := '[██████████ 85% ███████▒▒▒]';
            90:
                ReturnValue := '[██████████ 90% ████████▒▒]';
            95:
                ReturnValue := '[██████████ 95% █████████▒]';
            100:
                ReturnValue := '[██████████100% ██████████]';
    end;                
 */

    end;

}
