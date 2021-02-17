codeunit 81502 "Progress Bar TBHLG"
{
    Access = Public;

    procedure ProgressBar(Percentage: Decimal): Text;
    var
        ProgressBarImpl: Codeunit "Progress Bar Impl TBHLG";
    begin
        exit(ProgressBarImpl.ProgressBar(Percentage));
    end;

    procedure ProgressBar(Counter: Integer; MaxValue: Integer): Text;
    var
        ProgressBarImpl: Codeunit "Progress Bar Impl TBHLG";
    begin
        exit(ProgressBarImpl.ProgressBar(Counter, MaxValue));
    end;
}
