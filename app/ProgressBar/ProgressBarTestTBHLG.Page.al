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
            action(TestProgressBar)
            {
                ApplicationArea = All;
                Caption = 'Test Progress Bar';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AddWatch;

                trigger OnAction()
                begin
                    Window.open('Processing, Please be patient\\123456789012345678901234567890\#1########################');
                    Window.Update(1, ProgressBar.ProgressBar(Percentage));
                    sleep(5000);
                end;
            }
        }
    }

    var
        ProgressBar: Codeunit "Progress Bar TBHLG";
        Window: Dialog;
        Percentage: Integer;


}