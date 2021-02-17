codeunit 81501 "Dialog Helper Impl TBHLG"
{
    Access = Internal;

    var
        EndTime: DateTime;
        LastUpdate: DateTime;
        StartTime: DateTime;
        Window: Dialog;
        ElapsedTimeTxt: Label '\Elapsed time :...........#20#############';
        EstimatedEndTimeTxt: label '\Estimated end time :.....#22#############';
        EstimatedTimeLeftTxt: Label '\Estimated time left:....#21#############';
        MinutesTxt: Label 'Minutes';
        SecondsTxt: Label 'Seconds';

    procedure OpenWindow(DialogString: text; ShowEstimatedEndTime: Boolean)
    var
        WindowString: Text;
    begin
        if not IsGuiAllowed() then
            exit;

        StartTime := 0DT;
        WindowString := DialogString;

        if ShowEstimatedEndTime then begin
            WindowString := WindowString + ElapsedTimeTxt + EstimatedTimeLeftTxt + EstimatedEndTimeTxt;
            StartTime := CurrentDateTime;
        end;

        Window.open(WindowString);
        LastUpdate := CreateDateTime(19000101D, 100000T);
    end;

    procedure UpdateWindow(Counter: Integer; NoOfRecords: Integer);
    var
        EndTime: DateTime;
        CurrDuration: Duration;
        EstimatedDuration: Duration;

    begin
        if CurrentDateTime < LastUpdate + 1000 then
            exit;

        Window.Update(FieldNo, ROUND(Counter / NoOfRecords * 10000, 1, '<'));
        LastUpdate := CurrentDateTime;

        if StartTime = 0DT then
            exit;

        CurrDuration := CurrentDateTime - StartTime;
        EstimatedDuration := ROUND((CurrentDateTime - StartTime) * 100 / (Counter / NoOfRecords * 100), 100);
        EndTime := StartTime + EstimatedDuration;
        Window.UPDATE(20, FormatDuration(CurrDuration));

        IF CurrDuration <= 2000 then
            exit;

        Window.Update(21, FormatDuration(EstimatedDuration - CurrDuration));
        Window.Update(22, Format(EndTime, 0, '<Hours24>:<Minutes,2>:<Seconds,2>'));

    end;

    procedure UpdateWindow(FieldNo: Integer; Value: Text);
    begin
        if not IsGuiAllowed then
            exit;

        Window.update(FieldNo, Value);
    end;

    procedure UpdateWindow(FieldNo: Integer; Value: Text; Counter: Integer; NoOfRecords: Integer);
    begin
        if not IsGuiAllowed then
            exit;

        UpdateWindow(FieldNo, Value);
        UpdateWindow(Counter, NoOfRecords);
    end;

    local procedure FormatDuration(NewDuration: Duration): Text;
    VAR
        Minutes: Integer;
        Seconds: Integer;
    begin
        NewDuration := ROUND(NewDuration / 1000, 1);
        Minutes := ROUND(NewDuration / 60, 1, '<');
        Seconds := NewDuration - (Minutes * 60);
        IF Minutes > 0 then
            EXIT(STRSUBSTNO('%1 %2 %3 %4', Minutes, MinutesTxt, Seconds, SecondsTxt))
        ELSE
            EXIT(STRSUBSTNO('%1 %2', Seconds, SecondsTxt));
    END;

    //local procedure ProgressBar(Percentage: Decimal): ReturnValue: Text
    //var
    //begin
    //
    //  end;

    local procedure IsGuiAllowed() GuiIsAllowed: Boolean
    var
        Handled: Boolean;
    begin
        OnBeforeGuiAllowed(GuiIsAllowed, Handled);
        if Handled then
            exit;
        exit(GuiAllowed());
    end;

    /// <summary>
    /// Raises an event to be able to change the return of IsGuiAllowed function. Used for testing.
    /// </summary>
    [InternalEvent(false)]
    procedure OnBeforeGuiAllowed(var Result: Boolean; var Handled: Boolean)
    begin
    end;
}
