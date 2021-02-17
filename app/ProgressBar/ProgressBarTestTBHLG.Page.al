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
                Caption = '7 pct';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;

                trigger OnAction()
                begin
                    Window.open('#1################################################');
                    Window.Update(1, ProgressBar.ProgressBar(7));
                    sleep(5000);
                    Window.Close();
                end;
            }

            action(TestProgressBar3)
            {
                ApplicationArea = All;
                Caption = '50 pct';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;

                trigger OnAction()
                begin
                    Window.open('#1################################################');
                    Window.Update(1, ProgressBar.ProgressBar(50));
                    sleep(5000);
                    Window.Close();
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