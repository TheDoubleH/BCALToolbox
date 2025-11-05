pageextension 81500 "General Journal TBHLG" extends "General Journal"
{
    actions
    {
        addlast("Payro&ll")
        {
            action("ImportPayrollTBHLG TBHLG")
            {
                ApplicationArea = All;
                Caption = 'Import Excel Payroll Entries';
                Image = ImportExcel;
                ToolTip = 'Imports payroll entries from ADP Excel File';
                trigger OnAction()
                var
                    TEMPExcelBuffer: Record "Excel Buffer" temporary;
                    ExcelImportHelper: Codeunit "Excel Import Helper TBHLG";

                begin
                    ExcelImportHelper.ImportExcelFileIntoExcelBuffer(TEMPExcelBuffer);

                    TEMPExcelBuffer.SetRange("Column No.", 1);
                    Message('%1 lines imported', TEMPExcelBuffer.Count());

                end;

            }
        }

    }
}
