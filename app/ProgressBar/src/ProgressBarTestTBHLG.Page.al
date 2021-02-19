page 81500 "Progress Bar Test TBHLG"
{

    Caption = 'Progress Bar Test TBHLG';
    PageType = Card;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Percentage; Percentage)
                {
                    Caption = 'Percentage';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TestProgressBar1)
            {
                ApplicationArea = All;
                Caption = '10 pct';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;

                trigger OnAction()
                begin
                    Window.open('#1################################################');
                    Window.Update(1, ProgressBar.ProgressBar(10));
                    sleep(5000);
                    Window.Close();
                end;
            }

            action(TestProgressBar2)
            {
                ApplicationArea = All;
                Caption = '0 - 100 with EndTime';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;

                trigger OnAction()
                var
                    Pct: Decimal;
                    DialogHelper: Codeunit "Dialog Helper TBHLG";
                begin
                    DialogHelper.OpenWindow('', true);
                    repeat
                        pct += 1;
                        DialogHelper.UpdateWindow(Pct, 100);
                        sleep(1000);

                    until pct = 100;

                end;
            }

            action(TestProgressBar3)
            {
                ApplicationArea = All;
                Caption = '0 - 100 without EndTime';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;

                trigger OnAction()
                var
                    Pct: Decimal;
                    DialogHelper: Codeunit "Dialog Helper TBHLG";
                begin
                    DialogHelper.OpenWindow('', false);
                    repeat
                        pct += 1;
                        DialogHelper.UpdateWindow(Pct, 100);
                        sleep(1000);
                    until pct = 100;

                end;
            }

            action(TestProgressBar4)
            {
                ApplicationArea = All;
                Caption = 'Rolling';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;

                trigger OnAction()
                var
                    pct: Integer;
                begin
                    Window.open('#1################################################');

                    repeat
                        Window.Update(1, ProgressBar.ProgressBar(pct));
                        sleep(1000);
                        pct += 1;
                    until pct = 101;
                    Window.Close();
                end;
            }

            action(TestProgressBar5)
            {
                ApplicationArea = All;
                Caption = 'Rolling Alt';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;

                trigger OnAction()
                var
                    pct: Integer;
                begin
                    Window.open('#1################################################');
                    repeat
                        Window.Update(1, ProgressBar.ProgressBar(pct, 100));
                        sleep(1000);
                        pct += 1;
                    until pct = 101;
                    Window.Close();
                end;
            }
        }
    }

    var
        ProgressBar: Codeunit "Progress Bar TBHLG";
        Window: Dialog;
        Percentage: Integer;


}