/// <summary>
/// Codeunit Dialog Helper HLG (ID 81500).
/// Exposes functionality to raise a progress dialog with the option of showing an estimated end time.
/// </summary>
codeunit 81500 "Dialog Helper TBHLG"
{
    Access = Public;

    var
        DialogHelperImpl: Codeunit "Dialog Helper Impl TBHLG";

    procedure OpenWindow(DialogString: text; ShowEstimatedEndTime: Boolean)
    var
        WindowString: Text;
    begin
    end;

    procedure UpdateWindow(FieldNo: Integer; Value: Text);
    begin
        DialogHelperImpl.UpdateWindow((FieldNo, Value));
    end;

    procedure UpdateWindowIndicator(FieldNo: Integer; Count: Integer; NoOfRecs: Integer);
    var
    begin
        DialogHelperImpl.UpdateWindowIndicator(FieldNo, Count, NoOfRecs);
    end;


    procedure UpdateWindow(FieldNo: Integer; Value: Text);
    begin
        DialogHelperImpl.UpdateWindow((FieldNo, Value));
    end;

    procedure UpdateWindow(FieldNo: Integer; Count: Integer; NoOfRecs: Integer);
    begin
        DialogHelperImpl.UpdateWindowIndicator(FieldNo, Count, NoOfRecs);
    end;
}
