/// <summary>
/// Codeunit Dialog Helper HLG (ID 81500).
/// Codeunit for managing the dialog with the option to show the end user an estimated completion.
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
