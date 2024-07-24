report 50116 "Production Report"
{
    Caption = 'Daily Production Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = True;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            // RequestFilterFields = "Heat No.", "item type";
            trigger OnPreDataItem()
            begin
                "Item Ledger Entry".SetRange("Posting Date", Fromdate, Todate);
                MakeHeader();

                // TempExcelBuffer.DELETEALL
            end;

            trigger OnAfterGetRecord()
            begin
                MakeBody();

                if items.Get("Item No.") then;

            end;



        }


    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Filter)
                {
                    field(Fromdate; Fromdate)
                    {

                    }
                    field(Todate; Todate)
                    {

                    }


                }

            }
        }
    }
    trigger OnPreReport()
    begin

        TempExcelBuffer.Reset();
        TempExcelBuffer.DELETEALL();
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook;
    end;

    var
        Fromdate: Date;
        Todate: Date;

    local procedure MakeHeader()
    var
        myInt: Integer;


    begin
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Daily Production Report', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn('Date' + Format(CurrentDateTime), FALSE, '', true, true, true, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.NewRow;
        TempExcelBuffer.AddColumn('Production Order No', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Production Date', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Heat No', FALSE, '', true, FALSE, True, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Item No', FALSE, '', true, FALSE, true, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Item Code', FALSE, '', True, FALSE, True, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Item Type', false, '', true, false, true, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Grade', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Item Category Code', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn('Invetory Posting Group', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Entry Type', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Base Unit of Measure', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Qty MTS', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Cost Amount Actual', FALSE, '', TRUE, FALSE, TRUE, '', TempExcelBuffer."Cell Type"::Text);

    end;

    local procedure MakeBody()
    var

    begin
        TempExcelBuffer.NewRow;
        // TempExcelBuffer.AddColumn("Item Ledger Entry"."Production Order No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        // TempExcelBuffer.AddColumn("Item Ledger Entry"."Posting Date", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        // TempExcelBuffer.AddColumn("Item Ledger Entry"."Heat No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Item Ledger Entry"."Item No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        // TempExcelBuffer.AddColumn(items."Item Code", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        // TempExcelBuffer.AddColumn(items."Item Type", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        // TempExcelBuffer.AddColumn(items.Grade, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(items."Item Category Code", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::text);
        TempExcelBuffer.AddColumn("Item Ledger Entry"."Invenoty Post Group", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Item Ledger Entry"."Entry Type", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn("Item Ledger Entry"."Unit of Measure Code", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn("Item Ledger Entry".Quantity, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Item Ledger Entry"."Cost Amount (Actual)", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);


    end;

    local procedure CreateExcelBook();
    begin
        TempExcelBuffer.CreateNewBook('Production Report');
        TempExcelBuffer.WriteSheet('Production Report', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Production Report');
        TempExcelBuffer.OpenExcel();
    end;

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        items: Record Item;

}
