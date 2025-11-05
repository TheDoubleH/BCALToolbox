pageextension 81501 "Item Card TBHLG" extends "Item Card"
{
    actions
    {
        addlast(processing)
        {
            action("Calculate Something TBHLG")
            {
                ApplicationArea = All;
                Caption = 'Calculate Something';
                Image = Calculate;
                ToolTip = 'Calculate something, without dialog';
                trigger OnAction()
                var
                    ItemLedgerEntry: Record "Item Ledger Entry";

                begin
                    ItemLedgerEntry.SetCurrentKey("Item No.");
                    ItemLedgerEntry.SetRange("Item No.", Rec."No.");
                    if not ItemLedgerEntry.findset() then
                        exit;

                    repeat
                        Sleep(500);
                    until ItemLedgerEntry.next() = 0;

                end;

            }

            action("Calculate Something 2 TBHLG")
            {
                ApplicationArea = All;
                Caption = 'Calculate Something 2';
                Image = Calculate;
                ToolTip = 'Calculate something, with dialog';
                trigger OnAction()
                var
                    ItemLedgerEntry: Record "Item Ledger Entry";
                    DialogHelper: Codeunit "Dialog Helper TBHLG";
                    i: Integer;
                    NoOfRecords: Integer;

                begin
                    ItemLedgerEntry.SetCurrentKey("Item No.");
                    ItemLedgerEntry.SetRange("Item No.", Rec."No.");
                    if not ItemLedgerEntry.findset() then
                        exit;
                    NoOfRecords := ItemLedgerEntry.count();
                    DialogHelper.OpenWindow('', false);
                    repeat
                        i += 1;
                        DialogHelper.UpdateWindow(i, NoOfRecords);
                        Sleep(500);
                    until ItemLedgerEntry.next() = 0;

                end;
            }
            action("Calculate Something 3 TBHLG")
            {
                ApplicationArea = All;
                Caption = 'Calculate Something 3';
                Image = Calculate;
                ToolTip = 'Calculate something, with dialog and estimated end time';
                trigger OnAction()
                var
                    ItemLedgerEntry: Record "Item Ledger Entry";
                    DialogHelper: Codeunit "Dialog Helper TBHLG";
                    i: Integer;
                    NoOfRecords: Integer;

                begin
                    ItemLedgerEntry.SetCurrentKey("Item No.");
                    ItemLedgerEntry.SetRange("Item No.", Rec."No.");
                    if not ItemLedgerEntry.findset() then
                        exit;
                    NoOfRecords := ItemLedgerEntry.count();
                    DialogHelper.OpenWindow('', true);
                    repeat
                        i += 1;
                        DialogHelper.UpdateWindow(i, NoOfRecords);
                        Sleep(500);
                    until ItemLedgerEntry.next() = 0;

                end;

            }
        }

    }
}
