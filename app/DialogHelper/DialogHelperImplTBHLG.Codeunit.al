/// <summary>
/// Codeunit Dialog Helper HLG (ID 50000).
/// Codeunit for managing the dialog, with the option to show the end user an estimated completion.
/// </summary>
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

    /// <summary>
    /// OpenWindow must be called as the first step, and establishes the user interface.
    /// </summary>
    /// <param name="DialogString">i.e. Processing, Please be patient\@1@@@@@@@@@@@@@@@@@@@@@@@</param>
    /// <param name="ShowEstimatedEndTime">Boolean. - If true, Text is amended to the DialogString to specify Duration, Elapsed - and Estimated end time.
    /// Note! FieldNos 20, 21 and 22 will be used by the Duration, Elapsed and Esitmated end time</param>
    procedure OpenWindow(DialogString: text; ShowEstimatedEndTime: Boolean)
    var
        WindowString: Text;
    begin
        if not GuiAllowed then
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

    /// <summary>
    /// UpdateWindow will only update fields, however will not update durations and estimated end time.
    /// </summary>
    /// <param name="FieldNo">Integer.</param>
    /// <param name="Value">Text.</param>
    procedure UpdateWindow(FieldNo: Integer; Value: Text);
    begin
        if GuiAllowed then
            exit;

        Window.update(FieldNo, Value);
    end;

    /// <summary>
    /// UpdateWindowIndicator.
    /// </summary>
    /// <param name="FieldNo">Integer.</param>
    /// <param name="Count">Integer.</param>
    /// <param name="NoOfRecs">Integer.</param>
    procedure UpdateWindowIndicator(FieldNo: Integer; Count: Integer; NoOfRecs: Integer);
    var
        EndTime: DateTime;
        CurrDuration: Duration;
        EstimatedDuration: Duration;
    begin
        if not GuiAllowed then
            exit;

        if CurrentDateTime < LastUpdate + 1000 then
            exit;


        Window.Update(FieldNo, ROUND(Count / NoOfRecs * 10000, 1, '<'));
        LastUpdate := CurrentDateTime;

        if StartTime = 0DT then
            exit;

        CurrDuration := CurrentDateTime - StartTime;
        EstimatedDuration := ROUND((CurrentDateTime - StartTime) * 100 / (Count / NoOfRecs * 100), 100);
        EndTime := StartTime + EstimatedDuration;
        Window.UPDATE(20, FormatDuration(CurrDuration));

        IF CurrDuration <= 2000 then
            exit;

        Window.Update(21, FormatDuration(EstimatedDuration - CurrDuration));
        Window.Update(22, Format(EndTime, 0, '<Hours24>:<Minutes,2>:<Seconds,2>'));
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
}
