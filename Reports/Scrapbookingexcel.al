report 50127 ScrapbookingExcelreport
{
    Caption = 'Scrap  Booking Excel report';
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Scrap Booking"; "Scrap Booking")
        {
            trigger OnPreDataItem()
            begin
                MakeHeader();

                if FromdateG = 0D then
                    Error('From Date must have value');
                if todateG = 0D then
                    Error('To Date must have value');

                "Scrap Booking".SetRange("Starting Date", FromdateG, todateG);

                TempExcelBufferG.DeleteAll

            end;

            trigger OnAfterGetRecord()
            begin

                MakeBody();
            end;

        }

    }
    RequestPage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group("Date Filter")
                {
                    Caption = 'Date Filters';
                    field(FromdateG; FromdateG)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'From Date';
                        trigger OnValidate()
                        begin

                        end;
                    }
                    field(todateG; todateG)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'To Date';
                        trigger OnValidate()
                        begin

                        end;
                    }

                }
            }
        }
    }
    trigger OnPreReport()
    begin
        TempExcelBufferG.Reset();
        TempExcelBufferG.DeleteAll();
    end;

    trigger OnPostReport()
    begin
        CreateExcelBook;
    end;

    local procedure MakeHeader()
    var

    begin
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Pendency Scrap Booking', false, '', true, false, true, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.NewRow();
        TempExcelBufferG.AddColumn('Scrap No ', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Scrap Booking Date', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Broker Code', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Broker Name', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Scrap Booking Base Rate', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn('Total Purchase Base Rate', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn('Item No', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Item Description', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Scrap Booking Qty', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Total Qty Received', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn('Balance Qty', false, '', TRUE, FALSE, TRUE, '', TempExcelBufferG."Cell Type"::Text);

    end;

    local procedure MakeBody()
    var
        purecpL: Record "Purch. Rcpt. Header";
    begin
        TempExcelBufferG.NewRow;
        TempExcelBufferG.AddColumn("Scrap Booking"."Scrap No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Date);
        TempExcelBufferG.AddColumn("Scrap Booking"."Starting Date", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn("Scrap Booking"."Broker Code", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Date);
        TempExcelBufferG.AddColumn("Scrap Booking"."Broker Name", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        TempExcelBufferG.AddColumn("Scrap Booking"."Base Rate", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Number);
        ILEG.Reset();
        ILEG.SetRange("Entry Type", ILEG."Entry Type"::Purchase);
        if ILEG.FindFirst() then
            repeat
                purecpL.Reset();
                purecpL.Get(ILEG."Document No.");
            // if purecp.scra
            until ILEG.Next() = 0;
        TempExcelBufferG.AddColumn(ILEG."Cost Amount (Expected)", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn("Scrap Booking"."Item No.", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn("Scrap Booking"."Item Description", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn("Scrap Booking".Qty, false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn("Scrap Booking"."Qty Received", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);
        TempExcelBufferG.AddColumn("Scrap Booking"."Balance Qty", false, '', FALSE, FALSE, FALSE, '', TempExcelBufferG."Cell Type"::Text);

    end;

    local procedure CreateExcelBook();
    begin
        TempExcelBufferG.CreateNewBook('"Scrap Booking"');
        TempExcelBufferG.WriteSheet('"Scrap Booking"', CompanyName, UserId);
        TempExcelBufferG.CloseBook();
        TempExcelBufferG.SetFriendlyFilename('"Scrap Booking"');
        TempExcelBufferG.OpenExcel();
    end;

    var
        ILEG: Record "Item Ledger Entry";
        TempExcelBufferG: Record "Excel Buffer" temporary;
        FromdateG: Date;
        todateG: Date;
}
